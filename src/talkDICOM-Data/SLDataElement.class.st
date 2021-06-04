Class {
	#name : #SLDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
SLDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
SLDataElement class >> valueRepresentationString [
	^ 'SL'
]

{ #category : #'field value retrieving' }
SLDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
SLDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type SL.

	 May 13 2021 - PRD"

	^ self encoder headerLengthSLDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
SLDataElement >> decodeElementDataBytes: valueDataBytes [
	" VR = Floating Point Single - PRD 04.2001, 03.2003"

	^self encoder getValueFromByteArray: valueDataBytes
]

{ #category : #parsing }
SLDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomSLDataElementDataBytesFrom: pdvStream
		for: self
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
