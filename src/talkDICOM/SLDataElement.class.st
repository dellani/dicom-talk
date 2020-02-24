Class {
	#name : #SLDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
SLDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
SLDataElement class >> valueRepresentationString [

	^'SL'
]

{ #category : #'to deprecate' }
SLDataElement >> _printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015"

	| elementValue |
	((elementValue := self value) isKindOf: OrderedCollection)
		ifTrue: [ aStream nextPutAll: elementValue first printString ]
		ifFalse: [ (elementValue isKindOf: Integer)
				ifTrue: [ aStream nextPutAll: elementValue printString ] ]
]

{ #category : #'as yet unclassified' }
SLDataElement >> bsonTypeCode [
	"BSON type 16 = 32-bit integer, 4 = Array"
		
	| value bsonType | 

	bsonType := 6. "Default is nil"

	value := self bsonValue.

	(value isKindOf: Array) ifTrue: [bsonType := 4].
	(value isKindOf: Integer) ifTrue: [bsonType := 16].

	"^(self value isKindOf: OrderedCollection)
		ifTrue: [4]
		ifFalse: [16]"

	^bsonType
]

{ #category : #'as yet unclassified' }
SLDataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromSLDataElement: self
]

{ #category : #'field value retrieving' }
SLDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
SLDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthSLDataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
SLDataElement >> dataElementValueFrom: bsonSLDataElementValue [

	^self encoder 
		dicomSLDataElementValueFrom: bsonSLDataElementValue
]

{ #category : #'field value retrieving' }
SLDataElement >> decodeElementDataBytes: valueDataBytes [
	" VR = Floating Point Single - PRD 04.2001, 03.2003"

	^self encoder getValueFromByteArray: valueDataBytes
]

{ #category : #'field bytes' }
SLDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromSLDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
SLDataElement >> validateValue: an32BitInteger [
	"Perform the validation of the value to be stored in a DICOM SL (Signed Long) Data Element
	Signed binary integer 32 bits long in 2's complement form. 
	Represents an integer, n, in the range: 
	-2^31 <= n <= (2^31 - 1). 
	Character Repertoire: not applicable 
	Value Length: 4 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 07.2002"

	| aByteArray |
	aByteArray := ByteArray new.
	an32BitInteger isInteger
		ifTrue: 
			[aByteArray := self encoder byteArrayFromValue: an32BitInteger size: 4].
	^aByteArray
]

{ #category : #'field value storing' }
SLDataElement >> value: an32BitInteger [
	"SL Signed Long
	Signed binary integer 32 bits long in 2's complement form. 
	Represents an integer, n, in the range: 
	-2^31 <= n <= (2^31 - 1). 
	Character Repertoire: not applicable 
	Value Length: 4 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	(an32BitInteger isKindOf: OrderedCollection) | (an32BitInteger isKindOf: Array) 
		ifTrue: [self dataBytes: (self multipleByteValuesFrom: an32BitInteger)].
	an32BitInteger isInteger
		ifTrue: [self dataBytes: (self validateValue: an32BitInteger)].
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]

{ #category : #'as yet unclassified' }
SLDataElement >> writeBSONOn: aBSON [ 
	^self bsonTypeCode = 16
		ifTrue: [aBSON nextIntegerPut: self value]
		ifFalse: [aBSON nextArrayPut: self value]
]
