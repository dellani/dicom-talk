Class {
	#name : #ASDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
ASDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
ASDataElement class >> valueRepresentationString [

	^'AS'
]

{ #category : #'to deprecate' }
ASDataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	elementValue := self value.
	(elementValue isKindOf: String) ifTrue: [
		aStream nextPutAll: elementValue
	]
]

{ #category : #'instance creation' }
ASDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomASDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
ASDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthASDataElement + self dataBytes size
]

{ #category : #'field bytes' }
ASDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromASDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
ASDataElement >> validateValue: anASValue [
"
	Perform the validation of the value to be stored in a DICOM Age String Data Element
	A string of characters with one of the following formats -- nnnD, nnnW, nnnM, nnnY; where nnn 
	shall contain the number of days for D, weeks for W, months for M, or years for Y.  4 bytes fixed size.
	PS 3.5-2000 6.2
	PRD 04.2001 - 07.2002

	Porting to Pharo 5.0 - PRD February 23, 2017"

	| ageStream |

	ageStream := WriteStream on: String new.
	anASValue size = 4 ifTrue: [
		((anASValue copyFrom: 1 to: 3) asInteger) printOn: ageStream base: 10 length: 3 padded: true.
		(#(16r44 16r4D 16r57 16r59) includes: ((anASValue at: 4) asInteger ))
			ifTrue: [ageStream nextPut: (anASValue at: 4)]
			ifFalse: [ageStream nextPut: 16r44 asCharacter]
	].
	^ageStream contents
]

{ #category : #'field value storing' }
ASDataElement >> value: anASValue [
"
	AS Age String
	A string of characters with one of the following formats -- nnnD, nnnW, nnnM, nnnY; where nnn 
	shall contain the number of days for D, weeks for W, months for M, or years for Y.  4 bytes fixed size.
	PS 3.5-2000 6.2
	PRD 05-12.2001 - 02.2002

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 07.2002
"
	| dataString |

	dataString := String new.
	(anASValue isKindOf: OrderedCollection) | (anASValue isKindOf: Array)ifTrue: [
		dataString := self multipleStringValuesFrom: anASValue.
		dataString := self stringEvenner: dataString].
	(anASValue isKindOf: String) ifTrue: [
		dataString := self validateValue: anASValue].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)."
]
