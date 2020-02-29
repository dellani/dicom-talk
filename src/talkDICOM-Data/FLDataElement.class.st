Class {
	#name : #FLDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
FLDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
FLDataElement class >> valueRepresentationString [

	^'FL'
]

{ #category : #'to deprecate' }
FLDataElement >> _printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015"

	| elementValue |
	((elementValue := self value) isKindOf: OrderedCollection)
		ifTrue: [ aStream
				nextPutAll: elementValue first printString;
				nextPut: $\.
			2 to: elementValue size - 1 do: [ :index | 
				aStream
					nextPutAll: (elementValue at: index) printString;
					nextPut: $\ ].
			aStream nextPutAll: elementValue last printString ]
		ifFalse: [ (elementValue isKindOf: Float)
				ifTrue: [ aStream nextPutAll: elementValue printString ] ]
]

{ #category : #'field value retrieving' }
FLDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
FLDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthFLDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
FLDataElement >> decodeElementDataBytes: valueDataBytes [
	" VR = Floating Point Double - PRD 04.2001, 03.2003"

	^self encoder bytesToSinglePrecisionFloat: valueDataBytes
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
