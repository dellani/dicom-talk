Class {
	#name : #ATDataElement,
	#superclass : #FixedSizeDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
ATDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
ATDataElement class >> valueRepresentationString [

	^'AT'
]

{ #category : #'to deprecate' }
ATDataElement >> _decodeElementDataBytes: valueDataBytes [
	" VR = Attribute Tag - PRD 04.2001"

	| aDictionary |
	aDictionary := Dictionary new.
	aDictionary at: #groupNumber
		put: (self encoder
				getValueFromByteArray: (valueDataBytes copyFrom: 1 to: 2)).
	aDictionary at: #elementNumber
		put: (self encoder
				getValueFromByteArray: (valueDataBytes copyFrom: 3 to: 4)).
	^aDictionary
]

{ #category : #'to deprecate' }
ATDataElement >> _printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015, August 29, 2017"

	| valueCollection |
	^ self dataBytes notEmpty
		ifTrue: [ self dataBytes size >= self byteSize
				ifTrue: [ (valueCollection := self decodeValue) notEmpty
						ifTrue: [ (DataElementTag fromArray: valueCollection first) printOn: aStream.
							2 to: valueCollection size do: [ :index | 
								aStream nextPutAll: ' \\ '.
								(DataElementTag fromArray: (valueCollection at: index)) printOn: aStream ] ] ] ]
]

{ #category : #'as yet unclassified' }
ATDataElement >> bsonTypeCode [
	"BSON type 3 = Object, 4 = Array, 6 = nil"

	| value bsonType | 

	bsonType := 6. "Default is nil"

	value := self bsonValue.

	(value isKindOf: Array) ifTrue: [bsonType := 4].
	(value isKindOf: Dictionary) ifTrue: [bsonType := 3].

	^bsonType
]

{ #category : #'as yet unclassified' }
ATDataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromATDataElement: self
]

{ #category : #'field value retrieving' }
ATDataElement >> byteSize [
	^16r04
]

{ #category : #accessing }
ATDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthATDataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
ATDataElement >> dataElementValueFrom: bsonATDataElementValue [

	^self encoder 
		dicomATDataElementValueFrom: bsonATDataElementValue
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

{ #category : #'as yet unclassified' }
ATDataElement >> writeBSONOn: aBSON [

	^self bsonTypeCode = 2
		ifTrue: [aBSON nextSizedStringPut: self value trimBoth]
		ifFalse: [aBSON nextArrayPut: self value]
]
