Class {
	#name : #ATDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
ATDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
ATDataElement class >> valueRepresentationString [
	^ 'AT'
]

{ #category : #'field value retrieving' }
ATDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
ATDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type AT.

	 May 13 2021 - PRD"

	^ self encoder headerLengthATDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
ATDataElement >> decodeElementDataBytes: valueDataBytes [
	" VR = Attribute Tag - PRD 04.2001, August 29, 2017"

	| aDataElementTag |
	aDataElementTag := DataElementTag new.
	aDataElementTag groupNumber: 
		(self encoder getValueFromByteArray: (valueDataBytes copyFrom: 1 to: 2)).
	aDataElementTag elementNumber: 
		(self encoder getValueFromByteArray: (valueDataBytes copyFrom: 3 to: 4)).
	^ aDataElementTag
]

{ #category : #parsing }
ATDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomATDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
ATDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromATDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
ATDataElement >> validateValue: anATValue [
	"Perform the validation of the value to be stored in a DICOM Attribute Tag Data Element
	Ordered pair of 16-bit unsigned integers that is the value of a Data Element Tag. 
	Example: A Data Element Tag of (0018,00FF) would be encoded as a series of 4 bytes in a 
	Little-Endian Transfer Syntax as 18H,00H,FFH,00H and in a Big-Endian Transfer Syntax 
	as 00H,18H,00H,FFH. 
	Note: The encoding of an AT value is exactly the same as the encoding of a Data Element 
	Tag as defined in Section 7. 
	4 bytes fixed
	PS 3.5-2000 6.2
	PRD 05.2001, 07.2002"

	| attributeTagStream aByteArray |
	aByteArray := ByteArray new.
	(anATValue isKindOf: DataElementTag)
		ifTrue: [ attributeTagStream := WriteStream on: ByteArray new.
			attributeTagStream nextPutAll: (self encoder byteArrayFromValue: anATValue groupNumber size: 2).
			attributeTagStream nextPutAll: (self encoder byteArrayFromValue: anATValue elementNumber size: 2).
			aByteArray := attributeTagStream contents ].
	^ aByteArray
]

{ #category : #'field value storing' }
ATDataElement >> value: anATValue [
	"AT Attribute Tag

	Ordered pair of 16-bit unsigned integers that is the value of a Data Element Tag. 
	Example: A Data Element Tag of (0018,00FF) would be encoded as a series of 4 bytes in a 
	Little-Endian Transfer Syntax as 18H,00H,FFH,00H and in a Big-Endian Transfer Syntax 
	as 00H,18H,00H,FFH. 
	Note: The encoding of an AT value is exactly the same as the encoding of a Data Element 
	Tag as defined in Section 7. 
	4 bytes fixed
	PS 3.5-2000 6.2
	PRD 05.2001 - August 29, 2017

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 07.2002"

	anATValue isCollection | anATValue isArray
		ifTrue: [ self dataBytes: (self multipleByteValuesFrom: anATValue) ].
	(anATValue isKindOf: DataElementTag)
		ifTrue: [ self dataBytes: (self validateValue: anATValue) ].
	self length: self dataBytes size
]
