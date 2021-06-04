Class {
	#name : #SHDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
SHDataElement class >> initialize [
	"The character code 05CH (the BACKSLASH  \  in ISO-IR 6) shall
	not be present, as it is used as the delimiter between values for multiple
	data elements. The string shall not have Control Characters except ESC. 

	Character Repertoire: Default Character Repertoire and/or as defined by (0008,0005)."

	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		addAll: DefaultCharacterRepertoire digit;
		addAll: DefaultCharacterRepertoire lowerCase;
		addAll: DefaultCharacterRepertoire upperCase;
		addAll: DefaultCharacterRepertoire symbol;
		add: Character escape.
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
SHDataElement class >> valueRepresentationString [
	^ 'SH'
]

{ #category : #accessing }
SHDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type SH.

	 May 13 2021 - PRD"

	^ self encoder headerLengthSHDataElement + self dataBytes size
]

{ #category : #parsing }
SHDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomSHDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
SHDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromSHDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
SHDataElement >> validateValue: aSHValue [
"
	Perform the validation of the value to be stored in a DICOM Short String Data Element

	A character string that may be padded with leading and/or trailing spaces. 
	The character code 05CH (the BACKSLASH  \  in ISO-IR 6) shall not be 
	present, as it is used as the delimiter between values for multiple data elements. 
	The string shall not have Control Characters except ESC. 
	Character Repertoire: Default Character Repertoire and/or as defined by (0008,0005).
	Value Length: 16 chars maximum (see NOTE in 6.2)
	PS 3.5-2000 6.2
	PRD 05.2001, 07.2002
"
	| dataString |

	dataString := (self 
		stringPurify: aSHValue 
		goodChars:  self class dataElementCharacterRepertoire) trimBoth.
	dataString := self sizeString: dataString maxSize: 16r10.
	^dataString.
]

{ #category : #'field value storing' }
SHDataElement >> value: aSHValue [
	"SH (Short String)
	A character string that may be padded with leading and/or trailing spaces. 
	The character code 05CH (the BACKSLASH  \  in ISO-IR 6) shall not be 
	present, as it is used as the delimiter between values for multiple data elements. 
	The string shall not have Control Characters except ESC. 
	Character Repertoire: Default Character Repertoire and/or as defined by (0008,0005).
	Value Length: 16 chars maximum (see NOTE in 6.2)
	PS 3.5-2000 6.2 - PRD 05.2001

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	| dataString |
	dataString := String new.
	(aSHValue isKindOf: OrderedCollection) | (aSHValue isKindOf: Array) 
		ifTrue: 
			[dataString := self multipleStringValuesFrom: aSHValue.
			dataString := self stringEvenner: dataString].
	(aSHValue isKindOf: String)
		ifTrue: 
			[dataString := self validateValue: aSHValue.
			dataString := self stringEvenner: dataString].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
