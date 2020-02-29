Class {
	#name : #Patient,
	#superclass : #Object,
	#instVars : [
		'patientStudyIOM',
		'studies',
		'patientIOM',
		'specimenIdentificationIOM'
	],
	#category : #'talkDICOM-InformationModel'
}

{ #category : #'instance creation' }
Patient class >> fromC_FINDPatientRoot_RSP_Identifier: aC_FINDPatientRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDPatientRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	| newInstance |
	newInstance := self new.
	newInstance 
		patientID: aC_FINDPatientRoot_RSP_Identifier patientID.
	newInstance
		patientsBirthDate: aC_FINDPatientRoot_RSP_Identifier patientsBirthDate.
	newInstance 
		patientsName: aC_FINDPatientRoot_RSP_Identifier patientsName.
	newInstance 
		patientsSex: aC_FINDPatientRoot_RSP_Identifier patientsSex.
	^newInstance
]

{ #category : #'instance creation' }
Patient class >> fromC_FINDStudyRoot_RSP_Identifier: aC_FINDStudyRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDStudyRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	| newInstance |
	newInstance := self new.
	newInstance 
		patientID: aC_FINDStudyRoot_RSP_Identifier patientID.
	newInstance
		patientsBirthDate: aC_FINDStudyRoot_RSP_Identifier patientsBirthDate.
	newInstance
		patientsBirthTime: aC_FINDStudyRoot_RSP_Identifier patientsBirthTime.
	newInstance 
		patientsName: aC_FINDStudyRoot_RSP_Identifier patientsName.
	^newInstance
]

