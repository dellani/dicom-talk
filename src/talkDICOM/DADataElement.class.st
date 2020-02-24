Class {
	#name : #DADataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
DADataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
DADataElement class >> valueRepresentationString [

	^'DA'
]

{ #category : #'to deprecate' }
DADataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: DateAndTime) 
		ifTrue: [elementValue printYMDOn: aStream  "aStream nextPutAll: elementValue printString"]
]

{ #category : #'to deprecate' }
DADataElement >> _value [
	| anOrderedCollection |
	^ self dataBytes size >= self byteSize
		ifTrue: [ anOrderedCollection := self decodeValue.
			anOrderedCollection size = 1
				ifTrue: [ anOrderedCollection first ]
				ifFalse: [ anOrderedCollection ] ]
		ifFalse: [ "***** DICOM V3.0 encoding? *************"
			self type = '3'
				ifTrue: [ nil ]
				ifFalse: [ self raiseElementSizeError ] ]
]

{ #category : #'as yet unclassified' }
DADataElement >> bsonTypeCode [
"BSON type
	4 = Array;
	6 = nil;
	9 = UTC datetime - The int64 is UTC milliseconds since the Unix epoch;"

	| value bsonType | 

	bsonType := 6. "Default is nil"

	value := self bsonValue.

	(value isKindOf: Array) ifTrue: [bsonType := 4].
	(value isKindOf: DateAndTime) ifTrue: [bsonType := 9].

	"^(self value isKindOf: OrderedCollection)
		ifTrue: [4]
		ifFalse: [9]"

	^bsonType
]

{ #category : #'as yet unclassified' }
DADataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromDADataElement: self
]

{ #category : #'field value retrieving' }
DADataElement >> byteSize [
	^16r08
]

{ #category : #'field value retrieving' }
DADataElement >> dataBytesByteSpliter_exception01 [
	"Split the DICOM multi-byte values (for VM > 1) that are coded
	in dataBytes instance variable into an OrderedCollection, answering
	the OrderedCollection with the single data element values.
	
	This code deals with the fact that some DICOM implementations may use the
	character '\' (0x5C) to separate the values as is the case with strings by vm>1. 

	PRD 06.2002 - 01.2016"

	| start tempBytes anOrderedCollection |
	start := 1.
	tempBytes := self dataBytes.
	anOrderedCollection := OrderedCollection new.
	
	[tempBytes := tempBytes copyFrom: start to: tempBytes size.
	anOrderedCollection add: tempBytes.
	start := (tempBytes indexOf: 16r5C ifAbsent: [start + 8]) + 1.
	start + self byteSize <= tempBytes size]
			whileTrue.
	^anOrderedCollection
]

{ #category : #accessing }
DADataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthDADataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
DADataElement >> dataElementValueFrom: bsonDADataElementValue [

	^self encoder 
		dicomDADataElementValueFrom: bsonDADataElementValue
]

{ #category : #'field value retrieving' }
DADataElement >> decodeElementDataBytes: valueDataBytes [
	"VR = DATE
	
	PRD 04.2001  - 01-07.2002, 06.2017"

	| year month day |
	year := (valueDataBytes copyFrom: 1 to: 4) asString asNumber.
	month := (valueDataBytes copyFrom: 5 to: 6) asString asNumber.
	day := (valueDataBytes copyFrom: 7 to: 8) asString asNumber.

	"Guarantee that Date will be UTC+/-0; Always use instances of
	 DateTime for Date or Time representation"
	^ DateAndTime
		year: year
		month: month
		day: day
		offset: 0 asDuration
]

{ #category : #'field value retrieving' }
DADataElement >> decodeElementDataBytes_preDICOMV3: valueDataBytes [
	"VR = DATE, pre-DICOM encoding/decoding
	
	PRD 04.2001  - 01-07.2002, 06.2017"

	| year month day date |
	
	(valueDataBytes at: 3) = 16r2F ifTrue: [
		month := (valueDataBytes copyFrom: 1 to: 2) asString asNumber.
		day := (valueDataBytes copyFrom: 4 to: 5) asString asNumber.
		year := (valueDataBytes copyFrom: 7 to: 10) asString asNumber.
	] ifFalse: [
		year := (valueDataBytes copyFrom: 1 to: 4) asString asNumber.
		month := (valueDataBytes copyFrom: 6 to: 7) asString asNumber.
		day := (valueDataBytes copyFrom: 9 to: 10) asString asNumber.
	].
	"Guarantee that Date will be UTC+/-0; Always use instances of
	 DateTime for Date or Time representation"
	[ date := DateAndTime
		year: year
		month: month
		day: day
		offset: 0 asDuration ]
		on: Error
		do: [ :ex | date := nil ].
	^ date
]

{ #category : #'field value retrieving' }
DADataElement >> decodeValue [
	| anOrderedCollection split |
	anOrderedCollection := OrderedCollection new.
	(self dataBytes includes: 16r2E) | (self dataBytes includes: 16r2F)
		ifFalse: [ split := (self dataBytes includes: 16r5C)
				ifFalse: [ self dataBytesByteSpliter ]
				ifTrue: [ self dataBytesByteSpliter_exception01 ].
			split do: [ :valueDataBytes | anOrderedCollection add: (self decodeElementDataBytes: valueDataBytes) ] ]
		ifTrue: [ (self dataBytesByteSpliter: 16r0A)
				do: [ :valueDataBytes | anOrderedCollection add: (self decodeElementDataBytes_preDICOMV3: valueDataBytes) ] ].
	"***** Date string in the pre-DICOM V3.0 encoding format *************"
	^ anOrderedCollection
]

{ #category : #'field bytes' }
DADataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromDADataElement: self on: aByteStream
]

{ #category : #printing }
DADataElement >> printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015"

	| valueCollection |
	self dataBytes size >= self byteSize
		ifTrue: [ (valueCollection := self decodeValue) notEmpty
				ifTrue: [ valueCollection first printYMDOn: aStream.
					2 to: valueCollection size do: [ :index | 
						aStream nextPutAll: ' \\ '.
						(valueCollection at: index) printYMDOn: aStream ] ] ]
]

{ #category : #'field value storing' }
DADataElement >> validateValue: aDate [
	"Perform the validation of the value to be stored in a DICOM UL (Unsigned Long) Data Element
	Unsigned binary integer 32 bits long. Represents an integer n in the range: 0 <= n < 2^32 . 
	Character Repertoire: not applicable 
	4 bytes fixed
	PS 3.5-2000 6.2

	PRD 05.2001, 07.2002, 02.2017"

	| aStream dateString aByteArray |

	aByteArray := ByteArray new.
	aStream := WriteStream on: String new.
	(aDate isKindOf: Date) | (aDate isKindOf: DateAndTime)
		ifTrue:
			[aDate asDate printOn: aStream format: #(3 2 1 0 1 1 2).
			aByteArray := aStream contents asByteArray].

	(aDate isKindOf: String)
		ifTrue:
			[dateString := self stringEvenner: aDate.
			dateString := self stringPurify: dateString goodChars: DefaultCharacterRepertoire digit.
			aByteArray := aStream contents asByteArray].

	^ aByteArray
]

{ #category : #'field value storing' }
DADataElement >> value: anObject [
	"DA Date 
	A string of characters of the format yyyymmdd; where yyyy shall contain year, 
	mm shall contain the month, and dd shall contain the day. This conforms to the 
	ANSI HISPP MSDS Date common data type. Example:  19930822  would represent 
	August 22, 1993. 
	Notes: 
	1. For reasons of backward compatibility with versions of this standard prior to V3.0, 
	it is recommended that implementations also support a string of characters of the format 
	yyyy.mm.dd for this VR. 
	0 - 9  of Default Character Repertoire 
	Note: For reasons specified in the previous column, implementations may wish to support 
	the  .  character as well.
	8 bytes fixed 
	Note: For reasons specified in the previous columns, implementations may also wish to 
	support a 10 byte fixed length as well.	

	PS 3.5-2000 6.2 - PRD 05-09.2001, 01-02.2002

	Implemented support for VM > 1 - PRD 20.08.2014"

	self
		dataBytes:
			(anObject isCollection | anObject isArray
				ifTrue: [ self multipleByteValuesFrom: anObject ]
				ifFalse: [ self validateValue: anObject ]).
	self length: self dataBytes size
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]

{ #category : #'as yet unclassified' }
DADataElement >> writeBSONOn: aBSON [

	^self bsonTypeCode = 9
		ifTrue: [aBSON nextDateAndTimePut: self value]
		ifFalse: [aBSON nextArrayPut: self value]
]
