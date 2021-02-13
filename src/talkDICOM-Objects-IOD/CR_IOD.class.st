Class {
	#name : #'CR_IOD',
	#superclass : #DicomIOD,
	#instVars : [
		'patientIOM',
		'generalStudyIOM',
		'patientStudyIOM',
		'generalSeriesIOM',
		'generalEquipmentIOM',
		'generalImageIOM',
		'imagePixelIOM',
		'sopCommonIOM',
		'crSeriesIOM',
		'constrastBolusIOM',
		'crImageIOM',
		'overlayPlaneIOM',
		'curveIOM',
		'modalityLUTIOM',
		'voiLUTIOM'
	],
	#category : #'talkDICOM-Objects-IOD'
}

{ #category : #accessing }
CR_IOD class >> DicomIODName [

	^'CR IOD'
]

{ #category : #accessing }
CR_IOD class >> InformationObjectModules [

	^InformationObjectModules
		ifNil: 
			[InformationObjectModules := OrderedCollection new.
			InformationObjectModules
				add: PatientIOM initialize;
				add: GeneralStudyIOM initialize;
				add: PatientStudyIOM initialize;
				add: GeneralSeriesIOM initialize;
				add: GeneralEquipmentIOM initialize;
				add: GeneralImageIOM initialize;
				add: ImagePixelIOM initialize;
				add: SOPCommonIOM initialize;
				add: CRSeriesIOM initialize;
				add: ConstrastBolusIOM initialize;
				add: CRImageIOM initialize;
				add: OverlayPlaneIOM initialize;
				add: CurveIOM initialize;
				add: ModalityLUTIOM initialize;
				add: VOILUTIOM initialize;
				yourself]
]

{ #category : #accessing }
CR_IOD class >> SOPClassUID [

	^'1.2.840.10008.5.1.4.1.1.1'
]

{ #category : #'class initialization' }
CR_IOD class >> initialize [

	super initialize.
]

{ #category : #comparing }
CR_IOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber < dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
CR_IOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber <= dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
CR_IOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber > dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
CR_IOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber >= dicomIOD instanceNumber asNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDateTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDateTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDateTime: aDTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDeviceProcessingCode [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM acquisitionDeviceProcessingCode
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDeviceProcessingCode: aLOValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM acquisitionDeviceProcessingCode: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDeviceProcessingDescription [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM acquisitionDeviceProcessingDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionDeviceProcessingDescription: aLOValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM acquisitionDeviceProcessingDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionNumber [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionNumber: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> acquisitionTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #converting }
CR_IOD >> asDICOMDIR_IE [

	| aDICOMDIR_IE newItem |

	aDICOMDIR_IE := DICOMDIR_IE new.
	self sopCommonIOM copyTo: aDICOMDIR_IE sopCommonIOM.
	aDICOMDIR_IE 
		referencedTransferSyntaxUIDInFile: 
			(self encoder notNil ifTrue: [self encoder UID] ifFalse: [nil]).
	aDICOMDIR_IE
		imageType: 
			(self imageType notNil ifTrue: [self imageType] ifFalse: ['']).
	self referencedImageSequence notNil
		ifTrue: 
			[aDICOMDIR_IE referencedImageSequence: OrderedCollection new.
			self referencedImageSequence do: 
					[:item |
					newItem := ReferencedImageSequenceItem new.
					item copyTo: newItem.
					aDICOMDIR_IE referencedImageSequence add: newItem	]].
	^aDICOMDIR_IE
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> axisLabels [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisLabels
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> axisLabels: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisLabels: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> axisUnits [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisUnits
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> axisUnits: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisUnits: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bitsAllocated [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bitsAllocated
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bitsAllocated: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bitsStored [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bitsStored
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bitsStored: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bitsStored: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bluePaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bluePaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bluePaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bluePaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bodyPartExamined [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM bodyPartExamined
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> bodyPartExamined: aCSValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM bodyPartExamined: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> burnedInAnnotation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM burnedInAnnotation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> burnedInAnnotation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM burnedInAnnotation: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> casseteOrientation [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM cassetteOrientation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> casseteOrientation: aCSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM cassetteOrientation: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> casseteSize [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM cassetteSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> casseteSize: aCSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM cassetteSize: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> cassetteOrientation [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM cassetteOrientation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> cassetteOrientation: aCSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM cassetteOrientation: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> cassetteSize [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM cassetteSize
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> cassetteSize: aCSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM cassetteSize: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> collimatorGridName [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM collimatorGridName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> collimatorGridName: aSHValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM collimatorGridName: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> columns [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM columns
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> columns: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM columns: aUSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> constrastBolusIOM [

	^constrastBolusIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> constrastBolusIOM: aConstrastBolusIOM [

	constrastBolusIOM := aConstrastBolusIOM.
	constrastBolusIOM encoder: self encoder.

	constrastBolusIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		constrastBolusIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
	].

	constrastBolusIOM dataElementsValues == self dataElementsValues ifFalse: [
		constrastBolusIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		constrastBolusIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contentDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contentDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contentTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contentTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> contrastBolusAdministrationRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> contrastBolusAdministrationRoute: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusAdministrationRouteSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusAdministrationRouteSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusAgent [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgent
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusAgent: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgent: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusAgentSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgentSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusAgentSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgentSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusIngredient [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredient
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusIngredient: aCSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredient: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusIngredientConcentration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredientConcentration
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusIngredientConcentration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredientConcentration: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusRoute
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusRoute: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusRoute: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusStartTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStartTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusStartTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusStopTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStopTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusStopTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStopTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusTotalDose [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusTotalDose
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusTotalDose: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusTotalDose: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusVolume [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusVolume
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastBolusVolume: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusVolume: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastFlowDuration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowDuration
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastFlowDuration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowDuration: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastFlowRate [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowRate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> contrastFlowRate: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowRate: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> coordinateStartValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStartValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> coordinateStartValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStartValue: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> coordinateStepValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStepValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> coordinateStepValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStepValue: aUSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> crImageIOM [

	^crImageIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> crImageIOM: aCRImageIOM [

	crImageIOM := aCRImageIOM.
	crImageIOM encoder: self encoder.

	crImageIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		crImageIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
	].

	crImageIOM dataElementsValues == self dataElementsValues ifFalse: [
		crImageIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		crImageIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
CR_IOD >> crSeriesIOM [

	^crSeriesIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> crSeriesIOM: aCRSeriesIOM [

	crSeriesIOM := aCRSeriesIOM.
	crSeriesIOM encoder: self encoder.

	crSeriesIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		crSeriesIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
	].

	crSeriesIOM dataElementsValues == self dataElementsValues ifFalse: [
		crSeriesIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		crSeriesIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveData: aOWValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveData: aOWValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveDataDescriptor [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDataDescriptor
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveDataDescriptor: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDataDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveDescription [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDescription
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveDescription: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDescription: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveDimensions [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDimensions
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveDimensions: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDimensions: aUSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> curveIOM [

	^curveIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> curveIOM: aCurveIOM [

	curveIOM := aCurveIOM.
	curveIOM encoder: self encoder.

	curveIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		curveIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		curveIOM dataElementsDictionary: self dataElementsDictionary.
	].

	curveIOM dataElementsValues == self dataElementsValues ifFalse: [
		curveIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		curveIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveLabel [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveLabel
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveLabel: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveLabel: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveRange [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveRange
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> curveRange: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveRange: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> dataValueRepresentation [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_DataValueRepresentation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> dataValueRepresentation: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_DataValueRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> derivationDescription [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM derivationDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> derivationDescription: aSTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM derivationDescription: aSTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> distanceSourceToDetector [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM distanceSourceToDetector
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> distanceSourceToDetector: aDSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM distanceSourceToDetector: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> distanceSourceToPatient [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM distanceSourceToPatient
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> distanceSourceToPatient: aDSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM distanceSourceToPatient: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposure [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM exposure
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposure: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM exposure: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> exposureInmAS [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM exposureInuAs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> exposureInmAS: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM exposureInuAs: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposureInuAs [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM exposureInuAs
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposureInuAs: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM exposureInuAs: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposureTime [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM exposureTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposureTime: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM exposureTime: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposuresOnPlate [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM exposuresOnPlate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> exposuresOnPlate: aUSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM exposuresOnPlate: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> filterType [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM filterType
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> filterType: aSHValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM filterType: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> focalSpot [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM focalSpots
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> focalSpot: aDSValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM focalSpots: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> focalSpots [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM focalSpots
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> focalSpots: aDSValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM focalSpots: aDSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

	generalEquipmentIOM := aGeneralEquipmentIOM.
	generalEquipmentIOM encoder: self encoder.

	generalEquipmentIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		generalEquipmentIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
	].

	generalEquipmentIOM dataElementsValues == self dataElementsValues ifFalse: [
		generalEquipmentIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		generalEquipmentIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
CR_IOD >> generalImageIOM [

	^generalImageIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> generalImageIOM: aGeneralImageIOM [

	generalImageIOM := aGeneralImageIOM.
	generalImageIOM encoder: self encoder.

	generalImageIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		generalImageIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
	].

	generalImageIOM dataElementsValues == self dataElementsValues ifFalse: [
		generalImageIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		generalImageIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
CR_IOD >> generalSeriesIOM [

	^generalSeriesIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> generalSeriesIOM: aGeneralSeriesIOM [

	generalSeriesIOM := aGeneralSeriesIOM.
	generalSeriesIOM encoder: self encoder.

	generalSeriesIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		generalSeriesIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
	].

	generalSeriesIOM dataElementsValues == self dataElementsValues ifFalse: [
		generalSeriesIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		generalSeriesIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
CR_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> generalStudyIOM: aGeneralStudyIOM [

	generalStudyIOM := aGeneralStudyIOM.
	generalStudyIOM encoder: self encoder.

	generalStudyIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		generalStudyIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
	].

	generalStudyIOM dataElementsValues == self dataElementsValues ifFalse: [
		generalStudyIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		generalStudyIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CR_IOD >> generatorPower [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM generatorPower
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> generatorPower: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM generatorPower: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> greenPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> greenPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> greenPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> greenPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> highBit [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM highBit
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> highBit: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM highBit: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imageComments [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imageComments
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imageComments: aLTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imageComments: aLTValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> imageDate [

	^generalImageIOM contentDate.
]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> imageNumber [

	^generalImageIOM  instanceNumber.
]

{ #category : #'accessing IOM' }
CR_IOD >> imagePixelIOM [

	^imagePixelIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> imagePixelIOM: aImagePixelIOM [

	imagePixelIOM := aImagePixelIOM.
	imagePixelIOM encoder: self encoder.

	imagePixelIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		imagePixelIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
	].

	imagePixelIOM dataElementsValues == self dataElementsValues ifFalse: [
		imagePixelIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		imagePixelIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> imageTime [

	^generalImageIOM contentTime.
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imageType [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imageType
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imageType: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imageType: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imagerPixelSpacing [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM imagerPixelSpacing
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imagerPixelSpacing: aDSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM imagerPixelSpacing: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imagesInAcquisition [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imagesInAcquisition
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> imagesInAcquisition: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imagesInAcquisition: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> kVP [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM kVP
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> kVP: aDSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM kVP: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> largestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM largestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> largestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM largestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> largestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> largestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM largestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> laterality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM laterality
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> laterality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM laterality: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> lossyImageCompression [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompression
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> lossyImageCompression: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompression: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> lossyImageCompressionRatio [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompressionRatio
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> lossyImageCompressionRatio: aDSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompressionRatio: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> maximumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MaximumCoordinateValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> maximumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MaximumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> minimumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MinimumCoordinateValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> minimumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MinimumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> modality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM modality
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> modality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM modality: aCSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> modalityLUTIOM [

	^modalityLUTIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> modalityLUTIOM: aModalityLUTIOM [

	modalityLUTIOM := aModalityLUTIOM.
	modalityLUTIOM encoder: self encoder.

	modalityLUTIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		modalityLUTIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
	].

	modalityLUTIOM dataElementsValues == self dataElementsValues ifFalse: [
		modalityLUTIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		modalityLUTIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CR_IOD >> modalityLUTSequence [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM modalityLUTSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> modalityLUTSequence: aSQValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM modalityLUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> numberOfPoints [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_NumberOfPoints
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> numberOfPoints: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_NumberOfPoints: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> numberOfSeriesRelatedInstances [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> numberOfSeriesRelatedInstances: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM numberOfSeriesRelatedInstances: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> operatorsName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM operatorsName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> operatorsName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM operatorsName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayBitPosition [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitPosition
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayBitPosition: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitPosition: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayBitsAllocated [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitsAllocated
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayBitsAllocated: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayColumns [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayColumns
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayColumns: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayColumns: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayData [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayData: aOWValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayDescription [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayDescription: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayLabel [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayLabel
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayLabel: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayOrigin [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayOrigin
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayOrigin: aSSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayOrigin: aSSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> overlayPlaneIOM [

	^overlayPlaneIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> overlayPlaneIOM: aOverlayPlaneIOM [

	overlayPlaneIOM := aOverlayPlaneIOM.
	overlayPlaneIOM encoder: self encoder.

	overlayPlaneIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		overlayPlaneIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
	].

	overlayPlaneIOM dataElementsValues == self dataElementsValues ifFalse: [
		overlayPlaneIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		overlayPlaneIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayRows [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayRows
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayRows: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayRows: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlaySubtype [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlaySubtype
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlaySubtype: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlaySubtype: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayType [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayType
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> overlayType: aCSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayType: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
CR_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> patientIOM: aPatientIOM [

	patientIOM := aPatientIOM.
	patientIOM encoder: self encoder.

	patientIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		patientIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		patientIOM dataElementsDictionary: self dataElementsDictionary.
	].

	patientIOM dataElementsValues == self dataElementsValues ifFalse: [
		patientIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		patientIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientOrientation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM patientOrientation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientOrientation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM patientOrientation: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientPosition [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM patientPosition
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientPosition: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM patientPosition: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> patientStudyIOM: aPatientStudyIOM [

	patientStudyIOM := aPatientStudyIOM.
	patientStudyIOM encoder: self encoder.

	patientStudyIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		patientStudyIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
	].

	patientStudyIOM dataElementsValues == self dataElementsValues ifFalse: [
		patientStudyIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		patientStudyIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> performedActionItemSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> performedActionItemSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepID: aSHValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepID: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepStartDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepStartDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepStartTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProcedureStepStartTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProtocolCodeSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performedProtocolCodeSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performingPhysicianName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> performingPhysicianName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> performingPhysiciansName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> performingPhysiciansName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> phosphorType [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM phosphorType
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> phosphorType: aLOValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM phosphorType: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> photometricInterpretation [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM photometricInterpretation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> photometricInterpretation: aCSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM photometricInterpretation: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> pixelAspectRatio [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelAspectRatio
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> pixelAspectRatio: aISValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelAspectRatio: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> pixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> pixelData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> pixelRepresentation [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelRepresentation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> pixelRepresentation: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> planarConfiguration [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM planarConfiguration
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> planarConfiguration: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM planarConfiguration: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> plateID [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM plateID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> plateID: aLOValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM plateID: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> plateType [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM plateType
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> plateType: aSHValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM plateType: aSHValue

]

{ #category : #printing }
CR_IOD >> printOn: aStream [ 

	aStream nextPutAll: self modality, ' Image #'.

	self instanceNumber isNil 
		ifFalse: [self instanceNumber printOn: aStream paddedWith: Character space to: 16r0007]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0007].
	
	self bodyPartExamined isNil 
		ifFalse: [self bodyPartExamined printOn: aStream paddedWith: Character space to: 16r0012]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0012].

	"self instanceCreationTime isNil 
		ifFalse: [self instanceCreationTime printString printOn: aStream paddedWith: Character space to: 16r0014]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0014]."
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> protocolName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM protocolName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> protocolName: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM protocolName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> qualityControlImage [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM qualityControlImage
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> qualityControlImage: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM qualityControlImage: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_AxisLabels [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisLabels
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_AxisLabels: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisLabels: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_AxisUnits [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisUnits
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_AxisUnits: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisUnits: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CoordinateStartValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStartValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CoordinateStartValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStartValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CoordinateStepValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStepValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CoordinateStepValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStepValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveData: aUNValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveData: aUNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveDataDescriptor [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDataDescriptor
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveDataDescriptor: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDataDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveDescription [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveDescription: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveDimensions [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDimensions
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveDimensions: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDimensions: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveLabel [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveLabel
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveLabel: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveRange [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveRange
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_CurveRange: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveRange: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_DataValueRepresentation [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_DataValueRepresentation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_DataValueRepresentation: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_DataValueRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_MaximumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MaximumCoordinateValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_MaximumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MaximumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_MinimumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MinimumCoordinateValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_MinimumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MinimumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_NumberOfPoints [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_NumberOfPoints
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_NumberOfPoints: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_NumberOfPoints: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_ReferencedOverlaySequence [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_ReferencedOverlaySequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_ReferencedOverlaySequence: aSQValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_ReferencedOverlaySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_TypeOfData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_TypeOfData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_TypeOfData: aCSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_TypeOfData: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_VariablePixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rETIRED_VariablePixelData: aUNValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aUNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rOIArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rOIArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rOIMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rOIMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rOIStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rOIStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> redPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> redPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> redPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> redPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> referencedFrameNumber [

	^generalImageIOM referencedFrameNumber.
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM referencedImageSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM referencedImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> referencedOverlaySequence [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_ReferencedOverlaySequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> referencedOverlaySequence: aSQValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_ReferencedOverlaySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedPerformedProcedureStepSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedPerformedProcedureStepSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> referencedSOPClassUID [

	^generalStudyIOM referencedSOPClassUID.
]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> referencedSOPInstanceUID [

	^generalStudyIOM referencedSOPInstanceUID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> referencedStudyComponentSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> referencedStudyComponentSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> relativeXRayExposure [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM relativeXRayExposure
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> relativeXRayExposure: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM relativeXRayExposure: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> requestAttributesSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> requestAttributesSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM requestAttributesSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> requestProcedureID [

	^generalSeriesIOM requestProcedureID.
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rescaleIntercept [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM rescaleIntercept
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rescaleIntercept: aDSValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM rescaleIntercept: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rescaleSlope [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM rescaleSlope
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rescaleSlope: aDSValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM rescaleSlope: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rescaleType [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM rescaleType
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rescaleType: aLOValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM rescaleType: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> roiArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> roiArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> roiMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> roiMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> roiStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> roiStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rows [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rows
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> rows: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rows: aUSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> samplesPerPixel [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM samplesPerPixel
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> samplesPerPixel: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM samplesPerPixel: aUSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> scheduledActionItemCodeSequence [

	^generalSeriesIOM scheduledActionItemCodeSequence.
]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> scheduledProcedureStepDescription [

	^generalSeriesIOM scheduledProcedureStepDescription.
]

{ #category : #'accessing-dataElements-wrongNames' }
CR_IOD >> scheduledProcedureStepID [

	^generalSeriesIOM scheduledProcedureStepID.
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sensitivity [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM sensitivity
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sensitivity: aDSValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM sensitivity: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesInstanceUID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesInstanceUID: aUIValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesNumber [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesNumber
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesNumber: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> seriesTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> smallestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM smallestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> smallestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM smallestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> smallestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> smallestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM smallestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
CR_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> sopCommonIOM: aSOPCommonIOM [

	sopCommonIOM := aSOPCommonIOM.
	sopCommonIOM encoder: self encoder.

	sopCommonIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		sopCommonIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
	].

	sopCommonIOM dataElementsValues == self dataElementsValues ifFalse: [
		sopCommonIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		sopCommonIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sourceImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM sourceImageSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> sourceImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM sourceImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> typeOfData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_TypeOfData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> typeOfData: aCSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_TypeOfData: aCSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> vOILUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> vOILUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> viewPosition [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^crSeriesIOM viewPosition
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> viewPosition: aCSValue [

	crSeriesIOM isNil ifTrue: [
		crSeriesIOM := CRSeriesIOM new.
		crSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		crSeriesIOM dataElementsValues: self dataElementsValues.
	].

	crSeriesIOM viewPosition: aCSValue

]

{ #category : #'accessing IOM' }
CR_IOD >> voiLUTIOM [

	^voiLUTIOM
]

{ #category : #'accessing IOM' }
CR_IOD >> voiLUTIOM: aVOILUTIOM [

	voiLUTIOM := aVOILUTIOM.
	voiLUTIOM encoder: self encoder.

	voiLUTIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		voiLUTIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
	].

	voiLUTIOM dataElementsValues == self dataElementsValues ifFalse: [
		voiLUTIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		voiLUTIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> voiLUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> voiLUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> windowCenter [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenter
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> windowCenter: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenter: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> windowCenterAndWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CR_IOD >> windowCenterAndWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> windowCenterWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> windowCenterWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> windowWidth [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowWidth
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> windowWidth: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowWidth: aDSValue

]

{ #category : #'accessing IOM data elements' }
CR_IOD >> xRayTubeCurrent [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	^crImageIOM xRayTubeCurrent
]

{ #category : #'accessing IOM data elements' }
CR_IOD >> xRayTubeCurrent: aISValue [

	crImageIOM isNil ifTrue: [
		crImageIOM := CRImageIOM new.
		crImageIOM dataElementsDictionary: self dataElementsDictionary.
		crImageIOM dataElementsValues: self dataElementsValues.
	].

	crImageIOM xRayTubeCurrent: aISValue

]
