Class {
	#name : #CSDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
CSDataElement class >> initialize [
	"Character Repertoire: Uppercase characters,  0 -  9 ,
	the SPACE character, and underscore  _ , of the Default Character Repertoire"

	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		addAll: DefaultCharacterRepertoire upperCase;
		add: Character space;
		add: 16r005F asCharacter.
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
CSDataElement class >> valueRepresentationString [

	^'CS'
]

{ #category : #'instance creation' }
CSDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomCSDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
CSDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthCSDataElement + self dataBytes size
]

{ #category : #'field bytes' }
CSDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromCSDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
CSDataElement >> validateValue: anASValue [
	"Perform the validation of the value to be stored in a DICOM Coded String Data Element
	A string of characters with leading or trailing spaces (20H) being non-significant. 
	Character Repertoire: Uppercase characters,  0 -  9 , the SPACE character, 
	and underscore  _ , of the Default Character Repertoire 
	Value Length: 16 bytes maximum
	PS 3.5-2000 6.2

	PRD 05-09.2001, 07.2002"

	| dataString |
	dataString := (self stringPurify: anASValue goodChars: self class dataElementCharacterRepertoire) trimBoth.
	dataString := self sizeString: dataString maxSize: 16r10.
	^ dataString
]

{ #category : #'field value storing' }
CSDataElement >> value: aCSValue [
	"CS Code String
	A string of characters with leading or trailing spaces (20H) being non-significant. 
	Character Repertoire: Uppercase characters,  0 -  9 , the SPACE character, 
	and underscore  _ , of the Default Character Repertoire 
	Value Length: 16 bytes maximum
	PS 3.5-2000 6.2
	PRD 05-09.2001

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 07.2002"

	| dataString |
	dataString := String new.
	(aCSValue isKindOf: OrderedCollection) | (aCSValue isKindOf: Array)
		ifTrue: [ dataString := self multipleStringValuesFrom: aCSValue.
			dataString := self stringEvenner: dataString ].
	(aCSValue isKindOf: String)
		ifTrue: [ dataString := self validateValue: aCSValue.
			dataString := self stringEvenner: dataString ].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)"
]

{ #category : #'as yet unclassified' }
CSDataElement >> writeBSONOn: aBSON [

	^self bsonTypeCode = 2
		ifTrue: [aBSON nextSizedStringPut: self value trimBoth]
		ifFalse: [aBSON nextArrayPut: self value]
]
