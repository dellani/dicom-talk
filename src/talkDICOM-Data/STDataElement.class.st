Class {
	#name : #STDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
STDataElement class >> initialize [
	"A character string that may contain one or more paragraphs.
	It may contain the Graphic Character set and the Control Characters,
	CR, LF, FF, and ESC. It may be padded with trailing spaces, which 
	may be ignored, but leading spaces are considered to be significant.
	Data Elements with this VR shall not be multi-valued and therefore 
	character code 5CH (the BACKSLASH  \  in ISO-IR 6) may be used. 

	Default Character Repertoire and/or as defined by (0008,0005)."

	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		addAll: DefaultCharacterRepertoire digit;
		addAll: DefaultCharacterRepertoire lowerCase;
		addAll: DefaultCharacterRepertoire upperCase;
		addAll: DefaultCharacterRepertoire symbol;
		addAll: DefaultCharacterRepertoire control.
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
STDataElement class >> valueRepresentationString [

	^'ST'
]

{ #category : #'to deprecate' }
STDataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: String) ifTrue: [
		elementValue size <= 16 ifTrue: [
			aStream nextPutAll: (elementValue copyFrom: 1 to: elementValue size)
		] ifFalse: [ 
			aStream nextPutAll: (elementValue copyFrom: 1 to: 16)
		]
	]
]

{ #category : #'instance creation' }
STDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomSTDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
STDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthSTDataElement + self dataBytes size
]

{ #category : #'field bytes' }
STDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromSTDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
STDataElement >> validateValue: aSTValue [
"
	Perform the validation of the value to be stored in a DICOM Short Text Data Element

	A character string that may contain one or more paragraphs. It may contain 
	the Graphic Character set and the Control Characters, CR, LF, FF, and ESC. 
	It may be padded with trailing spaces, which may be ignored, but leading spaces 
	are considered to be significant. Data Elements with this VR shall not be multi-valued 
	and therefore character code 5CH (the BACKSLASH  \  in ISO-IR 6) may be used. 
	Default Character Repertoire and/or as defined by (0008,0005). 
	1024 chars maximum (see NOTE in 6.2)
	PS 3.5-2000 6.2
	PRD 05.2001, 01-07.2002
"
	| dataString |

	dataString := (self 
		stringPurify: aSTValue 
		goodChars:  self class dataElementCharacterRepertoire) trimBoth.
	dataString := self sizeString: dataString maxSize: 16r0400.
	^dataString.
]

{ #category : #'field value storing' }
STDataElement >> value: aSTValue [
"
	ST Short Text
	A character string that may contain one or more paragraphs. It may contain 
	the Graphic Character set and the Control Characters, CR, LF, FF, and ESC. 
	It may be padded with trailing spaces, which may be ignored, but leading spaces 
	are considered to be significant. Data Elements with this VR shall not be multi-valued 
	and therefore character code 5CH (the BACKSLASH  \  in ISO-IR 6) may be used. 
	Default Character Repertoire and/or as defined by (0008,0005). 
	1024 chars maximum (see NOTE in 6.2)
	PS 3.5-2000 6.2
	PRD 05.2001, 01.2002

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 07.2002

	Data Elements with this VR shall not be multi-valued. Removing VM>=1 code.
	PRD 01.2016
"
	| dataString |

	dataString := String new.
	"(aSTValue isKindOf: OrderedCollection) ifTrue: [
		dataString := self multipleStringValuesFrom: aSTValue.
		dataString := self stringEvenner: dataString]."
	(aSTValue isKindOf: String) ifTrue: [
		dataString := self validateValue: aSTValue.
		dataString := self stringEvenner: dataString].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)."
]