{ #category : #'instance creation' }
Patient class >> fromIOD: anIOD [
"
	Create a new instance of myself using the Patient and PatientStudy 
	IOM's data elements values from the given IOD, if it contains such IOM's.
	PRD - December 13th, 2004
"
	| newInstance value |

	newInstance := self new.
	(anIOD respondsTo: #patientIOM) ifTrue: [
		PatientIOM DataElements do: [:aDataElement |
			(value := anIOD perform: aDataElement name) notNil ifTrue: [
			newInstance patientIOM perform: (aDataElement name asString, ':') asSymbol with: value]
		].
	].
	(anIOD respondsTo: #patientStudyIOM) ifTrue: [
		PatientStudyIOM DataElements do: [:aDataElement |
			(value := anIOD perform: aDataElement name) notNil ifTrue: [
			newInstance patientStudyIOM perform: (aDataElement name asString, ':') asSymbol with: value]
		].
	].
	^newInstance
]

{ #category : #comparing }
Patient >> < aPatient [
	"PRD - August 08th, 2002"

	^self patientsName printString < aPatient patientsName printString
]

{ #category : #comparing }
Patient >> <= aPatient [
	"PRD - August 08th, 2002"

	^self patientsName printString <= aPatient patientsName printString
]

{ #category : #comparing }
Patient >> > aPatient [
	"PRD - August 08th, 2002"

	^self patientsName printString > aPatient patientsName printString
]

{ #category : #comparing }
Patient >> >= aPatient [
	"PRD - August 08th, 2002"

	^self patientsName printString >= aPatient patientsName printString
]

{ #category : #'accessing - patient study IOM' }
Patient >> additionalPatientsHistory [

	^self patientStudyIOM additionalPatientsHistory
]

{ #category : #'accessing - patient study IOM' }
Patient >> admittingDiagnosesDescription [

	^self patientStudyIOM admittingDiagnosesDescription
]

{ #category : #converting }
Patient >> asDicomDirectoryRecordSequenceItem [

	^DirectoryRecordSequenceItem new 
		offsetOfTheNextDirectoryRecord: 0;						"**** This information is unknown at the moment*** "
		recordInUseFlag: 16rFFFF;								"**** Record is in use ******"
		offsetOfReferencedLowerLevelDirectoryEntity: 0;			"**** This information is unknown at the moment*** "
		directoryRecordType: 'PATIENT';							"**** This is a PATIENT Directory Record *****"
		patientsName: self patientsName;
		patientID: self patientID;
		patientsBirthDate: self patientsBirthDate;
		patientsSex: self patientsSex.
]

{ #category : #converting }
Patient >> asDictionary [

	| newDictionary |
	newDictionary := Dictionary new.
	self patientID ifNotNil:
			[self patientID notEmpty
				ifTrue: [newDictionary at: 'patientID' put: self patientID]].
	self patientsName ifNotNil:
			[self patientsName notEmpty
				ifTrue: [newDictionary at: 'patientsName' put: self patientsName]].

	^newDictionary
]

{ #category : #'accessing - patient IOM' }
Patient >> ethnnicGroup [

	^self patientIOM ethnnicGroup
]

{ #category : #'accessing - patient IOM' }
Patient >> ethnnicGroup: aSHValue [

	self patientIOM ethnnicGroup: aSHValue
]

{ #category : #images }
Patient >> getImage: sopInstanceUID [

	| aDicomImage |
	self studies do: 
			[:aStudy |
			aStudy series do: 
					[:aSeries |
					(aDicomImage := aSeries images at: sopInstanceUID trimBoth
								ifAbsent: [nil]) notNil
						ifTrue: [^aDicomImage]]].
	^nil
]

{ #category : #series }
Patient >> getSeries: seriesInstanceUID [

	| aSeries |
	self studies do: 
			[:aStudy |
			(aSeries := aStudy series at: seriesInstanceUID trimBoth ifAbsent: [nil])
				notNil ifTrue: [^aSeries]].
	^nil
]

{ #category : #studies }
Patient >> getStudy: studyInstanceUID [

	^self studies at: studyInstanceUID trimBoth ifAbsent: [nil]
]

{ #category : #images }
Patient >> includesImage: sopInstanceUID [

	^(self getImage: sopInstanceUID trimBoth) notNil
]

{ #category : #series }
Patient >> includesSeries: seriesInstanceUID [
	^ (self getSeries: seriesInstanceUID trimBoth) notNil
]

{ #category : #studies }
Patient >> includesStudy: aStudy [
	^ self studies includesKey: aStudy studyInstanceUID trimBoth
]

{ #category : #testing }
Patient >> isImage [
	"Answer true if this object contains any kind of image
	PRD - November 13th, 2002"

	^false
]

{ #category : #testing }
Patient >> matches: text [
	"regexString asRegex matches: self"

	| regex |
	^ [ regex := text asRegex.
	^ (self patientsName matchesRegex: regex)
		|
			(self patientID notNil
				ifTrue: [ regex matches: self patientID ]
				ifFalse: [ false ]) ]
		on: RegexSyntaxError
		do: [ false ]
]

{ #category : #'accessing - patient study IOM' }
Patient >> occupation [

	^self patientStudyIOM occupation
]

{ #category : #'accessing - patient IOM' }
Patient >> otherPatientsIDs [

	^self patientIOM otherPatientsIDs
]

{ #category : #'accessing - patient IOM' }
Patient >> otherPatientsIDs: aLOValue [

	self patientIOM otherPatientsIDs: aLOValue
]

{ #category : #'accessing - patient IOM' }
Patient >> otherPatientsNames [

	^self patientIOM otherPatientsNames
]

{ #category : #'accessing - patient IOM' }
Patient >> otherPatientsNames: aPNValue [

	self patientIOM otherPatientsNames: aPNValue
]

{ #category : #'accessing - patient IOM' }
Patient >> patientComments [

	^self patientIOM patientComments
]

{ #category : #'accessing - patient IOM' }
Patient >> patientComments: aLTValue [

	self patientIOM patientComments: aLTValue
]

{ #category : #'accessing - patient IOM' }
Patient >> patientID [

	^self patientIOM patientID
]

{ #category : #'accessing - patient IOM' }
Patient >> patientID: aLOValue [

	self patientIOM patientID: aLOValue
]

{ #category : #accessing }
Patient >> patientIOM [

	^patientIOM isNil 
		ifTrue: [patientIOM := PatientIOM new]
		ifFalse: [patientIOM]
]

{ #category : #accessing }
Patient >> patientIOM: aPatientIOM [

	patientIOM := aPatientIOM
]

{ #category : #accessing }
Patient >> patientStudyIOM [

	^patientStudyIOM isNil 
		ifTrue: [patientStudyIOM := PatientStudyIOM new]
		ifFalse: [patientStudyIOM]
]

{ #category : #accessing }
Patient >> patientStudyIOM: aPatientStudyIOM [

	patientStudyIOM := aPatientStudyIOM
]

{ #category : #'accessing - patient study IOM' }
Patient >> patientsAge [

	^self patientStudyIOM patientsAge
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsBirthDate [

	^self patientIOM patientsBirthDate
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsBirthDate: aDAValue [

	self patientIOM patientsBirthDate: aDAValue
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsBirthTime [

	^self patientIOM patientsBirthTime
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsBirthTime: aTMValue [

	self patientIOM patientsBirthTime: aTMValue
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsName [

	^self patientIOM patientsName
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsName: aPNValue [

	self patientIOM patientsName: aPNValue
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsSex [

	^self patientIOM patientsSex
]

{ #category : #'accessing - patient IOM' }
Patient >> patientsSex: aCSValue [

	self patientIOM patientsSex: aCSValue
]

{ #category : #'accessing - patient study IOM' }
Patient >> patientsSize [

	^self patientStudyIOM patientsSize
]

{ #category : #'accessing - patient study IOM' }
Patient >> patientsWeight [

	^self patientStudyIOM patientsWeight
]

{ #category : #printing }
Patient >> printName [
	^String
		new: 10
		streamContents: [ :aStream | 
			(self patientsName isNil
				ifFalse: [ self patientsName printString ]
				ifTrue: [ String new ]) 
					printOn: aStream paddedWith: Character space to: 16r020 ]
]

{ #category : #printing }
Patient >> printOn: aStream [

	self patientID isNil
		ifFalse: 
			[self patientID
				printOn: aStream
				paddedWith: Character space
				to: 16r0010]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0010].
	self patientsName isNil
		ifFalse: 
			[self patientsName printString
				printOn: aStream
				paddedWith: Character space
				to: 16r020]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0020].
	self patientsBirthDate isNil
		ifFalse: 
			[self patientsBirthDate printString
				printOn: aStream
				paddedWith: Character space
				to: 16r0014]
		ifTrue: 
			[String new
				printOn: aStream
				paddedWith: Character space
				to: 16r0014]
]

{ #category : #'accessing - patient IOM' }
Patient >> referencedPatientSequence [

	^self patientIOM referencedPatientSequence
]

{ #category : #'accessing - patient IOM' }
Patient >> referencedPatientSequence: aSQValue [

	self patientIOM referencedPatientSequence: aSQValue
]

{ #category : #images }
Patient >> removeImage: sopInstanceUID [
	| answer |
	self studies
		do: [ :aStudy | 
			aStudy series
				do: [ :aSeries | 
					(answer := aSeries images removeKey: sopInstanceUID trimBoth ifAbsent: [ nil ]) notNil
						ifTrue: [ ^ answer ] ] ].
	^ nil
]

{ #category : #studies }
Patient >> removeStudy: aStudy [

	self studies remove: aStudy.
]

{ #category : #'accessing - specimen identification IOM' }
Patient >> specimenAccessionNumber [

	^self specimenIdentificationIOM specimenAccessionNumber
]

{ #category : #accessing }
Patient >> specimenIdentificationIOM [

	^specimenIdentificationIOM isNil
		ifTrue: [specimenIdentificationIOM := SpecimenIdentificationIOM new]
		ifFalse: [specimenIdentificationIOM]
]

{ #category : #accessing }
Patient >> specimenIdentificationIOM: aSpecimenIdentificationIOM [

	specimenIdentificationIOM := aSpecimenIdentificationIOM
]

{ #category : #'accessing - specimen identification IOM' }
Patient >> specimenSequence [

	^self specimenIdentificationIOM specimenSequence
]

{ #category : #studies }
Patient >> storeStudy: newStudy [
	(self includesStudy: newStudy)
		ifTrue: [ newStudy series: (self studies at: newStudy studyInstanceUID trimBoth) series ].
	newStudy patient: self.
	self studies at: newStudy studyInstanceUID trimBoth put: newStudy
]

{ #category : #accessing }
Patient >> studies [

	^studies isNil ifTrue: [studies := Dictionary new] ifFalse: [studies]
]

{ #category : #studies }
Patient >> studies: aStudiesDictionary [

	studies := aStudiesDictionary.
]

{ #category : #accessing }
Patient >> values [

	^self studies values
]
