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
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
ISDataElement class >> valueRepresentationString [
	^ 'IS'
]

{ #category : #accessing }
ISDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type IS.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthISDataElement + self dataBytes size
]

{ #category : #parsing }
ISDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomISDataElementDataBytesFrom: pdvStream
		for: self
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
	"Validate 'anISValue' according to the rules for DICOM  Integer String Data Elements.
	 A string of characters representing an Integer in base-10 (decimal), shall contain 
	 only the characters 0 - 9, with an optional leading '+' or '-'. It may be padded with 
	 leading and/or trailing spaces. Embedded spaces are not allowed. 
	 The integer, n, represented shall be in the range: -2^31 <= n <= (2^31 - 1).  
	 '0' - '9' ,  '+' ,  '-' of Default Character Repertoire
	 12 bytes maximum. PS 3.5-2000 6.2

	   March 2017: Bug fixes;
	 06 June 2021: New implementation - Paulo R. Dellani"

	| aString |
	aString := self
		stringPurify: anISValue asString
		goodChars: self class dataElementCharacterRepertoire.
	aString := aString copyFrom: 1 to: (aString size min: 16r0C).
	^ aString
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
