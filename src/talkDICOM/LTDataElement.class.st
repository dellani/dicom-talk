Class {
	#name : #LTDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
LTDataElement class >> initialize [
	
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
LTDataElement class >> valueRepresentationString [

	^'LT'
]

{ #category : #'as yet unclassified' }
LTDataElement >> bsonTypeCode [
	"BSON type 2 = String; 6 = nil"

	^(self bsonValue isKindOf: ByteArray) ifTrue: [2] ifFalse: [6]
]

{ #category : #'as yet unclassified' }
LTDataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromLTDataElement: self
]

{ #category : #'instance creation' }
LTDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomLTDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
LTDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthLTDataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
LTDataElement >> dataElementValueFrom: bsonLTDataElementValue [

	^self encoder 
		dicomLTDataElementValueFrom: bsonLTDataElementValue
]

{ #category : #'field bytes' }
LTDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromLTDataElement: self on: aByteStream
]

{ #category : #printing }
LTDataElement >> printEntireValueOn: aStream [
	"Print the entire Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015, August 31, 2017"

	| elementValue |
	((elementValue := self value) isKindOf: ByteString)
		ifTrue: [ aStream nextPutAll: elementValue ]
]

{ #category : #printing }
LTDataElement >> printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: ByteString) ifTrue: [
		elementValue size <= 16 ifTrue: [
			aStream nextPutAll: (elementValue copyFrom: 1 to: elementValue size)
		] ifFalse: [ 
			aStream nextPutAll: (elementValue copyFrom: 1 to: 16)
		]
	]
]

{ #category : #'field value retrieving' }
LTDataElement >> value [
	"VR = Long Text.
	
	PRD 04-06.2001"

	^self dataBytes asString asByteString.
]

{ #category : #'field value storing' }
LTDataElement >> value: anObject [
	"LT (Long Text)
	This Data Element always has the multiplicty value equal to 1

	PS 3.5-2000 6.2 - PRD 05-12.2001, February 23, 2017"

	self dataBytes: anObject asByteArray.

	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]

{ #category : #'as yet unclassified' }
LTDataElement >> writeBSONOn: aBSON [

	^aBSON nextSizedStringPut: self value
]
