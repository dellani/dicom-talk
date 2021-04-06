Class {
	#name : #OWDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
OWDataElement class >> initialize [
	
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
OWDataElement class >> valueRepresentationString [

	^'OW'
]

{ #category : #'instance creation' }
OWDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomOWDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
OWDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthOWDataElement + self dataBytes size
]

{ #category : #'field bytes' }
OWDataElement >> pdvBytes: aByteStream [
	"Put the byte-coding of this DICOM Data Element in to a ByteStream

	PRD - February 07th, 2003"

	self encoder pdvBytesFromOWDataElement: self on: aByteStream
]

{ #category : #printing }
OWDataElement >> printValueOn: aStream [
	"August 20, 2015: Print up to 8 of the bytes that I store to aStream;
	 September 14, 2017: Improvements for Pharo implementation;
	 April 6, 2021: Replaced test 'size > 1' with 'isEmpty and the chain
	                of conditional tests with '8 min:' - PRD"

	| elementValue |
	(elementValue := self value) isArray
		ifTrue: [ elementValue notEmpty
				ifTrue: [ (encoder getValueFromByteArray: (elementValue copyFrom: 1 to: 2))
  						             printOn: aStream
						             base: 16.
					3 to: (16 min: elementValue size) by: 2 do: [ :index | 
						aStream nextPutAll: ', '.
						(encoder getValueFromByteArray: (elementValue copyFrom: index to: index + 1))
							      printOn: aStream
							      base: 16 ].
					elementValue size > 16
						ifTrue: [ aStream nextPutAll: ', ...' ] ] ]
]

{ #category : #'field value retrieving' }
OWDataElement >> value [
	"VR = OW (Other Word String)
	PRD 04-06.2001, 03-05.2002

	Note: always return a ByteArray using Big Endian byte ordering, which means
	that if the encoder uses Little Endian, the byte ordering of dataBytes must be changed.
	PRD 05.2002

	This Data Element type (OW) always has a Value Multiplicity equal to one
	PRD 06.2002"

	^self length = 16rFFFFFFFF
		ifTrue: [self unencapsulateValue]
		ifFalse: [self dataBytes]
]

{ #category : #'field value storing' }
OWDataElement >> value: aByteArray [
	"OW (Other Word String)
	A string of 16-bit words where the encoding of the contents is specified 
	by the negotiated Transfer Syntax. OW is a VR which requires byte swapping 
	within each word when changing between Little Endian and Big Endian byte 
	ordering (see Section 7.3). 
	Character Repertoire: not applicable 
	Value Length: see Transfer Syntax definition	
	PS 3.5-2000 6.2 - PRD 05.2001, 03.2002

	Note: aByteArray uses always Big Endian byte ordering, which means
	that if the encoder is uses Little Endian, the byte ordering of aByteArray must be changed.
	PRD 05.2002

	The byte swapping is done when necessary by the transfer syntax encoder smalltalk class
	PRD 06-07.2002"

	self dataBytes: aByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
