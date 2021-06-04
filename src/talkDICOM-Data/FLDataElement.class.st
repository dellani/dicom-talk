Class {
	#name : #FLDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
FLDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
FLDataElement class >> valueRepresentationString [
	^ 'FL'
]

{ #category : #'field value retrieving' }
FLDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
FLDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type FL.

	 May 13 2021 - PRD"

	^ self encoder headerLengthFLDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
FLDataElement >> decodeElementDataBytes: valueDataBytes [
	" VR = Floating Point Double - PRD 04.2001, 03.2003"

	^self encoder bytesToSinglePrecisionFloat: valueDataBytes
]

{ #category : #parsing }
FLDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomFLDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
FLDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromFLDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
FLDataElement >> validateValue: floatValue [
	"Perform the validation of the value to be stored in a DICOM FL (Float) Data Element

	Single Single precision binary floating point number represented 
	in IEEE 754:1985 32-bit Floating Point Number Format. 
	4 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 07.2002, 03.2003"

	| aByteArray |
	aByteArray := ByteArray new: 4 withAll: 16r00.
	(floatValue isKindOf: Float)
		ifTrue: 
			[aByteArray := self encoder
						singlePrecisionFloatToBytes: floatValue].
	^aByteArray
]

{ #category : #'field value storing' }
FLDataElement >> value: aFloat [
	"FL Floating Point 
	Single Single precision binary floating point number represented 
	in IEEE 754:1985 32-bit Floating Point Number Format. 
	4 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 03.2003"

	(aFloat isKindOf: OrderedCollection) | (aFloat isKindOf: Array) 
		ifTrue: [self dataBytes: (self multipleByteValuesFrom: aFloat)]
		ifFalse: [self dataBytes: (self validateValue: aFloat)].
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
