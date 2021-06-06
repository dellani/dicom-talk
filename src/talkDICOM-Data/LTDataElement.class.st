Class {
	#name : #LTDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
LTDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
LTDataElement class >> valueRepresentationString [
	^ 'LT'
]

{ #category : #accessing }
LTDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type LT.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthLTDataElement + self dataBytes size
]

{ #category : #parsing }
LTDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomLTDataElementDataBytesFrom: pdvStream
		for: self
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
	"Put the first 16 characters of the value that I store in aStream.
	
	 20 August 2015: Initial implementation;
     06 April 2021: use min: instead of a chain of conditional tests;
	   06 June 2021: New implementation - Paulo R. Dellani"

	| elementValue |
	elementValue := self value.
	aStream
		nextPutAll: (elementValue copyFrom: 1 to: (16 min: elementValue size))
]

{ #category : #'field value retrieving' }
LTDataElement >> value [
	"Decode value Long Text stored in dataBytes and convert 
	 it to its correspoding Smalltalk representation.
	
	 06 June 2021: New implementation - Paulo R. Dellani"

	^ self dataBytes asString asByteString
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
