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
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
CSDataElement class >> valueRepresentationString [
	^ 'CS'
]

{ #category : #accessing }
CSDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type CS.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthCSDataElement + self dataBytes size
]

{ #category : #parsing }
CSDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomCSDataElementDataBytesFrom: pdvStream
		for: self
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
CSDataElement >> validateValue: anCSValue [
	"Validate 'anCSValue' according to the rules for DICOM CS Data Elements.
	 A string of characters with leading or trailing spaces (20H) being non-significant.
	 Character Repertoire: Uppercase characters,  0 -  9 , the SPACE character, 
	 and underscore _ of the Default Character Repertoire 
	 Value Length: 16 bytes maximum
	 PS 3.5-2000 6.2

	 06 June 2021: New implementation - Paulo R. Dellani"

	| dataString |
	dataString := (self
		stringPurify: anCSValue
		goodChars: self class dataElementCharacterRepertoire) trimBoth.
	dataString := dataString copyFrom: 1 to: (dataString size min: 16r10).
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
