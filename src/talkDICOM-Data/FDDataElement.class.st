Class {
	#name : #FDDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
FDDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
FDDataElement class >> valueRepresentationString [
	^ 'FD'
]

{ #category : #'to deprecate' }
FDDataElement >> _printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 

	PRD January 10th, 2003 - August 20th, 2015, August 29, 2017"

	| valueCollection |

	self dataBytes notEmpty
		ifTrue: [ self dataBytes size >= self byteSize
				ifTrue: [ (valueCollection := self decodeValue) notEmpty
						ifTrue: [ aStream nextPutAll: valueCollection first printString.
							2 to: valueCollection size do: [ :index | 
								aStream nextPutAll: ' \\ '.
								aStream nextPutAll: (valueCollection at: index) printString ] ] ] ].


	"((elementValue := self value) isKindOf: OrderedCollection)
		ifTrue: [ aStream
				nextPutAll: elementValue first printString;
				nextPut: $\.
			2 to: elementValue size - 1 do: [ :index | 
				aStream
					nextPutAll: (elementValue at: index) printString;
					nextPut: $\ ].
			aStream nextPutAll: elementValue last printString ]
		ifFalse: [ (elementValue isKindOf: Float)
				ifTrue: [ aStream nextPutAll: elementValue printString ] ]."

]

{ #category : #'field value retrieving' }
FDDataElement >> byteSize [
	^16r08
]

{ #category : #accessing }
FDDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthFDDataElement + self dataBytes size
]

{ #category : #'field value retrieving' }
FDDataElement >> decodeElementDataBytes: valueDataBytes [
	" VR = Floating Point Single - PRD 04.2001, 03.2003"

	^self encoder bytesToDoublePrecisionFloat: valueDataBytes
]

{ #category : #'field bytes' }
FDDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromFDDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
FDDataElement >> validateValue: aDouble [
	"Perform the validation of the value to be stored in a DICOM FD (Double precision Float) Data Element

	FD Floating Point Double
	Double precision binary floating point number represented in IEEE 754:1985 
	64-bit Floating Point Number Format.
	8 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 07.2002, 03.2003"

	| aByteArray |
	aByteArray := ByteArray new.
	aDouble isFloat
		ifTrue: [aByteArray := self encoder doublePrecisionFloatToBytes: aDouble].
	^aByteArray
]

{ #category : #'field value storing' }
FDDataElement >> value: aDouble [
	"FD Floating Point Double
	Double precision binary floating point number represented in IEEE 754:1985 
	64-bit Floating Point Number Format.
	8 bytes fixed
	PS 3.5-2000 6.2 - PRD 05.2001, 03.2003"

	(aDouble isKindOf: OrderedCollection) | (aDouble isKindOf: Array) 
		ifTrue: [self dataBytes: (self multipleByteValuesFrom: aDouble)]
		ifFalse: [self dataBytes: (self validateValue: aDouble)].
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
