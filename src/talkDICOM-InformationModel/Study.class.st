Class {
	#name : #Study,
	#superclass : #Object,
	#instVars : [
		'generalStudyIOM',
		'patientStudyIOM',
		'series',
		'patient'
	],
	#category : #'talkDICOM-InformationModel'
}

{ #category : #'instance creation' }
Study class >> fromC_FINDPatientRoot_RSP_Identifier: aC_FINDPatientRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDPatientRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	| newInstance |
	newInstance := self new.
	newInstance 
		accessionNumber: aC_FINDPatientRoot_RSP_Identifier accessionNumber.
	newInstance 
		studyDate: aC_FINDPatientRoot_RSP_Identifier studyDate.
	newInstance 
		studyDescription: aC_FINDPatientRoot_RSP_Identifier studyDescription.
	newInstance
		studyID: aC_FINDPatientRoot_RSP_Identifier studyID.
	newInstance
		studyInstanceUID: aC_FINDPatientRoot_RSP_Identifier studyInstanceUID.
	newInstance 
		studyTime: aC_FINDPatientRoot_RSP_Identifier studyTime.
	^newInstance
]

{ #category : #'instance creation' }
Study class >> fromC_FINDStudyRoot_RSP_Identifier: aC_FINDStudyRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDStudyRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	^self
		fromC_FINDPatientRoot_RSP_Identifier: aC_FINDStudyRoot_RSP_Identifier
]

