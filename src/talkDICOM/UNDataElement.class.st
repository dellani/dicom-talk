Class {
	#name : #UNDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
UNDataElement class >> initialize [
	
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
UNDataElement class >> valueRepresentationString [

	^'UN'
]

{ #category : #'as yet unclassified' }
UNDataElement >> bsonTypeCode [
	"BSON type 5 = Binary data (Byte Array), 6 = nil"

	^(self bsonValue isKindOf: ByteArray) ifTrue: [5] ifFalse: [6]
]

{ #category : #'as yet unclassified' }
UNDataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromUNDataElement: self
]

{ #category : #'instance creation' }
UNDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomUNDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
UNDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthUNDataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
UNDataElement >> dataElementValueFrom: bsonUNDataElementValue [

	^self encoder 
		dicomUNDataElementValueFrom: bsonUNDataElementValue
]

{ #category : #testing }
UNDataElement >> isUnknown [
	^ true
]

{ #category : #'field bytes' }
UNDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromUNDataElement: self on: aByteStream
]

{ #category : #printing }
UNDataElement >> printEntireValueOn: aStream [
	"Print the entire Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015, August 31, 2017"

	aStream nextPutAll: self value
]

{ #category : #printing }
UNDataElement >> printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: String) ifTrue: [
		elementValue size <= 16 ifTrue: [
			aStream nextPutAll: (elementValue copyFrom: 1 to: elementValue size)
		] ifFalse: [ 
			aStream nextPutAll: (elementValue copyFrom: 1 to: 16).
			aStream nextPutAll: ' (...)'.

		]
	]

	"aStream nextPutAll: (((elementValue := self value) isKindOf: String) 
		ifTrue: [elementValue]
		ifFalse: [elementValue printString])"
]

{ #category : #'field value retrieving' }
UNDataElement >> value [
	"This Data Element type (UN) always has a Value Multiplicity equal to one - PRD 06.2002"

	^self dataBytes asString asByteString
]

{ #category : #'field value storing' }
UNDataElement >> value: aString [
	"UN Unknown: string of bytes where the encoding of the contents
	is unknown (see Section 6.2.2). Character Repertoire: not applicable
	Any length valid for any of the other DICOM Value Representations

	PS 3.5-2000 6.2 - PRD 05.2001, February 23, 2017"

	| dataString |
	dataString := self stringEvenner: aString asByteString.
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size
]

{ #category : #'as yet unclassified' }
UNDataElement >> writeBSONOn: aBSON [

	^aBSON nextByteArrayPut: self dataBytes
]
