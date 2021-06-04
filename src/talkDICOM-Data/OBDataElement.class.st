Class {
	#name : #OBDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
OBDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
OBDataElement class >> valueRepresentationString [
	^ 'OB'
]

{ #category : #accessing }
OBDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type OB.

	 May 13 2021 - PRD"

	^ self encoder headerLengthOBDataElement + self dataBytes size
]

{ #category : #parsing }
OBDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomOBDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
OBDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromOBDataElement: self on: aByteStream
]

{ #category : #printing }
OBDataElement >> printValueOn: aStream [
	"August 20, 2015: Print up to 8 of the bytes that I store to aStream;
	 September 13, 2017: Improvements for Pharo implementation;
	 April 6, 2021: Replaced test 'size > 1' with 'isEmpty and the chain
	                of conditional tests with '8 min:' - PRD"

	| elementValue |
	(elementValue := self value) isArray
		ifTrue: [ elementValue notEmpty
				ifTrue: [ elementValue first printOn: aStream base: 10.
					2 to: (8 min: elementValue size) do: [ :index | 
						aStream nextPutAll: ', '.
						(elementValue at: index) printOn: aStream base: 10 ] ] ]
]

{ #category : #'field value retrieving' }
OBDataElement >> value [
	"VR = OB (Other Byte String)
	PRD 04-06.2001

	This Data Element type (OB) always has a Value Multiplicity equal to one
	PRD 06.2002"

	^self length = 16rFFFFFFFF
		ifTrue: [self unencapsulateValue]
		ifFalse: [self dataBytes]
]

{ #category : #'field value storing' }
OBDataElement >> value: aByteArray [
	"OB (Other Byte String)
	A string of bytes where the encoding of the contents is specified by the 
	negotiated Transfer Syntax. OB is a VR which is insensitive to Little/Big Endian 
	byte ordering (see Section 7.3). The string of bytes shall be padded with a single 
	trailing NULL byte value (00H) when necessary to achieve even length. 
	Character Repertoire: not applicable 
	Value Length: Transfer Syntax definition

	PS 3.5-2000 6.2 - PRD 05.2001, 02.2002, February 23, 2017"

	self dataBytes: aByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
