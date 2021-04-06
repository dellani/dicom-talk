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
		'tag',
		'name',
		'vm',
		'vmArray',
		'description',
		'type',
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

{ #category : #'instance creation' }
DataElement class >> _fromTextLine: textLine [
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

	^ self new fromTextLine: textLine
]

{ #category : #accessing }
DataElement class >> badCharacters [
	"Characters that should not be stored as value
	
	PRD 04.2001 - 03.2017"

	^badCharacters isNil 
		ifTrue: 
			[badCharacters := Dictionary new] 
		ifFalse: [badCharacters]
]

{ #category : #accessing }
DataElement class >> dataElementCharacterRepertoire [
	"Character Repertoire of a Dicom Data Element - PRD 04.2001 - 01.2002"

	^dataElementCharacterRepertoire isNil 
		ifTrue: 
			[dataElementCharacterRepertoire := CharacterSet new] 
		ifFalse: [dataElementCharacterRepertoire]
]

{ #category : #accessing }
DataElement class >> dataElementClasses [
	^ DicomRegistry DataElements
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

	"DSDataElement
				newWith: #pixelSpacing
				tag: #(16r0028 16r0030)
				vm: '2'
				type: '1'"
	^ dataElements
]

{ #category : #examples }
DataElement class >> importDCMTK_DICOM_Dictionary [
	"Import DCMTK dicom.dic registry of DICOM data elements"

	| inputStream collection line |
	collection := OrderedCollection new.
	inputStream := '/home/dellani/sandbox/dcmdata-3.6.0/data//dicom.dic'
		asFileReference readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#)
				ifFalse: [ collection addAll: (DataElement fromTextLine: line) ] ].
	inputStream
		close;
		release.
	^ collection inspect
]

{ #category : #'instance creation' }
DataElement class >> newVR: aString [

	| dataElementClass |
	
	dataElementClass := 
		self dataElementClasses at: aString asUppercase ifAbsent: [nil].
	
	^dataElementClass notNil 
		ifTrue: [dataElementClass new]
		ifFalse: [UNDataElement new]
]

{ #category : #'instance creation' }
DataElement class >> newWith: aDicomTagNameSymbol tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber [
	"This 'contructor message' can be sent in the following way:

	dataElement := *DataElement 
					newWith: #groupElement 
					tag: #(16r0000,16r0001)
					vm: 1.

	PRD 05.2001, 02.2016"

	^self new 
		name: aDicomTagNameSymbol 
		tag: aTagGroupElementValueArray 
		vm: aValueMultiplicityNumber 
		description: 'No description was given to this DICOM tag'
		type: '3'
]

{ #category : #'instance creation' }
DataElement class >> newWith: aDicomTagNameSymbol tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber description: aDescriptionString [
	"This 'contructor message' can be sent in the following way:

	dataElement := *DataElement 
					newWith: #groupElement
					tag: #(16r0000,16r0001)
					vm: 1
					description: 'Bla Bla Bla'.

	PRD 05.2001, 02.2016"
	
	^self new
		name: aDicomTagNameSymbol 
		tag: aTagGroupElementValueArray 
		vm: aValueMultiplicityNumber 
		description: aDescriptionString
		type: 3
]

{ #category : #'instance creation' }
DataElement class >> newWith: aDicomTagNameSymbol tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber description: aDescriptionString type: dataElementType [
	"This 'contructor message' can be sent in the following way:

	dataElement := *DataElement 
					newWith: #groupElement
					tag: #(16r0000,16r0001)
					vm: 1
					description: 'Bla Bla Bla'
					type: '3'.

	PRD 05.2001, 02.2016"

	^ self new
		name: aDicomTagNameSymbol
		tag: aTagGroupElementValueArray
		vm: aValueMultiplicityNumber
		description: aDescriptionString
		type: dataElementType
]

{ #category : #'instance creation' }
DataElement class >> newWith: aDicomTagNameSymbol tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber type: dataElementType [
	"This 'contructor message' can be sent in the following way:

	dataElement := *DataElement 
					newWith: #groupElement
					tag: #(16r0000,16r0001)
					vm: 1
					type: '1C'.

	PRD 05.2001, 02.2016"

	^ self new
		name: aDicomTagNameSymbol
		tag: aTagGroupElementValueArray
		vm: aValueMultiplicityNumber
		description: 'No description was given to this DICOM tag'
		type: dataElementType
]

{ #category : #accessing }
DataElement class >> valueRepresentationString [

	^self subclassResponsibility
]

{ #category : #comparing }
DataElement >> < aDataElement [
	"True if aDataElement instance group and element numbers are 
	greater than the self instance ones - PRD 04-06.2001"
	
	^((self groupNumber bitShift: 16) + self elementNumber) < 
		((aDataElement groupNumber bitShift: 16) + 
			aDataElement elementNumber).
]

{ #category : #comparing }
DataElement >> <= aDataElement [
	"True if aDataElement instance group and element numbers are 
	greater than or equal to the self instance ones - PRD 04-06.2001"
	
	^((self groupNumber bitShift: 16) + self elementNumber) <=
		((aDataElement groupNumber bitShift: 16) + aDataElement elementNumber).
]

{ #category : #comparing }
DataElement >> = aDataElement [
	"Compare the aDataElement instance group and element numbers with self 
	instance ones, answer true if they are equal - PRD 04-06.2001"
	
	^(self groupNumber = aDataElement groupNumber) & 
	  (self elementNumber = aDataElement elementNumber).
]

{ #category : #comparing }
DataElement >> > aDataElement [
	"True if aDataElement instance group and element numbers are
	less than the self instance ones - PRD 04-06.2001"
	
	^((self groupNumber bitShift: 16) + self elementNumber) >
		((aDataElement groupNumber bitShift: 16) + 
			aDataElement elementNumber).
]

{ #category : #comparing }
DataElement >> >= aDataElement [
	"True if aDataElement instance group and element numbers are
	less than or equal to the self instance ones - PRD 04-06.2001"
	
	^((self groupNumber bitShift: 16) + self elementNumber) >=
		((aDataElement groupNumber bitShift: 16) + 
			aDataElement elementNumber).
]

{ #category : #converting }
DataElement >> asText [

	^'Empty Dicom Data Element' asText
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
"
	Copy the string to an byte array instance variable
	PRD 05-12.2001
"
	(aString size > maxValueLength) 
		ifTrue: [ length := maxValueLength. ]
		ifFalse: [ length := aString size. ].
	dataBytes := (aString asByteArray) copyFrom: 1 to: length.
	^dataBytes.
]

{ #category : #'instance creation' }
DataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [

	^self subclassResponsibility
]

{ #category : #accessing }
DataElement >> dataBytes [
	"Byte array storing the data bytes of the message field - PRD 04.2001"

	^ dataBytes isNil
		ifTrue: [ dataBytes := ByteArray new ]
		ifFalse: [ dataBytes ]
]

{ #category : #accessing }
DataElement >> dataBytes: aByteArray [
	"Byte array storing the data bytes of the message field - PRD 04.2001"

	dataBytes := aByteArray
]

{ #category : #'field value retrieving' }
DataElement >> dataBytesByteSpliter: byteValueSize [
	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
DataElement >> dataBytesStringSpliter [
	"Split the DICOM strings (for VM > 1) coded in dataBytes instance variable.
	Answer an OrderedCollection with the splited strings - PRD 06.2002"

	| aWriteStream anOrderedCollection aValue |
	anOrderedCollection := OrderedCollection new.
	aWriteStream := WriteStream on: String new.
	self dataBytes
		do: [ :byteValue | 
			byteValue = 16r5C
				ifTrue: [ aValue := self validateValue: aWriteStream contents.
					anOrderedCollection add: aValue trimBoth.
					aWriteStream := WriteStream on: String new ]
				ifFalse: [ aWriteStream nextPut: byteValue asCharacter ] ].
	aValue := self validateValue: aWriteStream contents.
	anOrderedCollection add: aValue trimBoth.
	^ anOrderedCollection
]

{ #category : #accessing }
DataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self subclassResponsibility
]

{ #category : #accessing }
DataElement >> description [
	"Text description of the Message Field - PRD 04.2001"

	^ description
]

{ #category : #accessing }
DataElement >> description: aDescriptionText [
	"Text description of the Message Field - PRD 04.2001"

	description := aDescriptionText
]

{ #category : #accessing }
DataElement >> elementNumber [
	"The Element Number of an Data Element

	PRD 04-05.2001, 03.2017"

	^ tag elementNumber
]

{ #category : #accessing }
DataElement >> elementNumber: an16bitInteger [
	"The Element Number of an Data Element

	PRD 04-05.2001"

	tag elementNumber: an16bitInteger
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

{ #category : #'instance creation' }
DataElement >> fromTextLine: textLine [
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

	| collection inputStream token |
	collection := OrderedCollection new.
	inputStream := textLine readStream.
	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: Character tab.
			collection add: token ].
	^ collection
]

{ #category : #tags }
DataElement >> groupLengthTag [
	" Group Length Tag Number corresponding to self 

	PRD 03.2017"

	^ self tag groupLengthTag
]

{ #category : #accessing }
DataElement >> groupNumber [
	"The GROUP Number of an Data Element

	PRD 04-05.2001"

	^ tag groupNumber
]

{ #category : #accessing }
DataElement >> groupNumber: an16bitInteger [
	"The Element Number of an Data Element

	PRD 04-05.2001"

	tag groupNumber: an16bitInteger
]

{ #category : #comparing }
DataElement >> isDicomDataElement [
	"
	Who am I?
	PRD 04-05.2001
"

	^ true
]

{ #category : #testing }
DataElement >> isSequence [
	^ false
]

{ #category : #testing }
DataElement >> isType1 [
"
	Answer true if data element type is 1
	PRD 06.2001
"
	^type = '1'.
]

{ #category : #testing }
DataElement >> isType1C [
"
	Answer true if data element type is 1C
	PRD 06.2001
"
	^type = '1C'.
]

{ #category : #testing }
DataElement >> isType2 [
"
	Answer true if data element type is 2
	PRD 06.2001
"
	^type = '2'.
]

{ #category : #testing }
DataElement >> isType2C [
"
	Answer true if data element type is 2C
	PRD 06.2001
"
	^type = '2C'.
]

{ #category : #testing }
DataElement >> isType3 [
"
	Answer true if data element type is 3
	PRD 06.2001
"
	^type = '3'.
]

{ #category : #testing }
DataElement >> isUnknown [
	^ false
]

{ #category : #accessing }
DataElement >> length [
	"Data Length of the message field in bytes

	PRD 04.2001"

	^ length
]

{ #category : #accessing }
DataElement >> length: aNumber [
	"Data Length of the message field in bytes

	PRD 04.2001"

	length := aNumber
]

{ #category : #'field value storing' }
DataElement >> multipleByteValuesFrom: anOrderedCollectionorArray [
"
	Convert an OrderedCollection of Multi-byte DICOM Values into a 
	DICOM Multi-Byte Data Element where the VM > 1

	PRD 06-07.2002
"
	| aWriteStream |

	aWriteStream := WriteStream on: ByteArray new.
	anOrderedCollectionorArray do: [:each | 
		aWriteStream nextPutAll: (self validateValue: each).
	].

	^aWriteStream contents
]

{ #category : #'field value storing' }
DataElement >> multipleStringValuesFrom: anOrderedCollection [
"
	Convert an OrderedCollection of String Values into a DICOM String Data Element 
	with VM >= 1 where the elements are separeted from each other with the character 5Ch
	('\' of the ISO IR-6 character repertoire)

	PRD 06.2002
"
	| dataString |

	dataString := String new.
	anOrderedCollection do: [:each | 
		(each isKindOf: String) ifTrue: [
			dataString isEmpty 
				ifTrue: [dataString := self validateValue: each]
				ifFalse: [dataString := (dataString, ('' copyWith: 16r5C asCharacter)), 
							(self validateValue: each)].
		].
	].
	^dataString
]

{ #category : #accessing }
DataElement >> name [
	"Dicom Message Field Name Symbol - PRD 04.2001"

	^ name
]

{ #category : #accessing }
DataElement >> name: aMessageFieldNameSymbol [
	"Dicom Message Field Name Symbol - PRD 04.2001"

	name := aMessageFieldNameSymbol
]

{ #category : #initialize }
DataElement >> name: aDicomTagNameSymbol tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber description: aDescriptionString type: dataElementType [
	self name: aDicomTagNameSymbol.
	self tag: (DataElementTag fromArray: aTagGroupElementValueArray).
	self vm: aValueMultiplicityNumber.
	self description: aDescriptionString.
	self type: dataElementType
]

{ #category : #accessing }
DataElement >> nameAndTag [
	"Dicom Message Field Name Symbol + Tag as String - PRD 04.2001 - August 29, 2017"

	^ String
		new: 10
		streamContents: [ :stream | 
			stream nextPutAll: self name asString.
			self tag printOn: stream ]
]

{ #category : #'field bytes' }
DataElement >> pdvBytes [
	"Answer a ByteArray with the byte-coding of this DICOM Data Element

	PRD 05-11.2001"

	| byteStream |
	byteStream := WriteStream on: ByteArray new.
	encoder perform: ('pdvBytesFrom' , self vr , 'DataElement:on:') asSymbol with: self with: byteStream.
	^ byteStream contents
]

{ #category : #'field bytes' }
DataElement >> pdvBytes: aByteStream [
	"Put the byte-coding of this DICOM Data Element in to a ByteStream

	PRD - February 07th, 2003"

	^ self subclassResponsibility
]

{ #category : #printing }
DataElement >> printEntireValueOn: aStream [
	"August 31 2017: Some subclasses do not print the entire value 
	represented by the data element when receiving the message 
	printValueOn: aStream, so instead send this message to my
	subclasses - PRD"

	^ self printValueOn: aStream
]

{ #category : #printing }
DataElement >> printOn: aStream [
	"August 2002: Print general description of myself in 'aStream';
    January 10, 2003: Print the value that I store too;
	 August 2, 2015: Refactoring;
	 April 6, 2021: Refactoring"

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
	 PRD - July 15th, 2004 - August 21th, 2015
	 April 6, 2021: replace printOn:paddedWith:to: messages with padLeftTo:,
	                removed references to printOn:base:digitsToPad:highDigit: - PRD"

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
	"July 15 2004: Return a string of characters describing myself in unique row.
	 August 20 2015: Version that prints the value stored on the data element.
	 April 06, 2021: Refactoring - PRD"

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
	"August 20 2015: Print the value that I store to aStream - PRD"
	^ self subclassResponsibility
]

{ #category : #accessing }
DataElement >> put: aTagGroupElementValueArray [
	"Receive an array with the Group and Element number of the 
	DICOM Data Elemente Tag. PRD 05.2001 - 09.2017"

	self groupNumber: (aTagGroupElementValueArray at: 1).
	self elementNumber: (aTagGroupElementValueArray at: 2)
]

{ #category : #'field value storing' }
DataElement >> sizeString: aString maxSize: maxSize [
	"Answer back a copy of aString with the correct size, if needed.

	PRD 06.2002"

	^ aString size > maxSize
		ifTrue: [ aString copyFrom: 1 to: maxSize ]
		ifFalse: [ aString ]
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

{ #category : #tags }
DataElement >> tag [
	"Instance of DataElementTag with the Group and Element number of the DICOM Data Element

	PRD 05-06.2001, 03.2017"
	
	^tag
]

{ #category : #tags }
DataElement >> tag: dataElementTag [
	"Receive an array with the Group and Element number of the DICOM Data Elemente Tag 

	PRD 05.2001"
	
	tag := dataElementTag
]

{ #category : #accessing }
DataElement >> type [
	"Data element type. As defined by the Dicom Standard (PS 3.5-2000 7.4), 
	shall contain a value of 1, 1C, 2, 2C or 3. 

	PRD 06.2001"

	^ type
]

{ #category : #accessing }
DataElement >> type: aCharacterString [
	"Data element type. As defined by the Dicom Standard (PS 3.5-2000 7.4), 
	shall contain a value of 1, 1C, 2, 2C or 3. 

	PRD 06.2001"

	(#('1' '1C' '2' '2C' '3') includes: aCharacterString)
		ifTrue: [ type := aCharacterString ]
		ifFalse: [ type := '3' ]
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
	"Perform the validation of the value to be stored in a DICOM Data Element

	PRD 04.2001 - 06.2002"

	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
DataElement >> value [
	"Decode the value stored by the DICOM data element 
	to the respective 'Smalltalk representation' and then return it.
	
	PRD 04-05.2001, 07.2002"

	^ self subclassResponsibility
]

{ #category : #'field value storing' }
DataElement >> value: aValue [
	"Calculate the bytes corresponding to aValue for a message field value representation from the 'Smalltalk representation'

	PRD 05.2001"

	self subclassResponsibility
]

{ #category : #accessing }
DataElement >> vm [
	"Value Multiplicity Sort

	PRD 04.2001"

	^ vm
]

{ #category : #accessing }
DataElement >> vm: aValueMultiplicitySort [
	"Value Multiplicity Sort

	DICOM Data Elements VM	Smalltalk representation of the VM
	1							'1'
	2							'2'
	3							'3'
	n (0-n)						'n'
	2n							'2n'
	3n							'3n'
	4n							'4n'
	1-n							'1-n'
	2-n							'2-n'
	3-n							'3-n'
	2-5							'2-5'
	4-10						'4-10'
	2-2n						'2-2n'
	x-xn						'x-xn'

	PRD 04.2001, 07.2002"

	(aValueMultiplicitySort isKindOf: String)
		ifTrue: [ | step fixed free |
			step := 1.
			vm := aValueMultiplicitySort.
			aValueMultiplicitySort size = 1
				ifTrue: [ (aValueMultiplicitySort at: 1) = $n
						ifTrue: [ free := $n.
							fixed := 0 ]
						ifFalse: [ fixed := aValueMultiplicitySort asNumber ] ].
			aValueMultiplicitySort size = 2
				ifTrue: [ fixed := 0.
					free := aValueMultiplicitySort ].
			aValueMultiplicitySort size >= 3
				ifTrue: [ fixed := (aValueMultiplicitySort copyFrom: 1 to: 1) asNumber.
					free := aValueMultiplicitySort copyFrom: 3 to: aValueMultiplicitySort size.
					free size = 2
						ifTrue: [ (free at: 2) = $n
								ifTrue: [ step := (free copyFrom: 1 to: 1) asNumber.
									free := free copyFrom: 2 to: 2 ] ] ].
			self vmArray at: 1 put: fixed.
			self vmArray at: 2 put: free.
			self vmArray at: 3 put: step ].
	(aValueMultiplicitySort isKindOf: Array)
		ifTrue: [ self vmArray: aValueMultiplicitySort ]
]

{ #category : #accessing }
DataElement >> vmArray [
	^ vmArray isNil
		ifTrue: [ vmArray := Array new: 3 ]
		ifFalse: [ vmArray ]
]

{ #category : #accessing }
DataElement >> vmArray: anArray [

	vmArray := anArray
]

{ #category : #accessing }
DataElement >> vr [
	"String with the two characters encoding of the 
	dicom data element value representttion.
	
	PRD 04-10.2001, 29.02.2016"

	^self class valueRepresentationString
]
