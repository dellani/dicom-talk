Class {
	#name : #DicomRegistry,
	#superclass : #Object,
	#classInstVars : [
		'DIMSE_PM_Storage_SCP',
		'DIMSE_PM_Storage_SCU',
		'SOPClasses',
		'DIMSE_PM_Verification_SCP',
		'DIMSE_PM_Verification_SCU',
		'DIMSE_PM_QueryRetrieval_SCP',
		'DIMSE_PM_QueryRetrieval_SCU',
		'TransferSyntaxes',
		'SCPInterfaces',
		'SCUInterfaces',
		'DataElements',
		'DataDictionary',
		'PrivateCreatorsDataDictionary',
		'ImplementationClassUID',
		'ImplementationVersionName'
	],
	#category : #'talkDICOM-Core'
}

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_QueryRetrieval_SCP [
	^ DIMSE_PM_QueryRetrieval_SCP isNil
		ifTrue: [ DIMSE_PM_QueryRetrieval_SCP := Dictionary new ]
		ifFalse: [ DIMSE_PM_QueryRetrieval_SCP ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_QueryRetrieval_SCU [
	^ DIMSE_PM_QueryRetrieval_SCU isNil
		ifTrue: [ DIMSE_PM_QueryRetrieval_SCU := Dictionary new ]
		ifFalse: [ DIMSE_PM_QueryRetrieval_SCU ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Storage_SCP [
	^ DIMSE_PM_Storage_SCP isNil
		ifTrue: [ DIMSE_PM_Storage_SCP := Dictionary new ]
		ifFalse: [ DIMSE_PM_Storage_SCP ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Storage_SCU [
	^ DIMSE_PM_Storage_SCU isNil
		ifTrue: [ DIMSE_PM_Storage_SCU := Dictionary new ]
		ifFalse: [ DIMSE_PM_Storage_SCU ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Verification_SCP [
	^ DIMSE_PM_Verification_SCP isNil
		ifTrue: [ DIMSE_PM_Verification_SCP := Dictionary new ]
		ifFalse: [ DIMSE_PM_Verification_SCP ]
]

{ #category : #'class variables' }
DicomRegistry class >> DIMSE_PM_Verification_SCU [
	^ DIMSE_PM_Verification_SCU isNil
		ifTrue: [ DIMSE_PM_Verification_SCU := Dictionary new ]
		ifFalse: [ DIMSE_PM_Verification_SCU ]
]

{ #category : #'class variables' }
DicomRegistry class >> DataDictionary [
	^ DataDictionary isNil
		ifTrue: [ DataDictionary := Dictionary new ]
		ifFalse: [ DataDictionary ]
]

{ #category : #'class variables' }
DicomRegistry class >> DataElements [
	^ DataElements isNil
		ifTrue: [ DataElements := Dictionary new ]
		ifFalse: [ DataElements ]
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
	^ PrivateCreatorsDataDictionary isNil
		ifTrue: [ PrivateCreatorsDataDictionary := Dictionary new ]
		ifFalse: [ PrivateCreatorsDataDictionary ]
]

{ #category : #'class variables' }
DicomRegistry class >> SCPInterfaces [
	^ SCPInterfaces isNil
		ifTrue: [ SCPInterfaces := Dictionary new ]
		ifFalse: [ SCPInterfaces ]
]

{ #category : #'class variables' }
DicomRegistry class >> SCUInterfaces [
	^ SCUInterfaces isNil
		ifTrue: [ SCUInterfaces := Dictionary new ]
		ifFalse: [ SCUInterfaces ]
]

{ #category : #'class variables' }
DicomRegistry class >> SOPClasses [
	^ SOPClasses isNil
		ifTrue: [ SOPClasses := Dictionary new ]
		ifFalse: [ SOPClasses ]
]

{ #category : #'class variables' }
DicomRegistry class >> TransferSyntaxes [
	^ TransferSyntaxes isNil
		ifTrue: [ TransferSyntaxes := Dictionary new ]
		ifFalse: [ TransferSyntaxes ]
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
				ifFalse: [ collection addAll: (DataElement fromTextLine: line) ] ].
	inputStream
		close;
		release.
	"collection inspect."
	collection do: [ :dataElement | DicomRegistry DataDictionary at: dataElement tag put: dataElement ]

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
				ifFalse: [ collection addAll: (PrivateCreatorDataElement fromTextLine: line) ] ].
	inputStream
		close;
		release.
	collection
		do: [ :dataElement | 
			sortedCollection := self class PrivateCreatorsDataDictionary
				at: dataElement tag creatorsGroup
				ifAbsentPut: [ SortedCollection new ].
			sortedCollection add: dataElement ]
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
				ifFalse: [ collection add: (PrivateCreatorDataElement fromGDCMTextLine: line) ] ].
	inputStream
		close;
		release.
	collection
		do: [ :dataElement | 
			""
			sortedCollection := self PrivateCreatorsDataDictionary
				at: dataElement tag creatorsGroup
				ifAbsentPut: [ SortedCollection new ].
			sortedCollection add: dataElement ]
]
