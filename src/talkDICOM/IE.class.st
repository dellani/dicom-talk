Class {
	#name : #IE,
	#superclass : #Object,
	#instVars : [
		'series',
		'sopCommonIOM',
		'dicomIOD'
	],
	#category : #'talkDICOM-InformationModel'
}

{ #category : #'instance creation' }
IE class >> fromC_FINDPatientRoot_RSP_Identifier: aC_FINDPatientRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDPatientRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	| newInstance |
	newInstance := self new.
	newInstance instanceCreationDate: aC_FINDPatientRoot_RSP_Identifier instanceCreationDate.
	newInstance instanceCreationTime: aC_FINDPatientRoot_RSP_Identifier instanceCreationTime.
	newInstance instanceNumber: aC_FINDPatientRoot_RSP_Identifier instanceNumber.
	"newInstance 
		specificCharacterSet: aC_FINDPatientRoot_RSP_Identifier specificCharacterSet."
	newInstance sopInstanceUID: aC_FINDPatientRoot_RSP_Identifier sopInstanceUID.
	^ newInstance
]

{ #category : #'instance creation' }
IE class >> fromC_FINDStudyRoot_RSP_Identifier: aC_FINDStudyRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDStudyRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	| newInstance |
	newInstance := self new.
	newInstance 
		instanceCreationDate: aC_FINDStudyRoot_RSP_Identifier instanceCreationDate.
	newInstance 
		instanceCreationTime: aC_FINDStudyRoot_RSP_Identifier instanceCreationTime.
	newInstance 
		instanceNumber: aC_FINDStudyRoot_RSP_Identifier instanceNumber.
	newInstance 
		specificCharacterSet: aC_FINDStudyRoot_RSP_Identifier specificCharacterSet.
	newInstance 
		sopInstanceUID: aC_FINDStudyRoot_RSP_Identifier sopInstanceUID.
	^newInstance
]

{ #category : #comparing }
IE >> < anDicomIE [
	"PRD - August 08th, 2002"

	^self instanceNumber asNumber < anDicomIE instanceNumber asNumber
]

{ #category : #comparing }
IE >> <= anDicomIE [
	"PRD - August 08th, 2002"

	^self instanceNumber asNumber <= anDicomIE instanceNumber asNumber
]

{ #category : #comparing }
IE >> > anDicomIE [
	"PRD - August 08th, 2002"

	^self instanceNumber asNumber > anDicomIE instanceNumber asNumber
]

{ #category : #comparing }
IE >> >= anDicomIE [
	"PRD - August 08th, 2002"

	^self instanceNumber asNumber >= anDicomIE instanceNumber asNumber
]

{ #category : #converting }
IE >> asDicomDirectoryRecordSequenceItem [

	^DirectoryRecordSequenceItem new
		offsetOfTheNextDirectoryRecord: 0;						"**** This information is unknown at the moment*** "
		recordInUseFlag: 16rFFFF;								"**** Record is in use ******"
		offsetOfReferencedLowerLevelDirectoryEntity: 0;			"**** This information is unknown at the moment*** "
		directoryRecordType: 'IMAGE';							"**** This is a IMAGE Directory Record *****"
		referencedSOPClassUIDInFile: self sopClassUID;
		referencedSOPInstanceUIDInFile: self sopInstanceUID;
		referencedTransferSyntaxUIDInFile: self encoder UID;
		instanceNumber: self instanceNumber.
]

{ #category : #'accessing - SOP common IOM' }
IE >> authorizationEquipmentCertificationNumber [

	^self sopCommonIOM authorizationEquipmentCertificationNumber.
]

{ #category : #'accessing - SOP common IOM' }
IE >> authorizationEquipmentCertificationNumber: aString [

	self sopCommonIOM authorizationEquipmentCertificationNumber: aString
]

{ #category : #accessing }
IE >> dicomIOD [

	^dicomIOD
]

{ #category : #accessing }
IE >> dicomIOD: aDicomIOD [

	dicomIOD := aDicomIOD.
	self sopCommonIOM: aDicomIOD sopCommonIOM
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceCreationDate [

	^self sopCommonIOM instanceCreationDate
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceCreationDate: aDate [

	self sopCommonIOM instanceCreationDate: aDate
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceCreationTime [

	^self sopCommonIOM instanceCreationTime
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceCreationTime: aTime [

	self sopCommonIOM instanceCreationTime: aTime
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceCreatorUID [

	^self sopCommonIOM instanceCreatorUID
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceCreatorUID: aString [

	self sopCommonIOM instanceCreatorUID: aString
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceNumber [

	^self sopCommonIOM instanceNumber
]

{ #category : #'accessing - SOP common IOM' }
IE >> instanceNumber: aNumber [

	self sopCommonIOM instanceNumber: aNumber
]

{ #category : #testing }
IE >> isImage [
	"Answer true if this object contains any kind of image
	PRD - November 13th, 2002"

	^false
]

{ #category : #printing }
IE >> printOn: aStream [

	aStream nextPutAll: 'Image '.
	self instanceNumber isNil
		ifFalse: 
			[self instanceNumber
				printOn: aStream
				paddedWith: Character space
				to: 16r000D]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r000D].
	self instanceCreationTime isNil
		ifFalse: 
			[self instanceCreationTime printString
				printOn: aStream
				paddedWith: Character space
				to: 16r0014]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0014]
]

{ #category : #accessing }
IE >> series [

	^series isNil ifTrue: [series := Series new] ifFalse: [series]
]

{ #category : #accessing }
IE >> series: aSeries [

	series := aSeries
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopAuthorizationComment [ 

	^self sopCommonIOM sopAuthorizationComment
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopAuthorizationComment: aString [

	self sopCommonIOM sopAuthorizationComment: aString
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopAuthorizationDateAndTime [ 

	^self sopCommonIOM sopAuthorizationDateAndTime
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopAuthorizationDateAndTime: aDTValue [

	self sopCommonIOM sopAuthorizationDateAndTime: aDTValue
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopClassUID [

	^self sopCommonIOM sopClassUID
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopClassUID: aString [

	self sopCommonIOM sopClassUID: aString
]

{ #category : #accessing }
IE >> sopCommonIOM [

	^sopCommonIOM isNil 
		ifTrue: [sopCommonIOM := SOPCommonIOM new]
		ifFalse: [sopCommonIOM]
]

{ #category : #accessing }
IE >> sopCommonIOM: aSOPCommonIOM [

	sopCommonIOM := aSOPCommonIOM
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopInstanceStatus [

	^self sopCommonIOM sopInstanceStatus
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopInstanceStatus: aString [

	self sopCommonIOM sopInstanceStatus: aString
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopInstanceUID [

	^self sopCommonIOM sopInstanceUID
]

{ #category : #'accessing - SOP common IOM' }
IE >> sopInstanceUID: aString [

	self sopCommonIOM sopInstanceUID: aString
]

{ #category : #'accessing - SOP common IOM' }
IE >> specificCharacterSet [

	^self sopCommonIOM specificCharacterSet
]

{ #category : #'accessing - SOP common IOM' }
IE >> specificCharacterSet: aString [

	self sopCommonIOM specificCharacterSet: aString
]

{ #category : #'accessing - SOP common IOM' }
IE >> timezoneOffsetFromUTC [

	^self sopCommonIOM timezoneOffsetFromUTC
]

{ #category : #'accessing - SOP common IOM' }
IE >> timezoneOffsetFromUTC: aString [

	self sopCommonIOM timezoneOffsetFromUTC: aString
]

{ #category : #accessing }
IE >> values [

	^Array new
]
