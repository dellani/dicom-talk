Class {
	#name : #'US_IOD',
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
		'frameOfReferenceIOM',
		'usFrameOfReferenceIOM',
		'synchronizationIOM',
		'paletteColorLookupTableIOM',
		'constrastBolusIOM',
		'usRegionCalibrationIOM',
		'usImageIOM',
		'overlayPlaneIOM',
		'curveIdentificationIOM',
		'curveIOM',
		'audioIOM',
		'voiLUTIOM'
	],
	#category : #'talkDICOM-Objects-IOD'
}

{ #category : #accessing }
US_IOD class >> DicomIODName [

	^'US (retired) IOD'
]

{ #category : #accessing }
US_IOD class >> InformationObjectModules [
	^ InformationObjectModules
		ifNil: [ InformationObjectModules := OrderedCollection new.
			InformationObjectModules
				add: PatientIOM initialize;
				add: GeneralStudyIOM initialize;
				add: PatientStudyIOM initialize;
				add: GeneralSeriesIOM initialize;
				add: GeneralEquipmentIOM initialize;
				add: GeneralImageIOM initialize;
				add: ImagePixelIOM initialize;
				add: SOPCommonIOM initialize;
				add: FrameOfReferenceIOM initialize;
				add: USFrameOfReferenceIOM initialize;
				add: SynchronizationIOM initialize;
				add: PaletteColorLookupTableIOM initialize;
				add: ConstrastBolusIOM initialize;
				add: USRegionCalibrationIOM initialize;
				add: USImageIOM initialize;
				add: OverlayPlaneIOM initialize;
				add: CurveIdentificationIOM initialize;
				add: CurveIOM initialize;
				add: AudioIOM initialize;
				add: VOILUTIOM initialize;
				yourself ]
]

{ #category : #accessing }
US_IOD class >> SOPClassUID [

	^'1.2.840.10008.5.1.4.1.1.6.1'
]

{ #category : #'class initialization' }
US_IOD class >> initialize [

	super initialize.
]

{ #category : #comparing }
US_IOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber < dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
US_IOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber <= dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
US_IOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber > dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
US_IOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber >= dicomIOD instanceNumber asNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionDateTime [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM acquisitionDateTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionDateTime: aDTValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM acquisitionDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> acquisitionDatetime [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM acquisitionDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> acquisitionDatetime: aDTValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM acquisitionDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionNumber [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionNumber: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionTimeSynchronized [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM acquisitionTimeSynchronized
]

{ #category : #'accessing IOM data elements' }
US_IOD >> acquisitionTimeSynchronized: aCSValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM acquisitionTimeSynchronized: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
US_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> anatomicRegionSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM anatomicRegionSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> anatomicRegionSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM anatomicRegionSequence: aSQValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> aquisitionTimeSynchronized [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM acquisitionTimeSynchronized
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> aquisitionTimeSynchronized: aCSValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM acquisitionTimeSynchronized: aCSValue

]

{ #category : #converting }
US_IOD >> asDICOMDIR_IE [

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

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioComments [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioComments
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioComments: aLTValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioComments: aLTValue

]

{ #category : #'accessing IOM' }
US_IOD >> audioIOM [

	^audioIOM
]

{ #category : #'accessing IOM' }
US_IOD >> audioIOM: aAudioIOM [

	audioIOM := aAudioIOM.
	audioIOM encoder: self encoder.

	audioIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		audioIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		audioIOM dataElementsDictionary: self dataElementsDictionary.
	].

	audioIOM dataElementsValues == self dataElementsValues ifFalse: [
		audioIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		audioIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioSampleData [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioSampleData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioSampleData: aOWValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioSampleData: aOWValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioSampleFormat [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioSampleFormat
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioSampleFormat: aUSValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioSampleFormat: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioType [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioType
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> audioType: aUSValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioType: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> axisLabels [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisLabels
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> axisLabels: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisLabels: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> axisUnits [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisUnits
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> axisUnits: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisUnits: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> beatRejectionFlag [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM beatRejectionFlag
]

{ #category : #'accessing IOM data elements' }
US_IOD >> beatRejectionFlag: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM beatRejectionFlag: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> bitsAllocated [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM bitsAllocated
]

{ #category : #'accessing IOM data elements' }
US_IOD >> bitsAllocated: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM bitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> bitsStored [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM bitsStored
]

{ #category : #'accessing IOM data elements' }
US_IOD >> bitsStored: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM bitsStored: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> bluePaletteColorLookupTableData [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM bluePaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> bluePaletteColorLookupTableData: aOWValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM bluePaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> bluePaletteColorLookupTableDescriptor [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM bluePaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
US_IOD >> bluePaletteColorLookupTableDescriptor: aUSValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM bluePaletteColorLookupTableDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> bodyPartExamined [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM bodyPartExamined
]

{ #category : #'accessing IOM data elements' }
US_IOD >> bodyPartExamined: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM bodyPartExamined: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> boneThermalIndex [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM boneThermalIndex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> boneThermalIndex: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM boneThermalIndex: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> burnedInAnnotation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM burnedInAnnotation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> burnedInAnnotation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM burnedInAnnotation: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> columns [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM columns
]

{ #category : #'accessing IOM data elements' }
US_IOD >> columns: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM columns: aUSValue

]

{ #category : #'accessing IOM' }
US_IOD >> constrastBolusIOM [

	^constrastBolusIOM
]

{ #category : #'accessing IOM' }
US_IOD >> constrastBolusIOM: aConstrastBolusIOM [

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
US_IOD >> contentDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contentDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contentTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contentTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> contrastBolusAdministrationRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> contrastBolusAdministrationRoute: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusAdministrationRouteSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusAdministrationRouteSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusAgent [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgent
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusAgent: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgent: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusAgentSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgentSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusAgentSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgentSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusIngredient [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredient
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusIngredient: aCSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredient: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusIngredientConcentration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredientConcentration
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusIngredientConcentration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredientConcentration: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusRoute
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusRoute: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusRoute: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusStartTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStartTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusStartTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusStopTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStopTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusStopTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStopTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusTotalDose [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusTotalDose
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusTotalDose: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusTotalDose: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusVolume [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusVolume
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastBolusVolume: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusVolume: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastFlowDuration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowDuration
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastFlowDuration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowDuration: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastFlowRate [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowRate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> contrastFlowRate: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowRate: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> coordinateStartValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStartValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> coordinateStartValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStartValue: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> coordinateStepValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStepValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> coordinateStepValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStepValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> cranialThermalIndex [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM cranialThermalIndex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> cranialThermalIndex: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM cranialThermalIndex: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveData: aOWValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveData: aOWValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDataDescriptor [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDataDescriptor
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDataDescriptor: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDataDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDate [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_CurveDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDate: aDAValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_CurveDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDescription [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDescription
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDescription: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDescription: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDimensions [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDimensions
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveDimensions: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDimensions: aUSValue

]

{ #category : #'accessing IOM' }
US_IOD >> curveIOM [

	^curveIOM
]

{ #category : #'accessing IOM' }
US_IOD >> curveIOM: aCurveIOM [

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

{ #category : #'accessing IOM' }
US_IOD >> curveIdentificationIOM [

	^curveIdentificationIOM
]

{ #category : #'accessing IOM' }
US_IOD >> curveIdentificationIOM: aCurveIdentificationIOM [

	curveIdentificationIOM := aCurveIdentificationIOM.
	curveIdentificationIOM encoder: self encoder.

	curveIdentificationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		curveIdentificationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	curveIdentificationIOM dataElementsValues == self dataElementsValues ifFalse: [
		curveIdentificationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		curveIdentificationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveLabel [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveLabel
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveLabel: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveLabel: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveNumber [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_CurveNumber
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveNumber: aISValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_CurveNumber: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveRange [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveRange
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveRange: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveRange: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveTime [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_CurveTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> curveTime: aTMValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_CurveTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> dataValueRepresentation [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_DataValueRepresentation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> dataValueRepresentation: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_DataValueRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
US_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> depthOfScanField [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM depthOfScanField
]

{ #category : #'accessing IOM data elements' }
US_IOD >> depthOfScanField: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM depthOfScanField: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> derivationDescription [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM derivationDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> derivationDescription: aSTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM derivationDescription: aSTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
US_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> eventElapsedTimes [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM eventElapsedTimes
]

{ #category : #'accessing IOM data elements' }
US_IOD >> eventElapsedTimes: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM eventElapsedTimes: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> eventTimerNames [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM eventTimerNames
]

{ #category : #'accessing IOM data elements' }
US_IOD >> eventTimerNames: aLOValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM eventTimerNames: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> focusDepth [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM focusDepth
]

{ #category : #'accessing IOM data elements' }
US_IOD >> focusDepth: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM focusDepth: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> frameIncrementPointer [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM frameIncrementPointer
]

{ #category : #'accessing IOM data elements' }
US_IOD >> frameIncrementPointer: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM frameIncrementPointer: aUSValue

]

{ #category : #'accessing IOM' }
US_IOD >> frameOfReferenceIOM [

	^frameOfReferenceIOM
]

{ #category : #'accessing IOM' }
US_IOD >> frameOfReferenceIOM: aFrameOfReferenceIOM [

	frameOfReferenceIOM := aFrameOfReferenceIOM.
	frameOfReferenceIOM encoder: self encoder.

	frameOfReferenceIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		frameOfReferenceIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
	].

	frameOfReferenceIOM dataElementsValues == self dataElementsValues ifFalse: [
		frameOfReferenceIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		frameOfReferenceIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
US_IOD >> frameOfReferenceUID [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM frameOfReferenceUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> frameOfReferenceUID: aUIValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM frameOfReferenceUID: aUIValue

]

{ #category : #'accessing IOM' }
US_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
US_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

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
US_IOD >> generalImageIOM [

	^generalImageIOM
]

{ #category : #'accessing IOM' }
US_IOD >> generalImageIOM: aGeneralImageIOM [

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
US_IOD >> generalSeriesIOM [

	^generalSeriesIOM
]

{ #category : #'accessing IOM' }
US_IOD >> generalSeriesIOM: aGeneralSeriesIOM [

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
US_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
US_IOD >> generalStudyIOM: aGeneralStudyIOM [

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
US_IOD >> greenPaletteColorLookupTableData [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM greenPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> greenPaletteColorLookupTableData: aOWValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM greenPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> greenPaletteColorLookupTableDescriptor [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM greenPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
US_IOD >> greenPaletteColorLookupTableDescriptor: aUSValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM greenPaletteColorLookupTableDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> heartRate [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM heartRate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> heartRate: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM heartRate: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> highBit [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM highBit
]

{ #category : #'accessing IOM data elements' }
US_IOD >> highBit: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM highBit: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> highRRValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM highRRValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> highRRValue: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM highRRValue: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSAcquisition [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSAcquisition
]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSAcquisition: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSAcquisition: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSGatedRate [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSGatedRate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSGatedRate: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSGatedRate: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSPullbackRate [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSPullbackRate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSPullbackRate: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSPullbackRate: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSPullbackStartFrameNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSPullbackStartFrameNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSPullbackStartFrameNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSPullbackStartFrameNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSPullbackStopFrameNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSPullbackStopFrameNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> iVUSPullbackStopFrameNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSPullbackStopFrameNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> imageComments [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imageComments
]

{ #category : #'accessing IOM data elements' }
US_IOD >> imageComments: aLTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imageComments: aLTValue

]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> imageDate [

	^generalImageIOM contentDate.
]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> imageNumber [

	^generalImageIOM  instanceNumber.
]

{ #category : #'accessing IOM' }
US_IOD >> imagePixelIOM [

	^imagePixelIOM
]

{ #category : #'accessing IOM' }
US_IOD >> imagePixelIOM: aImagePixelIOM [

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
US_IOD >> imageTime [

	^generalImageIOM contentTime.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> imageTransformationMatrix [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_ImageTransformationMatrix
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> imageTransformationMatrix: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_ImageTransformationMatrix: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> imageTranslationVector [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_ImageTranslationVector
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> imageTranslationVector: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_ImageTranslationVector: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> imageType [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM imageType
]

{ #category : #'accessing IOM data elements' }
US_IOD >> imageType: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM imageType: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> imagesInAcquisition [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imagesInAcquisition
]

{ #category : #'accessing IOM data elements' }
US_IOD >> imagesInAcquisition: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imagesInAcquisition: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
US_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusAcquisition [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSAcquisition
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusAcquisition: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSAcquisition: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusGatedRate [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSGatedRate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusGatedRate: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSGatedRate: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusPullbackRate [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSPullbackRate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusPullbackRate: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSPullbackRate: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusPullbackStartFrameNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSPullbackStartFrameNumber
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusPullbackStartFrameNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSPullbackStartFrameNumber: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusPullbackStopFrameNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM iVUSPullbackStopFrameNumber
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ivusPullbackStopFrameNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM iVUSPullbackStopFrameNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> largestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM largestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> largestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM largestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> largestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
US_IOD >> largestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM largestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> laterality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM laterality
]

{ #category : #'accessing IOM data elements' }
US_IOD >> laterality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM laterality: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> lesionNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM lesionNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> lesionNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM lesionNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> lossyImageCompression [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM lossyImageCompression
]

{ #category : #'accessing IOM data elements' }
US_IOD >> lossyImageCompression: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM lossyImageCompression: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> lossyImageCompressionRatio [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompressionRatio
]

{ #category : #'accessing IOM data elements' }
US_IOD >> lossyImageCompressionRatio: aDSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompressionRatio: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> lowRRValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM lowRRValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> lowRRValue: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM lowRRValue: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
US_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> maximumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MaximumCoordinateValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> maximumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MaximumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> mechanicalIndex [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM mechanicalIndex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> mechanicalIndex: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM mechanicalIndex: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> minimumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MinimumCoordinateValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> minimumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MinimumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> modality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM modality
]

{ #category : #'accessing IOM data elements' }
US_IOD >> modality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM modality: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
US_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> nominalInterval [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM nominalInterval
]

{ #category : #'accessing IOM data elements' }
US_IOD >> nominalInterval: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM nominalInterval: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> numberOfChannels [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_NumberOfChannels
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> numberOfChannels: aUSValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_NumberOfChannels: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfEventTimers [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM numberOfEventTimers
]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfEventTimers: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM numberOfEventTimers: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> numberOfPoints [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_NumberOfPoints
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> numberOfPoints: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_NumberOfPoints: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> numberOfSamples [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_NumberOfSamples
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> numberOfSamples: aULValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_NumberOfSamples: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfSeriesRelatedInstances [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfSeriesRelatedInstances: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM numberOfSeriesRelatedInstances: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfStages [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM numberOfStages
]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfStages: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM numberOfStages: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfViewsInStage [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM numberOfViewsInStage
]

{ #category : #'accessing IOM data elements' }
US_IOD >> numberOfViewsInStage: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM numberOfViewsInStage: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> operatorsName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM operatorsName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> operatorsName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM operatorsName: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
US_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> outputPower [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM outputPower
]

{ #category : #'accessing IOM data elements' }
US_IOD >> outputPower: aSHValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM outputPower: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayBitPosition [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitPosition
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayBitPosition: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitPosition: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayBitsAllocated [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitsAllocated
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayBitsAllocated: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayColumns [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayColumns
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayColumns: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayColumns: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayData [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayData: aOWValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayDescription [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayDescription: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayLabel [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayLabel
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayLabel: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayOrigin [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayOrigin
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayOrigin: aSSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayOrigin: aSSValue

]

{ #category : #'accessing IOM' }
US_IOD >> overlayPlaneIOM [

	^overlayPlaneIOM
]

{ #category : #'accessing IOM' }
US_IOD >> overlayPlaneIOM: aOverlayPlaneIOM [

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
US_IOD >> overlayRows [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayRows
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayRows: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayRows: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlaySubtype [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlaySubtype
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlaySubtype: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlaySubtype: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayType [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayType
]

{ #category : #'accessing IOM data elements' }
US_IOD >> overlayType: aCSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayType: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> paletteColorLookupTableID [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM paletteColorLookupTableUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> paletteColorLookupTableID: aUIValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM paletteColorLookupTableUID: aUIValue

]

{ #category : #'accessing IOM' }
US_IOD >> paletteColorLookupTableIOM [

	^paletteColorLookupTableIOM
]

{ #category : #'accessing IOM' }
US_IOD >> paletteColorLookupTableIOM: aPaletteColorLookupTableIOM [

	paletteColorLookupTableIOM := aPaletteColorLookupTableIOM.
	paletteColorLookupTableIOM encoder: self encoder.

	paletteColorLookupTableIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		paletteColorLookupTableIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
	].

	paletteColorLookupTableIOM dataElementsValues == self dataElementsValues ifFalse: [
		paletteColorLookupTableIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
US_IOD >> paletteColorLookupTableUID [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM paletteColorLookupTableUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> paletteColorLookupTableUID: aUIValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM paletteColorLookupTableUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
US_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
US_IOD >> patientIOM: aPatientIOM [

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
US_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientOrientation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM patientOrientation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientOrientation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM patientOrientation: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientPosition [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM patientPosition
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientPosition: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM patientPosition: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
US_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
US_IOD >> patientStudyIOM: aPatientStudyIOM [

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
US_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
US_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> performedActionItemSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> performedActionItemSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepID: aSHValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepID: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepStartDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepStartDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepStartTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProcedureStepStartTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProtocolCodeSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> performedProtocolCodeSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> performingPhysicianName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> performingPhysicianName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> performingPhysiciansName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> performingPhysiciansName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> photometricInterpretation [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM photometricInterpretation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> photometricInterpretation: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM photometricInterpretation: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalDeltaX [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM physicalDeltaX
]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalDeltaX: aFDValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM physicalDeltaX: aFDValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalDeltaY [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM physicalDeltaY
]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalDeltaY: aFDValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM physicalDeltaY: aFDValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalUnitsXDirection [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM physicalUnitsXDirection
]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalUnitsXDirection: aUSValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM physicalUnitsXDirection: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalUnitsYDirection [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM physicalUnitsYDirection
]

{ #category : #'accessing IOM data elements' }
US_IOD >> physicalUnitsYDirection: aUSValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM physicalUnitsYDirection: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
US_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> pixelAspectRatio [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelAspectRatio
]

{ #category : #'accessing IOM data elements' }
US_IOD >> pixelAspectRatio: aISValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelAspectRatio: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> pixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> pixelData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> pixelRepresentation [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM pixelRepresentation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> pixelRepresentation: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM pixelRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> planarConfiguration [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM planarConfiguration
]

{ #category : #'accessing IOM data elements' }
US_IOD >> planarConfiguration: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM planarConfiguration: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> positionReferenceIndicator [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM positionReferenceIndicator
]

{ #category : #'accessing IOM data elements' }
US_IOD >> positionReferenceIndicator: aLOValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM positionReferenceIndicator: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> preprocessingFunction [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM processingFunction
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> preprocessingFunction: aLOValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM processingFunction: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> primaryAnatomicStructureSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM primaryAnatomicStructureSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> primaryAnatomicStructureSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM primaryAnatomicStructureSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> processingFunction [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM processingFunction
]

{ #category : #'accessing IOM data elements' }
US_IOD >> processingFunction: aLOValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM processingFunction: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> protocolName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM protocolName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> protocolName: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM protocolName: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> qualityControlImage [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM qualityControlImage
]

{ #category : #'accessing IOM data elements' }
US_IOD >> qualityControlImage: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM qualityControlImage: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioComments [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioComments
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioComments: aLTValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioSampleData [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioSampleData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioSampleData: aUNValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioSampleData: aUNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioSampleFormat [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioSampleFormat
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioSampleFormat: aUSValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioSampleFormat: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioType [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_AudioType
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AudioType: aUSValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_AudioType: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AxisLabels [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisLabels
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AxisLabels: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisLabels: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AxisUnits [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisUnits
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_AxisUnits: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisUnits: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CoordinateStartValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStartValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CoordinateStartValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStartValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CoordinateStepValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStepValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CoordinateStepValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStepValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveData: aUNValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveData: aUNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDataDescriptor [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDataDescriptor
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDataDescriptor: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDataDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDate [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_CurveDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDate: aDAValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_CurveDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDescription [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDescription: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDimensions [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDimensions
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveDimensions: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDimensions: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveLabel [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveLabel
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveLabel: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveNumber [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_CurveNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveNumber: aISValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_CurveNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveRange [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveRange
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveRange: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveRange: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveTime [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_CurveTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_CurveTime: aTMValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_CurveTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_DataValueRepresentation [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_DataValueRepresentation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_DataValueRepresentation: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_DataValueRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ImageTransformationMatrix [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_ImageTransformationMatrix
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ImageTransformationMatrix: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_ImageTransformationMatrix: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ImageTranslationVector [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_ImageTranslationVector
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ImageTranslationVector: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_ImageTranslationVector: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_MaximumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MaximumCoordinateValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_MaximumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MaximumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_MinimumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MinimumCoordinateValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_MinimumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MinimumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_NumberOfChannels [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_NumberOfChannels
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_NumberOfChannels: aUSValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_NumberOfChannels: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_NumberOfPoints [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_NumberOfPoints
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_NumberOfPoints: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_NumberOfPoints: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_NumberOfSamples [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_NumberOfSamples
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_NumberOfSamples: aULValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_NumberOfSamples: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ReferencedCurveSequence [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_ReferencedCurveSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ReferencedCurveSequence: aSQValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_ReferencedCurveSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ReferencedOverlaySequence [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_ReferencedOverlaySequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_ReferencedOverlaySequence: aSQValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_ReferencedOverlaySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_SampleRate [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_SampleRate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_SampleRate: aULValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_SampleRate: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TotalTime [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_TotalTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TotalTime: aULValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_TotalTime: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TransducerOrientationSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_TransducerOrientationSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TransducerOrientationSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_TransducerOrientationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TransducerPositionSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_TransducerPositionSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TransducerPositionSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_TransducerPositionSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TypeOfData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_TypeOfData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_TypeOfData: aCSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_TypeOfData: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_VariablePixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rETIRED_VariablePixelData: aUNValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aUNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rOIArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rOIArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rOIMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rOIMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rOIStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rOIStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> redPaletteColorLookupTableData [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM redPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> redPaletteColorLookupTableData: aOWValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM redPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> redPaletteColorLookupTableDescriptor [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM redPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
US_IOD >> redPaletteColorLookupTableDescriptor: aUSValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM redPaletteColorLookupTableDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelPhysicalValueX [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM referencePixelPhysicalValueX
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelPhysicalValueX: aFDValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM referencePixelPhysicalValueX: aFDValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelPhysicalValueY [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM referencePixelPhysicalValueY
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelPhysicalValueY: aFDValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM referencePixelPhysicalValueY: aFDValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelX0 [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM referencePixelX0
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelX0: aSLValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM referencePixelX0: aSLValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelY0 [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM referencePixelY0
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencePixelY0: aSLValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM referencePixelY0: aSLValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referencedCurveSequence [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	^curveIdentificationIOM rETIRED_ReferencedCurveSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referencedCurveSequence: aSQValue [

	curveIdentificationIOM isNil ifTrue: [
		curveIdentificationIOM := CurveIdentificationIOM new.
		curveIdentificationIOM dataElementsDictionary: self dataElementsDictionary.
		curveIdentificationIOM dataElementsValues: self dataElementsValues.
	].

	curveIdentificationIOM rETIRED_ReferencedCurveSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> referencedFrameNumber [

	^generalImageIOM referencedFrameNumber.
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedImageSequence [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM referencedImageSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedImageSequence: aSQValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM referencedImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referencedOverlaySequence [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_ReferencedOverlaySequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referencedOverlaySequence: aSQValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_ReferencedOverlaySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedPerformedProcedureStepSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedPerformedProcedureStepSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> referencedSOPClassUID [

	^generalStudyIOM referencedSOPClassUID.
]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> referencedSOPInstanceUID [

	^generalStudyIOM referencedSOPInstanceUID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referencedStudyComponentSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referencedStudyComponentSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedWaveformSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM referencedWaveformSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referencedWaveformSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM referencedWaveformSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMaxX1 [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM regionLocationMaxX1
]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMaxX1: aULValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM regionLocationMaxX1: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMaxY1 [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM regionLocationMaxY1
]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMaxY1: aULValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM regionLocationMaxY1: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMinX0 [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM regionLocationMinX0
]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMinX0: aULValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM regionLocationMinX0: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMinY0 [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^usFrameOfReferenceIOM regionLocationMinY0
]

{ #category : #'accessing IOM data elements' }
US_IOD >> regionLocationMinY0: aULValue [

	usFrameOfReferenceIOM isNil ifTrue: [
		usFrameOfReferenceIOM := USFrameOfReferenceIOM new.
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	usFrameOfReferenceIOM regionLocationMinY0: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> requestAttributesSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> requestAttributesSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM requestAttributesSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> requestProcedureID [

	^generalSeriesIOM requestProcedureID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> roiArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> roiArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> roiMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> roiMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> roiStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> roiStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> rows [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rows
]

{ #category : #'accessing IOM data elements' }
US_IOD >> rows: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rows: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sampleRate [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_SampleRate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sampleRate: aULValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_SampleRate: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> samplesPerPixel [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM samplesPerPixel
]

{ #category : #'accessing IOM data elements' }
US_IOD >> samplesPerPixel: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM samplesPerPixel: aUSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> scheduledActionItemCodeSequence [

	^generalSeriesIOM scheduledActionItemCodeSequence.
]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> scheduledProcedureStepDescription [

	^generalSeriesIOM scheduledProcedureStepDescription.
]

{ #category : #'accessing-dataElements-wrongNames' }
US_IOD >> scheduledProcedureStepID [

	^generalSeriesIOM scheduledProcedureStepID.
]

{ #category : #'accessing IOM data elements' }
US_IOD >> segmentedBluePaletteColorLookupTableData [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM segmentedBluePaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> segmentedBluePaletteColorLookupTableData: aOWValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM segmentedBluePaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> segmentedGreenPaletteColorLookupTableData [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM segmentedGreenPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> segmentedGreenPaletteColorLookupTableData: aOWValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM segmentedGreenPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> segmentedRedPaletteColorLookupTableData [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	^paletteColorLookupTableIOM segmentedRedPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> segmentedRedPaletteColorLookupTableData: aOWValue [

	paletteColorLookupTableIOM isNil ifTrue: [
		paletteColorLookupTableIOM := PaletteColorLookupTableIOM new.
		paletteColorLookupTableIOM dataElementsDictionary: self dataElementsDictionary.
		paletteColorLookupTableIOM dataElementsValues: self dataElementsValues.
	].

	paletteColorLookupTableIOM segmentedRedPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sequenceOfUltrasoundRegions [

	usRegionCalibrationIOM isNil ifTrue: [
		usRegionCalibrationIOM := USRegionCalibrationIOM new.
		usRegionCalibrationIOM dataElementsDictionary: self dataElementsDictionary.
		usRegionCalibrationIOM dataElementsValues: self dataElementsValues.
	].

	^usRegionCalibrationIOM sequenceOfUltrasoundRegions
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sequenceOfUltrasoundRegions: aSQValue [

	usRegionCalibrationIOM isNil ifTrue: [
		usRegionCalibrationIOM := USRegionCalibrationIOM new.
		usRegionCalibrationIOM dataElementsDictionary: self dataElementsDictionary.
		usRegionCalibrationIOM dataElementsValues: self dataElementsValues.
	].

	usRegionCalibrationIOM sequenceOfUltrasoundRegions: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesInstanceUID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesInstanceUID: aUIValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesNumber [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesNumber: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> seriesTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> smallestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM smallestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
US_IOD >> smallestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM smallestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> smallestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
US_IOD >> smallestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM smallestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> softTissueFocusThermalIndex [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM softTissueFocusThermalIndex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> softTissueFocusThermalIndex: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM softTissueFocusThermalIndex: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> softTissueSurfaceThermalIndex [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM softTissueSurfaceThermalIndex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> softTissueSurfaceThermalIndex: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM softTissueSurfaceThermalIndex: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> softTissueThermalIndex [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM softTissueThermalIndex
]

{ #category : #'accessing IOM data elements' }
US_IOD >> softTissueThermalIndex: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM softTissueThermalIndex: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
US_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
US_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
US_IOD >> sopCommonIOM: aSOPCommonIOM [

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
US_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> sourceImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM sourceImageSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> sourceImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM sourceImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
US_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
US_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> stageCodeSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM stageCodeSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> stageCodeSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM stageCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> stageName [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM stageName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> stageName: aSHValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM stageName: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> stageNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM stageNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> stageNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM stageNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> synchronizationChannel [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM synchronizationChannel
]

{ #category : #'accessing IOM data elements' }
US_IOD >> synchronizationChannel: aUSValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM synchronizationChannel: aUSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> synchronizationFrameOfReferenceUID [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM synchronizationFrameOfReferenceUID
]

{ #category : #'accessing IOM data elements' }
US_IOD >> synchronizationFrameOfReferenceUID: aUIValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM synchronizationFrameOfReferenceUID: aUIValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> synchronizationFrameofReferenceUID [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM synchronizationFrameOfReferenceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> synchronizationFrameofReferenceUID: aUIValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM synchronizationFrameOfReferenceUID: aUIValue

]

{ #category : #'accessing IOM' }
US_IOD >> synchronizationIOM [

	^synchronizationIOM
]

{ #category : #'accessing IOM' }
US_IOD >> synchronizationIOM: aSynchronizationIOM [

	synchronizationIOM := aSynchronizationIOM.
	synchronizationIOM encoder: self encoder.

	synchronizationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		synchronizationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	synchronizationIOM dataElementsValues == self dataElementsValues ifFalse: [
		synchronizationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		synchronizationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
US_IOD >> synchronizationTrigger [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM synchronizationTrigger
]

{ #category : #'accessing IOM data elements' }
US_IOD >> synchronizationTrigger: aCSValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM synchronizationTrigger: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> timeDistributionProtocol [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM timeDistributionProtocol
]

{ #category : #'accessing IOM data elements' }
US_IOD >> timeDistributionProtocol: aCSValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM timeDistributionProtocol: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
US_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> timeSource [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM timeSource
]

{ #category : #'accessing IOM data elements' }
US_IOD >> timeSource: aSHValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM timeSource: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
US_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> totalTime [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	^audioIOM rETIRED_TotalTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> totalTime: aULValue [

	audioIOM isNil ifTrue: [
		audioIOM := AudioIOM new.
		audioIOM dataElementsDictionary: self dataElementsDictionary.
		audioIOM dataElementsValues: self dataElementsValues.
	].

	audioIOM rETIRED_TotalTime: aULValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> transducerData [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM transducerData
]

{ #category : #'accessing IOM data elements' }
US_IOD >> transducerData: aLOValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM transducerData: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> transducerOrientationSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_TransducerOrientationSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> transducerOrientationSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_TransducerOrientationSequence: aSQValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> transducerPositionSequence [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM rETIRED_TransducerPositionSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> transducerPositionSequence: aSQValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM rETIRED_TransducerPositionSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> transducerType [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM transducerType
]

{ #category : #'accessing IOM data elements' }
US_IOD >> transducerType: aCSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM transducerType: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> triggerSourceOrType [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM triggerSourceOrType
]

{ #category : #'accessing IOM data elements' }
US_IOD >> triggerSourceOrType: aLOValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM triggerSourceOrType: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> triggerSourceorType [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	^synchronizationIOM triggerSourceOrType
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> triggerSourceorType: aLOValue [

	synchronizationIOM isNil ifTrue: [
		synchronizationIOM := SynchronizationIOM new.
		synchronizationIOM dataElementsDictionary: self dataElementsDictionary.
		synchronizationIOM dataElementsValues: self dataElementsValues.
	].

	synchronizationIOM triggerSourceOrType: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> triggerTime [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM triggerTime
]

{ #category : #'accessing IOM data elements' }
US_IOD >> triggerTime: aDSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM triggerTime: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> typeOfData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_TypeOfData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> typeOfData: aCSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_TypeOfData: aCSValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> ultrasoundColorDataPresent [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM ultrasoundColorDataPresent
]

{ #category : #'accessing IOM data elements' }
US_IOD >> ultrasoundColorDataPresent: aUSValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM ultrasoundColorDataPresent: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ultrasoundRegionsSequence [

	usRegionCalibrationIOM isNil ifTrue: [
		usRegionCalibrationIOM := USRegionCalibrationIOM new.
		usRegionCalibrationIOM dataElementsDictionary: self dataElementsDictionary.
		usRegionCalibrationIOM dataElementsValues: self dataElementsValues.
	].

	^usRegionCalibrationIOM sequenceOfUltrasoundRegions
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> ultrasoundRegionsSequence: aSQValue [

	usRegionCalibrationIOM isNil ifTrue: [
		usRegionCalibrationIOM := USRegionCalibrationIOM new.
		usRegionCalibrationIOM dataElementsDictionary: self dataElementsDictionary.
		usRegionCalibrationIOM dataElementsValues: self dataElementsValues.
	].

	usRegionCalibrationIOM sequenceOfUltrasoundRegions: aSQValue

]

{ #category : #'accessing IOM' }
US_IOD >> usFrameOfReferenceIOM [

	^usFrameOfReferenceIOM
]

{ #category : #'accessing IOM' }
US_IOD >> usFrameOfReferenceIOM: aUSFrameOfReferenceIOM [

	usFrameOfReferenceIOM := aUSFrameOfReferenceIOM.
	usFrameOfReferenceIOM encoder: self encoder.

	usFrameOfReferenceIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		usFrameOfReferenceIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		usFrameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
	].

	usFrameOfReferenceIOM dataElementsValues == self dataElementsValues ifFalse: [
		usFrameOfReferenceIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		usFrameOfReferenceIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
US_IOD >> usImageIOM [

	^usImageIOM
]

{ #category : #'accessing IOM' }
US_IOD >> usImageIOM: aUSImageIOM [

	usImageIOM := aUSImageIOM.
	usImageIOM encoder: self encoder.

	usImageIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		usImageIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
	].

	usImageIOM dataElementsValues == self dataElementsValues ifFalse: [
		usImageIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		usImageIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
US_IOD >> usRegionCalibrationIOM [

	^usRegionCalibrationIOM
]

{ #category : #'accessing IOM' }
US_IOD >> usRegionCalibrationIOM: aUSRegionCalibrationIOM [

	usRegionCalibrationIOM := aUSRegionCalibrationIOM.
	usRegionCalibrationIOM encoder: self encoder.

	usRegionCalibrationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		usRegionCalibrationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		usRegionCalibrationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	usRegionCalibrationIOM dataElementsValues == self dataElementsValues ifFalse: [
		usRegionCalibrationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		usRegionCalibrationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
US_IOD >> vOILUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements' }
US_IOD >> vOILUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> viewName [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM viewName
]

{ #category : #'accessing IOM data elements' }
US_IOD >> viewName: aSHValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM viewName: aSHValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> viewNumber [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	^usImageIOM viewNumber
]

{ #category : #'accessing IOM data elements' }
US_IOD >> viewNumber: aISValue [

	usImageIOM isNil ifTrue: [
		usImageIOM := USImageIOM new.
		usImageIOM dataElementsDictionary: self dataElementsDictionary.
		usImageIOM dataElementsValues: self dataElementsValues.
	].

	usImageIOM viewNumber: aISValue

]

{ #category : #'accessing IOM' }
US_IOD >> voiLUTIOM [

	^voiLUTIOM
]

{ #category : #'accessing IOM' }
US_IOD >> voiLUTIOM: aVOILUTIOM [

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
US_IOD >> voiLUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> voiLUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> windowCenter [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenter
]

{ #category : #'accessing IOM data elements' }
US_IOD >> windowCenter: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenter: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> windowCenterAndWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
US_IOD >> windowCenterAndWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> windowCenterWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements' }
US_IOD >> windowCenterWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
US_IOD >> windowWidth [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowWidth
]

{ #category : #'accessing IOM data elements' }
US_IOD >> windowWidth: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowWidth: aDSValue

]
