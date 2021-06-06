"
This class is a general abstraction of DICOM data element.

Instance Variables:
	groupNumber		<Integer>			16 bit Integer corresponting to the group number of the element
	elementNumber		<Integer>			16 bit Integer corresponting to the element number of the element
	name				<Value>				Value corresponding to the name of the data element 
	vm					<Integer>			Value Multiplicity of the data element. See notes below.
	vr					<String>				Value Representation of the DICOM Data Element
	description			<String>				An optional text describing the DICOM Data Element
	type				<String>				A String with the Type of the DICOM Data Element
	dataBytes			<ByteArray>			ByteArray with the binary representation of the DICOM Data Element
	length				<Integer>			The Lenght of the DICOM Data Element
	encoder				<TransferSyntax>		DICOM Transfer Syntax Encoder/Decoder being used by the Data Element
	value				<>					The corresponding Smalltalk data type containing the value of the Data Element
	dataElementLength	<Integer>			Number of bytes of the value field of the data element

DICOM Data Elements VM	Smalltalk representation of the VM
	1					'1'
	2					'2'
	3					'3'
	n (0-n)				'n'
	1-n					'1-n'
	2-n					'2-n'
	3-n					'3-n'
	2-5					'2-5'
	4-10					'4-10'
	2-2n				'2-2n'
	x-xn					'x-xn'
"
Class {
	#name : #DataElement,
	#superclass : #Object,
	#instVars : [
		'definition',
		'dataBytes',
		'length',
		'encoder'
	],
	#classInstVars : [
		'badCharacters',
		'dataElementCharacterRepertoire'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #accessing }
DataElement class >> badCharacters [
	"Characters that should not be stored as value
	
	PRD 04.2001 - 03.2017"

	^ badCharacters isNil
		ifTrue: [ badCharacters := Dictionary new ]
		ifFalse: [ badCharacters ]
]

