Class {
	#name : #UTDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
UTDataElement class >> initialize [
	"The character code 5CH (the BACKSLASH  \  in ISO-IR 6)
	shall not be present, as it is used as the delimiter between 
	values in multiple valued  data elements. The string shall not
	have Control Characters except for ESC.

	Default Character  Repertoire and/or as defined by (0008,0005)"

	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		addAll: DefaultCharacterRepertoire digit;
		addAll: DefaultCharacterRepertoire lowerCase;
		addAll: DefaultCharacterRepertoire upperCase;
		addAll: DefaultCharacterRepertoire symbol;
		add: Character escape.
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
UTDataElement class >> valueRepresentationString [
	^ 'UT'
]

{ #category : #'instance creation' }
UTDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomUTDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
UTDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthUTDataElement + self dataBytes size
]

{ #category : #'field bytes' }
UTDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromUTDataElement: self on: aByteStream
]

{ #category : #printing }
UTDataElement >> printEntireValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015, August 31, 2017"

	| elementValue |
	((elementValue := self value) isKindOf: String)
		ifTrue: [ aStream nextPutAll: elementValue ]
]

{ #category : #printing }
UTDataElement >> printValueOn: aStream [
	"August 20, 2015: Print up to 16 bytes of the unlimeted text
	                  value that I store to aStream;
	 April 06, 2021: New implementation with improved output - PRD"

	| elementValue |
	(elementValue := self value) isString
		ifTrue: [ elementValue copyFrom: 1 to: (16 min: elementValue size).
			elementValue size > 16
				ifTrue: [ aStream nextPutAll: ' (...)' ] ]
		ifFalse: [ aStream nextPutAll: '#!STRING' ]
]

{ #category : #'field value retrieving' }
UTDataElement >> value [
	"VR = Unlimited Text.
	
	PRD 04.2001"
	
	| aUnlimitedTextString |

	aUnlimitedTextString := (
		self 
			stringPurify: (String withAll: self dataBytes)
			goodChars: self class dataElementCharacterRepertoire
		) trimBoth.

	^aUnlimitedTextString
]

{ #category : #'field value storing' }
UTDataElement >> value: anObject [
	"UT (Unlimited Text): 	A character string that may contain one or more paragraphs. It
	may contain the Graphic Character set and the Control Characters, CR, LF, FF, and ESC. 
	It may be padded with trailing spaces, which may be ignored, but leading spaces 
	are considered to be significant. Data Elements with this VR shall not be multi-valued 
	and therefore character code 5CH (the BACKSLASH  \  in ISO-IR 6) may be used. 
	Default Character Repertoire and/or as defined by (0008,0005). 2 32 -2 
	Note: limited only by the size of the maximum unsigned integer representable in a 32 bit 
	VL field minus one, since FFFFFFFFH is reserved.
	PS 3.5-2000 6.2 - PRD 05.2001"

	| dataString |

	dataString := self stringEvenner: anObject asByteString.
	dataString := self sizeString: dataString maxSize: 16rFFFFFFFF - 3.
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
