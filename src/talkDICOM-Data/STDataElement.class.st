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
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
STDataElement class >> valueRepresentationString [
	^ 'ST'
]

{ #category : #accessing }
STDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type ST.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthSTDataElement + self dataBytes size
]

{ #category : #parsing }
STDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomSTDataElementDataBytesFrom: pdvStream
		for: self
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
	"Validate 'aSTValue' according to the rules for DICOM Short Text Data Elements.
	 A character string that may contain one or more paragraphs. It may contain 
	 the Graphic Character set and the Control Characters, CR, LF, FF, and ESC. 
	 It may be padded with trailing spaces, which may be ignored, but leading spaces 
	 are considered to be significant. Data Elements with this VR shall not be multi-valued 
	 and therefore character code 5CH (the BACKSLASH  \  in ISO-IR 6) may be used. 
	 Default Character Repertoire and/or as defined by (0008,0005). 
	 1024 chars maximum (see NOTE in 6.2)
	 PS 3.5-2000 6.2

	 06 June 2021: New implementation - Paulo R. Dellani"

	| dataString |
	dataString := (self
		stringPurify: aSTValue
		goodChars: self class dataElementCharacterRepertoire) trimBoth.
	dataString := dataString
		copyFrom: 1
		to: (dataString size min: 16r0400).
	^ dataString
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
