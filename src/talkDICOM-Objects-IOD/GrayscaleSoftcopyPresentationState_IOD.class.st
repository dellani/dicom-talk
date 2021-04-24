Class {
	#name : #'GrayscaleSoftcopyPresentationState_IOD',
	#superclass : #DicomIOD,
	#instVars : [
		'patientIOM',
		'generalStudyIOM',
		'patientStudyIOM',
		'generalSeriesIOM',
		'presentationSeriesIOM',
		'generalEquipmentIOM',
		'presentationStateIOM',
		'maskIOM',
		'displayShutterIOM',
		'bitmapDisplayShutterIOM',
		'overlayPlaneIOM',
		'overlayCurveActivationIOM',
		'displayedAreaIOM',
		'graphicAnnotationIOM',
		'spacialTransformationIOM',
		'graphicLayerIOM',
		'modalityLUTIOM',
		'softcopyVOI_LUT_IOM',
		'softcopyPresentationLUTIOM',
		'sopCommonIOM'
	],
	#category : #'talkDICOM-Objects-IOD'
}

{ #category : #accessing }
GrayscaleSoftcopyPresentationState_IOD class >> DicomIODName [

	^'Grayscale Softcopy Presentation State IOD'
]

{ #category : #accessing }
GrayscaleSoftcopyPresentationState_IOD class >> InformationObjectModules [
	^ InformationObjectModules
		ifNil: [ InformationObjectModules := OrderedCollection new.
			InformationObjectModules
				add: PatientIOM initialize;
				add: GeneralStudyIOM initialize;
				add: PatientStudyIOM initialize;
				add: GeneralSeriesIOM initialize;
				add: PresentationSeriesIOM initialize;
				add: GeneralEquipmentIOM initialize;
				add: PresentationStateIOM initialize;
				add: MaskIOM initialize;
				add: DisplayShutterIOM initialize;
				add: BitmapDisplayShutterIOM initialize;
				add: OverlayPlaneIOM initialize;
				add: OverlayCurveActivationIOM initialize;
				add: DisplayedAreaIOM initialize;
				add: GraphicAnnotationIOM initialize;
				add: SpacialTransformationIOM initialize;
				add: GraphicLayerIOM initialize;
				add: ModalityLUTIOM initialize;
				add: SoftcopyVOI_LUT_IOM initialize;
				add: SoftcopyPresentationLUTIOM initialize;
				add: SOPCommonIOM initialize;
				yourself ]
]

{ #category : #'class initialization' }
GrayscaleSoftcopyPresentationState_IOD class >> initialize [
	self initializeDataElementsDefinition.
	DicomRegistry registerIOD: self
]

{ #category : #accessing }
GrayscaleSoftcopyPresentationState_IOD class >> sopClassUID [
	^ '1.2.840.10008.5.1.4.1.1.11.1'
]

{ #category : #'textual attributes definition' }
GrayscaleSoftcopyPresentationState_IOD class >> textualAttributesDefinition [
	"Textual attributes definition for Grayscale Softcopy Presentation State IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-04-24T16:26:27.739248+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM presentationSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM presentationStateIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM maskIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM displayShutterIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM bitmapDisplayShutterIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayCurveActivationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM displayedAreaIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM graphicAnnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM spacialTransformationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM graphicLayerIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM modalityLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM softcopyVOI_LUT_IOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM softcopyPresentationLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #comparing }
GrayscaleSoftcopyPresentationState_IOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber < dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
GrayscaleSoftcopyPresentationState_IOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber <= dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
GrayscaleSoftcopyPresentationState_IOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber > dicomIOD instanceNumber asNumber
]

{ #category : #comparing }
GrayscaleSoftcopyPresentationState_IOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self instanceNumber asNumber >= dicomIOD instanceNumber asNumber
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> SoftcopyVOI_LUT_Sequence [

	softcopyVOI_LUT_IOM isNil ifTrue: [
		softcopyVOI_LUT_IOM := SoftcopyVOI_LUT_IOM new.
		softcopyVOI_LUT_IOM dataElementsDictionary: self dataElementsDictionary.
		softcopyVOI_LUT_IOM dataElementsValues: self dataElementsValues.
	].

	^softcopyVOI_LUT_IOM softcopyVOILUTSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> SoftcopyVOI_LUT_Sequence: aSQValue [

	softcopyVOI_LUT_IOM isNil ifTrue: [
		softcopyVOI_LUT_IOM := SoftcopyVOI_LUT_IOM new.
		softcopyVOI_LUT_IOM dataElementsDictionary: self dataElementsDictionary.
		softcopyVOI_LUT_IOM dataElementsValues: self dataElementsValues.
	].

	softcopyVOI_LUT_IOM softcopyVOILUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> bitmapDisplayShutterIOM [

	^bitmapDisplayShutterIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> bitmapDisplayShutterIOM: aBitmapDisplayShutterIOM [

	bitmapDisplayShutterIOM := aBitmapDisplayShutterIOM.
	bitmapDisplayShutterIOM encoder: self encoder.

	bitmapDisplayShutterIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		bitmapDisplayShutterIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
	].

	bitmapDisplayShutterIOM dataElementsValues == self dataElementsValues ifFalse: [
		bitmapDisplayShutterIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> bodyPartExamined [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM bodyPartExamined
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> bodyPartExamined: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM bodyPartExamined: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> centerOfCircularShutter [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM centerOfCircularShutter
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> centerOfCircularShutter: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM centerOfCircularShutter: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> contentCreatorName [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM contentCreatorName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> contentCreatorName: aPNValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM contentCreatorName: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> contentDescription [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM contentDescription
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> contentDescription: aLOValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM contentDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> contentLabel [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM contentLabel
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> contentLabel: aCSValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM contentLabel: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> curveActivationLayer [

	overlayCurveActivationIOM isNil ifTrue: [
		overlayCurveActivationIOM := OverlayCurveActivationIOM new.
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues.
	].

	^overlayCurveActivationIOM rETIRED_CurveActivationLayer
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> curveActivationLayer: aCSValue [

	overlayCurveActivationIOM isNil ifTrue: [
		overlayCurveActivationIOM := OverlayCurveActivationIOM new.
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues.
	].

	overlayCurveActivationIOM rETIRED_CurveActivationLayer: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> displayShutterIOM [

	^displayShutterIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> displayShutterIOM: aDisplayShutterIOM [

	displayShutterIOM := aDisplayShutterIOM.
	displayShutterIOM encoder: self encoder.

	displayShutterIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		displayShutterIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
	].

	displayShutterIOM dataElementsValues == self dataElementsValues ifFalse: [
		displayShutterIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		displayShutterIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> displayedAreaIOM [

	^displayedAreaIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> displayedAreaIOM: aDisplayedAreaIOM [

	displayedAreaIOM := aDisplayedAreaIOM.
	displayedAreaIOM encoder: self encoder.

	displayedAreaIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		displayedAreaIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		displayedAreaIOM dataElementsDictionary: self dataElementsDictionary.
	].

	displayedAreaIOM dataElementsValues == self dataElementsValues ifFalse: [
		displayedAreaIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		displayedAreaIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> displayedAreaSelectionSequence [

	displayedAreaIOM isNil ifTrue: [
		displayedAreaIOM := DisplayedAreaIOM new.
		displayedAreaIOM dataElementsDictionary: self dataElementsDictionary.
		displayedAreaIOM dataElementsValues: self dataElementsValues.
	].

	^displayedAreaIOM displayedAreaSelectionSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> displayedAreaSelectionSequence: aSQValue [

	displayedAreaIOM isNil ifTrue: [
		displayedAreaIOM := DisplayedAreaIOM new.
		displayedAreaIOM dataElementsDictionary: self dataElementsDictionary.
		displayedAreaIOM dataElementsValues: self dataElementsValues.
	].

	displayedAreaIOM displayedAreaSelectionSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> generalSeriesIOM [

	^generalSeriesIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> generalSeriesIOM: aGeneralSeriesIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> generalStudyIOM: aGeneralStudyIOM [

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

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> graphicAnnotationIOM [

	^graphicAnnotationIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> graphicAnnotationIOM: aGraphicAnnotationIOM [

	graphicAnnotationIOM := aGraphicAnnotationIOM.
	graphicAnnotationIOM encoder: self encoder.

	graphicAnnotationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		graphicAnnotationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		graphicAnnotationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	graphicAnnotationIOM dataElementsValues == self dataElementsValues ifFalse: [
		graphicAnnotationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		graphicAnnotationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> graphicAnnotationSequence [

	graphicAnnotationIOM isNil ifTrue: [
		graphicAnnotationIOM := GraphicAnnotationIOM new.
		graphicAnnotationIOM dataElementsDictionary: self dataElementsDictionary.
		graphicAnnotationIOM dataElementsValues: self dataElementsValues.
	].

	^graphicAnnotationIOM graphicAnnotationSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> graphicAnnotationSequence: aSQValue [

	graphicAnnotationIOM isNil ifTrue: [
		graphicAnnotationIOM := GraphicAnnotationIOM new.
		graphicAnnotationIOM dataElementsDictionary: self dataElementsDictionary.
		graphicAnnotationIOM dataElementsValues: self dataElementsValues.
	].

	graphicAnnotationIOM graphicAnnotationSequence: aSQValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> graphicLayerIOM [

	^graphicLayerIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> graphicLayerIOM: aGraphicLayerIOM [

	graphicLayerIOM := aGraphicLayerIOM.
	graphicLayerIOM encoder: self encoder.

	graphicLayerIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		graphicLayerIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		graphicLayerIOM dataElementsDictionary: self dataElementsDictionary.
	].

	graphicLayerIOM dataElementsValues == self dataElementsValues ifFalse: [
		graphicLayerIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		graphicLayerIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> graphicLayerSequence [

	graphicLayerIOM isNil ifTrue: [
		graphicLayerIOM := GraphicLayerIOM new.
		graphicLayerIOM dataElementsDictionary: self dataElementsDictionary.
		graphicLayerIOM dataElementsValues: self dataElementsValues.
	].

	^graphicLayerIOM graphicLayerSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> graphicLayerSequence: aSQValue [

	graphicLayerIOM isNil ifTrue: [
		graphicLayerIOM := GraphicLayerIOM new.
		graphicLayerIOM dataElementsDictionary: self dataElementsDictionary.
		graphicLayerIOM dataElementsValues: self dataElementsValues.
	].

	graphicLayerIOM graphicLayerSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> imageHorizontalFlip [

	spacialTransformationIOM isNil ifTrue: [
		spacialTransformationIOM := SpacialTransformationIOM new.
		spacialTransformationIOM dataElementsDictionary: self dataElementsDictionary.
		spacialTransformationIOM dataElementsValues: self dataElementsValues.
	].

	^spacialTransformationIOM imageHorizontalFlip
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> imageHorizontalFlip: aCSValue [

	spacialTransformationIOM isNil ifTrue: [
		spacialTransformationIOM := SpacialTransformationIOM new.
		spacialTransformationIOM dataElementsDictionary: self dataElementsDictionary.
		spacialTransformationIOM dataElementsValues: self dataElementsValues.
	].

	spacialTransformationIOM imageHorizontalFlip: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> imageRotation [

	spacialTransformationIOM isNil ifTrue: [
		spacialTransformationIOM := SpacialTransformationIOM new.
		spacialTransformationIOM dataElementsDictionary: self dataElementsDictionary.
		spacialTransformationIOM dataElementsValues: self dataElementsValues.
	].

	^spacialTransformationIOM imageRotation
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> imageRotation: aUSValue [

	spacialTransformationIOM isNil ifTrue: [
		spacialTransformationIOM := SpacialTransformationIOM new.
		spacialTransformationIOM dataElementsDictionary: self dataElementsDictionary.
		spacialTransformationIOM dataElementsValues: self dataElementsValues.
	].

	spacialTransformationIOM imageRotation: aUSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> largestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> largestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM largestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> laterality [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM laterality
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> laterality: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM laterality: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> maskIOM [

	^maskIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> maskIOM: aMaskIOM [

	maskIOM := aMaskIOM.
	maskIOM encoder: self encoder.

	maskIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		maskIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		maskIOM dataElementsDictionary: self dataElementsDictionary.
	].

	maskIOM dataElementsValues == self dataElementsValues ifFalse: [
		maskIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		maskIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> maskSubtractionSequence [

	maskIOM isNil ifTrue: [
		maskIOM := MaskIOM new.
		maskIOM dataElementsDictionary: self dataElementsDictionary.
		maskIOM dataElementsValues: self dataElementsValues.
	].

	^maskIOM maskSubtractionSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> maskSubtractionSequence: aSQValue [

	maskIOM isNil ifTrue: [
		maskIOM := MaskIOM new.
		maskIOM dataElementsDictionary: self dataElementsDictionary.
		maskIOM dataElementsValues: self dataElementsValues.
	].

	maskIOM maskSubtractionSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> modality [

	presentationSeriesIOM isNil ifTrue: [
		presentationSeriesIOM := PresentationSeriesIOM new.
		presentationSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		presentationSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^presentationSeriesIOM modality
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> modality: aCSValue [

	presentationSeriesIOM isNil ifTrue: [
		presentationSeriesIOM := PresentationSeriesIOM new.
		presentationSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		presentationSeriesIOM dataElementsValues: self dataElementsValues.
	].

	presentationSeriesIOM modality: aCSValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> modalityLUTIOM [

	^modalityLUTIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> modalityLUTIOM: aModalityLUTIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> modalityLUTSequence [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM modalityLUTSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> modalityLUTSequence: aSQValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM modalityLUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> numberOfSeriesRelatedInstances [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> numberOfSeriesRelatedInstances: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM numberOfSeriesRelatedInstances: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> operatorsName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM operatorsName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> operatorsName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM operatorsName: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayActivationLayer [

	overlayCurveActivationIOM isNil ifTrue: [
		overlayCurveActivationIOM := OverlayCurveActivationIOM new.
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues.
	].

	^overlayCurveActivationIOM overlayActivationLayer
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayActivationLayer: aCSValue [

	overlayCurveActivationIOM isNil ifTrue: [
		overlayCurveActivationIOM := OverlayCurveActivationIOM new.
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues.
	].

	overlayCurveActivationIOM overlayActivationLayer: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayBitPosition [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitPosition
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayBitPosition: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitPosition: aUSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayBitsAllocated [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayBitsAllocated
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayBitsAllocated: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayBitsAllocated: aUSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayColumns [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayColumns
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayColumns: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayColumns: aUSValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> overlayCurveActivationIOM [

	^overlayCurveActivationIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> overlayCurveActivationIOM: aOverlayCurveActivationIOM [

	overlayCurveActivationIOM := aOverlayCurveActivationIOM.
	overlayCurveActivationIOM encoder: self encoder.

	overlayCurveActivationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		overlayCurveActivationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	overlayCurveActivationIOM dataElementsValues == self dataElementsValues ifFalse: [
		overlayCurveActivationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayData [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayData
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayData: aOWValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayData: aOWValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayDescription [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayDescription
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayDescription: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayLabel [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayLabel
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayLabel: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayLabel: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayOrigin [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayOrigin
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayOrigin: aSSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayOrigin: aSSValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> overlayPlaneIOM [

	^overlayPlaneIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> overlayPlaneIOM: aOverlayPlaneIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> overlayRows [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayRows
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayRows: aUSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayRows: aUSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlaySubtype [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlaySubtype
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlaySubtype: aLOValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlaySubtype: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayType [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM overlayType
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> overlayType: aCSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM overlayType: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> patientIOM: aPatientIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientPosition [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM patientPosition
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientPosition: aCSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM patientPosition: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> patientStudyIOM: aPatientStudyIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> performedActionItemSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> performedActionItemSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepID: aSHValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepID: aSHValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepStartDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepStartDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepStartTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProcedureStepStartTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProcedureStepStartTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProtocolCodeSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performedProtocolCodeSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performedProtocolCodeSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performedProtocolCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performingPhysicianName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> performingPhysicianName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> performingPhysiciansName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM performingPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> performingPhysiciansName: aPNValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM performingPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationCreationDate [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM presentationCreationDate
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationCreationDate: aDAValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM presentationCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationCreationTime [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM presentationCreationTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationCreationTime: aTMValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM presentationCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> presentationCreatorsName [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM contentCreatorName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> presentationCreatorsName: aPNValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM contentCreatorName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> presentationDescription [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM contentDescription
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> presentationDescription: aLOValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM contentDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationLUTSequence [

	softcopyPresentationLUTIOM isNil ifTrue: [
		softcopyPresentationLUTIOM := SoftcopyPresentationLUTIOM new.
		softcopyPresentationLUTIOM dataElementsDictionary: self dataElementsDictionary.
		softcopyPresentationLUTIOM dataElementsValues: self dataElementsValues.
	].

	^softcopyPresentationLUTIOM presentationLUTSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationLUTSequence: aSQValue [

	softcopyPresentationLUTIOM isNil ifTrue: [
		softcopyPresentationLUTIOM := SoftcopyPresentationLUTIOM new.
		softcopyPresentationLUTIOM dataElementsDictionary: self dataElementsDictionary.
		softcopyPresentationLUTIOM dataElementsValues: self dataElementsValues.
	].

	softcopyPresentationLUTIOM presentationLUTSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationLUTShape [

	softcopyPresentationLUTIOM isNil ifTrue: [
		softcopyPresentationLUTIOM := SoftcopyPresentationLUTIOM new.
		softcopyPresentationLUTIOM dataElementsDictionary: self dataElementsDictionary.
		softcopyPresentationLUTIOM dataElementsValues: self dataElementsValues.
	].

	^softcopyPresentationLUTIOM presentationLUTShape
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> presentationLUTShape: aCSValue [

	softcopyPresentationLUTIOM isNil ifTrue: [
		softcopyPresentationLUTIOM := SoftcopyPresentationLUTIOM new.
		softcopyPresentationLUTIOM dataElementsDictionary: self dataElementsDictionary.
		softcopyPresentationLUTIOM dataElementsValues: self dataElementsValues.
	].

	softcopyPresentationLUTIOM presentationLUTShape: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> presentationLabel [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM contentLabel
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> presentationLabel: aCSValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM contentLabel: aCSValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> presentationSeriesIOM [

	^presentationSeriesIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> presentationSeriesIOM: aPresentationSeriesIOM [

	presentationSeriesIOM := aPresentationSeriesIOM.
	presentationSeriesIOM encoder: self encoder.

	presentationSeriesIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		presentationSeriesIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		presentationSeriesIOM dataElementsDictionary: self dataElementsDictionary.
	].

	presentationSeriesIOM dataElementsValues == self dataElementsValues ifFalse: [
		presentationSeriesIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		presentationSeriesIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> presentationStateIOM [

	^presentationStateIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> presentationStateIOM: aPresentationStateIOM [

	presentationStateIOM := aPresentationStateIOM.
	presentationStateIOM encoder: self encoder.

	presentationStateIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		presentationStateIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
	].

	presentationStateIOM dataElementsValues == self dataElementsValues ifFalse: [
		presentationStateIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		presentationStateIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> protocolName [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM protocolName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> protocolName: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM protocolName: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rETIRED_CurveActivationLayer [

	overlayCurveActivationIOM isNil ifTrue: [
		overlayCurveActivationIOM := OverlayCurveActivationIOM new.
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues.
	].

	^overlayCurveActivationIOM rETIRED_CurveActivationLayer
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rETIRED_CurveActivationLayer: aCSValue [

	overlayCurveActivationIOM isNil ifTrue: [
		overlayCurveActivationIOM := OverlayCurveActivationIOM new.
		overlayCurveActivationIOM dataElementsDictionary: self dataElementsDictionary.
		overlayCurveActivationIOM dataElementsValues: self dataElementsValues.
	].

	overlayCurveActivationIOM rETIRED_CurveActivationLayer: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rOIArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rOIArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rOIMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rOIMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rOIStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rOIStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> radiusOfCircularShutter [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM radiusOfCircularShutter
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> radiusOfCircularShutter: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM radiusOfCircularShutter: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> recommendedViewingMode [

	maskIOM isNil ifTrue: [
		maskIOM := MaskIOM new.
		maskIOM dataElementsDictionary: self dataElementsDictionary.
		maskIOM dataElementsValues: self dataElementsValues.
	].

	^maskIOM recommendedViewingMode
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> recommendedViewingMode: aCSValue [

	maskIOM isNil ifTrue: [
		maskIOM := MaskIOM new.
		maskIOM dataElementsDictionary: self dataElementsDictionary.
		maskIOM dataElementsValues: self dataElementsValues.
	].

	maskIOM recommendedViewingMode: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedPerformedProcedureStepSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedPerformedProcedureStepSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedSeriesSequence [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	^presentationStateIOM referencedSeriesSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedSeriesSequence: aSQValue [

	presentationStateIOM isNil ifTrue: [
		presentationStateIOM := PresentationStateIOM new.
		presentationStateIOM dataElementsDictionary: self dataElementsDictionary.
		presentationStateIOM dataElementsValues: self dataElementsValues.
	].

	presentationStateIOM referencedSeriesSequence: aSQValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> referencedStudyComponentSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM referencedPerformedProcedureStepSequence
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> referencedStudyComponentSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM referencedPerformedProcedureStepSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> requestAttributesSequence [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> requestAttributesSequence: aSQValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM requestAttributesSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rescaleIntercept [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM rescaleIntercept
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rescaleIntercept: aDSValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM rescaleIntercept: aDSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rescaleSlope [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM rescaleSlope
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rescaleSlope: aDSValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM rescaleSlope: aDSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rescaleType [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	^modalityLUTIOM rescaleType
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> rescaleType: aLOValue [

	modalityLUTIOM isNil ifTrue: [
		modalityLUTIOM := ModalityLUTIOM new.
		modalityLUTIOM dataElementsDictionary: self dataElementsDictionary.
		modalityLUTIOM dataElementsValues: self dataElementsValues.
	].

	modalityLUTIOM rescaleType: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> roiArea [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIArea
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> roiArea: aISValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIArea: aISValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> roiMean [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIMean
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> roiMean: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIMean: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> roiStandardDeviation [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	^overlayPlaneIOM rOIStandardDeviation
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> roiStandardDeviation: aDSValue [

	overlayPlaneIOM isNil ifTrue: [
		overlayPlaneIOM := OverlayPlaneIOM new.
		overlayPlaneIOM dataElementsDictionary: self dataElementsDictionary.
		overlayPlaneIOM dataElementsValues: self dataElementsValues.
	].

	overlayPlaneIOM rOIStandardDeviation: aDSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesDate [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDate
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesDate: aDAValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesDescription [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesDescription
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesDescription: aLOValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesInstanceUID [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesInstanceUID: aUIValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesNumber [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesNumber
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesNumber: aISValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesTime [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM seriesTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> seriesTime: aTMValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM seriesTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterLeftVerticalEdge [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM shutterLeftVerticalEdge
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterLeftVerticalEdge: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM shutterLeftVerticalEdge: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterLowerHorizontalEdge [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM shutterLowerHorizontalEdge
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterLowerHorizontalEdge: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM shutterLowerHorizontalEdge: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterOverlayGroup [

	bitmapDisplayShutterIOM isNil ifTrue: [
		bitmapDisplayShutterIOM := BitmapDisplayShutterIOM new.
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^bitmapDisplayShutterIOM shutterOverlayGroup
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterOverlayGroup: aUSValue [

	bitmapDisplayShutterIOM isNil ifTrue: [
		bitmapDisplayShutterIOM := BitmapDisplayShutterIOM new.
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues.
	].

	bitmapDisplayShutterIOM shutterOverlayGroup: aUSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterPresentationValue [

	bitmapDisplayShutterIOM isNil ifTrue: [
		bitmapDisplayShutterIOM := BitmapDisplayShutterIOM new.
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^bitmapDisplayShutterIOM shutterPresentationValue
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterPresentationValue: aUSValue [

	bitmapDisplayShutterIOM isNil ifTrue: [
		bitmapDisplayShutterIOM := BitmapDisplayShutterIOM new.
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues.
	].

	bitmapDisplayShutterIOM shutterPresentationValue: aUSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterRightVerticalEdge [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM shutterRightVerticalEdge
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterRightVerticalEdge: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM shutterRightVerticalEdge: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterShape [

	bitmapDisplayShutterIOM isNil ifTrue: [
		bitmapDisplayShutterIOM := BitmapDisplayShutterIOM new.
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^bitmapDisplayShutterIOM shutterShape
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterShape: aCSValue [

	bitmapDisplayShutterIOM isNil ifTrue: [
		bitmapDisplayShutterIOM := BitmapDisplayShutterIOM new.
		bitmapDisplayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		bitmapDisplayShutterIOM dataElementsValues: self dataElementsValues.
	].

	bitmapDisplayShutterIOM shutterShape: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterUpperHorizontalEdge [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM shutterUpperHorizontalEdge
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> shutterUpperHorizontalEdge: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM shutterUpperHorizontalEdge: aISValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> smallestPixelValueInSeries [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	^generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> smallestPixelValueInSeries: aSSValue [

	generalSeriesIOM isNil ifTrue: [
		generalSeriesIOM := GeneralSeriesIOM new.
		generalSeriesIOM dataElementsDictionary: self dataElementsDictionary.
		generalSeriesIOM dataElementsValues: self dataElementsValues.
	].

	generalSeriesIOM smallestPixelValueInSeries: aSSValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> softcopyPresentationLUTIOM [

	^softcopyPresentationLUTIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> softcopyPresentationLUTIOM: aSoftcopyPresentationLUTIOM [

	softcopyPresentationLUTIOM := aSoftcopyPresentationLUTIOM.
	softcopyPresentationLUTIOM encoder: self encoder.

	softcopyPresentationLUTIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		softcopyPresentationLUTIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		softcopyPresentationLUTIOM dataElementsDictionary: self dataElementsDictionary.
	].

	softcopyPresentationLUTIOM dataElementsValues == self dataElementsValues ifFalse: [
		softcopyPresentationLUTIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		softcopyPresentationLUTIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> softcopyVOILUTSequence [

	softcopyVOI_LUT_IOM isNil ifTrue: [
		softcopyVOI_LUT_IOM := SoftcopyVOI_LUT_IOM new.
		softcopyVOI_LUT_IOM dataElementsDictionary: self dataElementsDictionary.
		softcopyVOI_LUT_IOM dataElementsValues: self dataElementsValues.
	].

	^softcopyVOI_LUT_IOM softcopyVOILUTSequence
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> softcopyVOILUTSequence: aSQValue [

	softcopyVOI_LUT_IOM isNil ifTrue: [
		softcopyVOI_LUT_IOM := SoftcopyVOI_LUT_IOM new.
		softcopyVOI_LUT_IOM dataElementsDictionary: self dataElementsDictionary.
		softcopyVOI_LUT_IOM dataElementsValues: self dataElementsValues.
	].

	softcopyVOI_LUT_IOM softcopyVOILUTSequence: aSQValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> softcopyVOI_LUT_IOM [

	^softcopyVOI_LUT_IOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> softcopyVOI_LUT_IOM: aSoftcopyVOI_LUT_IOM [

	softcopyVOI_LUT_IOM := aSoftcopyVOI_LUT_IOM.
	softcopyVOI_LUT_IOM encoder: self encoder.

	softcopyVOI_LUT_IOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		softcopyVOI_LUT_IOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		softcopyVOI_LUT_IOM dataElementsDictionary: self dataElementsDictionary.
	].

	softcopyVOI_LUT_IOM dataElementsValues == self dataElementsValues ifFalse: [
		softcopyVOI_LUT_IOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		softcopyVOI_LUT_IOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> sopCommonIOM: aSOPCommonIOM [

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
GrayscaleSoftcopyPresentationState_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
GrayscaleSoftcopyPresentationState_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> spacialTransformationIOM [

	^spacialTransformationIOM
]

{ #category : #'accessing IOM' }
GrayscaleSoftcopyPresentationState_IOD >> spacialTransformationIOM: aSpacialTransformationIOM [

	spacialTransformationIOM := aSpacialTransformationIOM.
	spacialTransformationIOM encoder: self encoder.

	spacialTransformationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		spacialTransformationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		spacialTransformationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	spacialTransformationIOM dataElementsValues == self dataElementsValues ifFalse: [
		spacialTransformationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		spacialTransformationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> verticesOfThePolygonalShutter [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	^displayShutterIOM verticesOfThePolygonalShutter
]

{ #category : #'accessing IOM data elements' }
GrayscaleSoftcopyPresentationState_IOD >> verticesOfThePolygonalShutter: aISValue [

	displayShutterIOM isNil ifTrue: [
		displayShutterIOM := DisplayShutterIOM new.
		displayShutterIOM dataElementsDictionary: self dataElementsDictionary.
		displayShutterIOM dataElementsValues: self dataElementsValues.
	].

	displayShutterIOM verticesOfThePolygonalShutter: aISValue

]
