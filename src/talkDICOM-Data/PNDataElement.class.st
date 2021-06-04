Class {
	#name : #PNDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
PNDataElement class >> initialize [
	"Character Repertoire: Default Character Repertoire and/or 
	as defined by (0008,0005) excluding Control Characters 	LF,
	FF, and CR but allowing Control Character ESC."

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
PNDataElement class >> valueRepresentationString [
	^ 'PN'
]

{ #category : #accessing }
PNDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type PN.

	 May 13 2021 - PRD"

	^ self encoder headerLengthPNDataElement + self dataBytes size
]

{ #category : #parsing }
PNDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomPNDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
PNDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromPNDataElement: self on: aByteStream
]

{ #category : #printing }
PNDataElement >> printValueOn: aStream [
	"August 20, 2015: Print the person name that I store to aStream;
	 April 06, 2021: replace 'isKindOf: PersonName' with isPersonName - PRD"

	| elementValue |
	(elementValue := self value) isPersonName
		ifTrue: [ aStream nextPutAll: elementValue printString ]
		ifFalse: [ aStream nextPutAll: '#!PERSONNAME' ]
]

{ #category : #'field value retrieving' }
PNDataElement >> value [
	" VR = Person Name - PRD 04.2001, 01-02.2002,  14.05.2002"

	| personName index writeStream |
	personName := PersonName new: 5.
	index := 1.
	writeStream := WriteStream on: String new.
	personName at: index put: String new.
	self dataBytes do: 
			[:each |
			each = 16r005E
				ifTrue: 
					[writeStream := WriteStream on: String new.
					index := index + 1]
				ifFalse: [writeStream nextPut: (Character value: each)].
			index <= 5
				ifTrue: 
					[personName at: index
						put: (self stringPurify: writeStream contents
								goodChars: self class dataElementCharacterRepertoire)]].
	^personName
]

{ #category : #'field value storing' }
PNDataElement >> value: anObject [
	"PN (Person Name)
	A character string encoded using a 5 component convention. The character code
	5CH (the BACKSLASH  \  in ISO-IR 6) shall not be present, as it is used as the delimiter 
	between values in multiple valued data elements. The string may be padded with trailing 
	spaces. The five components in their order of occurrence are: family name complex, given 
	name complex, middle name, name prefix, name suffix. Any of the five components may be 
	an empty string. The component delimiter shall be the caret  ^  character (5EH). Delimiters 
	are required for interior null components. Trailing null components and their delimiters may 
	be omitted. Multiple entries are permitted in each component and are encoded as natural 
	text strings, in the format preferred by the named person. This conforms to the ANSI HISPP 
	MSDS Person Name common data type. This group of five components is referred to as a 
	Person Name component group. For the purpose of writing names in ideographic characters 
	and in phonetic characters, up to 3 groups of components (see Annex H examples 1 and 2) 
	may be used. The delimiter for component groups shall be the equals character  =  (3DH). 
	The three component groups of components in their order of occurrence are: a single-byte character 
	representation, an ideographic representation, and a phonetic representation. Any component 
	group may be absent, including the first component group. In this case, the person name may 
	start with one or more  =  delimiters. Delimiters are required for interior null component groups. 
	Trailing null component groups and their delimiters may be omitted. Precise semantics are defined 
	for each component group. See section 6.2.1. Examples: Rev. John Robert Quincy Adams, 
	B.A. M.Div.  Adams^John Robert Quincy^^Rev.^B.A. M.Div.  [One family name; three given names; 
	no middle name; one prefix; two suffixes.] Susan Morrison-Jones, Ph.D., Chief Executive Officer  
	Morrison-Jones^Susan^^^Ph.D., Chief Executive Officer  [Two family names; one given name; no 
	middle name; no prefix; two suffixes.] John Doe  Doe^John  [One family name; one given name; 
	no middle name, prefix, or suffix. Delimiters have been omitted for the three trailing null components.] 
	(for examples of the encoding of Person Names using multi-byte character sets see Annex H) 
	Notes: 
	1. This five component convention is also used by HL7 as defined in ASTM E-1238-91 and further 
	specialized by the ANSI MSDS. 
	2. In typical American and European usage the first occurrence of  given name  would represent 
	the  first name . The second and subsequent occurrences of the  given name  would typically be 
	treated as a middle name(s). The  middle name  component is retained for the purpose of backward 
	compatibility with existing standards. 
	3. The  Degree  component present in ASTM E-1238-91 is absorbed into the  Suffix  component. 
	4. The implementor should remain mindful of earlier usage forms which represented  given names  
	as  first  and  middle  and that translations to and from this previous typical usage may be required. 
	5. For reasons of backward compatibility with versions of this standard prior to V3.0, person names 
	might be considered a single family name complex (single component without '^' delimiters).
	Character Repertoire: Default Character Repertoire and/or as defined by (0008,0005) excluding Control Characters 
	LF, FF, and CR but allowing Control Character ESC. 
	Value Length: 64 chars maximum per component group (see NOTE in 6.2)	

	PS 3.5-2000 6.2 - PRD 05-09.2001"

	| dataString personName |
	(anObject isKindOf: Dictionary)
		ifTrue: [ personName := PersonName new fromDictionary: anObject.
			dataString := String new.
			1 to: personName size do: [ :index | 
				((personName at: index) isKindOf: String)
					ifTrue: [ dataString := dataString , (personName at: index) ].
				index < personName size
					ifTrue: [ (personName at: index + 1) isNil
							ifFalse: [ dataString := dataString , '^' ] ] ].
			dataString := self stringEvenner: dataString.
			self copyString: dataString maxSize: 16r40 ].
	(anObject isKindOf: Array)
		ifTrue: [ dataString := String new.
			1 to: anObject size do: [ :index | 
				((anObject at: index) isKindOf: String)
					ifTrue: [ dataString := dataString , (anObject at: index) ].
				index < anObject size
					ifTrue: [ (anObject at: index + 1) isNil
							ifFalse: [ dataString := dataString , '^' ] ] ].
			dataString := self stringEvenner: dataString.
			self copyString: dataString maxSize: 16r40 ].
	(anObject isKindOf: String)
		ifTrue: [ dataString := self stringEvenner: anObject.
			self copyString: dataString maxSize: 16r40 ].
	self length: self dataBytes size
]
