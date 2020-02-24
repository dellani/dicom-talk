Class {
	#name : #SSDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
SSDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
SSDataElement class >> valueRepresentationString [

	^'SS'
]

{ #category : #'to deprecate' }
SSDataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: OrderedCollection)
		ifTrue: [aStream nextPutAll: elementValue first printString]
		ifFalse: [(elementValue isKindOf: Integer)
			ifTrue: [aStream nextPutAll: elementValue printString]
		]
]

{ #category : #'as yet unclassified' }
SSDataElement >> bsonTypeCode [
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
SSDataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromSSDataElement: self
]

{ #category : #'field value retrieving' }
SSDataElement >> byteSize [
	^16r02
]

{ #category : #accessing }
SSDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthSSDataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
SSDataElement >> dataElementValueFrom: bsonSSDataElementValue [

	^self encoder 
		dicomSSDataElementValueFrom: bsonSSDataElementValue
]

{ #category : #'field value retrieving' }
SSDataElement >> decodeElementDataBytes: valueDataBytes [

	^self encoder getValueFromByteArray: valueDataBytes
]

{ #category : #'field bytes' }
SSDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromSSDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
SSDataElement >> validateValue: a16BitInteger [
	"Perform the validation of the value to be stored in a DICOM SS (Signed Short) Data Element
	Signed binary integer 16 bits long in 2's complement form. 
	Represents an integer n in the range: -2^15 <= n <= (2^15 - 1). 
	Character Repertoire: not applicable 
	Value Length: 2 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 07.2002"

	| aByteArray |
	aByteArray := ByteArray new.
	a16BitInteger isInteger
		ifTrue: [aByteArray := self encoder byteArrayFromValue: a16BitInteger size: 2].
	^aByteArray
]

{ #category : #'field value storing' }
SSDataElement >> value: a16BitInteger [
	"SS Signed Short
	Signed binary integer 16 bits long in 2's complement form. 
	Represents an integer n in the range: -2^15 <= n <= (2^15 - 1). 
	Character Repertoire: not applicable
	Value Length: 2 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	(a16BitInteger isKindOf: OrderedCollection) | (a16BitInteger isKindOf: Array) 
		ifTrue: [self dataBytes: (self multipleByteValuesFrom: a16BitInteger)].
	a16BitInteger isInteger
		ifTrue: [self dataBytes: (self validateValue: a16BitInteger)].
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]

{ #category : #'as yet unclassified' }
SSDataElement >> writeBSONOn: aBSON [ 
	^self bsonTypeCode = 16
		ifTrue: [aBSON nextIntegerPut: self value]
		ifFalse: [aBSON nextArrayPut: self value]
]
