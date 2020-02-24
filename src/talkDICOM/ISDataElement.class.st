Class {
	#name : #ISDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
ISDataElement class >> initialize [
	"Character Repertoire: '0' - '9' ,  '+' ,  '-' of Default Character Repertoire"

	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		addAll: DefaultCharacterRepertoire digit;
		add: 16r002B asCharacter;
		add: 16r002D asCharacter.
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
ISDataElement class >> valueRepresentationString [

	^'IS'
]

{ #category : #'to deprecate' }
ISDataElement >> _printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 

	PRD January 10th, 2003 - August 20th, 2015"

	| elementValue |
	aStream
		nextPutAll:
			(((elementValue := self value) isKindOf: String)
				ifTrue: [ elementValue ]
				ifFalse: [ elementValue printString ])
]

{ #category : #'instance creation' }
ISDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomISDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
ISDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthISDataElement + self dataBytes size
]

{ #category : #'field bytes' }
ISDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromISDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
ISDataElement >> validateValue: anISValue [
	"Perform the validation of the value to be stored in a DICOM Integer StringData Element

	A string of characters representing an Integer in base-10 (decimal), shall contain 
	only the characters 0 - 9, with an optional leading '+' or '-'. It may be padded with 
	leading and/or trailing spaces. Embedded spaces are not allowed. 
	The integer, n, represented shall be in the range: -2^31 <= n <= (2^31 - 1).  
	'0' - '9' ,  '+' ,  '-' of Default Character Repertoire
	12 bytes maximum

	PS 3.5-2000 6.2 - PRD 05-09.2001 - 01.2002, 03.2017"

	| anIntegerString |
	anIntegerString := self
		stringPurify: anISValue asString
		goodChars: self class dataElementCharacterRepertoire.
	anIntegerString := self sizeString: anIntegerString maxSize: 16r0C.
	^ anIntegerString
]

{ #category : #'field value storing' }
ISDataElement >> value: anISValue [
	"IS Integer String
	A string of characters representing an Integer in base-10 (decimal), shall contain 
	only the characters 0 - 9, with an optional leading '+' or '-'. It may be padded with 
	leading and/or trailing spaces. Embedded spaces are not allowed. 
	The integer, n, represented shall be in the range: -2^31 <= n <= (2^31 - 1).  
	'0' - '9' ,  '+' ,  '-' of Default Character Repertoire
	12 bytes maximum
	PS 3.5-2000 6.2 - PRD 05-09.2001 - 01.2002

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	| dataString |
	dataString := String new.
	(anISValue isKindOf: OrderedCollection) | (anISValue isKindOf: Array) 
		ifTrue: 
			[dataString := self multipleStringValuesFrom: anISValue.
			dataString := self stringEvenner: dataString].
	(anISValue isKindOf: String) | (anISValue isKindOf: Integer)
		ifTrue: 
			[dataString := self validateValue: anISValue.
			dataString := self stringEvenner: dataString].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]

{ #category : #'as yet unclassified' }
ISDataElement >> writeBSONOn: aBSON [ 
	^self bsonTypeCode = 2
		ifTrue: [aBSON nextSizedStringPut: self value trimBoth]
		ifFalse: [aBSON nextArrayPut: self value]
]
