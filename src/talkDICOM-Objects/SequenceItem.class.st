Class {
	#name : #SequenceItem,
	#superclass : #Item,
	#instVars : [
		'length',
		'description'
	],
	#classInstVars : [
		'sequenceName',
		'sequenceDataElementTag'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #'sequence item definitions' }
SequenceItem class >> acquisitionContextSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Acquisition Context Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.692861+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Acquisition Context Sequence Item
0040	08EA	MeasurementUnitCodeSequence                                     	SQ	1	1C
0040	A043	ConceptNameCodeSequence                                         	SQ	1	1C
0040	A121	Date                                                            	DA	1	1C
0040	A122	Time                                                            	TM	1	1C
0040	A123	PersonName                                                      	PN	1	1C
0040	A136	ReferencedFrameNumbers                                          	US	1-n	1C
0040	A160	TextValue                                                       	UT	1	1C
0040	A168	ConceptCodeSequence                                             	SQ	1	1C
0040	A30A	NumericValue                                                    	DS	1-n	1C'. ]

]

{ #category : #'computer reflection 2021' }
SequenceItem class >> addClassInitializationMethod [
	"Code the initialization method for class SequenceItem. This method will
	 initialize data element definitions for every implemented sequence items
	 to class variable sequenceItemDataElementDefinitions in DicomRegistry.
	
	 (Computer reflection is way cool!)

	 May 13 2021: Initial implementation - PRD."

	| method |
	
	self computerReflection_AddSequenceItemRegistrationMethods.
	method := self computerReflection_SequenceItemInitializationMethod.
	MethodAddition new
		compile: method contents
		classified: 'class initialization'
		withStamp: DateAndTime now printString
		notifying: nil 
		logSource: true
		"This is a class method, so refer to my metaclass"
		inClass: self class;
	compile.
]

{ #category : #'computer reflection 2021' }
SequenceItem class >> addSQItemTextualDescriptionMethods [
	"Code a method for every of my subclasses that writes the data elements
	 definion in textual form. The method is coded by 
	 computerReflection_SQItemTextualDataElementsDefinitionMethod: and added 
	 to protocol 'sequence items definitions'.
	
	 (Computer reflection is way cool!)

	 April 25 2021 - PRD."

	self subclassesDo: [ : aSequenceItemSubclass | | method |
		method := self computerReflection_TextualDataElementDefinitionMethod: aSequenceItemSubclass.
		MethodAddition new
			compile: method contents
			classified: 'sequence item definitions'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile. ]
]

{ #category : #'sequence item definitions' }
SequenceItem class >> additionalDrugSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Additional Drug Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.703113+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Additional Drug Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> administrationRouteCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Administration Route Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.706867+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Administration Route Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> anatomicRegionModifierSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Anatomic Region Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.710043+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Anatomic Region Modifier Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> anatomicRegionSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Anatomic Region Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.713256+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Anatomic Region Sequence Item
0008	2220	AnatomicRegionModifierSequence                                  	SQ	1	3'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #printing }
SequenceItem class >> asText [
	^ self name
]

{ #category : #'sequence item definitions' }
SequenceItem class >> calibrationDataSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Calibration Data Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.716539+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Calibration Data Sequence Item'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> channelDefinitionSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Channel Definition Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.719494+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Channel Definition Sequence Item
003A	0202	WaveformChannelNumber                                           	IS	1	3
003A	0203	ChannelLabel                                                    	SH	1	3
003A	0205	ChannelStatus                                                   	CS	1-n	3
003A	0208	ChannelSourceSequence                                           	SQ	1	1
003A	0209	ChannelSourceModifiersSequence                                  	SQ	1	1C
003A	020A	SourceWaveformSequence                                          	SQ	1	3
003A	020C	ChannelDerivationDescription                                    	LO	1	3
003A	0210	ChannelSensitivity                                              	DS	1	1C
003A	0211	ChannelSensitivityUnitsSequence                                 	SQ	1	1C
003A	0212	ChannelSensitivityCorrectionFactor                              	DS	1	1C
003A	0213	ChannelBaseline                                                 	DS	1	1C
003A	0214	ChannelTimeSkew                                                 	DS	1	1C
003A	0215	ChannelSampleSkew                                               	DS	1	1C
003A	0218	ChannelOffset                                                   	DS	1	3
003A	021A	WaveformBitsStored                                              	US	1	1
003A	0220	FilterLowFrequency                                              	DS	1	3
003A	0221	FilterHighFrequency                                             	DS	1	3
003A	0222	NotchFilterFrequency                                            	DS	1	3
003A	0223	NotchFilterBandwidth                                            	DS	1	3
5400	0110	ChannelMinimumValue                                             	OB	1	3
5400	0112	ChannelMaximumValue                                             	OB	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> channelSensitivityUnitsSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Channel Sensitivity Units Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.72282+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Channel Sensitivity Units Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> channelSourceModifierSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Channel Source Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.725938+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Channel Source Modifier Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> channelSourceSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Channel Source Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.728917+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Channel Source Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'computer reflection 2021' }
SequenceItem class >> computerReflection_AddSequenceItemRegistrationMethods [
	"Generates a method that register every known sequence item in 
    the dictionary of sequence item attributes definitions
	
	 03 June 2021 - Initial implementation - PRD"

	| method |

	self subclassesDo: [ : aSequenceItemSubclass |
		aSequenceItemSubclass sequenceDataElementTag ifNotNil: [ 

			method := String
				new: 10
				streamContents: [ :writeStream | 
					writeStream
						nextPutAll: 'register'; nextPutAll: (aSequenceItemSubclass sequenceName copyReplaceAll: 'SequenceItem' with: 'SQItem'); 
						cr; tab; nextPut: $"; 	
						nextPutAll: 'Register '; nextPutAll: aSequenceItemSubclass description; cr; cr;
						tab; nextPutAll: ' Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods'; cr; cr;
						tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr;

						cr; tab; nextPutAll: 'DicomRegistry';
						cr; tab; tab; nextPutAll: ' registerSequenceItemDataElementDefinition:';
						cr; tab; tab; tab; nextPutAll: '(self new ';
						cr; tab; tab; tab; tab; nextPutAll: 'description: '''; nextPutAll: aSequenceItemSubclass description; nextPutAll: ''';';
						cr; tab; tab; tab; tab; nextPutAll: 'initializeDataElementsDefinition: self ';
						nextPutAll: (aSequenceItemSubclass sequenceName copyReplaceAll: 'SequenceItem' with: 'SQItem'); 
						nextPutAll: 'TextualDataElementsDefinition;';
						cr; tab; tab; tab; tab; nextPutAll: 'yourself)';
						cr; tab; tab; nextPutAll: 'sequenceDataElementTag: ';
						nextPutAll: '(DataElementTag fromArray: '.
					aSequenceItemSubclass sequenceDataElementTag printArrayCodeOn: writeStream.
					writeStream
						nextPutAll: ').'; cr.
			].
		
			MethodAddition new
				compile: method contents
				classified: 'class initialization - private'
				withStamp: DateAndTime now printString
				notifying: nil 
				logSource: true
				"This is a class method, so refer to my metaclass"
				inClass: self class;
			compile ] ].



]

{ #category : #'computer reflection 2021' }
SequenceItem class >> computerReflection_SequenceItemInitializationMethod [
	"Code the class initialization method for SequenceItem that populates
	 class variable DicomRegistry>sequenceItemDataElementDefinitions with 
	 data element definitions for several sequence items. 
	
	 May 13 2021 - Initial implementation - PRD"

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'initialize';
				cr; tab; nextPut: $"; 	
				nextPutAll: 'Populates class variable DicomRegistry>sequenceItemDataElementDefinitions ';
				nextPutAll: 'with data element definitions for the implemented sequence items bellow.';
				cr; cr; tab; nextPutAll: ' Coder: SequenceItem>computerReflection_SequenceItemInitializationMethod:';
				cr; cr; tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr.

			self subclassesDo: [ : aSequenceItemSubclass |
				aSequenceItemSubclass sequenceDataElementTag ifNotNil: [
					writeStream
						cr; tab; nextPutAll: 'self register'; 
						nextPutAll: (aSequenceItemSubclass sequenceName copyReplaceAll: 'SequenceItem' with: 'SQItem'); nextPutAll: '.'.
			] ] ].
]

{ #category : #'computer reflection 2021' }
SequenceItem class >> computerReflection_TextualDataElementDefinitionMethod: aSequenceItemSubclass [
	"Code textual data element definition method for aSequenceItemSubclass according
	 to the contents of class variables. 
	
	 April 25 2021 - This is an adaptation of DicomIOM>
	                 ComputerReflection_IOMTextualDataElementsDefinitionMethod: - PRD."

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: (aSequenceItemSubclass sequenceName copyReplaceAll: 'SequenceItem' with: 'SQItem'); 
				nextPutAll: 'TextualDataElementsDefinition'; cr;
				tab; nextPut: $"; 	nextPutAll: 'Textual data element definition for '; 
				                  nextPutAll: aSequenceItemSubclass description; cr; cr;
				tab; nextPutAll: ' Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:'; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;

				nextPutAll: aSequenceItemSubclass listDataElementDefinition_Reflexive. ].
]

{ #category : #'sequence item definitions' }
SequenceItem class >> conceptCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Concept Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.731912+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Concept Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> conceptNameCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Concept Name Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.73485+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Concept Name Code Sequence Item
0040	A195	ModifierCodeSequence                                            	SQ	1	1C'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> contentSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Content Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.738031+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Content Sequence Item
0040	A010	RelationshipType                                                	CS	1	1
0040	DB73	ReferencedContentItemIdentifier                                 	UL	1-n	1C'.
			"DICOM Document Relationship Macro Item"
			aStream
				cr; nextPutAll: MacroItem documentRelationshipMacroItemTextualDataElementsDefinition.
			"DICOM Document Content Macro Item"
			aStream
				cr; nextPutAll: MacroItem documentContentMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> contentTemplateSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Content Template Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.741186+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Content Template Sequence Item'.
			"DICOM Template Identification Macro Item"
			aStream
				cr; nextPutAll: MacroItem templateIdentificationMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> contrastBolusAdministrationRouteSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Contrast/Bolus Administration Route Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.744122+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Contrast/Bolus Administration Route Sequence Item
0018	002A	AdditionalDrugSequence                                          	SQ	1	3'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> contrastBolusAgentSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Contrast/Bolus Agent Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.74724+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Contrast/Bolus Agent Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #utilities }
SequenceItem class >> csvPrintOn: aStream separator: aCharacter level: level [
	"List my data element definition using character (tab) separated values.
	
	 April 11 2021 - PRD."

	| definition attribute |

	definition := SortedCollection withAll: DataElements values.
	definition isNotEmpty ifTrue: [ 
		"level timesRepeat: [ aStream nextPutAll: '> ' ]."
		(definition at: 1) csvPrintOn: aStream separator: Character tab level: level.
		2 to: definition size do: [ :index | 
			aStream cr.
			"level timesRepeat: [ aStream nextPutAll: '> ' ]."
			attribute := definition at: index.
			attribute isSequence ifTrue: [
				"Some sequence items are potentially recursive, so let's avoid going down the rabbit hole"
				attribute sequenceItemClass = self ifTrue: [
					attribute csvPrintOn: aStream separator: aCharacter level: level listItemAttributes: false.
					aStream cr.
					level timesRepeat: [ aStream nextPutAll: '< ' ].
					aStream nextPutAll: ' Potentially recursive sequence attribute detected, refer my parent for my attributes.'.
				] ifFalse: [
					attribute csvPrintOn: aStream separator: aCharacter level: level listItemAttributes: true ] 
			] ifFalse: [
				attribute csvPrintOn: aStream separator: aCharacter level: level ] ] ]
		
	

]

{ #category : #'sequence item definitions' }
SequenceItem class >> currentRequestedProcedureEvidenceSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Current Requested Procedure Evidence Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.750213+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Current Requested Procedure Evidence Sequence Item'.
			"DICOM SOP Instance Reference Macro Item"
			aStream
				cr; nextPutAll: MacroItem sopInstanceReferenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> dataInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Data Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.753278+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Data Information Sequence Item
0018	1062	NominalInterval                                                 	IS	1	3
0018	1063	FrameTime                                                       	DS	1	1C
0018	1081	LowRRValue                                                      	IS	1	3
0018	1082	HighRRValue                                                     	IS	1	3
0018	1083	IntervalsAcquired                                               	IS	1	3
0018	1084	IntervalsRejected                                               	IS	1	3
0054	0072	TimeSlotInformationSequence                                     	SQ	1	2C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> detectorInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Detector Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.756267+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Detector Information Sequence Item
0018	1110	DistanceSourceToDetector                                        	DS	1	2C
0018	1120	GantryDetectorTilt                                              	DS	1	3
0018	1142	RadialPosition                                                  	DS	1-n	3
0018	1145	CenterOfRorationOffset                                          	DS	1	3
0018	1147	FieldOfViewShape                                                	CS	1	3
0018	1149	FieldOfViewDimensions                                           	IS	1-2	3
0018	1180	CollimatorGridName                                              	SH	1	3
0018	1181	CollimatorType                                                  	CS	1	2C
0018	1182	FocalDistance                                                   	IS	1-2	2C
0018	1183	XFocusCenter                                                    	DS	1-2	3
0018	1184	YFocusCenter                                                    	DS	1-2	3
0020	0032	ImagePositionPatient                                            	DS	3	2C
0020	0037	ImageOrientationPatient                                         	DS	6	2C
0028	0031	ZoomFactor                                                      	DS	2	3
0028	0032	ZoomCenter                                                      	DS	2	3
0054	0200	StartAngle                                                      	DS	1	3
0054	0220	ViewCodeSequence                                                	SQ	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> directoryRecordSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Directory Record Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.75942+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Directory Record Sequence Item
0004	1400	OffsetOfTheNextDirectoryRecord                                  	UL	1	1C
0004	1410	RecordInUseFlag                                                 	US	1	1C
0004	1420	OffsetOfReferencedLowerLevelDirectoryEntity                     	UL	1	1C
0004	1430	DirectoryRecordType                                             	CS	1	1C
0004	1432	PrivateRecordUID                                                	UI	1	1C
0004	1500	ReferencedFileID                                                	CS	1-8	1C
0004	1504	MrDRDirectoryRecordOffset                                       	UL	1	1C
0004	1510	ReferencedSOPClassUIDInFile                                     	UI	1	1C
0004	1511	ReferencedSOPInstanceUIDInFile                                  	UI	1	1C
0004	1512	ReferencedTransferSyntaxUIDInFile                               	UI	1	1C
0008	0005	SpecificCharacterSet                                            	CS	1-n	1C
0008	0008	ImageType                                                       	CS	1-n	3
0008	0020	StudyDate                                                       	DA	1	1
0008	0021	SeriesDate                                                      	DA	1	3
0008	0030	StudyTime                                                       	TM	1	1
0008	0031	SeriesTime                                                      	TM	1	3
0008	0050	AccessionNumber                                                 	SH	1	2
0008	0060	Modality                                                        	CS	1	1
0008	0090	ReferringPhysiciansName                                         	PN	1	3
0008	1030	StudyDescription                                                	LO	1	2
0008	103E	SeriesDescription                                               	LO	1	3
0008	1048	PhysiciansOfRecord                                              	PN	1-n	3
0008	1050	PerformingPhysiciansName                                        	PN	1-n	3
0008	1060	NameOfPhysiciansReadingStudy                                    	PN	1-n	3
0008	1070	OperatorsName                                                   	PN	1-n	3
0008	1140	ReferencedImageSequence                                         	SQ	1	3
0010	0010	PatientsName                                                    	PN	1	2
0010	0020	PatientID                                                       	LO	1	1
0010	0030	PatientsBirthDate                                               	DA	1	3
0010	0040	PatientsSex                                                     	CS	1	3
0018	0015	BodyPartExamined                                                	CS	1	3
0018	1030	ProtocolName                                                    	LO	1	3
0020	000D	StudyInstanceUID                                                	UI	1	1C
0020	000E	SeriesInstanceUID                                               	UI	1	1
0020	0010	StudyID                                                         	SH	1	1
0020	0011	SeriesNumber                                                    	IS	1	2
0020	0013	InstanceNumber                                                  	IS	1	1
0088	0200	IconImageSequence                                               	SQ	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> displayedAreaSelectionSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Displayed Area Selection Sequence Module

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.763004+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Displayed Area Selection Sequence Module
0008	1140	ReferencedImageSequence                                         	SQ	1	1
0070	0052	DisplayedAreaTopLeftHandCorner                                  	SL	2	1
0070	0053	DsplayedAreaBottomRightHandCorner                               	SL	2	1
0070	0100	PresentationSizeMode                                            	CS	1	1
0070	0101	PresentationPixelSpacing                                        	DS	2	1C
0070	0102	PresentationPixelAspectRatio                                    	IS	1	1C
0070	0103	PresentationPixelMagnificationRatio                             	FL	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> energyWindowInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Energy Window Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.766271+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Energy Window Information Sequence Item
0054	0013	EnergyWindowRangeSequence                                       	SQ	1	3
0054	0018	EnergyWindowName                                                	SH	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> energyWindowRangeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Energy Window Range Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.769131+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Energy Window Range Sequence Item'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> gatedInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Gated Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.771977+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Gated Information Sequence Item
0018	1060	TriggerTime                                                     	DS	1	3
0018	1064	FramingType                                                     	LO	1	3
0054	0063	DataInformationSequence                                         	SQ	1	2C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> genericSQItemTextualDataElementsDefinition [
	"Textual data element definition for Generic Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.943792+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Generic Sequence Item'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> graphicAnnotationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Graphic Annotation Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.774935+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Graphic Annotation Sequence Item
0008	1140	ReferencedImageSequence                                         	SQ	1	1C
0070	0002	GraphicLayer                                                    	CS	1	1
0070	0008	TextObjectSequence                                              	SQ	1	1C
0070	0009	GraphicObjectSequence                                           	SQ	1	1'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> graphicLayerSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Graphic Layer Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.777986+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Graphic Layer Sequence Item
0070	0002	GraphicLayer                                                    	CS	1	1
0070	0062	GraphicLayerOrder                                               	IS	1	1
0070	0066	GraphicLayerRecommendedDisplayGrayscaleValue                    	US	1	3
0070	0067	GraphicLayerRecommendedDisplayRGBValue                          	US	1	3
0070	0068	GraphicLayerDescription                                         	LO	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> graphicObjectSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Graphic Object Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.780891+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Graphic Object Sequence Item
0070	0005	GraphicAnnotationUnits                                          	CS	1	1
0070	0020	GraphicDimensions                                               	US	1	1
0070	0021	NumberOfGraphicPoints                                           	US	1	1
0070	0022	GraphicData                                                     	FL	2-n	1
0070	0023	GraphicType                                                     	CS	1	1
0070	0024	GraphicFilled                                                   	CS	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> iconImageSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Icon Image Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.783932+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Icon Image Sequence Item
0028	0002	SamplesPerPixel                                                 	US	1	1
0028	0004	PhotometricInterpretation                                       	CS	1	1
0028	0006	PlanarConfiguration                                             	US	1	1C
0028	0010	Rows                                                            	US	1	1
0028	0011	Columns                                                         	US	1	1
0028	0034	PixelAspectRatio                                                	IS	2	1C
0028	0100	BitsAllocated                                                   	US	1	1
0028	0101	BitsStored                                                      	US	1	1
0028	0102	HighBit                                                         	US	1	1
0028	0103	PixelRepresentation                                             	US	1	1
0028	0106	SmallestImagePixelValue                                         	SS	1	3
0028	0107	LargestImagePixelValue                                          	SS	1	3
0028	1101	RedPaletteColorLookupTableDescriptor                            	SS	3	1C
0028	1102	GreenPaletteColorLookupTableDescriptor                          	SS	3	1C
0028	1103	BluePaletteColorLookupTableDescriptor                           	SS	3	1C
0028	1201	RedPaletteColorLookupTableData                                  	OW	1	1C
0028	1202	GreenPaletteColorLookupTableData                                	OW	1	1C
0028	1203	BluePaletteColorLookupTableData                                 	OW	1	1C
7FE0	0010	PixelData                                                       	OW	1	1'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> identicalDocumentsSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Identical Documents Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.787097+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Identical Documents Sequence Item'.
			"DICOM SOP Instance Reference Macro Item"
			aStream
				cr; nextPutAll: MacroItem sopInstanceReferenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'class initialization' }
SequenceItem class >> initialize [
	"Populates class variable DicomRegistry>sequenceItemDataElementDefinitions with data element definitions for the implemented sequence items bellow.

	 Coder: SequenceItem>computerReflection_SequenceItemInitializationMethod:

	 2021-06-03T19:58:27.446957+02:00 - Computer Reflection"

	self registeracquisitionContextSQItem.
	self registeradditionalDrugSQItem.
	self registeradministrationRouteCodeSQItem.
	self registeranatomicRegionModifierSQItem.
	self registeranatomicRegionSQItem.
	self registercalibrationDataSQItem.
	self registerchannelDefinitionSQItem.
	self registerchannelSensitivityUnitsSQItem.
	self registerchannelSourceModifierSQItem.
	self registerchannelSourceSQItem.
	self registerconceptCodeSQItem.
	self registerconceptNameCodeSQItem.
	self registercontentSQItem.
	self registercontentTemplateSQItem.
	self registercontrastBolusAdministrationRouteSQItem.
	self registercontrastBolusAgentSQItem.
	self registercurrentRequestedProcedureEvidenceSQItem.
	self registerdataInformationSQItem.
	self registerdetectorInformationSQItem.
	self registerdirectoryRecordSQItem.
	self registerdisplayedAreaSelectionSQItem.
	self registerenergyWindowInformationSQItem.
	self registerenergyWindowRangeSQItem.
	self registergatedInformationSQItem.
	self registergraphicAnnotationSQItem.
	self registergraphicLayerSQItem.
	self registergraphicObjectSQItem.
	self registericonImageSQItem.
	self registeridenticalDocumentsSQItem.
	self registerinterventionDrugCodeSQItem.
	self registerinterventionDrugInformationSQItem.
	self registermaskSubtractionSQItem.
	self registermeasuredValueSQItem.
	self registermeasurementUnitsCodeSQItem.
	self registermodalityLUTSQItem.
	self registermodifierCodeSQItem.
	self registerpatientGantryRelationshipCodeSQItem.
	self registerpatientOrientationCodeSQItem.
	self registerpatientOrientationModifierCodeSQItem.
	self registerperformedActionItemSQItem.
	self registerperformedProcedureCodeSQItem.
	self registerpertinentOtherEvidenceSQItem.
	self registerphaseInformationSQItem.
	self registerpredecessorDocumentsSQItem.
	self registerpresentationLUTSQItem.
	self registerprimaryAnatomicStructureModifierSQItem.
	self registerprimaryAnatomicStructureSQItem.
	self registerprocedureCodeSQItem.
	self registerpurposeOfReferenceCodeSQItem.
	self registerradionuclideCodeSQItem.
	self registerradiopharmaceuticalCodeSQItem.
	self registerradiopharmaceuticalInformationSQItem.
	self registerreferencedCurveSQItem.
	self registerreferencedImageSQItem.
	self registerreferencedInstanceSQItem.
	self registerreferencedOverlaySQItem.
	self registerreferencedPatientSQItem.
	self registerreferencedRequestSQItem.
	self registerreferencedSOPSQItem.
	self registerreferencedSeriesSQItem.
	self registerreferencedStudyComponentSQItem.
	self registerreferencedStudySQItem.
	self registerreferencedWaveformSQItem.
	self registerrequestAttributesSQItem.
	self registerrequestedProcedureCodeSQItem.
	self registerrotationInformationSQItem.
	self registerscheduledActionItemCodeSQItem.
	self registersoftcopyVOILUTSQItem.
	self registersourceImageSQItem.
	self registersourceWaveformSQItem.
	self registerspecimenSQItem.
	self registerspecimenTypeCodeSQItem.
	self registerstageCodeSQItem.
	self registertextObjectSQItem.
	self registertimeSlotInformationSQItem.
	self registertransducerOrientationModifierSQItem.
	self registertransducerOrientationSQItem.
	self registertransducerPositionModifierSQItem.
	self registertransducerPositionSQItem.
	self registerultrasoundRegionsSQItem.
	self registervoiLUTSQItem.
	self registerverifyingObserverIdentificationCodeSQItem.
	self registerverifyingObserverSQItem.
	self registerviewCodeSQItem.
	self registerviewModifierCodeSQItem.
	self registerwaveformAnnotationSQItem.
	self registerwaveformSQItem.
]

{ #category : #'sequence item definitions' }
SequenceItem class >> interventionDrugCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Intervention Drug Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.790197+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Intervention Drug Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> interventionDrugInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for Intervention Drug Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.793118+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Intervention Drug Information Sequence Item
0018	0027	InterventionDrugStopTime                                        	TM	1	3
0018	0028	InterventionDrugDose                                            	DS	1	3
0018	0029	InterventionDrugCodeSequence                                    	SQ	1	3
0018	0034	InterventionDrugName                                            	LO	1	3
0018	0035	InterventionDrugStartTime                                       	TM	1	3
0054	0302	AdministrationRouteCodeSequence                                 	SQ	1	3'. ]

]

{ #category : #utilities }
SequenceItem class >> listDataElementDefinition [
	"List my data element definition using character (tab) separated values.
	
	 April 11 2021 - Initial implementation;
	 April 18 2021 - Modified from 'listDataElementDefinition_full' to not 
	                 include the expanded sequence attributes;
	 April 25 2021 - SequenceItem specific implementation;
	   May 09 2021 - Refactoring (pushed up) from SequenceItem to Item
	                 - Paulo R. Dellani."

	| definition macroDefinition |

	^ String
		new: 10
		streamContents: [ :aStream | 
			definition := SortedCollection withAll: self attributes.
			definition isNotEmpty ifTrue: [ 
				definition do: [ :item |
					aStream cr.
					item csvPrintOn: aStream separator: Character tab level: 0 ] ].
			self macroItemClass do: [ :aMacroItemClass |
				macroDefinition := SortedCollection withAll: aMacroItemClass attributes.
				macroDefinition isNotEmpty ifTrue: [ 
					aStream cr.
					aStream nextPutAll: '# '; nextPutAll: aMacroItemClass description.
					macroDefinition do: [ :item | 
						aStream cr.
						item csvPrintOn: aStream separator: Character tab level: 0 ] ] ] ]
]

{ #category : #'computer reflection 2021' }
SequenceItem class >> listDataElementDefinition_Reflexive [
	"List my data element definition using character (tab) separated values.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - Modified from 'listDataElementDefinition_full' to not 
	                include the expanded sequence attributes;
	April 25 2021 - SequenceItem specific implementation;
	  May 09 2021 - Refactoring (pushed up) from SequenceItem to Item;
	                Version for computer reflection - PRD."

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
					tab; tab; tab; tab; nextPutAll: 'cr; nextPutAll: MacroItem ';
					nextPutAll: aMacroItemClass macroName; 
					nextPutAll: 'TextualDataElementsDefinition'; nextPut: $.. ].

			aStream nextPutAll: ' ]'; cr. ].


		
	



]

{ #category : #'sequence item definitions' }
SequenceItem class >> maskSubtractionSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Mask Subtraction Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.796118+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Mask Subtraction Sequence Item
0028	6101	MaskOperation                                                   	CS	1	1
0028	6102	ApplicationFrameRange                                           	US	2-2n	3
0028	6110	MaskFrameNumbers                                                	US	1-n	1C
0028	6112	ContrastFrameAveraging                                          	US	1	1C
0028	6114	MaskSubpixelShift                                               	FL	2	3
0028	6120	TidOffset                                                       	SS	1	2C
0028	6190	MaskOperationExplanation                                        	ST	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> measuredValueSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Measured Value Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.799158+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Measured Value Sequence Item
0040	08EA	MeasurementUnitsCodeSequence                                    	SQ	1	1
0040	A30A	NumericValue                                                    	DS	1-n	1'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> measurementUnitsCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Measurement Units Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.802159+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Measurement Units Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> modalityLUTSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Modality LUT Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.805093+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Modality LUT Sequence Item
0028	3002	LutDescriptor                                                   	SS	3	1C
0028	3003	LutExplanation                                                  	LO	1	3
0028	3004	ModalityLUTType                                                 	LO	1	1C
0028	3006	LutData                                                         	OW	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> modifierCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Modifier Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.807989+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Modifier Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> patientGantryRelationshipCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Patient Gantry Relationship Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.810923+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Patient Gantry Relationship Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> patientOrientationCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Patient Orientation Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.813914+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Patient Orientation Code Sequence Item
0054	0412	PatientOrientationModifierCodeSequence                          	SQ	1	2C
0054	0412	PatientGantryRelationshipCodeSequence                           	SQ	1	2C'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> patientOrientationModifierCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Patient Orientation Modifier Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.817043+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Patient Orientation Modifier Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> performedActionItemSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Performed Action Item Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.819957+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Performed Action Item Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> performedProcedureCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Performed Procedure Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.822968+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Performed Procedure Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> pertinentOtherEvidenceSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Pertinent Other Evidence Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.825912+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Pertinent Other Evidence Sequence Item'.
			"DICOM SOP Instance Reference Macro Item"
			aStream
				cr; nextPutAll: MacroItem sopInstanceReferenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> phaseInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Phase Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.829035+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Phase Information Sequence Item
0018	1242	ActualFrameDuration                                             	IS	1	1C
0054	0033	NumberOfFramesInPhase                                           	US	1	1C
0054	0036	PhaseDelay                                                      	IS	1	1C
0054	0038	PauseBetweenFrames                                              	IS	1	1C
0054	0039	PhaseDescription                                                	CS	1	3
0054	0210	TriggerVector                                                   	IS	1-n	3
0054	0211	NumberOfTriggersInPhase                                         	US	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> predecessorDocumentsSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Predecessor Documents Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.832125+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Predecessor Documents Sequence Item'.
			"DICOM SOP Instance Reference Macro Item"
			aStream
				cr; nextPutAll: MacroItem sopInstanceReferenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> presentationLUTSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Presentation LUT Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.835074+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Presentation LUT Sequence Item
0028	3002	LutDescriptor                                                   	SS	3	1C
0028	3003	LutExplanation                                                  	LO	1	1C
0028	3006	LutData                                                         	US	1-n	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> primaryAnatomicStructureModifierSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Primary Anatomic Structure Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.837971+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Primary Anatomic Structure Modifier Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> primaryAnatomicStructureSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Primary Anatomic Structure Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.841132+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Primary Anatomic Structure Sequence Item
0008	2230	PrimaryAnatomicStructureModifierSequence                        	SQ	1	3'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> procedureCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Procedure Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.84407+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Procedure Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> purposeOfReferenceCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Purpose of Reference Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.847003+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Purpose of Reference Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> radionuclideCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Radionuclide Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.850076+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Radionuclide Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> radiopharmaceuticalCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Radiopharmaceutical Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.853192+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Radiopharmaceutical Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> radiopharmaceuticalInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Radiopharmaceutical Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.85612+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Radiopharmaceutical Information Sequence Item
0018	0031	Radiopharmaceutical                                             	LO	1	3
0018	1070	RadiopharmaceuticalRoute                                        	LO	1	3
0018	1071	RadiopharmaceuticalVolume                                       	DS	1	3
0018	1072	RadiopharmaceuticalStartTime                                    	TM	1	3
0018	1073	RadiopharmaceuticalStopTime                                     	TM	1	3
0018	1074	RadionuclideTotalDose                                           	DS	1	3
0054	0300	RadionuclideCodeSequence                                        	SQ	1	2C
0054	0302	AdministrationRouteCodeSequence                                 	SQ	1	3
0054	0304	RadiopharmaceuticalCodeSequence                                 	SQ	1	3
0054	0306	CalibrationDataSequence                                         	SQ	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedCurveSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Curve Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.859236+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Curve Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedImageSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Image Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.862126+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Image Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C
0008	1160	ReferencedFrameNumber                                           	IS	1-n	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedInstanceSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Instance Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.865204+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Instance Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedOverlaySQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Overlay Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.868086+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Overlay Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedPatientSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Patient Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.871082+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Patient Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedRequestSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Request Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.873972+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Request Sequence Item
0008	0050	AccessionNumber                                                 	SH	1	2
0008	1110	ReferencedStudySequence                                         	SQ	1	2
0020	000D	StudyInstanceUID                                                	UI	1	1
0032	1060	RequestedProcedureDescription                                   	LO	1	2
0032	1064	RequestedProcedureCodeSequence                                  	SQ	1	2
0040	1001	RequestedProcedureID                                            	SH	1	2
0040	2016	PlaceOrderNumberImagingServiceRequest                           	LO	1	2
0040	2017	FillerOrderNumberImagingServiceRequest                          	LO	1	2'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedSOPSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced SOP Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.876994+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced SOP Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C
0008	1160	ReferencedFrameNumber                                           	IS	1-n	1C
0008	1199	ReferencedSOPSequence                                           	SQ	1	1
0040	A0B0	ReferencedWaveformChannels                                      	US	2-2n	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedSeriesSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Series Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.880153+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Series Sequence Item
0008	0054	RetrieveAETitle                                                 	AE	1-n	3
0008	1199	ReferencedSOPSequence                                           	SQ	1	1
0020	000E	SeriesInstanceUID                                               	UI	1	1
0088	0130	StorageMediaFileSetID                                           	SH	1	3
0088	0140	StorageMediaFileSetUID                                          	UI	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedStudyComponentSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Study Component Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.883189+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Study Component Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedStudySQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Study Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.886063+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Study Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> referencedWaveformSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Referenced Waveform Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.888921+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Referenced Waveform Sequence Item
0040	A170	PurposeOfReferenceCodeSequence                                  	SQ	1	1'.
			"DICOM SOP Instance Reference Macro Item"
			aStream
				cr; nextPutAll: MacroItem sopInstanceReferenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'class initialization - private' }
SequenceItem class >> registeracquisitionContextSQItem [
	"Register DICOM Acquisition Context Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.041682+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Acquisition Context Sequence Item';
				initializeDataElementsDefinition: self acquisitionContextSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r0555)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registeradditionalDrugSQItem [
	"Register DICOM Additional Drug Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.05191+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Additional Drug Sequence Item';
				initializeDataElementsDefinition: self additionalDrugSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0018 16r002A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registeradministrationRouteCodeSQItem [
	"Register DICOM Administration Route Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.100709+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Administration Route Code Sequence Item';
				initializeDataElementsDefinition: self administrationRouteCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0302)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registeranatomicRegionModifierSQItem [
	"Register DICOM Anatomic Region Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.110699+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Anatomic Region Modifier Sequence Item';
				initializeDataElementsDefinition: self anatomicRegionModifierSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2220)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registeranatomicRegionSQItem [
	"Register DICOM Anatomic Region Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.116237+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Anatomic Region Sequence Item';
				initializeDataElementsDefinition: self anatomicRegionSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2218)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registercalibrationDataSQItem [
	"Register DICOM Calibration Data Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.120608+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Calibration Data Sequence Item';
				initializeDataElementsDefinition: self calibrationDataSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0306)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerchannelDefinitionSQItem [
	"Register DICOM Channel Definition Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.124658+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Channel Definition Sequence Item';
				initializeDataElementsDefinition: self channelDefinitionSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r003A 16r0200)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerchannelSensitivityUnitsSQItem [
	"Register DICOM Channel Sensitivity Units Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.128601+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Channel Sensitivity Units Sequence Item';
				initializeDataElementsDefinition: self channelSensitivityUnitsSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r003A 16r0211)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerchannelSourceModifierSQItem [
	"Register DICOM Channel Source Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.132735+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Channel Source Modifier Sequence Item';
				initializeDataElementsDefinition: self channelSourceModifierSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r003A 16r0209)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerchannelSourceSQItem [
	"Register DICOM Channel Source Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.136652+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Channel Source Sequence Item';
				initializeDataElementsDefinition: self channelSourceSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r003A 16r0208)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerconceptCodeSQItem [
	"Register DICOM Concept Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.141321+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Concept Code Sequence Item';
				initializeDataElementsDefinition: self conceptCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA168)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerconceptNameCodeSQItem [
	"Register DICOM Concept Name Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.145438+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Concept Name Code Sequence Item';
				initializeDataElementsDefinition: self conceptNameCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA043)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registercontentSQItem [
	"Register DICOM Content Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.149264+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Content Sequence Item';
				initializeDataElementsDefinition: self contentSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA730)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registercontentTemplateSQItem [
	"Register DICOM Content Template Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.153128+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Content Template Sequence Item';
				initializeDataElementsDefinition: self contentTemplateSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA504)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registercontrastBolusAdministrationRouteSQItem [
	"Register DICOM Contrast/Bolus Administration Route Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.157149+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Contrast/Bolus Administration Route Sequence Item';
				initializeDataElementsDefinition: self contrastBolusAdministrationRouteSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0018 16r0014)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registercontrastBolusAgentSQItem [
	"Register DICOM Contrast/Bolus Agent Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.161528+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Contrast/Bolus Agent Sequence Item';
				initializeDataElementsDefinition: self contrastBolusAgentSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0018 16r0012)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registercurrentRequestedProcedureEvidenceSQItem [
	"Register DICOM Current Requested Procedure Evidence Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.165724+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Current Requested Procedure Evidence Sequence Item';
				initializeDataElementsDefinition: self currentRequestedProcedureEvidenceSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA375)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerdataInformationSQItem [
	"Register DICOM Data Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.169602+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Data Information Sequence Item';
				initializeDataElementsDefinition: self dataInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0063)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerdetectorInformationSQItem [
	"Register DICOM Detector Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.173958+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Detector Information Sequence Item';
				initializeDataElementsDefinition: self detectorInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0022)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerdirectoryRecordSQItem [
	"Register DICOM Directory Record Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.177807+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Directory Record Sequence Item';
				initializeDataElementsDefinition: self directoryRecordSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0004 16r1220)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerdisplayedAreaSelectionSQItem [
	"Register DICOM Displayed Area Selection Sequence Module

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.181602+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Displayed Area Selection Sequence Module';
				initializeDataElementsDefinition: self displayedAreaSelectionSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0070 16r005A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerenergyWindowInformationSQItem [
	"Register DICOM Energy Window Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.185668+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Energy Window Information Sequence Item';
				initializeDataElementsDefinition: self energyWindowInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0012)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerenergyWindowRangeSQItem [
	"Register DICOM Energy Window Range Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.189568+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Energy Window Range Sequence Item';
				initializeDataElementsDefinition: self energyWindowRangeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0013)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registergatedInformationSQItem [
	"Register DICOM Gated Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.193486+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Gated Information Sequence Item';
				initializeDataElementsDefinition: self gatedInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0062)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registergraphicAnnotationSQItem [
	"Register DICOM Graphic Annotation Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.197552+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Graphic Annotation Sequence Item';
				initializeDataElementsDefinition: self graphicAnnotationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0070 16r0001)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registergraphicLayerSQItem [
	"Register DICOM Graphic Layer Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.201996+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Graphic Layer Sequence Item';
				initializeDataElementsDefinition: self graphicLayerSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0070 16r0060)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registergraphicObjectSQItem [
	"Register DICOM Graphic Object Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.206005+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Graphic Object Sequence Item';
				initializeDataElementsDefinition: self graphicObjectSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0070 16r0009)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registericonImageSQItem [
	"Register DICOM Icon Image Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.210117+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Icon Image Sequence Item';
				initializeDataElementsDefinition: self iconImageSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0088 16r0200)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registeridenticalDocumentsSQItem [
	"Register DICOM Identical Documents Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.213887+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Identical Documents Sequence Item';
				initializeDataElementsDefinition: self identicalDocumentsSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA525)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerinterventionDrugCodeSQItem [
	"Register DICOM Intervention Drug Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.217695+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Intervention Drug Code Sequence Item';
				initializeDataElementsDefinition: self interventionDrugCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0018 16r0029)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerinterventionDrugInformationSQItem [
	"Register Intervention Drug Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.221816+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'Intervention Drug Information Sequence Item';
				initializeDataElementsDefinition: self interventionDrugInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0018 16r0026)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registermaskSubtractionSQItem [
	"Register DICOM Mask Subtraction Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.226344+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Mask Subtraction Sequence Item';
				initializeDataElementsDefinition: self maskSubtractionSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0028 16r6100)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registermeasuredValueSQItem [
	"Register DICOM Measured Value Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.230483+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Measured Value Sequence Item';
				initializeDataElementsDefinition: self measuredValueSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA300)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registermeasurementUnitsCodeSQItem [
	"Register DICOM Measurement Units Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.234874+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Measurement Units Code Sequence Item';
				initializeDataElementsDefinition: self measurementUnitsCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r08EA)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registermodalityLUTSQItem [
	"Register DICOM Modality LUT Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.238776+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Modality LUT Sequence Item';
				initializeDataElementsDefinition: self modalityLUTSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0028 16r3000)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registermodifierCodeSQItem [
	"Register DICOM Modifier Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.242624+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Modifier Code Sequence Item';
				initializeDataElementsDefinition: self modifierCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA195)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpatientGantryRelationshipCodeSQItem [
	"Register DICOM Patient Gantry Relationship Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.246722+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Patient Gantry Relationship Code Sequence Item';
				initializeDataElementsDefinition: self patientGantryRelationshipCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0412)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpatientOrientationCodeSQItem [
	"Register DICOM Patient Orientation Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.250552+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Patient Orientation Code Sequence Item';
				initializeDataElementsDefinition: self patientOrientationCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0410)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpatientOrientationModifierCodeSQItem [
	"Register DICOM Patient Orientation Modifier Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.254311+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Patient Orientation Modifier Code Sequence Item';
				initializeDataElementsDefinition: self patientOrientationModifierCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0412)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerperformedActionItemSQItem [
	"Register DICOM Performed Action Item Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.258336+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Performed Action Item Sequence Item';
				initializeDataElementsDefinition: self performedActionItemSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r0260)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerperformedProcedureCodeSQItem [
	"Register DICOM Performed Procedure Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.262118+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Performed Procedure Code Sequence Item';
				initializeDataElementsDefinition: self performedProcedureCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA372)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpertinentOtherEvidenceSQItem [
	"Register DICOM Pertinent Other Evidence Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.265869+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Pertinent Other Evidence Sequence Item';
				initializeDataElementsDefinition: self pertinentOtherEvidenceSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA385)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerphaseInformationSQItem [
	"Register DICOM Phase Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.269618+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Phase Information Sequence Item';
				initializeDataElementsDefinition: self phaseInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0032)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpredecessorDocumentsSQItem [
	"Register DICOM Predecessor Documents Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.273657+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Predecessor Documents Sequence Item';
				initializeDataElementsDefinition: self predecessorDocumentsSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA360)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpresentationLUTSQItem [
	"Register DICOM Presentation LUT Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.277444+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Presentation LUT Sequence Item';
				initializeDataElementsDefinition: self presentationLUTSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r2050 16r0010)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerprimaryAnatomicStructureModifierSQItem [
	"Register DICOM Primary Anatomic Structure Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.281239+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Primary Anatomic Structure Modifier Sequence Item';
				initializeDataElementsDefinition: self primaryAnatomicStructureModifierSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2230)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerprimaryAnatomicStructureSQItem [
	"Register DICOM Primary Anatomic Structure Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.285418+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Primary Anatomic Structure Sequence Item';
				initializeDataElementsDefinition: self primaryAnatomicStructureSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2228)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerprocedureCodeSQItem [
	"Register DICOM Procedure Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.2893+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Procedure Code Sequence Item';
				initializeDataElementsDefinition: self procedureCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1032)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerpurposeOfReferenceCodeSQItem [
	"Register DICOM Purpose of Reference Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.293058+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Purpose of Reference Code Sequence Item';
				initializeDataElementsDefinition: self purposeOfReferenceCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA170)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerradionuclideCodeSQItem [
	"Register DICOM Radionuclide Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.297146+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Radionuclide Code Sequence Item';
				initializeDataElementsDefinition: self radionuclideCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0300)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerradiopharmaceuticalCodeSQItem [
	"Register DICOM Radiopharmaceutical Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.300932+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Radiopharmaceutical Code Sequence Item';
				initializeDataElementsDefinition: self radiopharmaceuticalCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0304)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerradiopharmaceuticalInformationSQItem [
	"Register DICOM Radiopharmaceutical Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.304688+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Radiopharmaceutical Information Sequence Item';
				initializeDataElementsDefinition: self radiopharmaceuticalInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0016)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedCurveSQItem [
	"Register DICOM Referenced Curve Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.308853+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Curve Sequence Item';
				initializeDataElementsDefinition: self referencedCurveSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1145)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedImageSQItem [
	"Register DICOM Referenced Image Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.312631+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Image Sequence Item';
				initializeDataElementsDefinition: self referencedImageSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1140)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedInstanceSQItem [
	"Register DICOM Referenced Instance Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.31637+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Instance Sequence Item';
				initializeDataElementsDefinition: self referencedInstanceSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r114A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedOverlaySQItem [
	"Register DICOM Referenced Overlay Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.320487+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Overlay Sequence Item';
				initializeDataElementsDefinition: self referencedOverlaySQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1130)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedPatientSQItem [
	"Register DICOM Referenced Patient Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.32428+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Patient Sequence Item';
				initializeDataElementsDefinition: self referencedPatientSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1120)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedRequestSQItem [
	"Register DICOM Referenced Request Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.328066+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Request Sequence Item';
				initializeDataElementsDefinition: self referencedRequestSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA370)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedSOPSQItem [
	"Register DICOM Referenced SOP Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.332214+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced SOP Sequence Item';
				initializeDataElementsDefinition: self referencedSOPSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1199)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedSeriesSQItem [
	"Register DICOM Referenced Series Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.33599+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Series Sequence Item';
				initializeDataElementsDefinition: self referencedSeriesSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1115)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedStudyComponentSQItem [
	"Register DICOM Referenced Study Component Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.339764+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Study Component Sequence Item';
				initializeDataElementsDefinition: self referencedStudyComponentSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1111)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedStudySQItem [
	"Register DICOM Referenced Study Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.343885+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Study Sequence Item';
				initializeDataElementsDefinition: self referencedStudySQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r1110)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerreferencedWaveformSQItem [
	"Register DICOM Referenced Waveform Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.347597+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Referenced Waveform Sequence Item';
				initializeDataElementsDefinition: self referencedWaveformSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r113A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerrequestAttributesSQItem [
	"Register DICOM Request Attributes Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.351672+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Request Attributes Sequence Item';
				initializeDataElementsDefinition: self requestAttributesSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r0275)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerrequestedProcedureCodeSQItem [
	"Register DICOM Requested Procedure Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.357673+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Requested Procedure Code Sequence Item';
				initializeDataElementsDefinition: self requestedProcedureCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0032 16r1064)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerrotationInformationSQItem [
	"Register DICOM Rotation Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.361656+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Rotation Information Sequence Item';
				initializeDataElementsDefinition: self rotationInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0052)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerscheduledActionItemCodeSQItem [
	"Register DICOM Scheduled Action Item Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.365483+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Scheduled Action Item Code Sequence Item';
				initializeDataElementsDefinition: self scheduledActionItemCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r0008)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registersoftcopyVOILUTSQItem [
	"Register DICOM Softcopy VOI LUT Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.369614+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Softcopy VOI LUT Sequence Item';
				initializeDataElementsDefinition: self softcopyVOILUTSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0028 16r3110)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registersourceImageSQItem [
	"Register DICOM Source Image Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.373368+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Source Image Sequence Item';
				initializeDataElementsDefinition: self sourceImageSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2112)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registersourceWaveformSQItem [
	"Register DICOM Source Waveform Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.377105+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Source Waveform Item';
				initializeDataElementsDefinition: self sourceWaveformSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r003A 16r020A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerspecimenSQItem [
	"Register DICOM Specimen Sequence Item 

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.381248+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Specimen Sequence Item ';
				initializeDataElementsDefinition: self specimenSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r0550)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerspecimenTypeCodeSQItem [
	"Register DICOM Specimen Type Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.385037+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Specimen Type Code Sequence Item';
				initializeDataElementsDefinition: self specimenTypeCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r059A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerstageCodeSQItem [
	"Register DICOM Stage Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.388811+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Stage Code Sequence Item';
				initializeDataElementsDefinition: self stageCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16r000A)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registertextObjectSQItem [
	"Register DICOM Text Object Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.392979+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Text Object Sequence Item';
				initializeDataElementsDefinition: self textObjectSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0070 16r0008)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registertimeSlotInformationSQItem [
	"Register DICOM Time Slot Information Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.396711+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Time Slot Information Sequence Item';
				initializeDataElementsDefinition: self timeSlotInformationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0072)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registertransducerOrientationModifierSQItem [
	"Register DICOM Transducer Orientation Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.40047+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Transducer Orientation Modifier Sequence Item';
				initializeDataElementsDefinition: self transducerOrientationModifierSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2246)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registertransducerOrientationSQItem [
	"Register DICOM Transducer Orientation Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.404594+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Transducer Orientation Sequence Item';
				initializeDataElementsDefinition: self transducerOrientationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2244)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registertransducerPositionModifierSQItem [
	"Register DICOM Transducer Position Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.408326+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Transducer Position Modifier Sequence Item';
				initializeDataElementsDefinition: self transducerPositionModifierSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2242)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registertransducerPositionSQItem [
	"Register DICOM Transducer Position Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.41209+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Transducer Position Sequence Item';
				initializeDataElementsDefinition: self transducerPositionSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0008 16r2240)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerultrasoundRegionsSQItem [
	"Register DICOM Ultrasound Regions Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.415827+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Ultrasound Regions Sequence Item';
				initializeDataElementsDefinition: self ultrasoundRegionsSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0018 16r6011)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerverifyingObserverIdentificationCodeSQItem [
	"Register DICOM Verifying Observer Identification Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.423749+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Verifying Observer Identification Code Sequence Item';
				initializeDataElementsDefinition: self verifyingObserverIdentificationCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA088)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerverifyingObserverSQItem [
	"Register DICOM Verifying Observer Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.427573+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Verifying Observer Sequence Item';
				initializeDataElementsDefinition: self verifyingObserverSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rA073)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerviewCodeSQItem [
	"Register DICOM View Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.431778+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM View Code Sequence Item';
				initializeDataElementsDefinition: self viewCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0220)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerviewModifierCodeSQItem [
	"Register DICOM View Modifier Code Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.435569+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM View Modifier Code Sequence Item';
				initializeDataElementsDefinition: self viewModifierCodeSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0054 16r0222)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registervoiLUTSQItem [
	"Register DICOM VOI LUT Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.419985+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM VOI LUT Sequence Item';
				initializeDataElementsDefinition: self voiLUTSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0028 16r3010)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerwaveformAnnotationSQItem [
	"Register DICOM Waveform Annotation Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.439213+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Waveform Annotation Sequence Item';
				initializeDataElementsDefinition: self waveformAnnotationSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r0040 16rB020)).

]

{ #category : #'class initialization - private' }
SequenceItem class >> registerwaveformSQItem [
	"Register DICOM Waveform Sequence Item

	 Coder: SequenceItem>computerReflection_AddSequenceItemRegistrationMethods

	 2021-06-03T19:58:27.443354+02:00 - Computer Reflection"

	DicomRegistry
		 registerSequenceItemDataElementDefinition:
			(self new 
				description: 'DICOM Waveform Sequence Item';
				initializeDataElementsDefinition: self waveformSQItemTextualDataElementsDefinition;
				yourself)
		sequenceDataElementTag: (DataElementTag fromArray: #(16r5400 16r0100)).

]

{ #category : #'sequence item definitions' }
SequenceItem class >> requestAttributesSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Request Attributes Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.892068+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Request Attributes Sequence Item
0040	0007	ScheduledProcedureStepDescription                               	LO	1	3
0040	0008	ScheduledActionItemCodeSequence                                 	SQ	1	3
0040	0009	ScheduledProcedureStepID                                        	SH	1	1C
0040	1001	RequestProcedureID                                              	SH	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> requestedProcedureCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Requested Procedure Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.894989+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Requested Procedure Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> rotationInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Rotation Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.898095+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Rotation Information Sequence Item
0018	1110	DistanceSourceToDetector                                        	DS	1	2C
0018	1130	TableHeight                                                     	DS	1	3
0018	1131	TableReverse                                                    	DS	1	3
0018	1140	RotationDirection                                               	CS	1	1C
0018	1142	RadialPosition                                                  	DS	1-n	3
0018	1143	ScanArc                                                         	DS	1	1C
0018	1144	AngularStep                                                     	DS	1	1C
0018	1242	ActualFrameDuration                                             	IS	1	1C
0054	0053	NumberOfFramesInRotation                                        	US	1	1C
0054	0200	StartAngle                                                      	DS	1	2'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> scheduledActionItemCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Scheduled Action Item Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.901121+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Scheduled Action Item Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #accessing }
SequenceItem class >> sequenceDataElementTag [
	^ sequenceDataElementTag
]

{ #category : #accessing }
SequenceItem class >> sequenceDataElementTag: aDicomDataElementTag [
	sequenceDataElementTag := aDicomDataElementTag
]

{ #category : #accessing }
SequenceItem class >> sequenceName [
	^ sequenceName
]

{ #category : #'sequence item definitions' }
SequenceItem class >> softcopyVOILUTSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Softcopy VOI LUT Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.904216+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Softcopy VOI LUT Sequence Item
0008	1140	ReferencedImageSequence                                         	SQ	1	1C
0028	1050	WindowCenter                                                    	DS	1-n	1C
0028	1051	WindowWidth                                                     	DS	1-n	1C
0028	1055	WindowCenterAndWidthExplanation                                 	LO	1-n	3
0028	3010	VoiLUTSequence                                                  	SQ	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> sourceImageSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Source Image Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.907194+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Source Image Sequence Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C
0008	1160	ReferencedFrameNumber                                           	IS	1-n	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> sourceWaveformSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Source Waveform Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.910123+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Source Waveform Item
0008	1150	ReferencedSOPClassUID                                           	UI	1	1C
0008	1155	ReferencedSOPInstanceUID                                        	UI	1	1C
0040	A0B0	ReferencedWaveformChannels                                      	US	2-2n	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> specimenSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Specimen Sequence Item 

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.913049+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Specimen Sequence Item 
0040	0551	SpecimenIdentifier                                              	LO	1	2C
0040	059A	SpecimenTypeCodeSequence                                        	SQ	1	2C
0040	06FA	SlideIdentifier                                                 	LO	1	2C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> specimenTypeCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Specimen Type Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.916254+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Specimen Type Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> stageCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Stage Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.9192+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Stage Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> textObjectSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Text Object Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.922125+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Text Object Sequence Item
0070	0003	BoundingBoxAnnotationUnits                                      	CS	1	1C
0070	0004	AnchorPointAnnotationUnits                                      	CS	1	1C
0070	0006	UnformattedTextValue                                            	ST	1	1
0070	0010	BoundingBoxTopLeftHandCorner                                    	FL	2	1C
0070	0011	BoundingBoxBottomRightHandCorner                                	FL	1	1C
0070	0012	BoundingBoxTextHorizontalJustification                          	CS	1	1C
0070	0014	AnchorPoint                                                     	FL	2	1C
0070	0015	AnchorPointVisibility                                           	CS	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> timeSlotInformationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Time Slot Information Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.925169+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Time Slot Information Sequence Item
0054	0073	TimeSlotTime                                                    	DS	1	3'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> transducerOrientationModifierSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Transducer Orientation Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.928171+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Transducer Orientation Modifier Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> transducerOrientationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Transducer Orientation Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.931117+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Transducer Orientation Sequence Item
0008	2246	TransducerOrientationModifierSequence                           	SQ	1	3'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> transducerPositionModifierSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Transducer Position Modifier Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.93415+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Transducer Position Modifier Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> transducerPositionSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Transducer Position Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.937102+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Transducer Position Sequence Item
0008	2242	TransducerPositionModifierSequence                              	SQ	1	3'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> ultrasoundRegionsSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Ultrasound Regions Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.940224+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Ultrasound Regions Sequence Item
0018	6012	RegionSpatialFormat                                             	US	1	1
0018	6014	RegionDataType                                                  	US	1	1
0018	6016	RegionFlags                                                     	UL	1	1
0018	6018	RegionLocationMinX0                                             	UL	1	1
0018	601A	RegionLocationMinY0                                             	UL	1	1
0018	601C	RegionLocationMaxX1                                             	UL	1	1
0018	601E	RegionLocationMaxY1                                             	UL	1	1
0018	6020	ReferencePixelX0                                                	SL	1	3
0018	6022	ReferencePixelY0                                                	SL	1	3
0018	6024	PhysicalUnitsXDirection                                         	US	1	1
0018	6026	PhysicalUnitsYDirection                                         	US	1	1
0018	6028	ReferencePixelPhysicalValueX                                    	FD	1	3
0018	602A	ReferencePixelPhysicalValueY                                    	FD	1	3
0018	602C	PhysicalDeltaX                                                  	FD	1	1
0018	602E	PhysicalDeltaY                                                  	FD	1	1
0018	6030	TransducerFrequency                                             	UL	1	3
0018	6032	PulseRepetitionFrequency                                        	UL	1	3
0018	6034	DopplerCorrectionAngle                                          	FD	1	3
0018	6036	SteeringAngle                                                   	FD	1	3
0018	6038	DopplerSampleVolumeXPosition                                    	UL	1	3
0018	603A	DopplerSampleVolumeYPosition                                    	UL	1	3
0018	603C	TmLinePositionX0                                                	UL	1	3
0018	603E	TmLinePositionY0                                                	UL	1	3
0018	6040	TmLinePositionX1                                                	UL	1	3
0018	6042	TmLinePositionY1                                                	UL	1	3
0018	6044	PixelComponentOrganization                                      	US	1	1C
0018	6046	PixelComponentMask                                              	UL	1	1C
0018	6048	PixelComponentRangeStart                                        	UL	1	1C
0018	604A	PixelComponentRangeStop                                         	UL	1	1C
0018	604C	PixelComponentPhysicalUnits                                     	US	1	1C
0018	604E	PixelComponentDataType                                          	US	1	1C
0018	6050	NumberOfTableBreakPoints                                        	UL	1	1C
0018	6052	TableOfXBreakPoints                                             	UL	1-n	1C
0018	6054	TableOfYBreakPoints                                             	FD	1-n	1C
0018	6056	NumberOfTableEntries                                            	UL	1	1C
0018	6058	TableOfPixelValues                                              	UL	1-n	1C
0018	605A	TableOfParameterValues                                          	FL	1-n	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> verifyingObserverIdentificationCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Verifying Observer Identification Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.949692+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Verifying Observer Identification Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> verifyingObserverSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Verifying Observer Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.952931+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Verifying Observer Sequence Item
0040	A027	VerifyingOrganization                                           	LO	1	1
0040	A030	VerificationDateTime                                            	DT	1	1
0040	A075	VerifyingObserverName                                           	PN	1	1
0040	A088	VerifyingObserverIdentificationCodeSequence                     	SQ	1	2'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> viewCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM View Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.955927+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM View Code Sequence Item
0054	0222	ViewModifierCodeSequence                                        	SQ	1	2C'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> viewModifierCodeSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM View Modifier Code Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.958896+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM View Modifier Code Sequence Item'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> voiLUTSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM VOI LUT Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.9466+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM VOI LUT Sequence Item
0028	3002	LutDescriptor                                                   	SS	3	1C
0028	3003	LutExplanation                                                  	LO	1	3
0028	3006	LutData                                                         	OW	1-n	1C'.
			"DICOM Code Sequence Macro Item"
			aStream
				cr; nextPutAll: MacroItem codeSequenceMacroItemTextualDataElementsDefinition. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> waveformAnnotationSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Waveform Annotation Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.961881+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Waveform Annotation Sequence Item
0040	08EA	MeasurementUnitsCodeSequence                                    	SQ	1	3
0040	A043	ConceptNameCodeSequence                                         	SQ	1	1C
0040	A0B0	ReferencedWaveformChannels                                      	US	2-2n	1C
0040	A130	TemporalRangeType                                               	CS	1	1C
0040	A132	ReferencedSamplePositions                                       	UL	1-n	1C
0040	A138	ReferencedTimeOffsets                                           	DS	1-n	1C
0040	A13A	ReferencedDateTime                                              	DT	1-n	1C
0040	A168	ConceptCodeSequence                                             	SQ	1	1C
0040	A180	AnnotationGroupNumber                                           	US	1	3
0040	A30A	NumericValue                                                    	DS	1-n	3
0070	0006	UnformattedTextValue                                            	ST	1	1C'. ]

]

{ #category : #'sequence item definitions' }
SequenceItem class >> waveformSQItemTextualDataElementsDefinition [
	"Textual data element definition for DICOM Waveform Sequence Item

	 Coder: SequenceItem>computerReflection_SQItemTextualDataElementsDefinitionMethod:

	 2021-05-24T13:23:41.965285+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM Waveform Sequence Item
0018	1068	MultiplexGroupTimeOffset                                        	DS	1	1C
0018	1069	TriggerTimeOffset                                               	DS	1	1C
0018	106E	TriggerSamplePosition                                           	UL	1	3
003A	0004	WaveformOriginality                                             	CS	1	1
003A	0005	NumberofWaveformChannels                                        	US	1	1
003A	0010	NumberofWaveformSamples                                         	UL	1	1
003A	001A	SamplingFrequency                                               	DS	1	1
003A	0020	MultiplexGroupLabel                                             	SH	1	3
003A	0200	ChannelDefinitionSequence                                       	SQ	1	1
5400	1004	WaveformBitsAllocated                                           	US	1	1
5400	1006	WaveformSampleInterpretation                                    	CS	1	1
5400	100A	WaveformPaddingValue                                            	OW	1	1C
5400	1010	WaveformData                                                    	OW	1	1'. ]

]

{ #category : #printing }
SequenceItem >> asText [
	self halt.
	^ self printString asText
]

{ #category : #accessing }
SequenceItem >> description [
	^ description
]

{ #category : #accessing }
SequenceItem >> description: byteString [
	description := byteString
]

{ #category : #accessing }
SequenceItem >> length [
	^ length
]

{ #category : #printing }
SequenceItem >> printOn: aStream [
	aStream
		nextPutAll:
			(self description
				ifNotNil: [ :arg | arg ]
				ifNil: [ 'Sequence item for unknow SQ data element' ])
]
