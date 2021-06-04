Class {
	#name : #ULDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
ULDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
ULDataElement class >> valueRepresentationString [
	^ 'UL'
]

{ #category : #deprecated }
ULDataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: OrderedCollection)
		ifTrue: [aStream nextPutAll: elementValue first printString]
		ifFalse: [(elementValue isKindOf: Integer)
			ifTrue: [aStream nextPutAll: elementValue printString]
		]
]

{ #category : #'field value retrieving' }
ULDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
ULDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type UL.

	 May 13 2021 - PRD"

	^ self encoder headerLengthULDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
ULDataElement >> decodeElementDataBytes: valueDataBytes [

	^self encoder getValueFromByteArray: valueDataBytes
]

{ #category : #parsing }
ULDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomULDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
ULDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromULDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
ULDataElement >> validateValue: a32BitInteger [
	"Perform the validation of the value to be stored in a DICOM UL (Unsigned Long) Data Element
	Unsigned binary integer 32 bits long. Represents an integer n in the range: 0 <= n < 2^32 . 
	Character Repertoire: not applicable 
	4 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 07.2002"

	| aByteArray |
	aByteArray := ByteArray new.
	a32BitInteger isInteger
		ifTrue: [aByteArray := self encoder byteArrayFromValue: a32BitInteger size: 4].
	^aByteArray
]

{ #category : #'field value storing' }
ULDataElement >> value: a32BitInteger [
	"UL Unsigned Long
	Unsigned binary integer 32 bits long. Represents an integer n in the range: 0 <= n < 2^32 . 
	Character Repertoire: not applicable 
	4 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	(a32BitInteger isKindOf: OrderedCollection) | (a32BitInteger isKindOf: Array) 
		ifTrue: [self dataBytes: (self multipleByteValuesFrom: a32BitInteger)].
	a32BitInteger isInteger
		ifTrue: [self dataBytes: (self validateValue: a32BitInteger)].
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
