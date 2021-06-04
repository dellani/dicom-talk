Class {
	#name : #DicomIOM,
	#superclass : #DicomObject,
	#classInstVars : [
		'moduleName',
		'description'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #'textual attributes definition' }
DicomIOM class >> acquisitionContextIOMTextualDataElementsDefinition [
	"Textual data element definition for Waveform Acquisition Context Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.8223+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Waveform Acquisition Context Image Information Object Module
0040	0555	AcquisitionContextSequence                                      	SQ	1	2
0040	0556	AcquisitionContextDescription                                   	LT	1	3' ]

]

{ #category : #'computer reflection 2021' }
DicomIOM class >> addIOMTextualDescriptionMethods [
	"Add a method that returns the textual attributes definition my subclasses
	 to myself. The method is coded by computerReflection_IOMTextualDataElementDefinitionMethod:
	 and added to protocol 'textual attributes definition'.
	
	 (Computer reflection is way cool!)

	 April 18 2021 - PRD."

	self subclassesDo: [ : aDicomIOMSubclass | | method |
		method := self computerReflection_IOMTextualDataElementsDefinitionMethod: aDicomIOMSubclass.
		MethodAddition new
			compile: method contents
			classified: 'textual attributes definition'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile. ]
]

{ #category : #'textual attributes definition' }
DicomIOM class >> audioIOMTextualDataElementsDefinition [
	"Textual data element definition for Audio Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.832918+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Audio Information Object Module
0008	1140	ReferencedImageSequence                                         	SQ	1	3
5000	2000	RETIRED_AudioType                                               	US	1	1
5000	2002	RETIRED_AudioSampleFormat                                       	US	1	1
5000	2004	RETIRED_NumberOfChannels                                        	US	1	1
5000	2006	RETIRED_NumberOfSamples                                         	UL	1	1
5000	2008	RETIRED_SampleRate                                              	UL	1	1
5000	200A	RETIRED_TotalTime                                               	UL	1	1
5000	200C	RETIRED_AudioSampleData                                         	OW	1	1
5000	200E	RETIRED_AudioComments                                           	LT	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> bitmapDisplayShutterIOMTextualDataElementsDefinition [
	"Textual data element definition for Bitmap Display Shutter Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.837447+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Bitmap Display Shutter Information Object Module
0018	1600	ShutterShape                                                    	CS	1-3	1
0018	1622	ShutterPresentationValue                                        	US	1	1
0018	1623	ShutterOverlayGroup                                             	US	1	1' ]

]

{ #category : #'computer reflection 2021' }
DicomIOM class >> computerReflection_IOMTextualDataElementsDefinitionMethod: aDicomIOMSubclass [
	"Code textual data element definition method for aDicomIOMSubclass according
	 to the contents of class variable 'DataElements'. DataElements is a Dictionary
	 holding instances of DataElement indexed by its tags that were used to define
	 DicomObject instances in the past.
	
	 April 18 2021 - This is an adaptation of 
	                 DicomObject>computerReflection_textualDataElementDefinitionMethod - PRD."

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: aDicomIOMSubclass moduleName; 
				nextPutAll: 'TextualDataElementsDefinition'; cr;
				tab; nextPut: $"; 	nextPutAll: 'Textual data element definition for '; 
				                  nextPutAll: aDicomIOMSubclass description; cr; cr;
				tab; nextPutAll: ' Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:'; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;

				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;

				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll:'; cr; nextPutAll: '''# ';
					                 nextPutAll: aDicomIOMSubclass description; cr;
				nextPutAll: aDicomIOMSubclass listDataElementDefinition; nextPut: $'; nextPutAll: ' ]'; cr. ].
]

{ #category : #'textual attributes definition' }
DicomIOM class >> constrastBolusIOMTextualDataElementsDefinition [
	"Textual data element definition for Contrast/Bolus Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.854203+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Contrast/Bolus Information Object Module
0018	0010	ContrastBolusAgent                                              	LO	1	2
0018	0012	ContrastBolusAgentSequence                                      	SQ	1	3
0018	0014	ContrastBolusAdministrationRouteSequence                        	SQ	1	3
0018	1040	ContrastBolusRoute                                              	LO	1	3
0018	1041	ContrastBolusVolume                                             	DS	1	3
0018	1042	ContrastBolusStartTime                                          	TM	1	3
0018	1043	ContrastBolusStopTime                                           	TM	1	3
0018	1044	ContrastBolusTotalDose                                          	DS	1	3
0018	1046	ContrastFlowRate                                                	DS	1-n	3
0018	1047	ContrastFlowDuration                                            	DS	1	3
0018	1048	ContrastBolusIngredient                                         	CS	1	3
0018	1049	ContrastBolusIngredientConcentration                            	DS	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> crImageIOMTextualDataElementsDefinition [
	"Textual data element definition for Computed Radiography Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.841718+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Computed Radiography Image Information Object Module
0018	0060	KVP                                                             	DS	1	2
0018	1004	PlateID                                                         	LO	1	3
0018	1110	DistanceSourceToDetector                                        	DS	1	3
0018	1111	DistanceSourceToPatient                                         	DS	1	3
0018	1150	ExposureTime                                                    	IS	1	3
0018	1151	XRayTubeCurrent                                                 	IS	1	3
0018	1152	Exposure                                                        	IS	1	3
0018	1153	ExposureInuAs                                                   	IS	1	3
0018	1164	ImagerPixelSpacing                                              	DS	2	3
0018	1170	GeneratorPower                                                  	IS	1	3
0018	1400	AcquisitionDeviceProcessingDescription                          	LO	1	3
0018	1401	AcquisitionDeviceProcessingCode                                 	LO	1	3
0018	1402	CassetteOrientation                                             	CS	1	3
0018	1403	CassetteSize                                                    	CS	1	3
0018	1404	ExposuresOnPlate                                                	US	1	3
0018	1405	RelativeXRayExposure                                            	IS	1	3
0018	6000	Sensitivity                                                     	DS	1	3
0028	0004	PhotometricInterpretation                                       	CS	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> crSeriesIOMTextualDataElementsDefinition [
	"Textual data element definition for CR Series Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.845881+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# CR Series Information Object Module
0018	0015	BodyPartExamined                                                	CS	1	2
0018	1160	FilterType                                                      	SH	1	3
0018	1180	CollimatorGridName                                              	SH	1	3
0018	1190	FocalSpots                                                      	DS	1-n	3
0018	1260	PlateType                                                       	SH	1	3
0018	1261	PhosphorType                                                    	LO	1	3
0018	5101	ViewPosition                                                    	CS	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> ctImageIOMTextualDataElementsDefinition [
	"Textual data element definition for Computed Tomography Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.849763+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Computed Tomography Image Information Object Module
0008	0008	ImageType                                                       	CS	1-n	1
0018	0022	ScanOptions                                                     	CS	1-n	3
0018	0060	KVP                                                             	DS	1	2
0018	0090	DataCollectionDiameter                                          	DS	1	3
0018	1100	ReconstructionDiameter                                          	DS	1	3
0018	1110	DistanceSourceToDetector                                        	DS	1	3
0018	1111	DistanceSourceToPatient                                         	DS	1	3
0018	1120	GantryDetectorTilt                                              	DS	1	3
0018	1130	TableHeight                                                     	DS	1	3
0018	1140	RotationDirection                                               	CS	1	3
0018	1150	ExposureTime                                                    	IS	1	3
0018	1151	XRayTubeCurrent                                                 	IS	1	3
0018	1152	Exposure                                                        	IS	1	3
0018	1153	ExposureInuAs                                                   	IS	1	3
0018	1160	FilterType                                                      	SH	1	3
0018	1170	GeneratorPower                                                  	IS	1	3
0018	1190	FocalSpots                                                      	DS	1-n	3
0018	1210	ConvolutionKernel                                               	SH	1-n	3
0020	0012	AcquisitionNumber                                               	IS	1	2
0028	0002	SamplesPerPixel                                                 	US	1	1
0028	0004	PhotometricInterpretation                                       	CS	1	1
0028	0100	BitsAllocated                                                   	US	1	1
0028	0101	BitsStored                                                      	US	1	1
0028	0102	HighBit                                                         	US	1	1
0028	1052	RescaleIntercept                                                	DS	1	1
0028	1053	RescaleSlope                                                    	DS	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> curveIOMTextualDataElementsDefinition [
	"Textual data element definition for Curve Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.858177+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Curve Information Object Module
0008	1130	RETIRED_ReferencedOverlaySequence                               	SQ	1	3
5000	0005	RETIRED_CurveDimensions                                         	US	1	1
5000	0010	RETIRED_NumberOfPoints                                          	US	1	1
5000	0020	RETIRED_TypeOfData                                              	CS	1	1
5000	0022	RETIRED_CurveDescription                                        	LO	1	3
5000	0030	RETIRED_AxisUnits                                               	SH	1-n	3
5000	0040	RETIRED_AxisLabels                                              	SH	1-n	3
5000	0103	RETIRED_DataValueRepresentation                                 	US	1	1
5000	0104	RETIRED_MinimumCoordinateValue                                  	US	1-n	3
5000	0105	RETIRED_MaximumCoordinateValue                                  	US	1-n	3
5000	0106	RETIRED_CurveRange                                              	SH	1-n	3
5000	0110	RETIRED_CurveDataDescriptor                                     	US	1-n	1C
5000	0112	RETIRED_CoordinateStartValue                                    	US	1	1C
5000	0114	RETIRED_CoordinateStepValue                                     	US	1	1C
5000	2500	RETIRED_CurveLabel                                              	LO	1	3
5000	3000	RETIRED_CurveData                                               	OW	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> curveIdentificationIOMTextualDataElementsDefinition [
	"Textual data element definition for Curve Identification Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.862176+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Curve Identification Information Object Module
0008	0025	RETIRED_CurveDate                                               	DA	1	3
0008	0035	RETIRED_CurveTime                                               	TM	1	3
0008	1130	RETIRED_ReferencedOverlaySequence                               	SQ	1	3
0008	1140	ReferencedImageSequence                                         	SQ	1	3
0008	1145	RETIRED_ReferencedCurveSequence                                 	SQ	1	3
0020	0024	RETIRED_CurveNumber                                             	IS	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> directoryInformationIOMTextualDataElementsDefinition [
	"Textual data element definition for Directory Information Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.866277+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Directory Information Information Object Module
0004	1200	OffsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity         	UL	1	1
0004	1202	OffsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity          	UL	1	1
0004	1212	FileSetConsistencyFlag                                          	US	1	1
0004	1220	DirectoryRecordSequence                                         	SQ	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> displayShutterIOMTextualDataElementsDefinition [
	"Textual data element definition for Display Shutter IOM

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.870098+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Display Shutter IOM
0018	1600	ShutterShape                                                    	CS	1	1
0018	1602	ShutterLeftVerticalEdge                                         	IS	1	1C
0018	1604	ShutterRightVerticalEdge                                        	IS	1	1C
0018	1606	ShutterUpperHorizontalEdge                                      	IS	1	1C
0018	1608	ShutterLowerHorizontalEdge                                      	IS	1	1C
0018	1610	CenterOfCircularShutter                                         	IS	2	1C
0018	1612	RadiusOfCircularShutter                                         	IS	1	1C
0018	1620	VerticesOfThePolygonalShutter                                   	IS	2-2n	1C
0018	1622	ShutterPresentationValue                                        	US	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> displayedAreaIOMTextualDataElementsDefinition [
	"Textual data element definition for Displayed Area IOM

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.873964+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Displayed Area IOM
0070	005A	DisplayedAreaSelectionSequence                                  	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> fileSetIOMTextualDataElementsDefinition [
	"Textual data element definition for File-set Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.87795+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# File-set Information Object Module
0004	1130	FileSetID                                                       	CS	1	2
0004	1141	FileSetDescriptorFileID                                         	CS	1-8	3
0004	1142	SpecificCharacterSetOfFileSetDescriptorFile                     	CS	1	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> frameOfReferenceIOMTextualDataElementsDefinition [
	"Textual data element definition for Frame of Reference Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.881712+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Frame of Reference Information Object Module
0020	0052	FrameOfReferenceUID                                             	UI	1	1
0020	1040	PositionReferenceIndicator                                      	LO	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> generalEquipmentIOMTextualDataElementsDefinition [
	"Textual data element definition for General Equipment Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.88546+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# General Equipment Information Object Module
0008	0070	Manufacturer                                                    	LO	1	2
0008	0080	InstitutionName                                                 	LO	1	3
0008	0081	InstitutionAddress                                              	ST	1	3
0008	1010	StationName                                                     	SH	1	3
0008	1040	InstitutionalDepartmentName                                     	LO	1	3
0008	1090	ManufacturerModelName                                           	LO	1	3
0018	1000	DeviceSerialNumber                                              	LO	1	3
0018	1020	SoftwareVersions                                                	LO	1-n	3
0018	1050	SpatialResolution                                               	DS	1	3
0018	1200	DateOfLastCalibration                                           	DA	1	3
0018	1201	TimeOfLastCalibration                                           	TM	1	3
0028	0120	PixelPaddingValue                                               	SS	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> generalImageIOMTextualDataElementsDefinition [
	"Textual data element definition for General Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.889385+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# General Image Information Object Module
0008	0008	ImageType                                                       	CS	1-n	3
0008	0022	AcquisitionDate                                                 	DA	1	3
0008	0023	ContentDate                                                     	DA	1	2C
0008	002A	AcquisitionDateTime                                             	DT	1	3
0008	0032	AcquisitionTime                                                 	TM	1	3
0008	0033	ContentTime                                                     	TM	1	2C
0008	1140	ReferencedImageSequence                                         	SQ	1	3
0008	2111	DerivationDescription                                           	ST	1	3
0008	2112	SourceImageSequence                                             	SQ	1	3
0020	0012	AcquisitionNumber                                               	IS	1	3
0020	0013	InstanceNumber                                                  	IS	1	2
0020	0020	PatientOrientation                                              	CS	2	2C
0020	1002	ImagesInAcquisition                                             	IS	1	3
0020	4000	ImageComments                                                   	LT	1	3
0028	0300	QualityControlImage                                             	CS	1	3
0028	0301	BurnedInAnnotation                                              	CS	1	3
0028	2110	LossyImageCompression                                           	CS	1	3
0028	2112	LossyImageCompressionRatio                                      	DS	1-n	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> generalSeriesIOMTextualDataElementsDefinition [
	"Textual data element definition for General Series Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.893681+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# General Series Information Object Module
0008	0021	SeriesDate                                                      	DA	1	3
0008	0031	SeriesTime                                                      	TM	1	3
0008	0060	Modality                                                        	CS	1	1
0008	103E	SeriesDescription                                               	LO	1	3
0008	1050	PerformingPhysicianName                                         	PN	1-n	3
0008	1070	OperatorsName                                                   	PN	1-n	3
0008	1111	ReferencedPerformedProcedureStepSequence                        	SQ	1	3
0018	0015	BodyPartExamined                                                	CS	1	3
0018	1030	ProtocolName                                                    	LO	1	3
0018	5100	PatientPosition                                                 	CS	1	2C
0020	000E	SeriesInstanceUID                                               	UI	1	1
0020	0011	SeriesNumber                                                    	IS	1	2
0020	0060	Laterality                                                      	CS	1	2C
0020	1209	NumberOfSeriesRelatedInstances                                  	IS	1	3
0028	0108	SmallestPixelValueInSeries                                      	SS	1	3
0028	0109	LargestPixelValueInSeries                                       	SS	1	3
0040	0244	PerformedProcedureStepStartDate                                 	DA	1	3
0040	0245	PerformedProcedureStepStartTime                                 	TM	1	3
0040	0253	PerformedProcedureStepID                                        	SH	1	3
0040	0254	PerformedProcedureStepDescription                               	LO	1	3
0040	0260	PerformedProtocolCodeSequence                                   	SQ	1	3
0040	0275	RequestAttributesSequence                                       	SQ	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> generalStudyIOMTextualDataElementsDefinition [
	"Textual data element definition for General Study Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.897806+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# General Study Information Object Module
0008	0020	StudyDate                                                       	DA	1	2
0008	0030	StudyTime                                                       	TM	1	2
0008	0050	AccessionNumber                                                 	SH	1	2
0008	0090	ReferringPhysicianName                                          	PN	1	2
0008	1030	StudyDescription                                                	LO	1	3
0008	1032	ProcedureCodeSequence                                           	SQ	1	3
0008	1048	PhysiciansOfRecord                                              	PN	1-n	3
0008	1060	NameOfPhysiciansReadingStudy                                    	PN	1-n	3
0008	1110	ReferencedStudySequence                                         	SQ	1	3
0020	000D	StudyInstanceUID                                                	UI	1	1
0020	0010	StudyID                                                         	SH	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> graphicAnnotationIOMTextualDataElementsDefinition [
	"Textual data element definition for Graphic Annotation IOM

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.901717+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Graphic Annotation IOM
0070	0001	GraphicAnnotationSequence                                       	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> graphicLayerIOMTextualDataElementsDefinition [
	"Textual data element definition for Graphic Layer IOM

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.905696+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Graphic Layer IOM
0070	0060	GraphicLayerSequence                                            	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> imagePixelIOMTextualDataElementsDefinition [
	"Textual data element definition for Image Pixel Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.909421+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Image Pixel Information Object Module
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
7FE0	0010	RETIRED_VariablePixelData                                       	OW	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> imagePlaneIOMTextualDataElementsDefinition [
	"Textual data element definition for Image Plane Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.913452+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Image Plane Information Object Module
0018	0050	SliceThickness                                                  	DS	1	2
0020	0032	ImagePositionPatient                                            	DS	3	1
0020	0037	ImageOrientationPatient                                         	DS	6	1
0020	1041	SliceLocation                                                   	DS	1	3
0028	0030	PixelSpacing                                                    	DS	2	1' ]

]

{ #category : #'class initialization' }
DicomIOM class >> initialize [
	^ self subclassResponsibility
]

{ #category : #'textual attributes definition' }
DicomIOM class >> maskIOMTextualDataElementsDefinition [
	"Textual data element definition for Mask Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.922064+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Mask Information Object Module
0028	1090	RecommendedViewingMode                                          	CS	1	1
0028	6100	MaskSubtractionSequence                                         	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> modalityLUTIOMTextualDataElementsDefinition [
	"Textual data element definition for Modality LUT Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.925803+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Modality LUT Information Object Module
0028	1052	RescaleIntercept                                                	DS	1	1C
0028	1053	RescaleSlope                                                    	DS	1	1C
0028	1054	RescaleType                                                     	LO	1	1C
0028	3000	ModalityLUTSequence                                             	SQ	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> mrImageIOMTextualDataElementsDefinition [
	"Textual data element definition for Magnetic Resonance Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.917511+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Magnetic Resonance Image Information Object Module
0008	0008	ImageType                                                       	CS	1-n	1
0018	0020	ScanningSequence                                                	CS	1-n	1
0018	0021	SequenceVariant                                                 	CS	1-n	1
0018	0022	ScanOptions                                                     	CS	1-n	2
0018	0023	MRAcquisitionType                                               	CS	1	2
0018	0024	SequenceName                                                    	SH	1	3
0018	0025	AngioFlag                                                       	CS	1	3
0018	0080	RepetitionTime                                                  	DS	1	2C
0018	0081	EchoTime                                                        	DS	1	2
0018	0082	InversionTime                                                   	DS	1	2C
0018	0083	NumberOfAverages                                                	DS	1	3
0018	0084	ImagingFrequency                                                	DS	1	3
0018	0085	ImagedNucleus                                                   	SH	1	3
0018	0086	EchoNumbers                                                     	IS	1-n	3
0018	0087	MagneticFieldStrength                                           	DS	1	3
0018	0088	SpacingBetweenSlices                                            	DS	1	3
0018	0089	NumberOfPhaseEncodingSteps                                      	IS	1	3
0018	0091	EchoTrainLength                                                 	IS	1	2
0018	0093	PercentSampling                                                 	DS	1	3
0018	0094	PercentPhaseFieldOfView                                         	DS	1	3
0018	0095	PixelBandwidth                                                  	DS	1	3
0018	1060	TriggerTime                                                     	DS	1	2C
0018	1062	NominalInterval                                                 	IS	1	3
0018	1080	BeatRejectionFlag                                               	CS	1	3
0018	1081	LowRRValue                                                      	IS	1	3
0018	1082	HighRRValue                                                     	IS	1	3
0018	1083	IntervalsAcquired                                               	IS	1	3
0018	1084	IntervalsRejected                                               	IS	1	3
0018	1085	PVCRejection                                                    	LO	1	3
0018	1086	SkipBeats                                                       	IS	1	3
0018	1088	HeartRate                                                       	IS	1	3
0018	1090	CardiacNumberOfImages                                           	IS	1	3
0018	1094	TriggerWindow                                                   	IS	1	3
0018	1100	ReconstructionDiameter                                          	DS	1	3
0018	1250	ReceiveCoilName                                                 	SH	1	3
0018	1251	TransmitCoilName                                                	SH	1	3
0018	1310	AcquisitionMatrix                                               	US	4	3
0018	1312	InPlanePhaseEncodingDirection                                   	CS	1	3
0018	1314	FlipAngle                                                       	DS	1	3
0018	1315	VariableFlipAngleFlag                                           	CS	1	3
0018	1316	SAR                                                             	DS	1	3
0018	1318	DBdt                                                            	DS	1	3
0020	0100	TemporalPositionIdentifier                                      	IS	1	3
0020	0105	NumberOfTemporalPositions                                       	IS	1	3
0020	0110	TemporalResolution                                              	DS	1	3
0028	0002	SamplesPerPixel                                                 	US	1	1
0028	0004	PhotometricInterpretation                                       	CS	1	1
0028	0100	BitsAllocated                                                   	US	1	1
0028	1052	RescaleIntercept                                                	DS	1	1C
0028	1053	RescaleSlope                                                    	DS	1	1C
0028	1054	RescaleType                                                     	LO	1	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> multiFrameIOMTextualDataElementsDefinition [
	"Textual data element definition for Multi Frame Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.929872+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Multi Frame Information Object Module
0028	0008	NumberOfFrames                                                  	IS	1	1
0028	0009	FrameIncrementPointer                                           	AT	1-n	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmDetectorIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Detector Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.933603+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Detector Information Object Module
0054	0022	DetectorInformationSequence                                     	SQ	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmImageIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.937315+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Image Information Object Module
0008	0008	ImageType                                                       	CS	1-n	1
0008	1130	RETIRED_ReferencedOverlaySequence                               	SQ	1	3
0008	1145	RETIRED_ReferencedCurveSequence                                 	SQ	1	3
0008	2218	AnatomicRegionSequence                                          	SQ	1	3
0018	0070	CountsAccumulated                                               	IS	1	2
0018	0071	AcquisitionTerminationCondition                                 	CS	1	3
0018	1061	TriggerSourceOrType                                             	LO	1	3
0018	1130	TableHeight                                                     	DS	1	3
0018	1131	TableTraverse                                                   	DS	1	3
0018	1242	ActualFrameDuration                                             	IS	1	1C
0018	1243	CountRate                                                       	IS	1	3
0018	1300	ScanVelocity                                                    	DS	1	2C
0018	1301	WholeBodyTechnique                                              	CS	1-n	3
0018	1302	ScanLength                                                      	IS	1	2C
0018	5020	ProcessingFunction                                              	LO	1	3
0028	0051	CorrectedImage                                                  	CS	1-n	3
0028	2110	LossyImageCompression                                           	CS	1	1C
0054	0400	ImageID                                                         	SH	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmImagePixelIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Image Pixel Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.941597+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Image Pixel Information Object Module
0028	0002	SamplesPerPixel                                                 	US	1	1
0028	0004	PhotometricInterpretation                                       	CS	1	1
0028	0030	PixelSpacing                                                    	DS	2	2
0028	0100	BitsAllocated                                                   	US	1	1
0028	0101	BitsStored                                                      	US	1	1
0028	0102	HighBit                                                         	US	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmIsotopeIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Isotope Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.945447+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Isotope Information Object Module
0018	0026	InterventionDrugInformationSequence                             	SQ	1	3
0054	0012	EnergyWindowInformationSequence                                 	SQ	1	2
0054	0016	RadiopharmaceuticalInformationSequence                          	SQ	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmMultiFrameIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Multi-frame Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.949278+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Multi-frame Information Object Module
0028	0009	FrameIncrementPointer                                           	AT	1-n	1
0054	0010	EnergyWindowVector                                              	US	1-n	1C
0054	0011	NumberOfEnergyWindows                                           	US	1	1
0054	0020	DetectorVector                                                  	US	1-n	1C
0054	0021	NumberOfDetectors                                               	US	1	1
0054	0030	PhaseVector                                                     	US	1-n	1C
0054	0031	NumberOfPhases                                                  	US	1	1C
0054	0050	RotationVector                                                  	US	1-n	1C
0054	0051	NumberOfRotations                                               	US	1	1C
0054	0060	RRIntervalVector                                                	US	1-n	1C
0054	0061	NumberOfRRIntervals                                             	US	1	1C
0054	0070	TimeSlotVector                                                  	US	1-n	1C
0054	0071	NumberOfTimeSlots                                               	US	1	1C
0054	0080	SliceVector                                                     	US	1-n	1C
0054	0081	NumberOfSlices                                                  	US	1	1C
0054	0090	AngularViewVector                                               	US	1-n	1C
0054	0100	TimeSliceVector                                                 	US	1-n	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmMultiGatedAcquisitionIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Multi Gated Acquisition Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.9533+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Multi Gated Acquisition Information Object Module
0018	1080	BeatRejectionFlag                                               	CS	1	3
0018	1085	PVCRejection                                                    	LO	1	3
0018	1086	SkipBeats                                                       	IS	1	3
0018	1088	HeartRate                                                       	IS	1	3
0054	0062	GatedInformationSequence                                        	SQ	1	2C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmPETPatientOrientationIOMTextualDataElementsDefinition [
	"Textual data element definition for NM/PET Patient Orientation Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.957448+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM/PET Patient Orientation Information Object Module
0054	0410	PatientOrientationCodeSequence                                  	SQ	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmPhaseIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Phase Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.961188+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Phase Information Object Module
0054	0032	PhaseInformationSequence                                        	SQ	1	2C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmReconstructionIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Reconstruction Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.964906+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Reconstruction Information Object Module
0018	0050	SliceThickness                                                  	DS	1	2
0018	0088	SpacingBetweenSlices                                            	DS	1	2
0018	1100	ReconstructionDiameter                                          	DS	1	3
0018	1210	ConvolutionKernel                                               	SH	1-n	3
0020	1041	SliceLocation                                                   	DS	1	3
0054	0500	SliceProgressionDirection                                       	CS	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> nmTomoAcquisitionIOMTextualDataElementsDefinition [
	"Textual data element definition for NM Tomo Acquisition Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.969006+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# NM Tomo Acquisition Information Object Module
0054	0052	RotationInformationSequence                                     	SQ	1	2
0054	0202	TypeOfDetectorMotion                                            	CS	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> overlayCurveActivationIOMTextualDataElementsDefinition [
	"Textual data element definition for Overlay Curve Activation Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.972724+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Overlay Curve Activation Information Object Module
5000	1001	RETIRED_CurveActivationLayer                                    	CS	1	2C
6000	1001	OverlayActivationLayer                                          	CS	1	2C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> overlayPlaneIOMTextualDataElementsDefinition [
	"Textual data element definition for Overlay Plane Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.976461+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Overlay Plane Information Object Module
6000	0010	OverlayRows                                                     	US	1	1
6000	0011	OverlayColumns                                                  	US	1	1
6000	0022	OverlayDescription                                              	LO	1	3
6000	0040	OverlayType                                                     	CS	1	1
6000	0045	OverlaySubtype                                                  	LO	1	3
6000	0050	OverlayOrigin                                                   	SS	2	1
6000	0100	OverlayBitsAllocated                                            	US	1	1
6000	0102	OverlayBitPosition                                              	US	1	1
6000	1301	ROIArea                                                         	IS	1	3
6000	1302	ROIMean                                                         	DS	1	3
6000	1303	ROIStandardDeviation                                            	DS	1	3
6000	1500	OverlayLabel                                                    	LO	1	3
6000	3000	OverlayData                                                     	OW	1	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> paletteColorLookupTableIOMTextualDataElementsDefinition [
	"Textual data element definition for Pallete Color Lookup Table Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.980707+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Pallete Color Lookup Table Information Object Module
0028	1101	RedPaletteColorLookupTableDescriptor                            	US	3	1C
0028	1102	GreenPaletteColorLookupTableDescriptor                          	US	3	1C
0028	1103	BluePaletteColorLookupTableDescriptor                           	US	3	1C
0028	1199	PaletteColorLookupTableUID                                      	UI	1	1C
0028	1201	RedPaletteColorLookupTableData                                  	OW	1	1C
0028	1202	GreenPaletteColorLookupTableData                                	OW	1	1C
0028	1203	BluePaletteColorLookupTableData                                 	OW	1	1C
0028	1221	SegmentedRedPaletteColorLookupTableData                         	OW	1	1C
0028	1222	SegmentedGreenPaletteColorLookupTableData                       	OW	1	1C
0028	1223	SegmentedBluePaletteColorLookupTableData                        	OW	1	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> patientIOMTextualDataElementsDefinition [
	"Textual data element definition for Patient Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.984583+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Patient Information Object Module
0008	1120	ReferencedPatientSequence                                       	SQ	1	3
0010	0010	PatientName                                                     	PN	1	2
0010	0020	PatientID                                                       	LO	1	2
0010	0030	PatientBirthDate                                                	DA	1	2
0010	0032	PatientBirthTime                                                	TM	1	3
0010	0040	PatientSex                                                      	CS	1	2
0010	1000	RETIRED_OtherPatientIDs                                         	LO	1-n	3
0010	1001	OtherPatientNames                                               	PN	1-n	3
0010	2160	EthnicGroup                                                     	SH	1	3
0010	4000	PatientComments                                                 	LT	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> patientStudyIOMTextualDataElementsDefinition [
	"Textual data element definition for Patient Study Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.988456+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Patient Study Information Object Module
0008	1080	AdmittingDiagnosesDescription                                   	LO	1-n	3
0010	1010	PatientAge                                                      	AS	1	3
0010	1020	PatientSize                                                     	DS	1	3
0010	1030	PatientWeight                                                   	DS	1	3
0010	2180	Occupation                                                      	SH	1	3
0010	21B0	AdditionalPatientHistory                                        	LT	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> presentationSeriesIOMTextualDataElementsDefinition [
	"Textual data element definition for Presentation Series Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.99226+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Presentation Series Information Object Module
0008	0060	Modality                                                        	CS	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> presentationStateIOMTextualDataElementsDefinition [
	"Textual data element definition for Presentation State Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:40.996418+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Presentation State Information Object Module
0008	1115	ReferencedSeriesSequence                                        	SQ	1	1
0018	1622	ShutterPresentationValue                                        	US	1	1C
0020	0013	InstanceNumber                                                  	IS	1	1
0028	1090	RecommendedViewingMode                                          	CS	1	1C
0028	6100	MaskSubtractionSequence                                         	SQ	1	1C
0070	0080	ContentLabel                                                    	CS	1	1
0070	0081	ContentDescription                                              	LO	1	1
0070	0082	PresentationCreationDate                                        	DA	1	1
0070	0083	PresentationCreationTime                                        	TM	1	1
0070	0084	ContentCreatorName                                              	PN	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> scEquipmentIOMTextualDataElementsDefinition [
	"Textual data element definition for SC Equipment Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.000421+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# SC Equipment Information Object Module
0008	0060	Modality                                                        	CS	1	3
0008	0064	ConversionType                                                  	CS	1	1
0018	1010	SecondaryCaptureDeviceID                                        	LO	1	3
0018	1016	SecondaryCaptureDeviceManufacturer                              	LO	1	3
0018	1018	SecondaryCaptureDeviceManufacturerModelName                     	LO	1	3
0018	1019	SecondaryCaptureDeviceSoftwareVersions                          	LO	1-n	3
0018	1022	VideoImageFormatAcquired                                        	SH	1	3
0018	1023	DigitalImageFormatAcquired                                      	LO	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> scImageIOMTextualDataElementsDefinition [
	"Textual data element definition for SC Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.004255+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# SC Image Information Object Module
0018	1012	DateOfSecondaryCapture                                          	DA	1	3
0018	1014	TimeOfSecondaryCapture                                          	TM	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> softcopyPresentationLUTIOMTextualDataElementsDefinition [
	"Textual data element definition for Presentation LUT Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.02426+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Presentation LUT Information Object Module
2050	0010	PresentationLUTSequence                                         	SQ	1	1C
2050	0020	PresentationLUTShape                                            	CS	1	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> softcopyVOI_LUT_IOMTextualDataElementsDefinition [
	"Textual data element definition for Softcopy VOI LUT Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.027973+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Softcopy VOI LUT Information Object Module
0028	3110	SoftcopyVOILUTSequence                                          	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> sopCommonIOMTextualDataElementsDefinition [
	"Textual data element definition for SOP Common Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.008326+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# SOP Common Information Object Module
0008	0005	SpecificCharacterSet                                            	CS	1-n	1C
0008	0012	InstanceCreationDate                                            	DA	1	3
0008	0013	InstanceCreationTime                                            	TM	1	3
0008	0014	InstanceCreatorUID                                              	UI	1	3
0008	0016	SOPClassUID                                                     	UI	1	1
0008	0018	SOPInstanceUID                                                  	UI	1	1
0008	0056	InstanceAvailability                                            	CS	1	3
0008	0201	TimezoneOffsetFromUTC                                           	SH	1	3
0020	0013	InstanceNumber                                                  	IS	1	3
0100	0410	SOPInstanceStatus                                               	CS	1	3
0100	0420	SOPAuthorizationDateTime                                        	DT	1	3
0100	0424	SOPAuthorizationComment                                         	LT	1	3
0100	0426	AuthorizationEquipmentCertificationNumber                       	LO	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> spacialTransformationIOMTextualDataElementsDefinition [
	"Textual data element definition for Spacial Transformation Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.031676+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Spacial Transformation Information Object Module
0070	0041	ImageHorizontalFlip                                             	CS	1	1
0070	0042	ImageRotation                                                   	US	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> specimenIdentificationIOMTextualDataElementsDefinition [
	"Textual data element definition for Specimen Identification Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.035665+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Specimen Identification Information Object Module
0040	050A	RETIRED_SpecimenAccessionNumber                                 	LO	1	1
0040	0550	RETIRED_SpecimenSequence                                        	SQ	1	2' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> srDocumentContentIOMTextualDataElementsDefinition [
	"Textual data element definition for SR Document General Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.012265+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# SR Document General Information Object Module
0008	1199	ReferencedSOPSequence                                           	SQ	1	1
0040	A032	ObservationDateTime                                             	DT	1	1C
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
0040	A13A	ReferencedDateTime                                              	DT	1-n	1C
0040	A160	TextValue                                                       	UT	1	1C
0040	A168	ConceptCodeSequence                                             	SQ	1	1
0040	A300	MeasuredValueSequence                                           	SQ	1	2
0040	A504	ContentTemplateSequence                                         	SQ	1	1C
0040	A730	ContentSequence                                                 	SQ	1	1C
0070	0022	GraphicData                                                     	FL	2-n	1
0070	0023	GraphicType                                                     	CS	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> srDocumentGeneralIOMTextualDataElementsDefinition [
	"Textual data element definition for SR Document General Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.016313+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# SR Document General Information Object Module
0008	0023	ContentDate                                                     	DA	1	1
0008	0033	ContentTime                                                     	TM	1	1
0020	0013	InstanceNumber                                                  	IS	1	1
0040	A073	VerifyingObserverSequence                                       	SQ	1	1C
0040	A360	PredecessorDocumentsSequence                                    	SQ	1	1C
0040	A370	ReferencedRequestSequence                                       	SQ	1	1C
0040	A372	PerformedProcedureCodeSequence                                  	SQ	1	2
0040	A375	CurrentRequestedProcedureEvidenceSequence                       	SQ	1	1C
0040	A385	PertinentOtherEvidenceSequence                                  	SQ	1	1C
0040	A491	CompletionFlag                                                  	CS	1	1
0040	A492	CompletionFlagDescription                                       	LO	1	3
0040	A493	VerificationFlag                                                	CS	1	1
0040	A525	IdenticalDocumentsSequence                                      	SQ	1	1C' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> srDocumentSeriesIOMTextualDataElementsDefinition [
	"Textual data element definition for SR Document Series Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.020509+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# SR Document Series Information Object Module
0008	0060	Modality                                                        	CS	1	1
0008	1111	ReferencedPerformedProcedureStepSequence                        	SQ	1	2
0020	000E	SeriesInstanceUID                                               	UI	1	1
0020	0011	SeriesNumber                                                    	IS	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> synchronizationIOMTextualDataElementsDefinition [
	"Textual data element definition for Synchronization Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.039383+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Synchronization Image Information Object Module
0018	1061	TriggerSourceOrType                                             	LO	1	3
0018	106A	SynchronizationTrigger                                          	CS	1	1
0018	106C	SynchronizationChannel                                          	US	2	1C
0018	1800	AcquisitionTimeSynchronized                                     	CS	1	1
0018	1801	TimeSource                                                      	SH	1	3
0018	1802	TimeDistributionProtocol                                        	CS	1	3
0020	0200	SynchronizationFrameOfReferenceUID                              	UI	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> usFrameOfReferenceIOMTextualDataElementsDefinition [
	"Textual data element definition for US Frame of Reference Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.043193+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# US Frame of Reference Information Object Module
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
0018	602E	PhysicalDeltaY                                                  	FD	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> usImageIOMTextualDataElementsDefinition [
	"Textual data element definition for US Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.047368+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# US Image Information Object Module
0008	0008	ImageType                                                       	CS	1-n	2
0008	002A	AcquisitionDateTime                                             	DT	1	1C
0008	1130	RETIRED_ReferencedOverlaySequence                               	SQ	1	3
0008	113A	ReferencedWaveformSequence                                      	SQ	1	3
0008	1145	RETIRED_ReferencedCurveSequence                                 	SQ	1	3
0008	2120	StageName                                                       	SH	1	3
0008	2122	StageNumber                                                     	IS	1	3
0008	2124	NumberOfStages                                                  	IS	1	2C
0008	2127	ViewName                                                        	SH	1	3
0008	2128	ViewNumber                                                      	IS	1	3
0008	2129	NumberOfEventTimers                                             	IS	1	3
0008	212A	NumberOfViewsInStage                                            	IS	1	2C
0008	2130	EventElapsedTimes                                               	DS	1-n	3
0008	2132	EventTimerNames                                                 	LO	1-n	3
0008	2218	AnatomicRegionSequence                                          	SQ	1	3
0008	2228	PrimaryAnatomicStructureSequence                                	SQ	1	3
0008	2240	RETIRED_TransducerPositionSequence                              	SQ	1	3
0008	2244	RETIRED_TransducerOrientationSequence                           	SQ	1	3
0018	1060	TriggerTime                                                     	DS	1	3
0018	1062	NominalInterval                                                 	IS	1	3
0018	1080	BeatRejectionFlag                                               	CS	1	3
0018	1081	LowRRValue                                                      	IS	1	3
0018	1082	HighRRValue                                                     	IS	1	3
0018	1088	HeartRate                                                       	IS	1	3
0018	3100	IVUSAcquisition                                                 	CS	1	1C
0018	3101	IVUSPullbackRate                                                	DS	1	1C
0018	3102	IVUSGatedRate                                                   	DS	1	1C
0018	3103	IVUSPullbackStartFrameNumber                                    	IS	1	1C
0018	3104	IVUSPullbackStopFrameNumber                                     	IS	1	1C
0018	3105	LesionNumber                                                    	IS	1-n	3
0018	5000	OutputPower                                                     	SH	1-n	3
0018	5010	TransducerData                                                  	LO	3	3
0018	5012	FocusDepth                                                      	DS	1	3
0018	5020	ProcessingFunction                                              	LO	1	3
0018	5022	MechanicalIndex                                                 	DS	1	3
0018	5024	BoneThermalIndex                                                	DS	1	3
0018	5026	CranialThermalIndex                                             	DS	1	3
0018	5027	SoftTissueThermalIndex                                          	DS	1	3
0018	5028	SoftTissueFocusThermalIndex                                     	DS	1	3
0018	5029	SoftTissueSurfaceThermalIndex                                   	DS	1	3
0018	5050	DepthOfScanField                                                	IS	1	3
0018	5210	RETIRED_ImageTransformationMatrix                               	DS	6	3
0018	5212	RETIRED_ImageTranslationVector                                  	DS	3	3
0018	6031	TransducerType                                                  	CS	1	3
0028	0002	SamplesPerPixel                                                 	US	1	1
0028	0004	PhotometricInterpretation                                       	CS	1	1
0028	0006	PlanarConfiguration                                             	US	1	1C
0028	0009	FrameIncrementPointer                                           	US	1	1C
0028	0014	UltrasoundColorDataPresent                                      	US	1	3
0028	0100	BitsAllocated                                                   	US	1	1
0028	0101	BitsStored                                                      	US	1	1
0028	0102	HighBit                                                         	US	1	1
0028	0103	PixelRepresentation                                             	US	1	1
0028	2110	LossyImageCompression                                           	CS	1	1C
0040	000A	StageCodeSequence                                               	SQ	1	3
6000	0045	OverlaySubtype                                                  	LO	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> usRegionCalibrationIOMTextualDataElementsDefinition [
	"Textual data element definition for US Region Calibration Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.051993+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# US Region Calibration Information Object Module
0018	6011	SequenceOfUltrasoundRegions                                     	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> voiLUTIOMTextualDataElementsDefinition [
	"Textual data element definition for VOI LUT Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.055702+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# VOI LUT Information Object Module
0028	1050	WindowCenter                                                    	DS	1-n	3
0028	1051	WindowWidth                                                     	DS	1-n	1C
0028	1055	WindowCenterWidthExplanation                                    	LO	1-n	3
0028	3010	VOILUTSequence                                                  	SQ	1	3' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> waveformAnotationIOMTextualDataElementsDefinition [
	"Textual data element definition for Waveform Annotation Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.059726+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Waveform Annotation Image Information Object Module
0040	B020	WaveformAnnotationSequence                                      	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> waveformIOMTextualDataElementsDefinition [
	"Textual data element definition for Waveform Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.063454+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Waveform Information Object Module
5400	0100	WaveformSequence                                                	SQ	1	1' ]

]

{ #category : #'textual attributes definition' }
DicomIOM class >> waveformIdentificationIOMTextualDataElementsDefinition [
	"Textual data element definition for Waveform Identification Image Information Object Module

	 Coder: DicomIOM>computerReflection_IOMTextualDataElementDefinitionMethod:

	 2021-05-24T13:19:41.067155+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# Waveform Identification Image Information Object Module
0008	0023	ContentDate                                                     	DA	1	1
0008	002A	AcquisitionDateTime                                             	DT	1	1
0008	0033	ContentTime                                                     	TM	1	1
0008	114A	ReferencedInstanceSequence                                      	SQ	1	3
0020	0013	InstanceNumber                                                  	IS	1	1' ]

]

{ #category : #copying }
DicomIOM >> copyFrom: aDicomObject [
	"Copy all the data element from the given DICOM Object to self.

	PRD - April 2th, 2004"

	aDicomObject copyTo: self.
]

{ #category : #copying }
DicomIOM >> copyTo: aDicomObject [
	"Copy all the data element values to the given DICOM Object.
	Note that both objects should be from the same class

	PRD - March 18th, 2004, March 10th, 2016"

	| value |

	(aDicomObject isKindOf: self class) ifTrue: [
		self dataElementsDefinition do: [:dataElementDefinition | 
			value := self perform: dataElementDefinition name.
			aDicomObject perform: (dataElementDefinition name asString copyWith: $:) asSymbol with: value.
		].
	]
]