{ #category : #'instance creation' }
Study class >> fromIOD: anIOD [
"
	Create a new instance of myself using the GeneralStudy and PatientStudy 
	IOM's data elements values from the given IOD, if it contains such IOM's.
	PRD - December 13th, 2004
"

	| newInstance value |

	newInstance := self new.
	(anIOD respondsTo: #generalStudyIOM) ifTrue: [
		GeneralStudyIOM DataElements do: [:aDataElement |
			(value := anIOD perform: aDataElement name) notNil ifTrue: [
			newInstance perform: (aDataElement name asString, ':') asSymbol with: value]
		].
	].
	(anIOD respondsTo: #patientStudyIOM) ifTrue: [
		PatientStudyIOM DataElements do: [:aDataElement |
			(value := anIOD perform: aDataElement name) notNil ifTrue: [
			newInstance perform: (aDataElement name asString, ':') asSymbol with: value]
		].
	].
	^newInstance
]

{ #category : #comparing }
Study >> < aStudy [
	"PRD - August 08th, 2002"

	^self studyID < aStudy studyID 
]

{ #category : #comparing }
Study >> <= aStudy [
	"PRD - August 08th, 2002"

	^ (aStudy studyID notNil and: [ self studyID notNil ])
		ifTrue: [ self studyID <= aStudy studyID ]
		ifFalse: [ false ]
]

{ #category : #comparing }
Study >> > aStudy [
	"PRD - August 08th, 2002"

	^ self studyID > aStudy studyID
]

{ #category : #comparing }
Study >> >= aStudy [
	"PRD - August 08th, 2002"

	^ self studyID >= aStudy studyID
]

{ #category : #'accessing - general study IOM' }
Study >> accessionNumber [

	^self generalStudyIOM accessionNumber
]

{ #category : #'accessing - general study IOM' }
Study >> accessionNumber: anObject [

	self generalStudyIOM accessionNumber: anObject
]

{ #category : #'accessing - patient study IOM' }
Study >> additionalPatientsHistory [

	^self patientStudyIOM additionalPatientsHistory
]

{ #category : #'accessing - patient study IOM' }
Study >> additionalPatientsHistory: anObject [

	self patientStudyIOM additionalPatientsHistory: anObject
]

{ #category : #'accessing - patient study IOM' }
Study >> admittingDiagnosesDescription [

	^self patientStudyIOM admittingDiagnosesDescription
]

{ #category : #'accessing - patient study IOM' }
Study >> admittingDiagnosesDescription: anObject [

	self patientStudyIOM admittingDiagnosesDescription: anObject
]

{ #category : #converting }
Study >> asDicomDirectoryRecordSequenceItem [

	^ DirectoryRecordSequenceItem new
		offsetOfTheNextDirectoryRecord: 0;						"**** This information is unknown at the moment*** "
		recordInUseFlag: 16rFFFF;									"**** Record is in use ******"
		offsetOfReferencedLowerLevelDirectoryEntity: 0;		"**** This information is unknown at the moment*** "
		directoryRecordType: 'STUDY';								"**** This is a STUDY Directory Record *****"
		studyDate: self studyDate;
		studyTime: self studyTime;
		studyDescription: self studyDescription;
		studyInstanceUID: self studyInstanceUID;
		studyID: self studyID;
		accessionNumber: self accessionNumber;
		referringPhysiciansName: self referringPhysiciansName;
		physiciansOfRecord: self physiciansOfRecord;
		nameOfPhysiciansReadingStudy: self nameOfPhysiciansReadingStudy.
]

{ #category : #converting }
Study >> asDictionary [
	| newDictionary |
	newDictionary := Dictionary new.
	self patient patientID
		ifNotNil: [ self patient patientID notEmpty
				ifTrue: [ newDictionary at: 'patientID' put: self patient patientID ] ].
	newDictionary at: 'studyInstanceUID' put: self studyInstanceUID.
	^ newDictionary
]

{ #category : #accessing }
Study >> generalStudyIOM [

	^generalStudyIOM isNil
		ifTrue: [generalStudyIOM := GeneralStudyIOM new]
		ifFalse: [generalStudyIOM]
]

{ #category : #accessing }
Study >> generalStudyIOM: aGeneralStudyIOM [

	generalStudyIOM := aGeneralStudyIOM
]

{ #category : #series }
Study >> includesSeries: dicomSeries [
	^ self series includesKey: dicomSeries seriesInstanceUID trimBoth
]

{ #category : #testing }
Study >> isImage [
	"Answer true if this object contains any kind of image
	PRD - November 13th, 2002"

	^false
]

{ #category : #printing }
Study >> listEntryPrint [
	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream nextPutAll: 'Study '.
			(self studyID isNil
				ifFalse: [ self studyID ]
				ifTrue: [ String new ]) printOn: aStream paddedWith: Character space to: 16r000A.

			aStream nextPutAll: '- '.

			(self studyDate isNil
				ifFalse: [ self studyDate asDate]
				ifTrue: [ Date year: 1900 month: 1 day: 1 ]) printOn: aStream format: #(1 2 3 $ 2 2) ]
]

{ #category : #'accessing - general study IOM' }
Study >> nameOfPhysiciansReadingStudy [

	^self generalStudyIOM nameOfPhysiciansReadingStudy
]

{ #category : #'accessing - general study IOM' }
Study >> nameOfPhysiciansReadingStudy: anObject [

	self generalStudyIOM nameOfPhysiciansReadingStudy: anObject
]

{ #category : #'accessing - patient study IOM' }
Study >> occupation [

	^self patientStudyIOM occupation
]

{ #category : #'accessing - patient study IOM' }
Study >> occupation: anObject [

	self patientStudyIOM occupation: anObject
]

{ #category : #accessing }
Study >> patient [

	^patient isNil ifTrue: [patient := Patient new] ifFalse: [patient]
]

{ #category : #accessing }
Study >> patient: aPatient [

	patient := aPatient
]

{ #category : #accessing }
Study >> patientStudyIOM [

	^patientStudyIOM isNil
		ifTrue: [patientStudyIOM := PatientStudyIOM new]
		ifFalse: [patientStudyIOM]
]

{ #category : #accessing }
Study >> patientStudyIOM: aPatientStudyIOM [

	patientStudyIOM := aPatientStudyIOM
]

{ #category : #'accessing - patient study IOM' }
Study >> patientsAge [

	^self patientStudyIOM patientsAge
]

{ #category : #'accessing - patient study IOM' }
Study >> patientsAge: anObject [

	self patientStudyIOM patientsAge: anObject
]

{ #category : #'accessing - patient study IOM' }
Study >> patientsSize [

	^self patientStudyIOM patientsSize
]

{ #category : #'accessing - patient study IOM' }
Study >> patientsSize: anObject [

	self patientStudyIOM patientsSize: anObject
]

{ #category : #'accessing - patient study IOM' }
Study >> patientsWeight [

	^self patientStudyIOM patientsWeight
]

{ #category : #'accessing - patient study IOM' }
Study >> patientsWeight: anObject [

	self patientStudyIOM patientsWeight: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> physiciansOfRecord [

	^self generalStudyIOM physiciansOfRecord
]

{ #category : #'accessing - general study IOM' }
Study >> physiciansOfRecord: anObject [

	self generalStudyIOM physiciansOfRecord: anObject
]

{ #category : #printing }
Study >> printOn: aStream [

	aStream nextPutAll: 'Study '.
	self studyID isNil
		ifFalse: 
			[self studyID
				printOn: aStream
				paddedWith: Character space
				to: 16r000A]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r000A].
	self studyDate isNil
		ifFalse: 
			[self studyDate printString
				printOn: aStream
				paddedWith: Character space
				to: 16r0014]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0014].
	self studyTime isNil
		ifFalse: 
			[self studyTime printString
				printOn: aStream
				paddedWith: Character space
				to: 16r0014]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0014].
	self accessionNumber isNil
		ifFalse: 
			[self accessionNumber
				printOn: aStream
				paddedWith: Character space
				to: 16r010]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0010].
	self studyDescription isNil
		ifFalse: 
			[self studyDescription
				printOn: aStream
				paddedWith: Character space
				to: 16r020]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0020].
	self referringPhysiciansName isNil
		ifFalse: [aStream nextPutAll: self referringPhysiciansName printString]
]

{ #category : #'accessing - general study IOM' }
Study >> procedureCodeSequence [

	^self generalStudyIOM procedureCodeSequence
]

{ #category : #'accessing - general study IOM' }
Study >> procedureCodeSequence: anObject [

	self generalStudyIOM procedureCodeSequence: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> referencedStudySequence [

	^self generalStudyIOM referencedStudySequence
]

{ #category : #'accessing - general study IOM' }
Study >> referencedStudySequence: anObject [

	self generalStudyIOM referencedStudySequence: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> referringPhysiciansName [

	^self generalStudyIOM referringPhysiciansName
]

{ #category : #'accessing - general study IOM' }
Study >> referringPhysiciansName: anObject [

	self generalStudyIOM referringPhysiciansName: anObject
]

{ #category : #'initialize-release' }
Study >> release [

   	patient := nil.
	super release.
]

{ #category : #series }
Study >> removeSeries: aSeries [
	^ self series removeKey: aSeries seriesInstanceUID trimBoth ifAbsent: [ nil ]
]

{ #category : #accessing }
Study >> series [

	^series isNil ifTrue: [series := Dictionary new] ifFalse: [series]
]

{ #category : #series }
Study >> series: aSeriesDictionary [

	series := aSeriesDictionary.
]

{ #category : #series }
Study >> storeSeries: newSeries [
	(self includesSeries: newSeries)
		ifTrue: [ newSeries images: (self series at: newSeries seriesInstanceUID trimBoth) images ].
	newSeries study: self.
	self series at: newSeries seriesInstanceUID trimBoth put: newSeries
]

{ #category : #'accessing - general study IOM' }
Study >> studyDate [

	^self generalStudyIOM studyDate
]

{ #category : #'accessing - general study IOM' }
Study >> studyDate: anObject [

	self generalStudyIOM studyDate: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> studyDescription [ 

	^self generalStudyIOM studyDescription
]

{ #category : #'accessing - general study IOM' }
Study >> studyDescription: anObject [

	self generalStudyIOM studyDescription: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> studyID [

	^self generalStudyIOM studyID
]

{ #category : #'accessing - general study IOM' }
Study >> studyID: anObject [

	self generalStudyIOM studyID: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> studyInstanceUID [

	^self generalStudyIOM studyInstanceUID
]

{ #category : #'accessing - general study IOM' }
Study >> studyInstanceUID: anObject [

	self generalStudyIOM studyInstanceUID: anObject
]

{ #category : #'accessing - general study IOM' }
Study >> studyTime [

	^self generalStudyIOM studyTime
]

{ #category : #'accessing - general study IOM' }
Study >> studyTime: anObject [

	self generalStudyIOM studyTime: anObject
]

{ #category : #accessing }
Study >> values [

	^self series values
]
