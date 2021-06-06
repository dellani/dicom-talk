Class {
	#name : #USDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
USDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
USDataElement class >> valueRepresentationString [
	^ 'US'
]

{ #category : #'field value retrieving' }
USDataElement >> byteSize [
	^16r02
]

{ #category : #accessing }
USDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type US.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthUSDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
USDataElement >> decodeElementDataBytes: valueDataBytes [

	^self encoder getValueFromByteArray: valueDataBytes
]

{ #category : #parsing }
USDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomUSDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
USDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromUSDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
USDataElement >> validateValue: a16BitInteger [
	"Validate 'a16BitInteger' according to the rules for DICOM US (Unsigned Short) Data Elements.
	 Unsigned binary integer 16 bits long. Represents integer n in the range: 0 <= n < 2^16 .
	 Character Repertoire: not applicable 
	 Value Length: 2 bytes fixed
	 PS 3.5-2000 6.2

	 06 June 2021: New implementation - Paulo R. Dellani"

	^ ByteArray
		new: 10
		streamContents: [ :byteStream | 
			a16BitInteger isInteger
				ifTrue: [ byteStream
						nextPutAll: (self encoder byteArrayFromValue: a16BitInteger size: 2) ] ]
]

{ #category : #'field value storing' }
USDataElement >> value: a16BitInteger [
	"US Unsigned Short
	Unsigned binary integer 16 bits long. Represents integer n in the range: 0 <= n < 2^16 .
	Character Repertoire: not applicable 
	Value Length: 2 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	(a16BitInteger isKindOf: OrderedCollection) | (a16BitInteger isKindOf: Array)
		ifTrue: [ self dataBytes: (self multipleByteValuesFrom: a16BitInteger) ].
	a16BitInteger isInteger
		ifTrue: [ self dataBytes: (self validateValue: a16BitInteger) ].
	self length: self dataBytes size
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
