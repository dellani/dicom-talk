Class {
	#name : #'MR_IOD',
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
		'mrImageIOM',
		'overlayPlaneIOM',
		'voiLUTIOM'
	],
	#category : #'talkDICOM-Objects-IOD'
}

{ #category : #accessing }
MR_IOD class >> DicomIODName [

	^'MR IOD'
]

{ #category : #accessing }
MR_IOD class >> InformationObjectModules [
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
				add: ImagePlaneIOM initialize;
				add: ConstrastBolusIOM initialize;
				add: MRImageIOM initialize;
				add: OverlayPlaneIOM initialize;
				add: VOILUTIOM initialize;
				yourself ]
]

{ #category : #accessing }
MR_IOD class >> SOPClassUID [

	^'1.2.840.10008.5.1.4.1.1.4'
]

{ #category : #'class initialization' }
MR_IOD class >> initialize [

	super initialize.
]

{ #category : #comparing }
MR_IOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber < dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
MR_IOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber <= dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
MR_IOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber > dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
MR_IOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber >= dicomIOD instanceNumber asNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionDateTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionDateTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionDateTime: aDTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionMatrix [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM acquisitionMatrix
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionMatrix: aUSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM acquisitionMatrix: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionNumber [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionNumber: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM acquisitionTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> acquisitionTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM acquisitionTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> angioFlag [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM angioFlag
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> angioFlag: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM angioFlag: aCSValue

]

{ #category : #converting }
MR_IOD >> asDICOMDIR_IE [

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
MR_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> beatRejectionFlag [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM beatRejectionFlag
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> beatRejectionFlag: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM beatRejectionFlag: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bitsAllocated [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM bitsAllocated
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bitsAllocated: aUSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM bitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bitsStored [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bitsStored
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bitsStored: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bitsStored: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bluePaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bluePaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bluePaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM bluePaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bluePaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM bluePaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bodyPartExamined [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM bodyPartExamined
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> bodyPartExamined: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM bodyPartExamined: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> burnedInAnnotation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM burnedInAnnotation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> burnedInAnnotation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM burnedInAnnotation: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> cardiacNumberOfImages [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM cardiacNumberOfImages
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> cardiacNumberOfImages: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM cardiacNumberOfImages: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> cardiacNumberofImages [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM cardiacNumberOfImages
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> cardiacNumberofImages: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM cardiacNumberOfImages: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> columns [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM columns
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> columns: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM columns: aUSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> constrastBolusIOM [

	^constrastBolusIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> constrastBolusIOM: aConstrastBolusIOM [

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
MR_IOD >> contentDate [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contentDate: aDAValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contentTime [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM contentTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contentTime: aTMValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM contentTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> contrastBolusAdministrationRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> contrastBolusAdministrationRoute: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusAdministrationRouteSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAdministrationRouteSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusAdministrationRouteSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAdministrationRouteSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusAgent [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgent
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusAgent: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgent: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusAgentSequence [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusAgentSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusAgentSequence: aSQValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusAgentSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusIngredient [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredient
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusIngredient: aCSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredient: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusIngredientConcentration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusIngredientConcentration
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusIngredientConcentration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusIngredientConcentration: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusRoute [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusRoute
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusRoute: aLOValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusRoute: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusStartTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStartTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusStartTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusStopTime [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusStopTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusStopTime: aTMValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusStopTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusTotalDose [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusTotalDose
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusTotalDose: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusTotalDose: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusVolume [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastBolusVolume
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastBolusVolume: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastBolusVolume: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastFlowDuration [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowDuration
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastFlowDuration: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowDuration: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastFlowRate [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	^constrastBolusIOM contrastFlowRate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> contrastFlowRate: aDSValue [

	constrastBolusIOM isNil ifTrue: [
		constrastBolusIOM := ConstrastBolusIOM new.
		constrastBolusIOM dataElementsDictionary: self dataElementsDictionary.
		constrastBolusIOM dataElementsValues: self dataElementsValues.
	].

	constrastBolusIOM contrastFlowRate: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> dBdt [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM dBdt
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> dBdt: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM dBdt: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> dbdt [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM dBdt
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> dbdt: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM dBdt: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> derivationDescription [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM derivationDescription
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> derivationDescription: aSTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM derivationDescription: aSTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> echoNumber [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM echoNumbers
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> echoNumber: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM echoNumbers: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> echoNumbers [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM echoNumbers
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> echoNumbers: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM echoNumbers: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> echoTime [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM echoTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> echoTime: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM echoTime: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> echoTrainLength [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM echoTrainLength
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> echoTrainLength: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM echoTrainLength: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> flipAngle [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM flipAngle
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> flipAngle: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM flipAngle: aDSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> frameOfReferenceIOM [

	^frameOfReferenceIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> frameOfReferenceIOM: aFrameOfReferenceIOM [

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
MR_IOD >> frameOfReferenceUID [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM frameOfReferenceUID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> frameOfReferenceUID: aUIValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM frameOfReferenceUID: aUIValue

]

{ #category : #'accessing IOM' }
MR_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

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
MR_IOD >> generalImageIOM [

	^generalImageIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> generalImageIOM: aGeneralImageIOM [

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
MR_IOD >> generalSeriesIOM [

	^generalSeriesIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> generalSeriesIOM: aGeneralSeriesIOM [

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
MR_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> generalStudyIOM: aGeneralStudyIOM [

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
MR_IOD >> greenPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> greenPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> greenPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM greenPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> greenPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM greenPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> heartRate [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM heartRate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> heartRate: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM heartRate: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> highBit [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM highBit
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> highBit: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM highBit: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> highRRValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM highRRValue
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> highRRValue: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM highRRValue: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imageComments [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imageComments
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imageComments: aLTValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imageComments: aLTValue

]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> imageDate [

	^generalImageIOM contentDate.
]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> imageNumber [

	^generalImageIOM  instanceNumber.
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imageOrientationPatient [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM imageOrientationPatient
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imageOrientationPatient: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM imageOrientationPatient: aDSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> imagePixelIOM [

	^imagePixelIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> imagePixelIOM: aImagePixelIOM [

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
MR_IOD >> imagePlaneIOM [

	^imagePlaneIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> imagePlaneIOM: aImagePlaneIOM [

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
MR_IOD >> imagePositionPatient [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM imagePositionPatient
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagePositionPatient: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM imagePositionPatient: aDSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> imageTime [

	^generalImageIOM contentTime.
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imageType [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM imageType
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imageType: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM imageType: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagedNucleus [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM imagedNucleus
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagedNucleus: aSHValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM imagedNucleus: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagesInAcquisition [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM imagesInAcquisition
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagesInAcquisition: aISValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM imagesInAcquisition: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagingFrequency [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM imagingFrequency
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> imagingFrequency: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM imagingFrequency: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> inPlanePhaseEncodingDirection [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM inPlanePhaseEncodingDirection
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> inPlanePhaseEncodingDirection: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM inPlanePhaseEncodingDirection: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> intervalsAcquired [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM intervalsAcquired
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> intervalsAcquired: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM intervalsAcquired: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> intervalsRejected [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM intervalsRejected
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> intervalsRejected: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM intervalsRejected: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> inversionTime [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM inversionTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> inversionTime: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM inversionTime: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> largestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM largestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> largestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM largestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> largestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> largestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM largestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> laterality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM laterality
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> laterality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM laterality: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> lossyImageCompression [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompression
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> lossyImageCompression: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompression: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> lossyImageCompressionRatio [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM lossyImageCompressionRatio
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> lossyImageCompressionRatio: aDSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM lossyImageCompressionRatio: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> lowRRValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM lowRRValue
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> lowRRValue: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM lowRRValue: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> mRAcquisitionType [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM mRAcquisitionType
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> mRAcquisitionType: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM mRAcquisitionType: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> magneticFieldStrength [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM magneticFieldStrength
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> magneticFieldStrength: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM magneticFieldStrength: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> modality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM modality
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> modality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM modality: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> mrAcquisitionType [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM mRAcquisitionType
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> mrAcquisitionType: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM mRAcquisitionType: aCSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> mrImageIOM [

	^mrImageIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> mrImageIOM: aMRImageIOM [

	mrImageIOM := aMRImageIOM.
	mrImageIOM encoder: self encoder.

	mrImageIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		mrImageIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
	].

	mrImageIOM dataElementsValues == self dataElementsValues ifFalse: [
		mrImageIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		mrImageIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
MR_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> nominalInterval [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM nominalInterval
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> nominalInterval: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM nominalInterval: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfAverages [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM numberOfAverages
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfAverages: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM numberOfAverages: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfPhaseEncodingSteps [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM numberOfPhaseEncodingSteps
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfPhaseEncodingSteps: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM numberOfPhaseEncodingSteps: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfSeriesRelatedInstances [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfSeriesRelatedInstances: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM numberOfSeriesRelatedInstances: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfTemporalPositions [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM numberOfTemporalPositions
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> numberOfTemporalPositions: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM numberOfTemporalPositions: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> numberofAverages [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM numberOfAverages
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> numberofAverages: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM numberOfAverages: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> numberofPhaseFieldofView [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM numberOfPhaseEncodingSteps
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> numberofPhaseFieldofView: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM numberOfPhaseEncodingSteps: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> numberofTemporalPositions [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM numberOfTemporalPositions
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> numberofTemporalPositions: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM numberOfTemporalPositions: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> operatorsName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM operatorsName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> operatorsName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM operatorsName: aPNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayBitPosition [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitPosition
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayBitPosition: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitPosition: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayBitsAllocated [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitsAllocated
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayBitsAllocated: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayColumns [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayColumns
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayColumns: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayColumns: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayData [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayData
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayData: aOWValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayData: aOWValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayDescription [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayDescription
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayDescription: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayLabel [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayLabel
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayLabel: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayOrigin [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayOrigin
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayOrigin: aSSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayOrigin: aSSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> overlayPlaneIOM [

	^overlayPlaneIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> overlayPlaneIOM: aOverlayPlaneIOM [

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
MR_IOD >> overlayRows [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayRows
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayRows: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayRows: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlaySubtype [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlaySubtype
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlaySubtype: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlaySubtype: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayType [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayType
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> overlayType: aCSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayType: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pVCRejection [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM pVCRejection
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pVCRejection: aLOValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM pVCRejection: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
MR_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> patientIOM: aPatientIOM [

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
MR_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientOrientation [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM patientOrientation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientOrientation: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM patientOrientation: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientPosition [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM patientPosition
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientPosition: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM patientPosition: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> patientStudyIOM: aPatientStudyIOM [

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
MR_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> percentPhaseFieldOfView [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM percentPhaseFieldOfView
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> percentPhaseFieldOfView: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM percentPhaseFieldOfView: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> percentPhaseFieldofView [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM percentPhaseFieldOfView
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> percentPhaseFieldofView: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM percentPhaseFieldOfView: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> percentSampling [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM percentSampling
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> percentSampling: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM percentSampling: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> performedActionItemSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> performedActionItemSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepID: aSHValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepID: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepStartDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepStartDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepStartTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProcedureStepStartTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProtocolCodeSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performedProtocolCodeSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performingPhysicianName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> performingPhysicianName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> performingPhysiciansName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> performingPhysiciansName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> phaseEncodingDirection [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM inPlanePhaseEncodingDirection
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> phaseEncodingDirection: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM inPlanePhaseEncodingDirection: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> photometricInterpretation [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM photometricInterpretation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> photometricInterpretation: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM photometricInterpretation: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelAspectRatio [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelAspectRatio
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelAspectRatio: aISValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelAspectRatio: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelBandwidth [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM pixelBandwidth
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelBandwidth: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM pixelBandwidth: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> pixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> pixelData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aOWValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelRepresentation [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM pixelRepresentation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelRepresentation: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM pixelRepresentation: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelSpacing [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM pixelSpacing
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> pixelSpacing: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM pixelSpacing: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> planarConfiguration [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM planarConfiguration
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> planarConfiguration: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM planarConfiguration: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> positionReferenceIndicator [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	^frameOfReferenceIOM positionReferenceIndicator
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> positionReferenceIndicator: aLOValue [

	frameOfReferenceIOM isNil ifTrue: [
		frameOfReferenceIOM := FrameOfReferenceIOM new.
		frameOfReferenceIOM dataElementsDictionary: self dataElementsDictionary.
		frameOfReferenceIOM dataElementsValues: self dataElementsValues.
	].

	frameOfReferenceIOM positionReferenceIndicator: aLOValue

]

{ #category : #printing }
MR_IOD >> printOn: aStream [
	aStream
		nextPutAll: self modality;
		nextPutAll: ' Image #';
		nextPutAll:
			(self instanceNumber
				ifNil: [ String new padLeftTo: 16r0007 ]
				ifNotNil: [ :arg | arg padLeftTo: 16r0007 ]);
		nextPutAll:
			(self sliceLocation
				ifNil: [ String new padLeftTo: 16r000D ]
				ifNotNil: [ :arg | arg padLeftTo: 16r000D ]);
		nextPutAll:
			(self sliceThickness
				ifNil: [ String new padLeftTo: 16r0010 ]
				ifNotNil: [ :arg | arg padLeftTo: 16r0010 ])
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> protocolName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM protocolName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> protocolName: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM protocolName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> pvcRejection [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM pVCRejection
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> pvcRejection: aLOValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM pVCRejection: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> qualityControlImage [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM qualityControlImage
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> qualityControlImage: aCSValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM qualityControlImage: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rETIRED_VariablePixelData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rETIRED_VariablePixelData
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rETIRED_VariablePixelData: aUNValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rETIRED_VariablePixelData: aUNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rOIArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rOIArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rOIMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rOIMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rOIStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rOIStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> receiveCoilName [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM receiveCoilName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> receiveCoilName: aSHValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM receiveCoilName: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> receivingCoil [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM receiveCoilName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> receivingCoil: aSHValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM receiveCoilName: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> reconstructionDiameter [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM reconstructionDiameter
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> reconstructionDiameter: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM reconstructionDiameter: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> redPaletteColorLookupTableData [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableData
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> redPaletteColorLookupTableData: aOWValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableData: aOWValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> redPaletteColorLookupTableDescriptor [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM redPaletteColorLookupTableDescriptor
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> redPaletteColorLookupTableDescriptor: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM redPaletteColorLookupTableDescriptor: aSSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> referencedFrameNumber [

	^generalImageIOM referencedFrameNumber.
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM referencedImageSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM referencedImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedPerformedProcedureStepSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedPerformedProcedureStepSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> referencedSOPClassUID [

	^generalStudyIOM referencedSOPClassUID.
]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> referencedSOPInstanceUID [

	^generalStudyIOM referencedSOPInstanceUID.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> referencedStudyComponentSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> referencedStudyComponentSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> repetitionTime [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM repetitionTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> repetitionTime: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM repetitionTime: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> requestAttributesSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> requestAttributesSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM requestAttributesSequence: aSQValue

]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> requestProcedureID [

	^generalSeriesIOM requestProcedureID.
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rescaleIntercept [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM rescaleIntercept
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rescaleIntercept: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM rescaleIntercept: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rescaleSlope [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM rescaleSlope
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rescaleSlope: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM rescaleSlope: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rescaleType [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM rescaleType
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rescaleType: aLOValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM rescaleType: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> roiArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> roiArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> roiMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> roiMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> roiStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> roiStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rows [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM rows
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> rows: aUSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM rows: aUSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sAR [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM sAR
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sAR: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM sAR: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> samplesPerPixel [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM samplesPerPixel
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> samplesPerPixel: aUSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM samplesPerPixel: aUSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sar [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM sAR
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sar: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM sAR: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> scanOptions [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM scanOptions
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> scanOptions: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM scanOptions: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> scanningSequence [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM scanningSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> scanningSequence: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM scanningSequence: aCSValue

]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> scheduledActionItemCodeSequence [

	^generalSeriesIOM scheduledActionItemCodeSequence.
]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> scheduledProcedureStepDescription [

	^generalSeriesIOM scheduledProcedureStepDescription.
]

{ #category : #'accessing-dataElements-wrongNames' }
MR_IOD >> scheduledProcedureStepID [

	^generalSeriesIOM scheduledProcedureStepID.
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sequenceName [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM sequenceName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sequenceName: aSHValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM sequenceName: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sequenceVariant [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM sequenceVariant
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sequenceVariant: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM sequenceVariant: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDescription
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesInstanceUID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesInstanceUID: aUIValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesNumber [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesNumber
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesNumber: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> seriesTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> skipBeats [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM skipBeats
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> skipBeats: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM skipBeats: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sliceLocation [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM sliceLocation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sliceLocation: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM sliceLocation: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sliceThickness [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	^imagePlaneIOM sliceThickness
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sliceThickness: aDSValue [

	imagePlaneIOM isNil ifTrue: [
		imagePlaneIOM := ImagePlaneIOM new.
		imagePlaneIOM dataElementsDictionary: self dataElementsDictionary.
		imagePlaneIOM dataElementsValues: self dataElementsValues.
	].

	imagePlaneIOM sliceThickness: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> smallestImagePixelValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	^imagePixelIOM smallestImagePixelValue
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> smallestImagePixelValue: aSSValue [

	imagePixelIOM isNil ifTrue: [
		imagePixelIOM := ImagePixelIOM new.
		imagePixelIOM dataElementsDictionary: self dataElementsDictionary.
		imagePixelIOM dataElementsValues: self dataElementsValues.
	].

	imagePixelIOM smallestImagePixelValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> smallestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> smallestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM smallestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
MR_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> sopCommonIOM: aSOPCommonIOM [

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
MR_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sourceImageSequence [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	^generalImageIOM sourceImageSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> sourceImageSequence: aSQValue [

	generalImageIOM isNil ifTrue: [
		generalImageIOM := GeneralImageIOM new.
		generalImageIOM dataElementsDictionary: self dataElementsDictionary.
		generalImageIOM dataElementsValues: self dataElementsValues.
	].

	generalImageIOM sourceImageSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> spacingBetweenSlices [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM spacingBetweenSlices
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> spacingBetweenSlices: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM spacingBetweenSlices: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> temporalPositionIdentifier [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM temporalPositionIdentifier
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> temporalPositionIdentifier: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM temporalPositionIdentifier: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> temporalResolution [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM temporalResolution
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> temporalResolution: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM temporalResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> transmitCoilName [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM transmitCoilName
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> transmitCoilName: aSHValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM transmitCoilName: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> transmitionCoil [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM transmitCoilName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> transmitionCoil: aSHValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM transmitCoilName: aSHValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> triggerTime [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM triggerTime
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> triggerTime: aDSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM triggerTime: aDSValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> triggerWindow [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM triggerWindow
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> triggerWindow: aISValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM triggerWindow: aISValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> vOILUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> vOILUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> variableFlipAngleFlag [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	^mrImageIOM variableFlipAngleFlag
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> variableFlipAngleFlag: aCSValue [

	mrImageIOM isNil ifTrue: [
		mrImageIOM := MRImageIOM new.
		mrImageIOM dataElementsDictionary: self dataElementsDictionary.
		mrImageIOM dataElementsValues: self dataElementsValues.
	].

	mrImageIOM variableFlipAngleFlag: aCSValue

]

{ #category : #'accessing IOM' }
MR_IOD >> voiLUTIOM [

	^voiLUTIOM
]

{ #category : #'accessing IOM' }
MR_IOD >> voiLUTIOM: aVOILUTIOM [

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
MR_IOD >> voiLUTSequence [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM vOILUTSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> voiLUTSequence: aSQValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM vOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> windowCenter [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenter
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> windowCenter: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenter: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> windowCenterAndWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
MR_IOD >> windowCenterAndWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> windowCenterWidthExplanation [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowCenterWidthExplanation
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> windowCenterWidthExplanation: aLOValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowCenterWidthExplanation: aLOValue

]

{ #category : #'accessing IOM data elements' }
MR_IOD >> windowWidth [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	^voiLUTIOM windowWidth
]

{ #category : #'accessing IOM data elements' }
MR_IOD >> windowWidth: aDSValue [

	voiLUTIOM isNil ifTrue: [
		voiLUTIOM := VOILUTIOM new.
		voiLUTIOM dataElementsDictionary: self dataElementsDictionary.
		voiLUTIOM dataElementsValues: self dataElementsValues.
	].

	voiLUTIOM windowWidth: aDSValue

]
