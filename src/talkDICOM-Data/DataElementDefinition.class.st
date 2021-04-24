Class {
	#name : #DataElementDefinition,
	#superclass : #Object,
	#instVars : [
		'tag',
		'vr',
		'name',
		'vm',
		'description',
		'type',
		'version'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation - private' }
DataElementDefinition class >> dataElementTagClass [
	^ DataElementTag
]

{ #category : #examples }
DataElementDefinition class >> example01 [
	(self fromTextLine: '(0000,0000)	UL	CommandGroupLength	1	DICOM_2009') inspect
]

{ #category : #examples }
DataElementDefinition class >> example02 [
	"Import DCMTK dicom.dic registry of DICOM data elements"

	| inputStream collection line |
	collection := OrderedCollection new.
	inputStream := '/home/dellani/sandbox/dcmdata-3.6.0/data/dicom.dic'
		asFileReference readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#)
				ifFalse: [ collection addAll: (self fromTextLine: line) ] ].
	inputStream
		close;
		release.
	collection inspect
]

{ #category : #examples }
DataElementDefinition class >> example03 [
	(self fromTextualDefinition: '0000	0000	CommandGroupLength	UL	1	1') inspect
]

{ #category : #examples }
DataElementDefinition class >> example04 [

	| inputStream collection line |
	collection := OrderedCollection new.
	inputStream := DicomIOM patientIOMTextualDataElementDefinition readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#)
				ifFalse: [ collection addAll: (self fromTextualDefinition: line) ] ].
	inputStream
		close;
		release.
	collection inspect

]

{ #category : #'instance creation' }
DataElementDefinition class >> fromTextLine: textLine [
	"Parse the data from an entry in the dicom.dic file from the 
	 dcmdata module of OFFIS DICOM ToolKit.
	
	 August 22 2017: Initial implementation;
	  April 08 2021: Refactoring from DataElement class to DataElementDefinition class.

	 Comment from header of dicom.dic file:
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
	 (6000-60FF,0040)	CS	OverlayType	1	DICOM_2009"

	| tokens inputStream token dataElementTagCollection |

	tokens := OrderedCollection new.
	inputStream := textLine readStream.
	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: Character tab.
			tokens add: token ].

	"First Token stores an OrderedCollection with the data element tag. If the data
	 element tag defines a range of group or element numbers, this will create an
	 instance of the class returned by the 'dataElementTagClass' for every group 
	 and element number defined by the range."
	dataElementTagCollection := self dataElementTagClass fromToken: tokens first.

	^ dataElementTagCollection
		collect: [ :dataElementTag | 
			self new 
				initializeFromTokens: tokens;
				tag: dataElementTag. ]
		as: OrderedCollection.


]

{ #category : #'instance creation' }
DataElementDefinition class >> fromTextualDefinition: textualDefinition [
	"Create an instance of myself and initialize it with tokens parsed
	 from 'textualDefinition'. The order of the tokens in 'textualDefinition',
	 which itself is to be coded as values separated by the tab character,
	 shall be as follows:
	
	 Group-Element-Number  Element-Element-Number Attribute-Name Value-Representation Value-Multiplicity Type

	 The attribute name will be padded with blanks to the right up to 64
	 characters. For example:

	 0008	002A	AcquisitionDatetime                                             	DT	1	1C
	 0010	0010	PatientsName                                                    	PN	1	2
	 0010	1001	OtherPatientsNames                                              	PN	1-n	3
	 0010	0040	PatientsSex                                                     	CS	1	2

	 April 20 2021 - PRD"

	| tokens inputStream token dataElementTagCollection tagToken |

	tokens := OrderedCollection new.
	inputStream := textualDefinition readStream.
	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: Character tab.
			tokens add: token trimBoth  ].

	"First two tokens store the data element tag. If it defines a sequence of group
	 or element numbers in a given range, this will create an instance of the class
	 returned by the 'myself>>dataElementTagClass' for every group and element number
	 defined by the range."
	tagToken := ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: (tokens removeAt: 1);
				tab;
				nextPutAll: (tokens removeAt: 1).
			].
	dataElementTagCollection := self dataElementTagClass fromTextualDefinition: tagToken.

	^ dataElementTagCollection
		collect: [ :dataElementTag | 
			self new 
				tag: dataElementTag; 
				initializeFromtextualDefinitionTokens: tokens. ]
		as: OrderedCollection.
]

{ #category : #printing }
DataElementDefinition >> csvPrintOn: aStream separator: aCharacter [
	"Print a description of myself in a single CSV text line 
	 separated by aCharacter:
	
	 Group number <tab> Element number <tab> name <tab> vr <tab> vm <tab> type <cr>
	
	 Assumes that every all values are correctly defined.
	
	 April 11 2021 - PRD."

	self tag csvPrintOn: aStream separator: aCharacter.
	aStream
		nextPut: aCharacter;
		nextPutAll: (self nameUpperCaseFirstLetter padRightTo: 64);
		nextPut: aCharacter;
		nextPutAll: self vr;
		nextPut: aCharacter;
		nextPutAll: self vm;
		nextPut: aCharacter;
		nextPutAll: self type;
		nextPut: Character cr.

]

{ #category : #accessing }
DataElementDefinition >> description [
	"Textual description of the data element"

	^ description
]

{ #category : #accessing }
DataElementDefinition >> description: aByteString [
	"Textual description of the data element"
	description := aByteString
]

{ #category : #initialization }
DataElementDefinition >> initializeFromTokens: tokens [
	self
		tag: (tokens at: 1);
		"Second Token is the data element value representation"
		vr: (tokens at: 2);
		"Third Token is the data element name"
		name: (tokens at: 3);
		"Fourth Token is the data element value multiplicity"
		vm: (tokens at: 4);
		"Fifth Token is the DICOM standard version"
		version: (tokens at: 5).
]

{ #category : #initialization }
DataElementDefinition >> initializeFromtextualDefinitionTokens: tokens [
	"Initialize myself using the 'tokens' OrderedCollection. The tokens
	 are stored in the following order:

	 1: Attribute-Name
	 2: Value-Representation
	 3: Value-Multiplicity
	 4: Type

	 Type is optional.

	 April 20 2021 - PRD"

	self
		name: (tokens at: 1);
		vr: (tokens at: 2);
		vm: (tokens at: 3).
	tokens size > 3
		ifTrue: [ self type: (tokens at: 4) ]
]

{ #category : #accessing }
DataElementDefinition >> name [
	"Name of the data element"

	^ name
]

{ #category : #accessing }
DataElementDefinition >> name: aByteString [
	"Name of the data element"

	name := aByteString
]

{ #category : #'printing - private' }
DataElementDefinition >> nameUpperCaseFirstLetter [
	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream
				nextPut: self name first asUppercase;
				nextPutAll: (self name copyFrom: 2 to: self name size) ]
]

{ #category : #printing }
DataElementDefinition >> printOn: aStream [
	"Print general description of myself in 'aStream'.
	
	 April 08 2021: Refactored from DataElement - PRD."

	aStream
		nextPutAll:
			(self name ifNil: [ 'unknown' ] ifNotNil: [ :arg | arg ]);
		nextPut: Character space.
	self tag printOn: aStream.
	aStream
		nextPut: Character space;
		nextPutAll: self vr;
		nextPut: Character space;
		nextPutAll: (self vm padLeftTo: 5);
		nextPut: Character space;
		nextPutAll: (self type ifNil: [ ' ' ] ifNotNil: [ :arg | arg ]).

]

{ #category : #accessing }
DataElementDefinition >> tag [
	"Instance of DataElementTag with the Group and Element numbers of the DICOM Data Element.
	
	March 2017: Initial implementation"

	^ tag
]

{ #category : #accessing }
DataElementDefinition >> tag: aDataElementTag [
	"Instance of DataElementTag with the Group and Element numbers of the DICOM Data Element.
	
	March 2017: Initial implementation"

	tag := aDataElementTag
]

{ #category : #accessing }
DataElementDefinition >> type [
	"Data element type, as defined by the Dicom Standard (PS 3.5-2000 7.4), 
	 shall contain a value of 1, 1C, 2, 2C or 3."

	^ type
]

{ #category : #accessing }
DataElementDefinition >> type: aByteString [
	"Data element type, as defined by the Dicom Standard (PS 3.5-2000 7.4), 
	 shall contain a value of 1, 1C, 2, 2C or 3."

	type := aByteString
]

{ #category : #accessing }
DataElementDefinition >> version [
	"Version of the DICOM Standard from which this definition refers to"

	^ version
]

{ #category : #accessing }
DataElementDefinition >> version: aByteString [
	"Version of the DICOM Standard from which this definition refers to"

	version := aByteString
]

{ #category : #accessing }
DataElementDefinition >> vm [
	"Value Multiplicity Sort"

	^ vm
]

{ #category : #accessing }
DataElementDefinition >> vm: aByteString [
	"Value Multiplicity Sort"

	vm := aByteString
]

{ #category : #accessing }
DataElementDefinition >> vr [
	"Two characters string encoding of the  dicom data element value representttion."

	^ vr
]

{ #category : #accessing }
DataElementDefinition >> vr: aByteString [
	"Two characters string encoding of the  dicom data element value representttion."

	vr := aByteString
]
