Class {
	#name : #UIDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
UIDataElement class >> initialize [
	dataElementCharacterRepertoire := nil.
	self dataElementCharacterRepertoire
		addAll: DefaultCharacterRepertoire digit;
		add: 16r002E asCharacter.
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
UIDataElement class >> valueRepresentationString [

	^'UI'
]

{ #category : #'to deprecate' }
UIDataElement >> _printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	aStream 
		nextPutAll: (((elementValue := self value) isKindOf: String)
			ifTrue: [elementValue]
			ifFalse: [elementValue printString])
]

{ #category : #'instance creation' }
UIDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomUIDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
UIDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthUIDataElement + self dataBytes size
]

{ #category : #'field bytes' }
UIDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromUIDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
UIDataElement >> stringEvenner: aString [
"
	Check if the string size is even, if not, pad with one ASCII character with code 0.
	PRD 05-09.2001
"
	| dataString stringSize |

	dataString := nil.
	stringSize := aString size.
	stringSize odd ifTrue: [
		dataString := ByteString new: stringSize + 1.
		1 to: stringSize do: [ :index | dataString at: index put: (aString at: index) ].
		dataString at: stringSize + 1 put: 0 asCharacter.
	]
	ifFalse: [ dataString := aString ].
	^dataString.
]

{ #category : #'field value storing' }
UIDataElement >> validateValue: anUIValue [
"
	UI Unique Identifier (UID)  data element value validation routine
	A character string containing a UID that is used to uniquely identify 
	a wide variety of items. The UID is a series of numeric components separated by the period '.' 
	character. If a Value Field containing one or more UIDs is an odd number of bytes in length, 
	the Value Field shall be padded with a single trailing NULL (00H) character to ensure that 
	the Value Field is an even number of bytes in length. See Section 9 and Annex B for a complete 
	specification and examples. 
	'0 - 9 ,  .' of Default Character Repertoire 
	Byte Length: 64 bytes maximum	
	PS 3.5-2000 6.2
	PRD 05-09.2001, 01-06.2002
"
	| dataString |

	dataString := self 
		stringPurify: anUIValue 
		goodChars: self class dataElementCharacterRepertoire.
	dataString := self sizeString: dataString maxSize: 16r40.
	^dataString
]

{ #category : #'field value storing' }
UIDataElement >> value: aValue [
"
	UI Unique Identifier (UID) 
	A character string containing a UID that is used to uniquely identify 
	a wide variety of items. The UID is a series of numeric components separated by the period '.' 
	character. If a Value Field containing one or more UIDs is an odd number of bytes in length, 
	the Value Field shall be padded with a single trailing NULL (00H) character to ensure that 
	the Value Field is an even number of bytes in length. See Section 9 and Annex B for a complete 
	specification and examples. 
	'0 - 9 ,  .' of Default Character Repertoire 
	Byte Length: 64 bytes maximum	
	PS 3.5-2000 6.2
	PRD 05-09.2001, 01-2002

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 06-07.2002
"
	| dataString |

	dataString := String new.
	(aValue isKindOf: OrderedCollection) | (aValue isKindOf: Array)  ifTrue: [
		dataString := self multipleStringValuesFrom: aValue.
		dataString := self stringEvenner: dataString].
	(aValue isKindOf: String) ifTrue: [
		dataString := self validateValue: aValue.
		dataString := self stringEvenner: dataString].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)."
]

{ #category : #'as yet unclassified' }
UIDataElement >> writeBSONOn: aBSON [
	^ self bsonTypeCode = 4
		ifTrue: [ aBSON nextArrayPut: self value ]
		ifFalse: [ aBSON nextSizedStringPut: self value trimBoth ]
]
