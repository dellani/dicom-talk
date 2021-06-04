Class {
	#name : #DicomRegistry,
	#superclass : #Object,
	#classInstVars : [
		'DataDictionary',
		'dataElementClasses',
		'dicomIODDataElementDefinitions',
		'DIMSE_PM_QueryRetrieval_SCP',
		'DIMSE_PM_QueryRetrieval_SCU',
		'DIMSE_PM_Storage_SCP',
		'DIMSE_PM_Storage_SCU',
		'DIMSE_PM_Verification_SCP',
		'DIMSE_PM_Verification_SCU',
		'ImplementationClassUID',
		'ImplementationVersionName',
		'PrivateCreatorsDataDictionary',
		'SOPClasses',
		'SCPInterfaces',
		'SCUInterfaces',
		'TransferSyntaxes',
		'sequenceItemDataElementDefinitions'
	],
	#category : #'talkDICOM-Core'
}

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_QueryRetrieval_SCP [
	^ DIMSE_PM_QueryRetrieval_SCP
		ifNotNil: [ :arg | arg ]
		ifNil: [ DIMSE_PM_QueryRetrieval_SCP := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_QueryRetrieval_SCU [
	^ DIMSE_PM_QueryRetrieval_SCU
		ifNotNil: [ :arg | arg ]
		ifNil: [ DIMSE_PM_QueryRetrieval_SCU := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Storage_SCP [
	^ DIMSE_PM_Storage_SCP
		ifNotNil: [ :arg | arg ]
		ifNil: [ DIMSE_PM_Storage_SCP := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Storage_SCU [
	^ DIMSE_PM_Storage_SCU
		ifNotNil: [ :arg | arg ]
		ifNil: [ DIMSE_PM_Storage_SCU := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Verification_SCP [
	^ DIMSE_PM_Verification_SCP
		ifNotNil: [ :arg | arg ]
		ifNil: [ DIMSE_PM_Verification_SCP := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Verification_SCU [
	^ DIMSE_PM_Verification_SCU
		ifNotNil: [ :arg | arg ]
		ifNil: [ DIMSE_PM_Verification_SCU := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> DataDictionary [
	^ DataDictionary
		ifNotNil: [ :arg | arg ]
		ifNil: [ DataDictionary := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> ImplementationClassUID [
	^ '1.2.840.66666.1.1.1.1.1.1.1'
]

{ #category : #'class variables' }
DicomRegistry class >> ImplementationVersionName [
	^ 'talkDICOM'
]

{ #category : #'class variables' }
DicomRegistry class >> PrivateCreatorsDataDictionary [
	^ PrivateCreatorsDataDictionary
		ifNotNil: [ :arg | arg ]
		ifNil: [ PrivateCreatorsDataDictionary := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> SCPInterfaces [
	^ SCPInterfaces
		ifNotNil: [ :arg | arg ]
		ifNil: [ SCPInterfaces := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> SCUInterfaces [
	^ SCUInterfaces
		ifNotNil: [ :arg | arg ]
		ifNil: [ SCUInterfaces := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> SOPClasses [
	^ SOPClasses
		ifNotNil: [ :arg | arg ]
		ifNil: [ SOPClasses := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> TransferSyntaxes [
	^ TransferSyntaxes
		ifNotNil: [ :arg | arg ]
		ifNil: [ TransferSyntaxes := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> dataElementClasses [
	^ dataElementClasses
		ifNotNil: [ :arg | arg ]
		ifNil: [ dataElementClasses := Dictionary new ]
]

{ #category : #'class variables' }
DicomRegistry class >> dicomIODDataElementDefinitions [
	^ dicomIODDataElementDefinitions
		ifNotNil: [ :arg | arg ]
		ifNil: [ dicomIODDataElementDefinitions := Dictionary new ]
]

{ #category : #utility }
DicomRegistry class >> importDCMTKDicomDictionary [
	"Import DCMTK dicom.dic registry of DICOM data elements

	collection inspect.

	dictionary := Dictionary new.
	collection do: [ :item | (dictionary at: item tag creatorsGroup ifAbsentPut: [ SortedCollection new ]) add: item ].
	collection size
	dictionary inspect.
	DicomRegistry PrivateCreatorsDataDictionary"

	| inputStream collection line |
	collection := OrderedCollection new.
	inputStream := '/home/dellani/git/dcmtk/dcmdata/data/dicom.dic' asFileReference readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#)
				ifFalse: [ collection addAll: (DataElementDefinition fromTextLine: line) ] ].
	inputStream
		close;
		release.
	"collection inspect."
	collection do: [ :dataElementDefinition | DicomRegistry DataDictionary at: dataElementDefinition tag put: dataElementDefinition ]

	"DicomRegistry DataDictionary at: (DataElementTag new fromToken: '(0020,1040)') first

	DicomObject correctedDataElementNames.

	(DataElementTag fromToken: '(0020,1040)') first printString.

	#ACR_NEMA_2C_VariableCoefficientsSDDN asString first asLowercase.

	DateAndTime now.
	#ACR_NEMA_2C_VariableCoefficientsSDDN asString includesAllOf: 'ACR'.

	#'unknowDataElement(10,20)'.

	DataElement fromTextLine: '(0000,0000)	UL	CommandGroupLength	1	DICOM_2009'.

	DataElementTag fromToken: '(0020,0040)'.

	'(00,00FE)' asSymbol .

	DataElementTag fromToken: '(6000-60ff,0060)'.

	'(0000,0000)	UL	CommandGroupLength	1	DICOM_2009' includes: $#"
]

{ #category : #utility }
DicomRegistry class >> importDCMTKPrivateDictionary [
	"Import DCMTK private.dic registry of DICOM data elements

	collection inspect.

	dictionary := Dictionary new.
	collection do: [ :item | (dictionary at: item tag creatorsGroup ifAbsentPut: [ SortedCollection new ]) add: item ].
	collection size
	dictionary inspect.
	DicomRegistry PrivateCreatorsDataDictionary"

	| collection inputStream line sortedCollection |
	collection := OrderedCollection new.
	inputStream := '/home/dellani/git/dcmtk/dcmdata/data/private.dic' asFileReference readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#) | line isEmpty
				ifFalse: [ collection addAll: (PrivateCreatorDataElementDefinition fromTextLine: line) ] ].
	inputStream
		close;
		release.
	collection
		do: [ :dataElementDefinition | 
			sortedCollection := self PrivateCreatorsDataDictionary
				at: dataElementDefinition tag creatorsGroup
				ifAbsentPut: [ SortedCollection new ].
			sortedCollection add: dataElementDefinition ]
]

{ #category : #utility }
DicomRegistry class >> importGDCMPrivateDefaultDicts [
	"Import DICOM GrassRoots gdcmPrivateDefaultDicts.cxx registry of DICOM data elements

	collection inspect.

	dictionary := Dictionary new.
	collection do: [ :item | (dictionary at: item tag creatorsGroup ifAbsentPut: [ SortedCollection new ]) add: item ].
	collection size
	dictionary inspect.
	DicomRegistry PrivateCreatorsDataDictionary"

	| collection inputStream line sortedCollection |
	collection := OrderedCollection new.
	inputStream := '/home/dellani/sandbox/Grassroots DICOM/gdcmPrivateDefaultDicts.cxx' asFileReference readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine trimBoth.
			(line beginsWith: '/*') | (line beginsWith: '//') | line isEmpty
				ifFalse: [ collection add: (PrivateCreatorDataElementDefinition fromGDCMTextLine: line) ] ].
	inputStream
		close;
		release.
	collection
		do: [ :dataElementDefinition | 
			""
			sortedCollection := self PrivateCreatorsDataDictionary
				at: dataElementDefinition tag creatorsGroup
				ifAbsentPut: [ SortedCollection new ].
			sortedCollection add: dataElementDefinition ]
]

{ #category : #registration }
DicomRegistry class >> registerDataElementClass: aDataElementSubclass [
	aDataElementSubclass valueRepresentationString
		ifNotNil: [ self dataElementClasses
				at: aDataElementSubclass valueRepresentationString
				put: aDataElementSubclass ]
]

{ #category : #registration }
DicomRegistry class >> registerDicomIODDataElementDefinition: dicomIODDataElementDefinition sopClassUID: sopClassUID [
	self dicomIODDataElementDefinitions at: sopClassUID put: dicomIODDataElementDefinition
]

{ #category : #registration }
DicomRegistry class >> registerIOD: aDicomIOD [
	aDicomIOD sopClassUID
		ifNotNil: [ self SOPClasses at: aDicomIOD sopClassUID put: aDicomIOD ]
]

{ #category : #registration }
DicomRegistry class >> registerSequenceItemDataElementDefinition: sequenceItemDataElementDefinition sequenceDataElementTag: dataElementTag [
	self sequenceItemDataElementDefinitions at: dataElementTag put: sequenceItemDataElementDefinition
]

{ #category : #registration }
DicomRegistry class >> resetDicomIODDataElementDefinitions [
	dicomIODDataElementDefinitions := Dictionary new
]

{ #category : #registration }
DicomRegistry class >> resetSequenceItemDataElementDefinitions [
	sequenceItemDataElementDefinitions := Dictionary new
]

{ #category : #'class variables' }
DicomRegistry class >> sequenceItemDataElementDefinitions [
	^ sequenceItemDataElementDefinitions
		ifNotNil: [ :arg | arg ]
		ifNil: [ sequenceItemDataElementDefinitions := Dictionary new ]
]
