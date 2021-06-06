Class {
	#name : #DADataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
DADataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
DADataElement class >> valueRepresentationString [
	^ 'DA'
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
	"Lenght of the message field in bytes for data element of type DA.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthDADataElement + self dataBytes size
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
	PRD 04.2001  - 01-07.2002, 06.2017, 03.2018"

	| split year month day date monthday byteString |
	
	byteString := ByteString fromByteArray: valueDataBytes.
	split := '.' split: byteString.
	split size > 1 ifFalse: [split := '/' split: byteString].
	
	"look for the substring with the year"
	split do: [ :substring | substring size = 4 ifTrue: [ year := substring asNumber ] ].
	
	"look for the substrings with the month and the day"
	monthday := OrderedCollection new.
	split do: [ :substring | substring size = 2 ifTrue: [ monthday add: substring asNumber ] ].

	"Normally the first substring in monthday should represent the month, aber Kontrolle ist besser."
	monthday first > 12 
		ifTrue: [ day := monthday first. month := monthday last ] 
		ifFalse: [ month := monthday first. day := monthday last ].
	
	"Guarantee that Date will be UTC+/-0; Always use instances of
	 DateTime for Date or Time representation"
	[ date := DateAndTime year: year month: month day: day offset: 0 asDuration ]
		on: Error
		do: [ :ex | date := nil ].
	^ date
]

{ #category : #'field value retrieving' }
DADataElement >> decodeValue [
	| anOrderedCollection split |
	anOrderedCollection := OrderedCollection new.
	(self dataBytes includes: 16r20) ifTrue: [ "Remove blanks"
		dataBytes := (self stringPurify: self dataBytes asString goodChars: DefaultCharacterRepertoire digit) asByteArray.
		length := dataBytes size.
	 ].

	self dataBytes size >= self byteSize
		ifTrue: [ (self dataBytes includes: 16r2E) | (self dataBytes includes: 16r2F)
			ifFalse: [ split := (self dataBytes includes: 16r5C)
					ifFalse: [ self dataBytesByteSpliter ]
					ifTrue: [ self dataBytesByteSpliter_exception01 ].
				split do: [ :valueDataBytes | anOrderedCollection add: (self decodeElementDataBytes: valueDataBytes) ] ]
			ifTrue: [ (self dataBytesByteSpliter: 16r0A)
					do: [ :valueDataBytes | anOrderedCollection add: (self decodeElementDataBytes_preDICOMV3: valueDataBytes) ] ] ]
		ifFalse: [ self type = '3'
			ifTrue: [ anOrderedCollection add: nil ]
			ifFalse: [ self raiseElementSizeError ] ].
	"***** Date string in the pre-DICOM V3.0 encoding format *************"
	^ anOrderedCollection
]

{ #category : #parsing }
DADataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomDADataElementDataBytesFrom: pdvStream
		for: self
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
	"Print the value that I store to aStream.
	
	 20 August 2015: Initial implementation;
	   06 June 2021: New implementation - Paulo R. Dellani"

	self decodeValue
		ifNotEmpty: [ :arg | 
			arg first printYMDOn: aStream.
			2 to: arg size do: [ :index | 
				aStream nextPutAll: ' \\ '.
				(arg at: index) printYMDOn: aStream ] ]
]

{ #category : #'field value storing' }
DADataElement >> validateValue: aDateOrString [
	"Validate 'aDateOrString' according to the rules for DICOM Date Data Elements.
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

	   March 2017: Bug fixes;
	 06 June 2021: Bug fixes; New implementation - Paulo R. Dellani"

	| dateString |
	^ String
		new: 10
		streamContents:
			[ :stream | 
			(aDateOrString isKindOf: Date) | (aDateOrString isKindOf: DateAndTime)
				ifTrue: [ aDateOrString asDate printOn: stream format: #(3 2 1 0 1 1 2) ].
			aDateOrString isString
				ifTrue: [ dateString := self stringEvenner: aDateOrString.
					dateString := self
						stringPurify: dateString
						goodChars: DefaultCharacterRepertoire digit.
					stream nextPutAll: dateString ] ] asByteArray
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
]
