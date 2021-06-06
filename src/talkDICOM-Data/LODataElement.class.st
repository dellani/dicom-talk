Class {
	#name : #LODataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
LODataElement class >> initialize [
	"The character code 5CH (the BACKSLASH  \  in ISO-IR 6) shall not be present,
	as it is used as the delimiter between values in multiple valued  data elements. 
	The string shall not have Control Characters except for ESC.
	Default Character  Repertoire and/or as defined by (0008,0005)."

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
LODataElement class >> valueRepresentationString [
	^ 'LO'
]

{ #category : #accessing }
LODataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type LO.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthLODataElement + self dataBytes size
]

{ #category : #parsing }
LODataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomLODataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
LODataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromLODataElement: self on: aByteStream
]

{ #category : #'field value storing' }
LODataElement >> validateValue: aLOValue [
	"Validate 'aLOValue' according to the rules for DICOM Long Text Data Elements.
	 A character string that may be padded with leading and/or trailing spaces.
	 The character code 5CH (the BACKSLASH  \  in ISO-IR 6) shall not be present,
	 as it is used as the delimiter between values in multiple valued  data elements. 
	 The string shall not have Control Characters except for ESC.
	 Default Character  Repertoire and/or as defined by (0008,0005).
	 64 chars maximum (see NOTE in 6.2). PS 3.5-2000 6.2
	
	 06 June 2021: New implementation - Paulo R. Dellani"

	| dataString |
	dataString := self
		stringPurify: aLOValue
		goodChars: self class dataElementCharacterRepertoire.
	dataString := dataString copyFrom: 1 to: (dataString size min: 16r40).
	^ dataString
]

{ #category : #'field value storing' }
LODataElement >> value: aLOValue [
	"LO Long String
	A character string that may be padded with leading and/or trailing spaces.
	The character code 5CH (the BACKSLASH  \  in ISO-IR 6) shall not be present,
	as it is used as the delimiter between values in multiple valued data elements. 
	The string shall not have Control Characters except for ESC.
	Default Character  Repertoire and/or as defined by (0008,0005).
	64 chars maximum (see NOTE in 6.2)
	PS 3.5-2000 6.2 	- PRD 05.2001, 07.2002

	Code changed in order to correctly handle multiplicity values different than 1 - PRD 07.2002"

	| dataString |
	dataString := String new.
	(aLOValue isKindOf: OrderedCollection) | (aLOValue isKindOf: Array) 
		ifTrue: 
			[dataString := self multipleStringValuesFrom: aLOValue.
			dataString := self stringEvenner: dataString].
	(aLOValue isKindOf: String)
		ifTrue: 
			[dataString := self validateValue: aLOValue.
			dataString := self stringEvenner: dataString].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length
				+ (self encoder dataElementHeaderLenght: self)"
]
