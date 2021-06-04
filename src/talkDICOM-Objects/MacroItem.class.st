Class {
	#name : #MacroItem,
	#superclass : #Item,
	#classInstVars : [
		'macroName'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #'computer reflection 2021' }
MacroItem class >> addMacroItemTextualDescriptionMethods [
	"Code a method for every of my subclasses that writes the data elements
	 definion in textual form. The method is coded by 
	 computerReflection_MacroItemTextualDataElementDefinitionMethod: and added 
	 to protocol 'macro item definitions'.
	
	 (Computer reflection is way cool!)

	 May 09 2021 - This is an adaptation of SequenceItem>
	                 addSQItemTextualDescriptionMethods - PRD."

	self subclassesDo: [ : aSequenceItemSubclass | | method |
		method := self computerReflection_MacroItemTextualDataElementsDefinitionMethod: aSequenceItemSubclass.
		MethodAddition new
			compile: method contents
			classified: 'macro item definitions'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile. ]
]

{ #category : #'macro item definitions' }
MacroItem class >> codeMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Code Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.03366+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Code Macro Item
0040	A168	ConceptCodeSequence                                             	SQ	1	1'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> codeSequenceMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Code Sequence Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.042887+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Code Sequence Macro Item
0008	0100	CodeValue                                                       	SH	1	1C
0008	0102	CodingSchemeDesignator                                          	SH	1	1C
0008	0103	CodingSchemeVersion                                             	SH	1	1C
0008	0104	CodingMeaning                                                   	LO	1	1C
0008	0105	MappingResource                                                 	CS	1	1C
0008	0106	ContextGroupVersion                                             	DT	1	1C
0008	0107	ContextGroupLocalVersion                                        	DT	1	1C
0008	010B	CodeSetExtensionFlag                                            	CS	1	3
0008	010F	ContextIdentifier                                               	CS	1	3'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> compositeObjectReferenceMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Composite Object Reference Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.048238+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Composite Object Reference Macro Item
0008	1199	ReferencedSOPSequence                                           	SQ	1	1'. ]

]

{ #category : #'computer reflection 2021' }
MacroItem class >> computerReflection_MacroItemTextualDataElementsDefinitionMethod: aMacroItemSubclass [
	"Code textual data element definition method for aMacroItemSubclass according
	 to the contents of class variables. 
	
	 May 09 2021 - This is an adaptation of SequenceItem>
	                 computerReflection_SQItemTextualDataElementsDefinitionMethod: - PRD."

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: aMacroItemSubclass macroName; 
				nextPutAll: 'TextualDataElementsDefinition'; cr;
				tab; nextPut: $"; 	nextPutAll: 'Textual data element definition for '; 
				                  nextPutAll: aMacroItemSubclass description; cr; cr;
				tab; nextPutAll: ' Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:'; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;

				nextPutAll: aMacroItemSubclass listDataElementDefinition_Reflexive. ].
]

{ #category : #'macro item definitions' }
MacroItem class >> documentContentMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Document Content Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.051798+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Document Content Macro Item
0008	1199	ReferencedSOPSequence                                           	SQ	1	1
0040	A040	ValueType                                                       	CS	1	1
0040	A043	ConceptNameCodeSequence                                         	SQ	1	1C
0040	A050	ContinuityOfContent                                             	CS	1	1C
0040	A120	DateTime                                                        	DT	1	1C
0040	A121	Date                                                            	DA	1	1C
0040	A122	Time                                                            	TM	1	1C
0040	A123	PersonName                                                      	PN	1	1C
0040	A124	UID                                                             	UI	1	1C
0040	A130	TemporalRangeType                                               	CS	1	1
0040	A132	ReferencedSamplePositions                                       	UL	1-n	1C
0040	A138	ReferencedTimeOffsets                                           	DS	1-n	1C
0040	A13A	ReferencedDatetime                                              	DT	1-n	1C
0040	A160	TextValue                                                       	UT	1	1C
0040	A168	ConceptCodeSequence                                             	SQ	1	1
0040	A300	MeasuredValueSequence                                           	SQ	1	2
0070	0022	GraphicData                                                     	FL	2-n	1
0070	0023	GraphicType                                                     	CS	1	1'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> documentRelationshipMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Document Relationship Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.055632+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Document Relationship Macro Item
0040	A032	ObservationDateTime                                             	DT	1	1C
0040	A504	ContentTemplateSequence                                         	SQ	1	1C
0040	A730	ContentSequence                                                 	SQ	1	1C'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> imageReferenceMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Image Reference Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.059596+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Image Reference Macro Item'.
			"DICOM Composite Object Reference Macro Item"
			aStream
				nextPutAll: self compositeObjectReferenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'computer reflection 2021' }
MacroItem class >> listDataElementDefinition_Reflexive [
	"List my data element definition using character (tab) separated values.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - Modified from 'listDataElementDefinition_full' to not 
	                include the expanded sequence attributes;
	April 25 2021 - SequenceItem specific implementation;
	  May 09 2021 - Refactoring (pushed up) from SequenceItem to Item;
	                Version for computer reflection - Paulo R. Dellani."

	| definition |

	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll:'; cr; nextPutAll: '''# ';
					                 nextPutAll: self description.

			definition := SortedCollection withAll: self attributes.
			definition isNotEmpty ifTrue: [ 
				definition do: [ :item |
					aStream cr.
					item csvPrintOn: aStream separator: Character tab level: 0 ] ].

			aStream
				nextPut: $'; nextPut: $..

			self macroItemClass do: [ :aMacroItemClass |
				aStream
					cr;
					tab; tab; tab; nextPutAll: '"'; nextPutAll: aMacroItemClass description; nextPutAll: '"'; cr;
					tab; tab; tab; nextPutAll: 'aStream'; cr;
					tab; tab; tab; tab; nextPutAll: 'nextPutAll: self ';
					nextPutAll: aMacroItemClass macroName; 
					nextPutAll: 'TextualDataElementsDefinition'; nextPut: $.. ].

			aStream nextPutAll: ' ]'; cr. ].


		
	



]

