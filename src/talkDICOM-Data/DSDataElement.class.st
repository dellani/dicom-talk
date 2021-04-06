Class {
	#name : #DSDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
DSDataElement class >> initialize [
	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		add: 16r30 asCharacter;
		add: 16r31 asCharacter;
		add: 16r32 asCharacter;
		add: 16r33 asCharacter;
		add: 16r34 asCharacter;
		add: 16r35 asCharacter;
		add: 16r36 asCharacter;
		add: 16r37 asCharacter;
		add: 16r38 asCharacter;
		add: 16r39 asCharacter;
		add: 16r002E asCharacter;	"."
		add: 16r002B asCharacter;	"+"
		add: 16r002D asCharacter;	"-"
		add: 16r0065 asCharacter;	"e"
		add: 16r0045 asCharacter.	"E"
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
DSDataElement class >> valueRepresentationString [
	^ 'DS'
]

{ #category : #'to deprecate' }
DSDataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	elementValue := self value.
	(elementValue isKindOf: OrderedCollection) ifTrue: [
		aStream nextPutAll: elementValue first.
		2 to: elementValue size do: [:index | 
			aStream nextPutAll: ', '; nextPutAll: (elementValue at: index).
		]
	] ifFalse: [
		aStream nextPutAll: elementValue.
	].
]

{ #category : #'instance creation' }
DSDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomDSDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
DSDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthDSDataElement + self dataBytes size
]

{ #category : #'field bytes' }
DSDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromDSDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
DSDataElement >> validateValue: aDSValue [
	"Perform the validation of the value to be stored in Decimal String DICOM Data Element.

	A string of characters representing either a fixed point number or a floating point number. 
	A fixed point number shall contain only the characters 0-9 with an optional leading 
	'+' or '-' and an optional '.' to mark the decimal point. A floating point number shall 
	be conveyed as defined in ANSI X3.9, with an 'E' or 'e' to indicate the start of the 
	exponent. Decimal Strings may be padded with leading or trailing spaces. 
	Embedded spaces are not allowed.  
	'0' - '9' ,  '+' ,  '-' ,  'E' ,  'e' ,  '.' of Default Character Repertoire 
	16 bytes maximum
	PS 3.5-2000 6.2

	PRD 05.2001, 07.2002"

	| dataString |
	dataString := (self stringPurify: aDSValue goodChars: self class dataElementCharacterRepertoire) trimBoth.
	dataString := self sizeString: dataString maxSize: 16r10.
	^ dataString
]

{ #category : #'field value storing' }
DSDataElement >> value: aValue [
	"DS Decimal String 
	A string of characters representing either a fixed point number or a floating point number. 
	A fixed point number shall contain only the characters 0-9 with an optional leading 
	'+' or '-' and an optional '.' to mark the decimal point. A floating point number shall 
	be conveyed as defined in ANSI X3.9, with an 'E' or 'e' to indicate the start of the 
	exponent. Decimal Strings may be padded with leading or trailing spaces. 
	Embedded spaces are not allowed.  
	'0' - '9' ,  '+' ,  '-' ,  'E' ,  'e' ,  '.' of Default Character Repertoire 
	16 bytes maximum
	PS 3.5-2000 6.2
	PRD 05.2001

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 07.2002"

	| dataString |
	(aValue isKindOf: OrderedCollection) | (aValue isKindOf: Array)
		ifTrue: 
			[dataString := self multipleStringValuesFrom: aValue.
			dataString := self stringEvenner: dataString.
			self dataBytes: dataString asByteArray].
	(aValue isKindOf: String)
		ifTrue: 
			[dataString := self validateValue: aValue.
			dataString := self stringEvenner: dataString.
			self dataBytes: dataString asByteArray].
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
