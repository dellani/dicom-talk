Class {
	#name : #UNDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
UNDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
UNDataElement class >> valueRepresentationString [
	^ 'UN'
]

{ #category : #accessing }
UNDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type UN.

	 May 13 2021 - PRD"

	^ self encoder headerLengthUNDataElement + self dataBytes size
]

{ #category : #testing }
UNDataElement >> isUnknown [
	^ true
]

{ #category : #parsing }
UNDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomUNDataElementDataBytesFrom: pdvStream
		for: self
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

	aStream
		nextPutAll:
			(ByteString
				fromByteArray: (self dataBytes copyFrom: 1 to: (16 min: self dataBytes size))).
	self dataBytes size > 16
		ifTrue: [ aStream nextPutAll: ' (...)' ]
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