{ #category : #abstract }
MacroItem class >> macroName [
	^ macroName
]

{ #category : #'macro item definitions' }
MacroItem class >> numericMeasurementMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Numeric Measurement Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.063114+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Numeric Measurement Macro Item
0040	A300	MeasuredValueSequence                                           	SQ	1	2'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> sopInstanceReferenceMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM SOP Instance Reference Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.066443+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM SOP Instance Reference Macro Item
0008	1115	ReferencedSeriesSequence                                        	SQ	1	1
0020	000D	StudyInstanceUID                                                	UI	1	1'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> spatialCoordinatesMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Spatial Coordinates Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.070282+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Spatial Coordinates Macro Item
0070	0022	GraphicData                                                     	FL	2-2n	1
0070	0023	GraphicType                                                     	CS	1	1'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> templateIdentificationMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Template Identification Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.076901+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Template Identification Macro Item
0008	0105	MappingResource                                                 	CS	1	1
0040	DB00	TemplateIdentifier                                              	CS	1	1
0040	DB06	TemplateVersion                                                 	DT	1	1C
0040	DB07	TemplateLocalVersion                                            	DT	1	1C
0040	DB0B	TemplateExtensionFlag                                           	CS	1	1C
0040	DB0C	TemplateExtensionOrganizationUID                                	UI	1	2C
0040	DB0D	TemplateExtensionCreatorUID                                     	UI	1	2C'. ]

]

{ #category : #'macro item definitions' }
MacroItem class >> temporalCoordinatesMacroItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Temporal Coordinates Macro Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:22:42.073578+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Temporal Coordinates Macro Item
0040	A130	TemporalRangeType                                               	CS	1	1
0040	A132	ReferencedSamplePositions                                       	UL	1-n	1C
0040	A138	ReferencedTimeOffsets                                           	DS	1-n	1C
0040	A13A	ReferencedDatetime                                              	DT	1-n	1C'. ]

]
