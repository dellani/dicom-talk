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
		"Fourth Token is the data element value multiplycity"
		vm: (tokens at: 4);
		"Fifth Token is the DICOM standard version"
		version: (tokens at: 5).
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
