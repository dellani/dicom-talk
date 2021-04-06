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
	"August 31, 2017: Print the entire value that in store in aStream - PRD"

	aStream nextPutAll: self value
]

{ #category : #printing }
UNDataElement >> printValueOn: aStream [
	"August 20, 2015: Print up to 16 bytes of the unknown value that
	                  I store to aStream;
	 April 06, 2021: New implementation - PRD"

	| elementValue |
	(elementValue := self value) isString
		ifTrue: [ elementValue copyFrom: 1 to: (16 min: elementValue size).
			elementValue size > 16
				ifTrue: [ aStream nextPutAll: ' (...)' ] ]
		ifFalse: [ aStream nextPutAll: '#!STRING' ]
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
