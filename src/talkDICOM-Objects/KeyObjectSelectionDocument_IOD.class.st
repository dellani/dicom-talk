Class {
	#name : #'KeyObjectSelectionDocument_IOD',
	#superclass : #DicomIOD,
	#instVars : [
		'patientIOM',
		'generalStudyIOM',
		'patientStudyIOM',
		'generalEquipmentIOM',
		'srDocumentContentIOM',
		'sopCommonIOM'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
KeyObjectSelectionDocument_IOD class >> DicomIODName [

	^'KO IOD'
]

{ #category : #accessing }
KeyObjectSelectionDocument_IOD class >> InformationObjectModules [

	^InformationObjectModules
		ifNil: 
			[InformationObjectModules := OrderedCollection new.
			InformationObjectModules
				"Patient IE"
				add: PatientIOM initialize;

				"Study IE"
				add: GeneralStudyIOM initialize;
				add: PatientStudyIOM initialize;

				"Series IE"

				"Equipment IE"
				add: GeneralEquipmentIOM initialize;

				"Document"
				add: SRDocumentContentIOM initialize;
				add: SOPCommonIOM initialize;

				yourself]
]

{ #category : #accessing }
KeyObjectSelectionDocument_IOD class >> SOPClassUID [

	^'1.2.840.10008.5.1.4.1.1.88.59'
]

{ #category : #initialization }
KeyObjectSelectionDocument_IOD class >> initialize [

	InformationObjectModules := nil.
	super initialize.
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> UID [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM uID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> UID: aUIValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM uID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> accessionNumber [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM accessionNumber
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> accessionNumber: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM accessionNumber: aSHValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> additionalPatientHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> additionalPatientHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> additionalPatientsHistory [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM additionalPatientHistory
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> additionalPatientsHistory: aLTValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM additionalPatientHistory: aLTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> admittingDiagnosesDescription [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> admittingDiagnosesDescription: aLOValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM admittingDiagnosesDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> authorizationEquipmentCertificationNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM authorizationEquipmentCertificationNumber
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> authorizationEquipmentCertificationNumber: aLOValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM authorizationEquipmentCertificationNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> conceptCodeSequence [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM conceptCodeSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> conceptCodeSequence: aSQValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM conceptCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> conceptNameCodeSequence [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM conceptNameCodeSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> conceptNameCodeSequence: aSQValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM conceptNameCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> contentSequence [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM contentSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> contentSequence: aSQValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM contentSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> contentTemplateSequence [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM contentTemplateSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> contentTemplateSequence: aSQValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM contentTemplateSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> continuityOfContent [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM continuityOfContent
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> continuityOfContent: aCSValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM continuityOfContent: aCSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> date [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM date
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> date: aDAValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM date: aDAValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> dateOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM dateOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> dateOfLastCalibration: aDAValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM dateOfLastCalibration: aDAValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> dateTime [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM dateTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> dateTime: aDTValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM dateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> deviceSerialNumber [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM deviceSerialNumber
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> deviceSerialNumber: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM deviceSerialNumber: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> ethnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> ethnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> ethnnicGroup [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM ethnicGroup
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> ethnnicGroup: aSHValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM ethnicGroup: aSHValue

]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> generalEquipmentIOM [

	^generalEquipmentIOM
]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> generalEquipmentIOM: aGeneralEquipmentIOM [

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
KeyObjectSelectionDocument_IOD >> generalStudyIOM [

	^generalStudyIOM
]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> generalStudyIOM: aGeneralStudyIOM [

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
KeyObjectSelectionDocument_IOD >> graphicData [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM graphicData
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> graphicData: aFLValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM graphicData: aFLValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> graphicType [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM graphicType
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> graphicType: aCSValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM graphicType: aCSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceAvailability [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceAvailability
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceAvailability: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceAvailability: aCSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceCreationDate [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationDate
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceCreationDate: aDAValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceCreationTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreationTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceCreationTime: aTMValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreationTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceCreatorUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceCreatorUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceCreatorUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceNumber [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM instanceNumber
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> instanceNumber: aISValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM instanceNumber: aISValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> institutionAddress [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionAddress
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> institutionAddress: aSTValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionAddress: aSTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> institutionName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> institutionName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionName: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> institutionalDepartmentName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM institutionalDepartmentName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> institutionalDepartmentName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM institutionalDepartmentName: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> manufacturer [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturer
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> manufacturer: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturer: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> manufacturerModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> manufacturerModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> manufacturersModelName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM manufacturerModelName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> manufacturersModelName: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM manufacturerModelName: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> measuredValueSequence [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM measuredValueSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> measuredValueSequence: aSQValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM measuredValueSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> nameOfPhysiciansReadingStudy [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> nameOfPhysiciansReadingStudy: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM nameOfPhysiciansReadingStudy: aPNValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> observationDateTime [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM observationDateTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> observationDateTime: aDTValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM observationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> occupation [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM occupation
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> occupation: aSHValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM occupation: aSHValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> otherPatientNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> otherPatientNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> otherPatientsIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> otherPatientsIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> otherPatientsNames [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM otherPatientNames
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> otherPatientsNames: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM otherPatientNames: aPNValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientComments [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientComments
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientComments: aLTValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientComments: aLTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientID [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientID: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientID: aLOValue

]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> patientIOM [

	^patientIOM
]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> patientIOM: aPatientIOM [

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
KeyObjectSelectionDocument_IOD >> patientName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> patientStudyIOM [

	^patientStudyIOM
]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> patientStudyIOM: aPatientStudyIOM [

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
KeyObjectSelectionDocument_IOD >> patientWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> patientWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsAge [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientAge
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsAge: aASValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientAge: aASValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsBirthDate [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthDate
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsBirthDate: aDAValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthDate: aDAValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsBirthTime [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientBirthTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsBirthTime: aTMValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientBirthTime: aTMValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsName [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsName: aPNValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsSex [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM patientSex
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsSex: aCSValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM patientSex: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsSize [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientSize
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsSize: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientSize: aDSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsWeight [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	^patientStudyIOM patientWeight
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> patientsWeight: aDSValue [

	patientStudyIOM isNil ifTrue: [
		patientStudyIOM := PatientStudyIOM new.
		patientStudyIOM dataElementsDictionary: self dataElementsDictionary.
		patientStudyIOM dataElementsValues: self dataElementsValues.
	].

	patientStudyIOM patientWeight: aDSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> personName [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM personName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> personName: aPNValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM personName: aPNValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> physiciansOfRecord [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> physiciansOfRecord: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM physiciansOfRecord: aPNValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> pixelPaddingValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM pixelPaddingValue
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> pixelPaddingValue: aSSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM pixelPaddingValue: aSSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> procedureCodeSequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> procedureCodeSequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM procedureCodeSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> rETIRED_OtherPatientIDs [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM rETIRED_OtherPatientIDs
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> rETIRED_OtherPatientIDs: aLOValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM rETIRED_OtherPatientIDs: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedDateTime [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM referencedDateTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedDateTime: aDTValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM referencedDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> referencedDatetime [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM referencedDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> referencedDatetime: aDTValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM referencedDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedPatientSequence [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	^patientIOM referencedPatientSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedPatientSequence: aSQValue [

	patientIOM isNil ifTrue: [
		patientIOM := PatientIOM new.
		patientIOM dataElementsDictionary: self dataElementsDictionary.
		patientIOM dataElementsValues: self dataElementsValues.
	].

	patientIOM referencedPatientSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedSOPSequence [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM referencedSOPSequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedSOPSequence: aSQValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM referencedSOPSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedSamplePositions [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM referencedSamplePositions
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedSamplePositions: aULValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM referencedSamplePositions: aULValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedStudySequence [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referencedStudySequence
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedStudySequence: aSQValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referencedStudySequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedTimeOffsets [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM referencedTimeOffsets
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referencedTimeOffsets: aDSValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM referencedTimeOffsets: aDSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referringPhysicianName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> referringPhysicianName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> referringPhysiciansName [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM referringPhysicianName
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> referringPhysiciansName: aPNValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM referringPhysicianName: aPNValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPAuthorizationDateTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPAuthorizationDateTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> sOPInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> softwareVersions [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM softwareVersions
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> softwareVersions: aLOValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM softwareVersions: aLOValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopAuthorizationComment [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationComment
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopAuthorizationComment: aLTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationComment: aLTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopAuthorizationDateAndTime [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPAuthorizationDateTime
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopAuthorizationDateAndTime: aDTValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPAuthorizationDateTime: aDTValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopClassUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPClassUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopClassUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPClassUID: aUIValue

]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> sopCommonIOM [

	^sopCommonIOM
]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> sopCommonIOM: aSOPCommonIOM [

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
KeyObjectSelectionDocument_IOD >> sopInstanceStatus [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceStatus
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopInstanceStatus: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceStatus: aCSValue

]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopInstanceUID [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM sOPInstanceUID
]

{ #category : #'accessing IOM data elements - talkDICOM names' }
KeyObjectSelectionDocument_IOD >> sopInstanceUID: aUIValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM sOPInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> spatialResolution [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM spatialResolution
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> spatialResolution: aDSValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM spatialResolution: aDSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> specificCharacterSet [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM specificCharacterSet
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> specificCharacterSet: aCSValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM specificCharacterSet: aCSValue

]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> srDocumentContentIOM [

	^srDocumentContentIOM
]

{ #category : #'accessing IOM' }
KeyObjectSelectionDocument_IOD >> srDocumentContentIOM: aSRDocumentContentIOM [

	srDocumentContentIOM := aSRDocumentContentIOM.
	srDocumentContentIOM encoder: self encoder.

	srDocumentContentIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		srDocumentContentIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
	].

	srDocumentContentIOM dataElementsValues == self dataElementsValues ifFalse: [
		srDocumentContentIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		srDocumentContentIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> stationName [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM stationName
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> stationName: aSHValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM stationName: aSHValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyDate [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDate
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyDate: aDAValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDate: aDAValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyDescription [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyDescription
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyDescription: aLOValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyDescription: aLOValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyID: aSHValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyID: aSHValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyInstanceUID [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyInstanceUID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyInstanceUID: aUIValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyInstanceUID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyTime [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	^generalStudyIOM studyTime
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> studyTime: aTMValue [

	generalStudyIOM isNil ifTrue: [
		generalStudyIOM := GeneralStudyIOM new.
		generalStudyIOM dataElementsDictionary: self dataElementsDictionary.
		generalStudyIOM dataElementsValues: self dataElementsValues.
	].

	generalStudyIOM studyTime: aTMValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> temporalRangeType [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM temporalRangeType
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> temporalRangeType: aCSValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM temporalRangeType: aCSValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> textValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM textValue
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> textValue: aUTValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM textValue: aUTValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> time [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM time
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> time: aTMValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM time: aTMValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> timeOfLastCalibration [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	^generalEquipmentIOM timeOfLastCalibration
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> timeOfLastCalibration: aTMValue [

	generalEquipmentIOM isNil ifTrue: [
		generalEquipmentIOM := GeneralEquipmentIOM new.
		generalEquipmentIOM dataElementsDictionary: self dataElementsDictionary.
		generalEquipmentIOM dataElementsValues: self dataElementsValues.
	].

	generalEquipmentIOM timeOfLastCalibration: aTMValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> timezoneOffsetFromUTC [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	^sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> timezoneOffsetFromUTC: aSHValue [

	sopCommonIOM isNil ifTrue: [
		sopCommonIOM := SOPCommonIOM new.
		sopCommonIOM dataElementsDictionary: self dataElementsDictionary.
		sopCommonIOM dataElementsValues: self dataElementsValues.
	].

	sopCommonIOM timezoneOffsetFromUTC: aSHValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> uID [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM uID
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> uID: aUIValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM uID: aUIValue

]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> valueType [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	^srDocumentContentIOM valueType
]

{ #category : #'accessing IOM data elements' }
KeyObjectSelectionDocument_IOD >> valueType: aCSValue [

	srDocumentContentIOM isNil ifTrue: [
		srDocumentContentIOM := SRDocumentContentIOM new.
		srDocumentContentIOM dataElementsDictionary: self dataElementsDictionary.
		srDocumentContentIOM dataElementsValues: self dataElementsValues.
	].

	srDocumentContentIOM valueType: aCSValue

]
