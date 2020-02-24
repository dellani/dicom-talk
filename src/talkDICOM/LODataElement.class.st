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
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
LODataElement class >> valueRepresentationString [

	^'LO'
]

{ #category : #'to deprecate' }
LODataElement >> _printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015, August 29th, 2017"

	| valueCollection |
	(valueCollection := self dataBytesStringSpliter) size >= 1
		ifTrue: [ aStream nextPutAll: valueCollection first.
			2 to: valueCollection size do: [ :item | 
				aStream
					nextPutAll: ' // ';
					nextPutAll: item ] ]
]

{ #category : #'instance creation' }
LODataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomLODataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
LODataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthLODataElement + self dataBytes size
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
	"Perform the validation of the value to be stored in a DICOM Long Text Data Element

	A character string that may be padded with leading and/or trailing spaces.
	The character code 5CH (the BACKSLASH  \  in ISO-IR 6) shall not be present,
	as it is used as the delimiter between values in multiple valued  data elements. 
	The string shall not have Control Characters except for ESC.
	Default Character  Repertoire and/or as defined by (0008,0005).
	64 chars maximum (see NOTE in 6.2)

	PS 3.5-2000 6.2 - PRD 05.2001, 07.2002
"

	| dataString |
	dataString := self stringPurify: aLOValue
				goodChars: self class dataElementCharacterRepertoire.
	dataString := self sizeString: dataString maxSize: 16r40.
	^dataString
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

{ #category : #'as yet unclassified' }
LODataElement >> writeBSONOn: aBSON [ 
	^self bsonTypeCode = 2
		ifTrue: [aBSON nextSizedStringPut: self value trimBoth]
		ifFalse: [aBSON nextArrayPut: self value]
]
