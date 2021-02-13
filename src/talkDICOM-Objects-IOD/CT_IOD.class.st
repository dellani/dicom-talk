Class {
	#name : #'CT_IOD',
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
		'imagePlaneIOM',
		'constrastBolusIOM',
		'ctImageIOM',
		'overlayPlaneIOM',
		'voiLUTIOM'
	],
	#category : #'talkDICOM-Objects-IOD'
}

{ #category : #accessing }
CT_IOD class >> DicomIODName [

	^'CT IOD'
]

{ #category : #accessing }
CT_IOD class >> InformationObjectModules [

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
				add: FrameOfReferenceIOM initialize;
				add: ImagePlaneIOM initialize;
				add: ConstrastBolusIOM initialize;
				add: CTImageIOM initialize;
				add: OverlayPlaneIOM initialize;
				add: VOILUTIOM initialize;
				yourself]
]

{ #category : #accessing }
CT_IOD class >> SOPClassUID [

	^'1.2.840.10008.5.1.4.1.1.2'
]

{ #category : #'class initialization' }
CT_IOD class >> initialize [

	super initialize.
]

{ #category : #comparing }
CT_IOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber < dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
CT_IOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber <= dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
CT_IOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber > dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
CT_IOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber >= dicomIOD instanceNumber asNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionDateTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDateTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionDateTime: aDTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionNumber [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM acquisitionNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionNumber: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM acquisitionNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> acquisitionTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #converting }
CT_IOD >> asDICOMDIR_IE [

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
CT_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bitsAllocated [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM bitsAllocated
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bitsAllocated: aUSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM bitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bitsStored [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM bitsStored
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bitsStored: aUSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM bitsStored: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bluePaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bluePaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bluePaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bluePaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bodyPartExamined [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM bodyPartExamined
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> bodyPartExamined: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM bodyPartExamined: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> burnedInAnnotation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM burnedInAnnotation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> burnedInAnnotation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM burnedInAnnotation: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> columns [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM columns
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> columns: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM columns: aUSValue

]

{ #category : #'accessing IOM' }
CT_IOD >> constrastBolusIOM [

	^constrastBolusIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> constrastBolusIOM: aConstrastBolusIOM [

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
CT_IOD >> contentDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contentDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contentTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contentTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> contrastBolusAdministrationRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> contrastBolusAdministrationRoute: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusAdministrationRouteSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusAdministrationRouteSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusAgent [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgent
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusAgent: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgent: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusAgentSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgentSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusAgentSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgentSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusIngredient [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredient
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusIngredient: aCSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredient: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusIngredientConcentration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredientConcentration
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusIngredientConcentration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredientConcentration: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusRoute
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusRoute: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusRoute: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusStartTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStartTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusStartTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusStopTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStopTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusStopTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStopTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusTotalDose [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusTotalDose
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusTotalDose: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusTotalDose: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusVolume [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusVolume
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastBolusVolume: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusVolume: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastFlowDuration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowDuration
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastFlowDuration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowDuration: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastFlowRate [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowRate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> contrastFlowRate: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowRate: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> convolutionKernel [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM convolutionKernel
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> convolutionKernel: aSHValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM convolutionKernel: aSHValue

]

{ #category : #'accessing IOM' }
CT_IOD >> ctImageIOM [

	^ctImageIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> ctImageIOM: aCTImageIOM [

	ctImageIOM := aCTImageIOM.
	ctImageIOM encoder: self encoder.

	ctImageIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		ctImageIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
	].

	ctImageIOM dataElementsValues == self dataElementsValues ifFalse: [
		ctImageIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		ctImageIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CT_IOD >> dataCollectionDiameter [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM dataCollectionDiameter
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> dataCollectionDiameter: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM dataCollectionDiameter: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> derivationDescription [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM derivationDescription
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> derivationDescription: aSTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM derivationDescription: aSTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> distanceSourceToDetector [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM distanceSourceToDetector
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> distanceSourceToDetector: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM distanceSourceToDetector: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> distanceSourceToPatient [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM distanceSourceToPatient
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> distanceSourceToPatient: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM distanceSourceToPatient: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> exposure [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM exposure
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> exposure: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM exposure: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> exposureInmAS [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM exposureInuAs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> exposureInmAS: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM exposureInuAs: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> exposureInuAs [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM exposureInuAs
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> exposureInuAs: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM exposureInuAs: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> exposureTime [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM exposureTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> exposureTime: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM exposureTime: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> filterType [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM filterType
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> filterType: aSHValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM filterType: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> focalSpot [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM focalSpots
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> focalSpot: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM focalSpots: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> focalSpots [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM focalSpots
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> focalSpots: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM focalSpots: aDSValue

]

{ #category : #'accessing IOM' }
CT_IOD >> frameOfReferenceIOM [

	^frameOfReferenceIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> frameOfReferenceIOM: aFrameOfReferenceIOM [

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
CT_IOD >> frameOfReferenceUID [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM frameOfReferenceUID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> frameOfReferenceUID: aUIValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM frameOfReferenceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> gantryDetectorTilt [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM gantryDetectorTilt
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> gantryDetectorTilt: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM gantryDetectorTilt: aDSValue

]

{ #category : #'accessing IOM' }
CT_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

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
CT_IOD >> generalImageIOM [

	^generalImageIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> generalImageIOM: aGeneralImageIOM [

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
CT_IOD >> generalSeriesIOM [

	^generalSeriesIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> generalSeriesIOM: aGeneralSeriesIOM [

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
CT_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> generalStudyIOM: aGeneralStudyIOM [

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
CT_IOD >> generatorPower [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM generatorPower
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> generatorPower: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM generatorPower: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> greenPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> greenPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> greenPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> greenPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> highBit [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM highBit
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> highBit: aUSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM highBit: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imageComments [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imageComments
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imageComments: aLTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imageComments: aLTValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> imageDate [

	^generalImageIOM contentDate.
]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> imageNumber [

	^generalImageIOM  instanceNumber.
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imageOrientationPatient [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM imageOrientationPatient
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imageOrientationPatient: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM imageOrientationPatient: aDSValue

]

{ #category : #'accessing IOM' }
CT_IOD >> imagePixelIOM [

	^imagePixelIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> imagePixelIOM: aImagePixelIOM [

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

{ #category : #'accessing IOM' }
CT_IOD >> imagePlaneIOM [

	^imagePlaneIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> imagePlaneIOM: aImagePlaneIOM [

	imagePlaneIOM := aImagePlaneIOM.
	imagePlaneIOM encoder: self encoder.

	imagePlaneIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		imagePlaneIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
	].

	imagePlaneIOM dataElementsValues == self dataElementsValues ifFalse: [
		imagePlaneIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		imagePlaneIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imagePositionPatient [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM imagePositionPatient
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imagePositionPatient: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM imagePositionPatient: aDSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> imageTime [

	^generalImageIOM contentTime.
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imageType [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM imageType
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imageType: aCSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM imageType: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imagesInAcquisition [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imagesInAcquisition
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> imagesInAcquisition: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imagesInAcquisition: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> kVP [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM kVP
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> kVP: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM kVP: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> largestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM largestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> largestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM largestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> largestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> largestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM largestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> laterality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM laterality
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> laterality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM laterality: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> lossyImageCompression [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompression
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> lossyImageCompression: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompression: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> lossyImageCompressionRatio [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompressionRatio
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> lossyImageCompressionRatio: aDSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompressionRatio: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> modality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM modality
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> modality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM modality: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> numberOfSeriesRelatedInstances [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> numberOfSeriesRelatedInstances: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM numberOfSeriesRelatedInstances: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> operatorsName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM operatorsName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> operatorsName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM operatorsName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayBitPosition [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitPosition
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayBitPosition: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitPosition: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayBitsAllocated [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitsAllocated
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayBitsAllocated: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayColumns [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayColumns
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayColumns: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayColumns: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayData [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayData
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayData: aOWValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayDescription [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayDescription
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayDescription: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayLabel [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayLabel
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayLabel: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayOrigin [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayOrigin
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayOrigin: aSSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayOrigin: aSSValue

]

{ #category : #'accessing IOM' }
CT_IOD >> overlayPlaneIOM [

	^overlayPlaneIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> overlayPlaneIOM: aOverlayPlaneIOM [

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
CT_IOD >> overlayRows [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayRows
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayRows: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayRows: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlaySubtype [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlaySubtype
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlaySubtype: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlaySubtype: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayType [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayType
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> overlayType: aCSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayType: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
CT_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> patientIOM: aPatientIOM [

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
CT_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientOrientation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM patientOrientation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientOrientation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM patientOrientation: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientPosition [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM patientPosition
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientPosition: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM patientPosition: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
CT_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> patientStudyIOM: aPatientStudyIOM [

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
CT_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> performedActionItemSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> performedActionItemSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepID: aSHValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepID: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepStartDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepStartDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepStartTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProcedureStepStartTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProtocolCodeSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performedProtocolCodeSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performingPhysicianName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> performingPhysicianName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> performingPhysiciansName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> performingPhysiciansName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> photometricInterpretation [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM photometricInterpretation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> photometricInterpretation: aCSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM photometricInterpretation: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelAspectRatio [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelAspectRatio
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelAspectRatio: aISValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelAspectRatio: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> pixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> pixelData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelRepresentation [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelRepresentation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelRepresentation: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelSpacing [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM pixelSpacing
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> pixelSpacing: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM pixelSpacing: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> planarConfiguration [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM planarConfiguration
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> planarConfiguration: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM planarConfiguration: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> positionReferenceIndicator [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM positionReferenceIndicator
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> positionReferenceIndicator: aLOValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM positionReferenceIndicator: aLOValue

]

{ #category : #printing }
CT_IOD >> printOn: aStream [ 

	aStream nextPutAll: self modality, ' Image #'.

	self instanceNumber isNil 
		ifFalse: [self instanceNumber printOn: aStream paddedWith: Character space to: 16r0007]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0007].

	self sliceLocation isNil 
		ifFalse: [self sliceLocation printOn: aStream paddedWith: Character space to: 16r000D]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0010].
	self sliceThickness isNil 
		ifFalse: [self sliceThickness asNumber asFloat printString printOn: aStream paddedWith: Character space to: 16r0010]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0010].
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> protocolName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM protocolName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> protocolName: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM protocolName: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> qualityControlImage [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM qualityControlImage
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> qualityControlImage: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM qualityControlImage: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rETIRED_VariablePixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rETIRED_VariablePixelData: aUNValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aUNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rOIArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rOIArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rOIMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rOIMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rOIStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rOIStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> reconstructionDiameter [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM reconstructionDiameter
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> reconstructionDiameter: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM reconstructionDiameter: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> reconstrutionDiameter [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM reconstructionDiameter
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> reconstrutionDiameter: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM reconstructionDiameter: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> redPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> redPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> redPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> redPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> referencedFrameNumber [

	^generalImageIOM referencedFrameNumber.
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM referencedImageSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM referencedImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedPerformedProcedureStepSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedPerformedProcedureStepSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> referencedSOPClassUID [

	^generalStudyIOM referencedSOPClassUID.
]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> referencedSOPInstanceUID [

	^generalStudyIOM referencedSOPInstanceUID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> referencedStudyComponentSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> referencedStudyComponentSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> requestAttributesSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> requestAttributesSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM requestAttributesSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> requestProcedureID [

	^generalSeriesIOM requestProcedureID.
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rescaleIntercept [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM rescaleIntercept
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rescaleIntercept: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM rescaleIntercept: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rescaleSlope [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM rescaleSlope
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rescaleSlope: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM rescaleSlope: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> roiArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> roiArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> roiMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> roiMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> roiStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> roiStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rotationDirection [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM rotationDirection
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rotationDirection: aCSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM rotationDirection: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rows [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rows
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> rows: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rows: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> samplesPerPixel [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM samplesPerPixel
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> samplesPerPixel: aUSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM samplesPerPixel: aUSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> scanOptions [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM scanOptions
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> scanOptions: aCSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM scanOptions: aCSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> scheduledActionItemCodeSequence [

	^generalSeriesIOM scheduledActionItemCodeSequence.
]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> scheduledProcedureStepDescription [

	^generalSeriesIOM scheduledProcedureStepDescription.
]

{ #category : #'accessing-dataElements-wrongNames' }
CT_IOD >> scheduledProcedureStepID [

	^generalSeriesIOM scheduledProcedureStepID.
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDescription
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesInstanceUID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesInstanceUID: aUIValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesNumber [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesNumber
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesNumber: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> seriesTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sliceLocation [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM sliceLocation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sliceLocation: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM sliceLocation: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sliceThickness [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM sliceThickness
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sliceThickness: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM sliceThickness: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> smallestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM smallestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> smallestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM smallestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> smallestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> smallestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM smallestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
CT_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> sopCommonIOM: aSOPCommonIOM [

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
CT_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sourceImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM sourceImageSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> sourceImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM sourceImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> tableHeight [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM tableHeight
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> tableHeight: aDSValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM tableHeight: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> vOILUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> vOILUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM' }
CT_IOD >> voiLUTIOM [

	^voiLUTIOM
]

{ #category : #'accessing IOM' }
CT_IOD >> voiLUTIOM: aVOILUTIOM [

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
CT_IOD >> voiLUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> voiLUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> windowCenter [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenter
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> windowCenter: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenter: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> windowCenterAndWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
CT_IOD >> windowCenterAndWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> windowCenterWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> windowCenterWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> windowWidth [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowWidth
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> windowWidth: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowWidth: aDSValue

]

{ #category : #'accessing IOM data elements' }
CT_IOD >> xRayTubeCurrent [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	^ctImageIOM xRayTubeCurrent
]

{ #category : #'accessing IOM data elements' }
CT_IOD >> xRayTubeCurrent: aISValue [

	ctImageIOM isNil ifTrue: [
		ctImageIOM := CTImageIOM new.
		ctImageIOM dataElementsDictionary: self dataElementsDictionary.
		ctImageIOM dataElementsValues: self dataElementsValues.
	].

	ctImageIOM xRayTubeCurrent: aISValue

]