{ #category : #accessing }
DataElement class >> dataElementCharacterRepertoire [
	"Character Repertoire of a Dicom Data Element - PRD 04.2001 - 01.2002"

	^ dataElementCharacterRepertoire isNil
		ifTrue: [ dataElementCharacterRepertoire := CharacterSet new ]
		ifFalse: [ dataElementCharacterRepertoire ]
]

{ #category : #accessing }
DataElement class >> dataElementClasses [
	^ DicomRegistry dataElementClasses
]

{ #category : #'instance creation' }
DataElement class >> fromTextLine: textLine [
	"Parse the data from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit. Comment from header of dicom.dic file:
	
	# Each field must be separated by a single tab.  The tag values (gggg,eeee)
	# must be in hexedecimal and must be surrounded by parentheses.  Repeating
	# groups are represented by indicating the range (gggg-gggg,eeee).  By default
	# the repeating notation only represents even numbers.  A range where only
	# odd numbers are valid is represented using the notation (gggg-o-gggg,eeee).
	# A range can represent both even and odd numbers using the notation
	# (gggg-u-gggg,eeee).  The element part of the tag can also be a range.
	#
	# Comments have a '#' at the beginning of the line.
	#
	# Tag		VR	Name			VM	Version
	#
	(0000,0000)	UL	CommandGroupLength	1	DICOM_2009
	.
	.
	.
	(6000-60FF,0040)	CS	OverlayType	1	DICOM_2009
					
	PRD August 22, 2017"

	| collection inputStream token tag vr dataElementName vm dataElement dataElements |
	collection := OrderedCollection new.
	inputStream := textLine readStream.
	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: Character tab.
			collection add: token ].

	"First Token is the data element Tag"
	tag := DataElementTag fromToken: collection first.

	"Second Token is the data element value representation"
	vr := collection at: 2.

	"Third Token is the data element name"
	dataElementName := collection at: 3.
	dataElementName at: 1 put: (dataElementName at: 1) asLowercase.


	"Fourth Token is the data element value multiplycity"
	vm := collection at: 4.
	OrderedCollection new.
	dataElements := tag
		collect: [ :dataElementTag | 
			dataElement := self newVR: vr trimBoth.
			dataElement
				name: dataElementName asSymbol;
				tag: dataElementTag;
				vm: vm ].

	^ dataElements
]

{ #category : #'instance creation' }
DataElement class >> newFrom: aDataElementDefinition [
	"Create an instance of the DataElement according to my definition
	
	 May 13 2021: Initial implementation - PRD"

	| newInstance |
	newInstance := self newVR: aDataElementDefinition vr.
	newInstance dataElementDefinion: aDataElementDefinition.
	^ newInstance
]

{ #category : #'instance creation' }
DataElement class >> newVR: aString [
	| dataElementClass |
	dataElementClass := self dataElementClasses
		at: aString asUppercase
		ifAbsent: [ UNDataElement ].
	^ dataElementClass new
]

{ #category : #'instance creation' }
DataElement class >> newWith: dataElementName tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber [
	"Instance constructor: creates a new instance of myself, 
	 initializing it with the given arguments.
	
	 24 May 2021 - Implementation using the DataElementDefintion class
	               to store the definition of the data element split
	               from the data element itself  - Paulo R. Dellani"

	| dataDefinition |
	dataDefinition := DataElementDefinition new
		vr: self valueRepresentationString;
		name: dataElementName asString asByteString;
		tag: (DataElementTag fromArray: aTagGroupElementValueArray);
		vm: aValueMultiplicityNumber;
		description: 'No description was given to this DICOM data element';
		type: '3';
		yourself.
	^ dataDefinition asDataElement
]

{ #category : #'instance creation' }
DataElement class >> newWith: dataElementName tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber description: aDescriptionString [
	"Instance constructor: creates a new instance of myself, 
	 initializing it with the given arguments.
	
	 24 May 2021 - Implementation using the DataElementDefintion class
	               to store the definition of the data element split
	               from the data element itself  - Paulo R. Dellani"

	| dataDefinition |
	dataDefinition := DataElementDefinition new
		vr: self valueRepresentationString;
		name: dataElementName asString asByteString;
		tag: (DataElementTag fromArray: aTagGroupElementValueArray);
		vm: aValueMultiplicityNumber;
		description: aDescriptionString;
		type: '3';
		yourself.
	^ dataDefinition asDataElement
]

{ #category : #'instance creation' }
DataElement class >> newWith: dataElementName tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber description: aDescriptionString type: dataElementType [
	"Instance constructor: creates a new instance of myself, 
	 initializing it with the given arguments.
	
	 24 May 2021 - Implementation using the DataElementDefintion class
	               to store the definition of the data element split
	               from the data element itself  - Paulo R. Dellani"

	| dataDefinition |
	dataDefinition := DataElementDefinition new
		vr: self valueRepresentationString;
		name: dataElementName asString asByteString;
		tag: (DataElementTag fromArray: aTagGroupElementValueArray);
		vm: aValueMultiplicityNumber;
		description: aDescriptionString;
		type: dataElementType;
		yourself.
	^ dataDefinition asDataElement
]

{ #category : #'instance creation' }
DataElement class >> newWith: dataElementName tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber type: dataElementType [
	"Instance constructor: creates a new instance of myself, 
	 initializing it with the given arguments.
	
	 24 May 2021 - Implementation using the DataElementDefintion class
	               to store the definition of the data element split
	               from the data element itself  - Paulo R. Dellani"

	| dataDefinition |
	dataDefinition := DataElementDefinition new
		vr: self valueRepresentationString;
		tag: (DataElementTag fromArray: aTagGroupElementValueArray);
		name: dataElementName asString asByteString;
		vm: aValueMultiplicityNumber;
		description: 'No description was given to this DICOM data element';
		type: dataElementType;
		yourself.
	^ dataDefinition asDataElement
]

{ #category : #accessing }
DataElement class >> valueRepresentationString [
	^ self subclassResponsibility
]

{ #category : #comparing }
DataElement >> < anotherDataElement [
	^ self tag < anotherDataElement tag
]

{ #category : #comparing }
DataElement >> <= anotherDataElement [
	^ self tag <= anotherDataElement tag
]

{ #category : #comparing }
DataElement >> = anotherDataElement [
	^ self tag = anotherDataElement tag
]

{ #category : #comparing }
DataElement >> > anotherDataElement [
	^ self tag > anotherDataElement tag
]

{ #category : #comparing }
DataElement >> >= anotherDataElement [
	^ self tag >= anotherDataElement tag
]

{ #category : #'field value retrieving' }
DataElement >> byteSize [
	^ self subclassResponsibility
]

{ #category : #'field value storing' }
DataElement >> copyString: aString [
	"Copy the string to an byte array instance variable
	PRD 05-12.2001"

	dataBytes := aString asByteArray.
	^ dataBytes
]

{ #category : #'field value storing' }
DataElement >> copyString: aString maxSize: maxValueLength [
	"Copy the string to an byte array instance variable
	 PRD 05-12.2001"

	aString size > maxValueLength
		ifTrue: [ length := maxValueLength ]
		ifFalse: [ length := aString size ].
	dataBytes := aString asByteArray copyFrom: 1 to: length.
	^ dataBytes
]

{ #category : #printing }
DataElement >> csvPrintOn: aStream separator: aCharacter level: level [
	"Print a description of myself in a single CSV text line separated by aCharacter:
	
	 Group number <tab> Element number <tab> name <tab> vr <tab> vm <tab> type <cr>
	
	 Assume that all instance variables are correctly defined.
	
	 11 April 2021 - Paulo R. Dellani."

	level timesRepeat: [ aStream nextPutAll: '> ' ].
	self tag csvPrintOn: aStream separator: aCharacter.
	aStream
		nextPut: aCharacter;
		nextPutAll: (self nameUpperCaseFirstLetter padRightTo: 64);
		nextPut: aCharacter;
		nextPutAll: self vr;
		nextPut: aCharacter;
		nextPutAll: self vm;
		nextPut: aCharacter;
		nextPutAll: self type.

]

{ #category : #accessing }
DataElement >> dataBytes [
	"The the data bytes of the message field.
	
	 06 June 20201: New implementation - Paulo R. Dellani."

	^ dataBytes
		ifNil: [ dataBytes := ByteArray new ]
		ifNotNil: [ :arg | arg ]
]

{ #category : #accessing }
DataElement >> dataBytes: byteArray [
	"The the data bytes of the message field.
	
	 06 June 20201: New implementation - Paulo R. Dellani."

	dataBytes := byteArray
]

{ #category : #'field value retrieving' }
DataElement >> dataBytesStringSpliter [
	"Split dataBytes using the DICOM string separator $\ (16r5C asCharacter),
	 storing the DICOM strings (for VM > 1) in an OrderedCollection.
	
	 06 June 2021: New Implementation - Paulo R. Dellani"

	| anOrderedCollection |
	anOrderedCollection := OrderedCollection new.
	self dataBytes
		splitOn: 16r5C
		do: [ :each | 
			anOrderedCollection add: (self validateValue: each asString) trimBoth ].
	^ anOrderedCollection
]

{ #category : #initialize }
DataElement >> dataElementDefinion: aDataElementDefinition [
	"Initialize myself with the given instance of DataElementDefinition
	
	 13 May 2021: Initial Implementation"

	self definition: aDataElementDefinition
]

{ #category : #accessing }
DataElement >> dataElementLength [
	"Lenght of the message field in bytes (see subclass implementations)

	 13 May 2021: New implementation - PRD"

	^ self subclassResponsibility
]

{ #category : #accessing }
DataElement >> definition [
	"My own defition, an instance of DataElementDefinition

	 13 May 2021: Split data element definition from data element
	              instance itself;
	 16 May 2021: Check if 'definition' is nil; if it is, initialize
	              the instance variable - Paulo R. Dellani"

	^ definition
		ifNil: [ definition := DataElementDefinition new ]
		ifNotNil: [ :arg | arg ]
]

{ #category : #accessing }
DataElement >> definition: aDataElementDefinition [
	"My own defition, an instance of DataElementDefinition

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	definition := aDataElementDefinition
]

{ #category : #accessing }
DataElement >> description [
	"Data element description.
	
	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition description
]

{ #category : #accessing }
DataElement >> elementNumber [
	"Data Element's Element Number.
	
	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition tag elementNumber
]

{ #category : #accessing }
DataElement >> elementNumber: an16bitInteger [
	"Data Element's Element Number.

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition tag elementNumber: an16bitInteger
]

{ #category : #accessing }
DataElement >> encoder [
	"Contains a reference to the object class that represents the 
	DICOM Transfer Syntax being used - PRD 05.2001"

	^ encoder
]

{ #category : #accessing }
DataElement >> encoder: aDicomTransferSyntaxClass [
	"Contains a reference to the object class that represents 
	the DICOM Transfer Syntax being used
	
	PRD 05.2001"

	encoder := aDicomTransferSyntaxClass
]

{ #category : #printing }
DataElement >> fullCSVPrintOn: aStream separator: aCharacter level: level [
	"Print a description of myself in a single CSV text line separated by aCharacter:
	
	 Group number <tab> Element number <tab> name <tab> vr <tab> vm <tab> type <cr>
	
	 Assumes that every all values are correctly defined.
	
	 April 11 2021 - Initial implementation;
	 April 18 2021 - Modified from 'csvPrintOn:separator:level:' which from now
	                 on is the protocol to print the data element description in
	                 CSV format without the expantion of sequence element
                    attributes - PRD."

	self csvPrintOn: aStream separator: aCharacter level: level

]

{ #category : #'data element tag' }
DataElement >> groupLengthTag [
	"Group Length Tag Number corresponding to myself

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self tag groupLengthTag
]

{ #category : #accessing }
DataElement >> groupNumber [
	"Data Element's Group Number.
	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition tag groupNumber
]

{ #category : #accessing }
DataElement >> groupNumber: an16bitInteger [
	"Data Element's Group Number.
	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition tag groupNumber: an16bitInteger
]

{ #category : #testing }
DataElement >> isSequence [
	^ false
]

{ #category : #testing }
DataElement >> isType1 [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition type = '1'
]

{ #category : #testing }
DataElement >> isType1C [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition type = '1C'
]

{ #category : #testing }
DataElement >> isType2 [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition type = '2'
]

{ #category : #testing }
DataElement >> isType2C [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition type = '2C'
]

{ #category : #testing }
DataElement >> isType3 [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition type = '3'
]

{ #category : #testing }
DataElement >> isUnknown [
	^ false
]

{ #category : #accessing }
DataElement >> length [
	"Message field's data length of in bytes

	 06 June 2021: Paulo R. Dellani"

	^ length
]

{ #category : #accessing }
DataElement >> length: aNumber [
	"Message field's data length of in bytes

	 06 June 2021: Paulo R. Dellani"

	length := aNumber
]

{ #category : #'field value storing' }
DataElement >> multipleByteValuesFrom: arrayOrOrderedCollection [
	"Convert an OrderedCollection of Multi-byte DICOM Values into a 
	 DICOM Multi-Byte Data Element (VM > 1).

	 06 June 2021: New Implementation - Paulo R. Dellani"

	^ ByteArray
		new: 10
		streamContents: [ :aStream | 
			arrayOrOrderedCollection
				do: [ :each | aStream nextPutAll: (self validateValue: each) ] ]
]

{ #category : #'field value storing' }
DataElement >> multipleStringValuesFrom: orderedCollection [
	"Encode a collection of strings into a DICOM string data element with
	 value multiplicity >= 1. Every string is separated from each other
	 with the character 16r5C ($\) of the ISO IR-6 character repertoire.
	
	 06 June 2021: New implementation - Paulo R. Dellani"

	| selection |
	"Ignore entries that are not strings"
	selection := orderedCollection select: [ :each | each isString ].
	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream nextPutAll: (self validateValue: selection first).
			2 to: selection size do: [ :index | 
				aStream
					nextPut: 16r5C asCharacter;
					nextPutAll: (self validateValue: (selection at: index)) ] ]
]

{ #category : #accessing }
DataElement >> name [
	"Name of the data element

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition name
]

{ #category : #accessing }
DataElement >> name: aByteString [
	"Name of the data element

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition name: aByteString
]

{ #category : #accessing }
DataElement >> nameAndTag [
	"Dicom Message Field Name Symbol + Tag as String.
	
	29 August 2017: First implementatin - Paulo R. Dellani"

	^ String
		new: 10
		streamContents: [ :stream | 
			stream nextPutAll: self name asString.
			self tag printOn: stream ]
]

{ #category : #'printing - private' }
DataElement >> nameUpperCaseFirstLetter [
	^ String
		new: 10
		streamContents: [ :aStream | 
			(self name copyFrom: 1 to: 3) = 'sop'
				ifTrue: [ aStream
						nextPutAll: 'SOP';
						nextPutAll: (self name copyFrom: 4 to: self name size) ]
				ifFalse: [ aStream
						nextPut: self name first asUppercase;
						nextPutAll: (self name copyFrom: 2 to: self name size) ] ]
]

{ #category : #parsing }
DataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	^ self subclassResponsibility
]

{ #category : #'field bytes' }
DataElement >> pdvBytes [
	"DICOM Presentation Data Value byte encoding of myself
	 in a ByteArray instance.
	
	 06 June 2021: New Implementation - Paulo R. Dellani"

	^ ByteArray
		new: 10
		streamContents: [ :pdvStream | self pdvBytes: pdvStream ]

	"| byteStream |
	byteStream := WriteStream on: ByteArray new.
	encoder perform: ('pdvBytesFrom' , self vr , 'DataElement:on:') asSymbol with: self with: byteStream.
	^ byteStream contents"
]

{ #category : #'field bytes' }
DataElement >> pdvBytes: aByteStream [
	"Put the byte-coding of this DICOM Data Element in to a ByteStream

	PRD - February 07th, 2003"

	^ self subclassResponsibility
]

{ #category : #printing }
DataElement >> printEntireValueOn: aStream [
	"Some subclasses do not print the entire value represented 
	by the data element when receiving the message printValueOn:.
	To print the complete value on aStream, send this message to
	one my subclasses
	
	31 August 2017: Initial implementation - Paulo R. Dellani"

	^ self printValueOn: aStream
]

{ #category : #printing }
DataElement >> printOn: aStream [
	"Print general description of myself in 'aStream'.
	 
    10 January 2003: Print the value that I store too;
	  02 August 2015: Refactoring;
	   06 April 2021: Code improvements."

	aStream
		nextPutAll:
			(self name ifNil: [ 'unknown' ] ifNotNil: [ :arg | arg ]);
		nextPut: Character space.
	self tag printOn: aStream.
	aStream
		nextPut: Character space;
		nextPutAll: self vr;
		nextPut: Character space;
		nextPutAll: (self type ifNil: [ ' ' ] ifNotNil: [ :arg | arg ]);
		nextPut: $[.
	self printValueOn: aStream.
	aStream nextPut: $]
]

{ #category : #printing }
DataElement >> printTableEntry [
	^ self printTableEntry: 0
]

{ #category : #printing }
DataElement >> printTableEntry: level [
	"Return a string of characters describing myself in unique row.
	   15 July 2004: Initial implementation; 
	 21 August 2015: Code changes;
	  06 April 2021: replace printOn:paddedWith:to: messages with padLeftTo:,
	                 removed references to printOn:base:digitsToPad:highDigit:
	                 - Paulo R. Dellani"

	^ String
		new: 10
		streamContents: [ :aStream | 
			level timesRepeat: [ aStream nextPutAll: '> ' ].
			aStream
				nextPutAll:
					(self name
						ifNil: [ String new padRightTo: 64 - (level * 2) ]
						ifNotNil: [ :arg | arg padRightTo: 64 - (level * 2) ]);
				tab;
				nextPutAll: self tag printString;
				tab;
				nextPutAll: self vr;
				tab;
				nextPutAll: self type;
				tab;
				nextPutAll: self vm ]
]

{ #category : #printing }
DataElement >> printTableEntryWithValues [
	^ self printTableEntryWithValues: 0
]

{ #category : #printing }
DataElement >> printTableEntryWithValues: level [
	"Return a string of characters describing myself in unique row.
	   15 July 2004: Initial implementation; 
	 20 August 2015: Version that prints the value stored on the data element;
	  06 April 2021: Refactoring - Paulo R. Dellani"

	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream
				nextPutAll: (self printTableEntry: level);
				tab.
			self printValueOn: aStream ]
]

{ #category : #printing }
DataElement >> printValueOn: aStream [
	"Print the value that I store to aStream.
	
	 20 August 2015: Initial implementation - Paulo R. Dellani"

	^ self subclassResponsibility
]

{ #category : #accessing }
DataElement >> put: aTagGroupElementValueArray [
	"Define data element's group and element number using the
	 contents fo aTagGroupElementValueArray, an Array with two 
	 16-bit integers.
	
	 September 2017: New implementation - Paulo R. Dellani"

	self groupNumber: (aTagGroupElementValueArray at: 1).
	self elementNumber: (aTagGroupElementValueArray at: 2)
]

{ #category : #'field value storing' }
DataElement >> stringEvenner: aString [
	"If the number of characters in the string is odd,
	add one blank at its end. PRD 05-09.2001, 09.2002"

	^ aString size odd
		ifTrue: [ aString copyWith: Character space ]
		ifFalse: [ aString ]
]

{ #category : #'field value storing' }
DataElement >> stringPurify: impureString badChars: characterSet [
	"Remove from impureString the 'impure' characters that resides in CharacterDictionary, if found.

	PRD 05-09.2001"

	| aString |
	aString := String
		new: impureString size
		streamContents: [ :aStream | 
			impureString
				do: [ :each | 
					(characterSet includes: each)
						ifFalse: [ aStream nextPut: each ] ] ].
	^ aString
]

{ #category : #'field value storing' }
DataElement >> stringPurify: impureString goodChars: characterSet [
	"Mantain in the impureString the 'good' characters that resides in CharacterDictionary.

	PRD 05.2001 - 01.2002"

	| aString |
	aString := String
		new: impureString size
		streamContents: [ :aStream | 
			impureString
				do: [ :each | 
					(characterSet includes: each)
						ifTrue: [ aStream nextPut: each ] ] ].
	^ aString
]

{ #category : #'data element tag' }
DataElement >> tag [
	"Instance of DataElementTag with the Group and 
	 Element number of the DICOM Data Element

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition tag
]

{ #category : #'data element tag' }
DataElement >> tag: dataElementTag [
	"Instance of DataElementTag with the Group and 
	 Element number of the DICOM Data Element

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition tag: dataElementTag
]

{ #category : #accessing }
DataElement >> type [
	"Data element type, as defined by the Dicom Standard (PS 3.5-2000 7.4), 
	 shall contain a value of 1, 1C, 2, 2C or 3.

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition type
]

{ #category : #accessing }
DataElement >> type: aByteString [
	"Data element type, as defined by the Dicom Standard (PS 3.5-2000 7.4), 
	 shall contain a value of 1, 1C, 2, 2C or 3.

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition type: aByteString
]

{ #category : #'field value retrieving' }
DataElement >> unencapsulateValue [
	"**** 	
	We have an 'encapsulated' pixel data value here, let's decode it a litle bit.
	Firstly we must read the First Item of the sequence of Items - the basic offset table. 
	This is from DICOM PS 3.5-2001 Page 50: 
		- The first Item in the Sequence of Items before the encoded Pixel Data Stream shall 
		   be a Basic Offset Table item. The Basic Offset Table Item Value, however, is not 
		   required to be present:
		   -	When the Item Value is not present, the Item Length shall be zero (00000000H) (see Table A.4-1).
		   -	When the Item Value is present, the Basic Offset Table Item Value shall contain concatenated 32-bit 
			unsigned integer values that are byte offsets to the first byte of the Item Tag of the first fragment for 
			each frame in the Sequence of Items. These offsets are measured from the first byte of the first Item
			Tag following the Basic Offset Table item (See Table A.4-2)."

	| group element itemLength offsets offsetValue secondItemOffset frames thisOffset |
	"an OrderedCollection to store the fragments of each frame in the Sequence of Items"
	frames := OrderedCollection new.

	"First the Basic Offset Table Item Value"
	group := encoder getValueFromByteArray: (dataBytes copyFrom: 1 to: 2).
	element := encoder getValueFromByteArray: (dataBytes copyFrom: 3 to: 4).
	"Check if the groupElement and the itemElement numbers are correct"
	group = 16rFFFE & (element = 16rE000)
		ifTrue: [ itemLength := encoder getValueFromByteArray: (dataBytes copyFrom: 5 to: 8).
			"an OrderedCollection to store the basic offsets from the basic offset table item value"
			offsets := OrderedCollection new.
			itemLength = 0
				ifFalse: [ 9 to: 8 + itemLength by: 4 do: [ :index | 
						offsetValue := encoder getValueFromByteArray: (dataBytes copyFrom: index to: index + 3).
						offsets add: offsetValue ].
					secondItemOffset := 9 + itemLength ]
				ifTrue: [ offsets add: 0.
					secondItemOffset := 9 ].
			"ok, item not equal to zero means that we have some offset values to read"
			"ok, no offsets to read. So let's put one 'artificial' offset for the 
			next steps of the 'unencapsulation'"
			"here we will 'unencapsulate' the fragments for each frame in the Sequence of Items"
			offsets
				do: [ :offset | 
					thisOffset := secondItemOffset + offset.
					group := encoder getValueFromByteArray: (dataBytes copyFrom: thisOffset to: thisOffset + 1).
					element := encoder getValueFromByteArray: (dataBytes copyFrom: thisOffset + 2 to: thisOffset + 3).
					"Check if the groupElement and the itemElement numbers are correct"
					group = 16rFFFE & (element = 16rE000)
						ifTrue: [ itemLength := encoder getValueFromByteArray: (dataBytes copyFrom: thisOffset + 4 to: thisOffset + 7).
							frames add: (dataBytes copyFrom: thisOffset + 8 to: thisOffset + 7 + itemLength) ]
					"Ok, now read the item lenght" ].
			group := encoder
				getValueFromByteArray: (dataBytes copyFrom: thisOffset + 8 + itemLength to: thisOffset + 9 + itemLength).
			element := encoder
				getValueFromByteArray: (dataBytes copyFrom: thisOffset + 10 + itemLength to: thisOffset + 11 + itemLength).
			group = 16rFFFE & (element = 16rE0DD)
				ifFalse: [ self halt	"***** Problems???? ******" ] ].
	"Ok, now read the item lenght"
	^ frames
]

{ #category : #'field value storing' }
DataElement >> validateValue: aValue [
	"Validate 'aValue' according to the rules for my DICOM Data Element subclasses.
    See subclasses implementations for details.

	 06 June 2021: New implementation - Paulo R. Dellani"

	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
DataElement >> value [
	"Decode the value stored by the DICOM data element to the
	 respective 'Smalltalk representation' and then return it.

	 06 June 2021: New implementation - Paulo R. Dellani"

	^ self subclassResponsibility
]

{ #category : #'field value storing' }
DataElement >> value: aValue [
	"Encode the 'Smalltalk representation' (aValue) of the 
	 value which I will store according to the DICOM rules
	 for data element value representation of my subclasses.
	 See subclasses implementations for details.

	 06 June 2021: New implementation - Paulo R. Dellani"

	^ self subclassResponsibility
]

{ #category : #accessing }
DataElement >> vm [
	"Value Multiplicity Sort

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition vm
]

{ #category : #accessing }
DataElement >> vm: aByteString [
	"Value Multiplicity Sort	

	 13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition vm: aByteString
]

{ #category : #accessing }
DataElement >> vmArray [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	^ self definition vmArray
]

{ #category : #accessing }
DataElement >> vmArray: anArray [
	"13 May 2021: Split data element definition from data element
	              instance itself - Paulo Roberto Dellani"

	self definition vmArray: anArray
]

{ #category : #accessing }
DataElement >> vr [
	"String with the two characters encoding of the 
	 dicom data element value representttion.
	
	 29 February 2016: Take VR from the class side method
	                   valueRepresentationString - Paulo R. Dellani"

	^ self class valueRepresentationString
]
