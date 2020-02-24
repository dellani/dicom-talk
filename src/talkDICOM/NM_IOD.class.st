Class {
	#name : #'NM_IOD',
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
		'nmPETPatientOrientationIOM',
		'frameOfReferenceIOM',
		'nmImagePixelIOM',
		'multiFrameIOM',
		'nmMultiFrameIOM',
		'nmImageIOM',
		'nmIsotopeIOM',
		'nmDetectorIOM',
		'nmTomoAcquisitionIOM',
		'nmMultiGatedAcquisitionIOM',
		'nMPhaseIOM',
		'nMReconstructionIOM',
		'overlayPlaneIOM',
		'curveIOM',
		'voiLUTIOM',
		'nmPhaseIOM',
		'nmReconstructionIOM'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
NM_IOD class >> DicomIODName [

	^'MR IOD'
]

{ #category : #accessing }
NM_IOD class >> InformationObjectModules [

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
				add: NMPETPatientOrientationIOM initialize;
				add: FrameOfReferenceIOM initialize;
				add: NMImagePixelIOM initialize;
				add: MultiFrameIOM initialize;
				add: NMMultiFrameIOM initialize;
				add: NMImageIOM initialize;
				add: NMIsotopeIOM initialize;
				add: NMDetectorIOM initialize;
				add: NMTomoAcquisitionIOM initialize;
				add: NMMultiGatedAcquisitionIOM initialize;
				add: NMPhaseIOM initialize;
				add: NMReconstructionIOM initialize;
				add: OverlayPlaneIOM initialize;
				add: CurveIOM initialize;
				add: VOILUTIOM initialize;
				yourself]
]

{ #category : #accessing }
NM_IOD class >> SOPClassUID [

	^'1.2.840.10008.5.1.4.1.1.20'
]

{ #category : #'class initialization' }
NM_IOD class >> initialize [

	super initialize.
]

{ #category : #comparing }
NM_IOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber < dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
NM_IOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber <= dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
NM_IOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber > dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
NM_IOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber >= dicomIOD instanceNumber asNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionDateTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDateTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionDateTime: aDTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionNumber [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionNumber: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionTerminationCondition [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM acquisitionTerminationCondition
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionTerminationCondition: aCSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM acquisitionTerminationCondition: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> acquisitionTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> actualFrameDuration [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM actualFrameDuration
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> actualFrameDuration: aISValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM actualFrameDuration: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> anatomicRegionSequence [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM anatomicRegionSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> anatomicRegionSequence: aSQValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM anatomicRegionSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> angularViewVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM angularViewVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> angularViewVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM angularViewVector: aUSValue

]

{ #category : #converting }
NM_IOD >> asDICOMDIR_IE [

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
NM_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> axisLabels [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisLabels
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> axisLabels: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisLabels: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> axisUnits [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisUnits
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> axisUnits: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisUnits: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> beatRejectionFlag [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiGatedAcquisitionIOM beatRejectionFlag
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> beatRejectionFlag: aCSValue [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiGatedAcquisitionIOM beatRejectionFlag: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bitsAllocated [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^nmImagePixelIOM bitsAllocated
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bitsAllocated: aUSValue [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	nmImagePixelIOM bitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bitsStored [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^nmImagePixelIOM bitsStored
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bitsStored: aUSValue [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	nmImagePixelIOM bitsStored: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bluePaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bluePaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bluePaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bluePaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bodyPartExamined [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM bodyPartExamined
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> bodyPartExamined: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM bodyPartExamined: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> burnedInAnnotation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM burnedInAnnotation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> burnedInAnnotation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM burnedInAnnotation: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> columns [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM columns
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> columns: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM columns: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> contentDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> contentDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> contentTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> contentTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> convolutionKernel [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	^nmReconstructionIOM convolutionKernel
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> convolutionKernel: aSHValue [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	nmReconstructionIOM convolutionKernel: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> coordinateStartValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStartValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> coordinateStartValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStartValue: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> coordinateStepValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStepValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> coordinateStepValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStepValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> correctedImage [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM correctedImage
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> correctedImage: aCSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM correctedImage: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> countRate [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM countRate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> countRate: aISValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM countRate: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> countsAccumulated [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM countsAccumulated
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> countsAccumulated: aISValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM countsAccumulated: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveData: aOWValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveData: aOWValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveDataDescriptor [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDataDescriptor
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveDataDescriptor: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDataDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveDescription [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDescription
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveDescription: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDescription: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveDimensions [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDimensions
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveDimensions: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDimensions: aUSValue

]

{ #category : #'accessing IOM' }
NM_IOD >> curveIOM [

	^curveIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> curveIOM: aCurveIOM [

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
NM_IOD >> curveLabel [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveLabel
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveLabel: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveLabel: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveRange [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveRange
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> curveRange: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveRange: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> dataValueRepresentation [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_DataValueRepresentation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> dataValueRepresentation: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_DataValueRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> derivationDescription [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM derivationDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> derivationDescription: aSTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM derivationDescription: aSTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> detectorInformationSequence [

	nmDetectorIOM isNil ifTrue: [
		nmDetectorIOM := NMDetectorIOM new.
		nmDetectorIOM dataElementsDictionary: self dataElementsDictionary.
		nmDetectorIOM dataElementsValues: self dataElementsValues.
	].

	^nmDetectorIOM detectorInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> detectorInformationSequence: aSQValue [

	nmDetectorIOM isNil ifTrue: [
		nmDetectorIOM := NMDetectorIOM new.
		nmDetectorIOM dataElementsDictionary: self dataElementsDictionary.
		nmDetectorIOM dataElementsValues: self dataElementsValues.
	].

	nmDetectorIOM detectorInformationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> detectorVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM detectorVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> detectorVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM detectorVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> energyWindowInformationSequence [

	nmIsotopeIOM isNil ifTrue: [
		nmIsotopeIOM := NMIsotopeIOM new.
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
		nmIsotopeIOM dataElementsValues: self dataElementsValues.
	].

	^nmIsotopeIOM energyWindowInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> energyWindowInformationSequence: aSQValue [

	nmIsotopeIOM isNil ifTrue: [
		nmIsotopeIOM := NMIsotopeIOM new.
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
		nmIsotopeIOM dataElementsValues: self dataElementsValues.
	].

	nmIsotopeIOM energyWindowInformationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> energyWindowVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM energyWindowVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> energyWindowVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM energyWindowVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> frameIncrementPointer [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM frameIncrementPointer
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> frameIncrementPointer: aATValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM frameIncrementPointer: aATValue

]

{ #category : #'accessing IOM' }
NM_IOD >> frameOfReferenceIOM [

	^frameOfReferenceIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> frameOfReferenceIOM: aFrameOfReferenceIOM [

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
NM_IOD >> frameOfReferenceUID [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM frameOfReferenceUID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> frameOfReferenceUID: aUIValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM frameOfReferenceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> gatedInformationSequence [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiGatedAcquisitionIOM gatedInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> gatedInformationSequence: aSQValue [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiGatedAcquisitionIOM gatedInformationSequence: aSQValue

]

{ #category : #'accessing IOM' }
NM_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

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
NM_IOD >> generalImageIOM [

	^generalImageIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> generalImageIOM: aGeneralImageIOM [

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
NM_IOD >> generalSeriesIOM [

	^generalSeriesIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> generalSeriesIOM: aGeneralSeriesIOM [

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
NM_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> generalStudyIOM: aGeneralStudyIOM [

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
NM_IOD >> greenPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> greenPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> greenPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> greenPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> heartRate [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiGatedAcquisitionIOM heartRate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> heartRate: aISValue [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiGatedAcquisitionIOM heartRate: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> highBit [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^nmImagePixelIOM highBit
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> highBit: aUSValue [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	nmImagePixelIOM highBit: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imageComments [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imageComments
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imageComments: aLTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imageComments: aLTValue

]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> imageDate [

	^generalImageIOM contentDate.
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imageID [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM imageID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imageID: aSHValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM imageID: aSHValue

]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> imageNumber [

	^generalImageIOM  instanceNumber.
]

{ #category : #'accessing IOM' }
NM_IOD >> imagePixelIOM [

	^imagePixelIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> imagePixelIOM: aImagePixelIOM [

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
NM_IOD >> imageTime [

	^generalImageIOM contentTime.
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imageType [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM imageType
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imageType: aCSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM imageType: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imagesInAcquisition [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imagesInAcquisition
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> imagesInAcquisition: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imagesInAcquisition: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> interventionDrugInformationSequence [

	nmIsotopeIOM isNil ifTrue: [
		nmIsotopeIOM := NMIsotopeIOM new.
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
		nmIsotopeIOM dataElementsValues: self dataElementsValues.
	].

	^nmIsotopeIOM interventionDrugInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> interventionDrugInformationSequence: aSQValue [

	nmIsotopeIOM isNil ifTrue: [
		nmIsotopeIOM := NMIsotopeIOM new.
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
		nmIsotopeIOM dataElementsValues: self dataElementsValues.
	].

	nmIsotopeIOM interventionDrugInformationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> largestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM largestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> largestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM largestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> largestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> largestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM largestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> laterality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM laterality
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> laterality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM laterality: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> lossyImageCompression [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM lossyImageCompression
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> lossyImageCompression: aCSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM lossyImageCompression: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> lossyImageCompressionRatio [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompressionRatio
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> lossyImageCompressionRatio: aDSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompressionRatio: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> maximumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MaximumCoordinateValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> maximumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MaximumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> minimumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MinimumCoordinateValue
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> minimumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MinimumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> modality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM modality
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> modality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM modality: aCSValue

]

{ #category : #'accessing IOM' }
NM_IOD >> multiFrameIOM [

	^multiFrameIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> multiFrameIOM: aMultiFrameIOM [

	multiFrameIOM := aMultiFrameIOM.
	multiFrameIOM encoder: self encoder.

	multiFrameIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		multiFrameIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		multiFrameIOM dataElementsDictionary: self dataElementsDictionary.
	].

	multiFrameIOM dataElementsValues == self dataElementsValues ifFalse: [
		multiFrameIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		multiFrameIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nMPhaseIOM [

	^nMPhaseIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nMPhaseIOM: aNMPhaseIOM [

	nMPhaseIOM := aNMPhaseIOM.
	nMPhaseIOM encoder: self encoder.

	nMPhaseIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nMPhaseIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nMPhaseIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nMPhaseIOM dataElementsValues == self dataElementsValues ifFalse: [
		nMPhaseIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nMPhaseIOM dataElementsValues: self dataElementsValues
	].
]

{ #category : #'accessing IOM' }
NM_IOD >> nMReconstructionIOM [

	^nMReconstructionIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nMReconstructionIOM: aNMReconstructionIOM [

	nMReconstructionIOM := aNMReconstructionIOM.
	nMReconstructionIOM encoder: self encoder.

	nMReconstructionIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nMReconstructionIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nMReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nMReconstructionIOM dataElementsValues == self dataElementsValues ifFalse: [
		nMReconstructionIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nMReconstructionIOM dataElementsValues: self dataElementsValues
	].
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM' }
NM_IOD >> nmDetectorIOM [

	^nmDetectorIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmDetectorIOM: aNMDetectorIOM [

	nmDetectorIOM := aNMDetectorIOM.
	nmDetectorIOM encoder: self encoder.

	nmDetectorIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmDetectorIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmDetectorIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmDetectorIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmDetectorIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmDetectorIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmImageIOM [

	^nmImageIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmImageIOM: aNMImageIOM [

	nmImageIOM := aNMImageIOM.
	nmImageIOM encoder: self encoder.

	nmImageIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmImageIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmImageIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmImageIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmImageIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmImagePixelIOM [

	^nmImagePixelIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmImagePixelIOM: aNMImagePixelIOM [

	nmImagePixelIOM := aNMImagePixelIOM.
	nmImagePixelIOM encoder: self encoder.

	nmImagePixelIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmImagePixelIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmImagePixelIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmImagePixelIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmImagePixelIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmIsotopeIOM [

	^nmIsotopeIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmIsotopeIOM: aNMIsotopeIOM [

	nmIsotopeIOM := aNMIsotopeIOM.
	nmIsotopeIOM encoder: self encoder.

	nmIsotopeIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmIsotopeIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmIsotopeIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmIsotopeIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmIsotopeIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmMultiFrameIOM [

	^nmMultiFrameIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmMultiFrameIOM: aNMMultiFrameIOM [

	nmMultiFrameIOM := aNMMultiFrameIOM.
	nmMultiFrameIOM encoder: self encoder.

	nmMultiFrameIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmMultiFrameIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmMultiFrameIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmMultiFrameIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmMultiFrameIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmMultiGatedAcquisitionIOM [

	^nmMultiGatedAcquisitionIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmMultiGatedAcquisitionIOM: aNMMultiGatedAcquisitionIOM [

	nmMultiGatedAcquisitionIOM := aNMMultiGatedAcquisitionIOM.
	nmMultiGatedAcquisitionIOM encoder: self encoder.

	nmMultiGatedAcquisitionIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmMultiGatedAcquisitionIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmMultiGatedAcquisitionIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmMultiGatedAcquisitionIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmPETPatientOrientationIOM [

	^nmPETPatientOrientationIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmPETPatientOrientationIOM: aNMPETPatientOrientationIOM [

	nmPETPatientOrientationIOM := aNMPETPatientOrientationIOM.
	nmPETPatientOrientationIOM encoder: self encoder.

	nmPETPatientOrientationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmPETPatientOrientationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmPETPatientOrientationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmPETPatientOrientationIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmPETPatientOrientationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmPETPatientOrientationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmPhaseIOM [

	^nmPhaseIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmPhaseIOM: aNMPhaseIOM [

	nmPhaseIOM := aNMPhaseIOM.
	nmPhaseIOM encoder: self encoder.

	nmPhaseIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmPhaseIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmPhaseIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmPhaseIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmPhaseIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmPhaseIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmReconstructionIOM [

	^nmReconstructionIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmReconstructionIOM: aNMReconstructionIOM [

	nmReconstructionIOM := aNMReconstructionIOM.
	nmReconstructionIOM encoder: self encoder.

	nmReconstructionIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmReconstructionIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmReconstructionIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmReconstructionIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmReconstructionIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
NM_IOD >> nmTomoAcquisitionIOM [

	^nmTomoAcquisitionIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> nmTomoAcquisitionIOM: aNMTomoAcquisitionIOM [

	nmTomoAcquisitionIOM := aNMTomoAcquisitionIOM.
	nmTomoAcquisitionIOM encoder: self encoder.

	nmTomoAcquisitionIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		nmTomoAcquisitionIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		nmTomoAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
	].

	nmTomoAcquisitionIOM dataElementsValues == self dataElementsValues ifFalse: [
		nmTomoAcquisitionIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		nmTomoAcquisitionIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfDetectors [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfDetectors
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfDetectors: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfDetectors: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfEnergyWindows [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfEnergyWindows
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfEnergyWindows: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfEnergyWindows: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfFrames [

	multiFrameIOM isNil ifTrue: [
		multiFrameIOM := MultiFrameIOM new.
		multiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		multiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^multiFrameIOM numberOfFrames
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfFrames: aISValue [

	multiFrameIOM isNil ifTrue: [
		multiFrameIOM := MultiFrameIOM new.
		multiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		multiFrameIOM dataElementsValues: self dataElementsValues.
	].

	multiFrameIOM numberOfFrames: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfPhases [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfPhases
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfPhases: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfPhases: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> numberOfPoints [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_NumberOfPoints
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> numberOfPoints: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_NumberOfPoints: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfRRIntervals [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfRRIntervals
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfRRIntervals: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfRRIntervals: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfRotations [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfRotations
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfRotations: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfRotations: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfSeriesRelatedInstances [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfSeriesRelatedInstances: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM numberOfSeriesRelatedInstances: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfSlices [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfSlices
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfSlices: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfSlices: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfTimeSlots [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM numberOfTimeSlots
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> numberOfTimeSlots: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM numberOfTimeSlots: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> operatorsName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM operatorsName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> operatorsName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM operatorsName: aPNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayBitPosition [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitPosition
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayBitPosition: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitPosition: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayBitsAllocated [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitsAllocated
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayBitsAllocated: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayColumns [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayColumns
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayColumns: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayColumns: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayData [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayData: aOWValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayData: aOWValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayDescription [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayDescription: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayLabel [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayLabel
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayLabel: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayOrigin [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayOrigin
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayOrigin: aSSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayOrigin: aSSValue

]

{ #category : #'accessing IOM' }
NM_IOD >> overlayPlaneIOM [

	^overlayPlaneIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> overlayPlaneIOM: aOverlayPlaneIOM [

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
NM_IOD >> overlayRows [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayRows
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayRows: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayRows: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlaySubtype [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlaySubtype
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlaySubtype: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlaySubtype: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayType [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayType
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> overlayType: aCSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayType: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pVCRejection [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiGatedAcquisitionIOM pVCRejection
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pVCRejection: aLOValue [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiGatedAcquisitionIOM pVCRejection: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
NM_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> patientIOM: aPatientIOM [

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
NM_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientOrientation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM patientOrientation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientOrientation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM patientOrientation: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientOrientationCodeSequence [

	nmPETPatientOrientationIOM isNil ifTrue: [
		nmPETPatientOrientationIOM := NMPETPatientOrientationIOM new.
		nmPETPatientOrientationIOM dataElementsDictionary: self dataElementsDictionary.
		nmPETPatientOrientationIOM dataElementsValues: self dataElementsValues.
	].

	^nmPETPatientOrientationIOM patientOrientationCodeSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientOrientationCodeSequence: aSQValue [

	nmPETPatientOrientationIOM isNil ifTrue: [
		nmPETPatientOrientationIOM := NMPETPatientOrientationIOM new.
		nmPETPatientOrientationIOM dataElementsDictionary: self dataElementsDictionary.
		nmPETPatientOrientationIOM dataElementsValues: self dataElementsValues.
	].

	nmPETPatientOrientationIOM patientOrientationCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientPosition [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM patientPosition
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientPosition: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM patientPosition: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
NM_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> patientStudyIOM: aPatientStudyIOM [

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
NM_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> performedActionItemSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> performedActionItemSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepID: aSHValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepID: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepStartDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepStartDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepStartTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProcedureStepStartTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProtocolCodeSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performedProtocolCodeSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performingPhysicianName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> performingPhysicianName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> performingPhysiciansName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> performingPhysiciansName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> phaseInformationSequence [

	nmPhaseIOM isNil ifTrue: [
		nmPhaseIOM := NMPhaseIOM new.
		nmPhaseIOM dataElementsDictionary: self dataElementsDictionary.
		nmPhaseIOM dataElementsValues: self dataElementsValues.
	].

	^nmPhaseIOM phaseInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> phaseInformationSequence: aSQValue [

	nmPhaseIOM isNil ifTrue: [
		nmPhaseIOM := NMPhaseIOM new.
		nmPhaseIOM dataElementsDictionary: self dataElementsDictionary.
		nmPhaseIOM dataElementsValues: self dataElementsValues.
	].

	nmPhaseIOM phaseInformationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> phaseVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM phaseVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> phaseVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM phaseVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> photometricInterpretation [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^nmImagePixelIOM photometricInterpretation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> photometricInterpretation: aCSValue [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	nmImagePixelIOM photometricInterpretation: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelAspectRatio [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelAspectRatio
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelAspectRatio: aISValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelAspectRatio: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> pixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> pixelData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aOWValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelRepresentation [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelRepresentation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelRepresentation: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelSpacing [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^nmImagePixelIOM pixelSpacing
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> pixelSpacing: aDSValue [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	nmImagePixelIOM pixelSpacing: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> planarConfiguration [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM planarConfiguration
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> planarConfiguration: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM planarConfiguration: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> positionReferenceIndicator [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM positionReferenceIndicator
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> positionReferenceIndicator: aLOValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM positionReferenceIndicator: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> processingFunction [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM processingFunction
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> processingFunction: aLOValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM processingFunction: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> protocolName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM protocolName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> protocolName: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM protocolName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> pvcRejection [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiGatedAcquisitionIOM pVCRejection
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> pvcRejection: aLOValue [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiGatedAcquisitionIOM pVCRejection: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> qualityControlImage [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM qualityControlImage
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> qualityControlImage: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM qualityControlImage: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_AxisLabels [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisLabels
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_AxisLabels: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisLabels: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_AxisUnits [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_AxisUnits
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_AxisUnits: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_AxisUnits: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CoordinateStartValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStartValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CoordinateStartValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStartValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CoordinateStepValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CoordinateStepValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CoordinateStepValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CoordinateStepValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveData: aUNValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveData: aUNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveDataDescriptor [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDataDescriptor
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveDataDescriptor: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDataDescriptor: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveDescription [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveDescription: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveDimensions [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveDimensions
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveDimensions: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveDimensions: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveLabel [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveLabel
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveLabel: aLOValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveRange [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_CurveRange
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_CurveRange: aSHValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_CurveRange: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_DataValueRepresentation [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_DataValueRepresentation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_DataValueRepresentation: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_DataValueRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_MaximumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MaximumCoordinateValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_MaximumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MaximumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_MinimumCoordinateValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_MinimumCoordinateValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_MinimumCoordinateValue: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_MinimumCoordinateValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_NumberOfPoints [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_NumberOfPoints
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_NumberOfPoints: aUSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_NumberOfPoints: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_ReferencedCurveSequence [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM rETIRED_ReferencedCurveSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_ReferencedCurveSequence: aSQValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM rETIRED_ReferencedCurveSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_ReferencedOverlaySequence [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_ReferencedOverlaySequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_ReferencedOverlaySequence: aSQValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_ReferencedOverlaySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_TypeOfData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_TypeOfData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_TypeOfData: aCSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_TypeOfData: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_VariablePixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rETIRED_VariablePixelData: aUNValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aUNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rOIArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rOIArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rOIMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rOIMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rOIStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rOIStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rRIntervalVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM rRIntervalVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rRIntervalVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM rRIntervalVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> radiopharmaceuticalInformationSequence [

	nmIsotopeIOM isNil ifTrue: [
		nmIsotopeIOM := NMIsotopeIOM new.
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
		nmIsotopeIOM dataElementsValues: self dataElementsValues.
	].

	^nmIsotopeIOM radiopharmaceuticalInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> radiopharmaceuticalInformationSequence: aSQValue [

	nmIsotopeIOM isNil ifTrue: [
		nmIsotopeIOM := NMIsotopeIOM new.
		nmIsotopeIOM dataElementsDictionary: self dataElementsDictionary.
		nmIsotopeIOM dataElementsValues: self dataElementsValues.
	].

	nmIsotopeIOM radiopharmaceuticalInformationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> reconstructionDiameter [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	^nmReconstructionIOM reconstructionDiameter
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> reconstructionDiameter: aDSValue [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	nmReconstructionIOM reconstructionDiameter: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> redPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> redPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> redPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> redPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referencedCurveSequence [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM rETIRED_ReferencedCurveSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referencedCurveSequence: aSQValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM rETIRED_ReferencedCurveSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> referencedFrameNumber [

	^generalImageIOM referencedFrameNumber.
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM referencedImageSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM referencedImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referencedOverlaySequence [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_ReferencedOverlaySequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referencedOverlaySequence: aSQValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_ReferencedOverlaySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedPerformedProcedureStepSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedPerformedProcedureStepSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> referencedSOPClassUID [

	^generalStudyIOM referencedSOPClassUID.
]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> referencedSOPInstanceUID [

	^generalStudyIOM referencedSOPInstanceUID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referencedStudyComponentSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referencedStudyComponentSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> requestAttributesSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> requestAttributesSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM requestAttributesSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> requestProcedureID [

	^generalSeriesIOM requestProcedureID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> roiArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> roiArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> roiMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> roiMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> roiStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> roiStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rotationInformationSequence [

	nmTomoAcquisitionIOM isNil ifTrue: [
		nmTomoAcquisitionIOM := NMTomoAcquisitionIOM new.
		nmTomoAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmTomoAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmTomoAcquisitionIOM rotationInformationSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rotationInformationSequence: aSQValue [

	nmTomoAcquisitionIOM isNil ifTrue: [
		nmTomoAcquisitionIOM := NMTomoAcquisitionIOM new.
		nmTomoAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmTomoAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmTomoAcquisitionIOM rotationInformationSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rotationVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM rotationVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rotationVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM rotationVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rows [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rows
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> rows: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rows: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> rrIntervalVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM rRIntervalVector
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> rrIntervalVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM rRIntervalVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> samplesPerPixel [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^nmImagePixelIOM samplesPerPixel
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> samplesPerPixel: aUSValue [

	nmImagePixelIOM isNil ifTrue: [
		nmImagePixelIOM := NMImagePixelIOM new.
		nmImagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		nmImagePixelIOM dataElementsValues: self dataElementsValues.
	].

	nmImagePixelIOM samplesPerPixel: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> scanLength [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM scanLength
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> scanLength: aISValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM scanLength: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> scanVelocity [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM scanVelocity
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> scanVelocity: aDSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM scanVelocity: aDSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> scheduledActionItemCodeSequence [

	^generalSeriesIOM scheduledActionItemCodeSequence.
]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> scheduledProcedureStepDescription [

	^generalSeriesIOM scheduledProcedureStepDescription.
]

{ #category : #'accessing-dataElements-wrongNames' }
NM_IOD >> scheduledProcedureStepID [

	^generalSeriesIOM scheduledProcedureStepID.
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesInstanceUID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesInstanceUID: aUIValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesNumber [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesNumber
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesNumber: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> seriesTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> skipBeats [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiGatedAcquisitionIOM skipBeats
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> skipBeats: aISValue [

	nmMultiGatedAcquisitionIOM isNil ifTrue: [
		nmMultiGatedAcquisitionIOM := NMMultiGatedAcquisitionIOM new.
		nmMultiGatedAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiGatedAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiGatedAcquisitionIOM skipBeats: aISValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceLocation [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	^nmReconstructionIOM sliceLocation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceLocation: aDSValue [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	nmReconstructionIOM sliceLocation: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceProgressionDirection [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	^nmReconstructionIOM sliceProgressionDirection
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceProgressionDirection: aCSValue [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	nmReconstructionIOM sliceProgressionDirection: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceThickness [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	^nmReconstructionIOM sliceThickness
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceThickness: aDSValue [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	nmReconstructionIOM sliceThickness: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM sliceVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sliceVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM sliceVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> smallestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM smallestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> smallestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM smallestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> smallestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> smallestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM smallestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
NM_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> sopCommonIOM: aSOPCommonIOM [

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
NM_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sourceImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM sourceImageSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> sourceImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM sourceImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> spacingBetweenSlices [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	^nmReconstructionIOM spacingBetweenSlices
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> spacingBetweenSlices: aDSValue [

	nmReconstructionIOM isNil ifTrue: [
		nmReconstructionIOM := NMReconstructionIOM new.
		nmReconstructionIOM dataElementsDictionary: self dataElementsDictionary.
		nmReconstructionIOM dataElementsValues: self dataElementsValues.
	].

	nmReconstructionIOM spacingBetweenSlices: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> tableHeight [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM tableHeight
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> tableHeight: aDSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM tableHeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> tableTransverse [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM tableTraverse
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> tableTransverse: aDSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM tableTraverse: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> tableTraverse [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM tableTraverse
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> tableTraverse: aDSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM tableTraverse: aDSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timeSliceVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM timeSliceVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timeSliceVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM timeSliceVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timeSlotVector [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	^nmMultiFrameIOM timeSlotVector
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timeSlotVector: aUSValue [

	nmMultiFrameIOM isNil ifTrue: [
		nmMultiFrameIOM := NMMultiFrameIOM new.
		nmMultiFrameIOM dataElementsDictionary: self dataElementsDictionary.
		nmMultiFrameIOM dataElementsValues: self dataElementsValues.
	].

	nmMultiFrameIOM timeSlotVector: aUSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> triggerSourceOrType [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM triggerSourceOrType
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> triggerSourceOrType: aLOValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM triggerSourceOrType: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> typeOfData [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	^curveIOM rETIRED_TypeOfData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> typeOfData: aCSValue [

	curveIOM isNil ifTrue: [
		curveIOM := CurveIOM new.
		curveIOM dataElementsDictionary: self dataElementsDictionary.
		curveIOM dataElementsValues: self dataElementsValues.
	].

	curveIOM rETIRED_TypeOfData: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> typeOfDetectorMotion [

	nmTomoAcquisitionIOM isNil ifTrue: [
		nmTomoAcquisitionIOM := NMTomoAcquisitionIOM new.
		nmTomoAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmTomoAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	^nmTomoAcquisitionIOM typeOfDetectorMotion
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> typeOfDetectorMotion: aCSValue [

	nmTomoAcquisitionIOM isNil ifTrue: [
		nmTomoAcquisitionIOM := NMTomoAcquisitionIOM new.
		nmTomoAcquisitionIOM dataElementsDictionary: self dataElementsDictionary.
		nmTomoAcquisitionIOM dataElementsValues: self dataElementsValues.
	].

	nmTomoAcquisitionIOM typeOfDetectorMotion: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> vOILUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> vOILUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM' }
NM_IOD >> voiLUTIOM [

	^voiLUTIOM
]

{ #category : #'accessing IOM' }
NM_IOD >> voiLUTIOM: aVOILUTIOM [

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
NM_IOD >> voiLUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> voiLUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> wholeBodyTechnique [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	^nmImageIOM wholeBodyTechnique
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> wholeBodyTechnique: aCSValue [

	nmImageIOM isNil ifTrue: [
		nmImageIOM := NMImageIOM new.
		nmImageIOM dataElementsDictionary: self dataElementsDictionary.
		nmImageIOM dataElementsValues: self dataElementsValues.
	].

	nmImageIOM wholeBodyTechnique: aCSValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> windowCenter [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenter
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> windowCenter: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenter: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> windowCenterAndWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
NM_IOD >> windowCenterAndWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> windowCenterWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> windowCenterWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
NM_IOD >> windowWidth [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowWidth
]

{ #category : #'accessing IOM data elements' }
NM_IOD >> windowWidth: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowWidth: aDSValue

]
