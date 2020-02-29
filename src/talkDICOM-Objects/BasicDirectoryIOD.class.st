Class {
	#name : #BasicDirectoryIOD,
	#superclass : #DicomIOD,
	#instVars : [
		'fileSetIOM',
		'directoryInformationIOM'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
BasicDirectoryIOD class >> DicomIODName [

	^'Basic Directory IOD'
]

{ #category : #accessing }
BasicDirectoryIOD class >> InformationObjectModules [

	^InformationObjectModules
		ifNil: 
			[InformationObjectModules := OrderedCollection new.
			InformationObjectModules
				add: FileSetIOM initialize;
				add: DirectoryInformationIOM initialize;
				yourself]
]

{ #category : #accessing }
BasicDirectoryIOD class >> SOPClassUID [

	^'1.2.840.10008.1.3.10'
]

{ #category : #'class initialization' }
BasicDirectoryIOD class >> initialize [

	super initialize.
]

{ #category : #comparing }
BasicDirectoryIOD >> < dicomIOD [
	"PRD - March 05th, 2004"

	^self shouldNotImplement
]

{ #category : #comparing }
BasicDirectoryIOD >> <= dicomIOD [
	"PRD - March 05th, 2004"

	^self shouldNotImplement
]

{ #category : #comparing }
BasicDirectoryIOD >> > dicomIOD [
	"PRD - March 05th, 2004"

	^self shouldNotImplement
]

{ #category : #comparing }
BasicDirectoryIOD >> >= dicomIOD [
	"PRD - March 05th, 2004"

	^self shouldNotImplement
]

{ #category : #converting }
BasicDirectoryIOD >> asDICOMDIR_IE [

	^self shouldNotImplement
]

{ #category : #'accessing IOM' }
BasicDirectoryIOD >> directoryInformationIOM [

	^directoryInformationIOM
]

{ #category : #'accessing IOM' }
BasicDirectoryIOD >> directoryInformationIOM: aDirectoryInformationIOM [

	directoryInformationIOM := aDirectoryInformationIOM.
	directoryInformationIOM encoder: self encoder.

	directoryInformationIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		directoryInformationIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
	].

	directoryInformationIOM dataElementsValues == self dataElementsValues ifFalse: [
		directoryInformationIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		directoryInformationIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> directoryRecordSequence [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	^directoryInformationIOM directoryRecordSequence
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> directoryRecordSequence: aSQValue [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	directoryInformationIOM directoryRecordSequence: aSQValue

]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> fileSetConsistencyFlag [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	^directoryInformationIOM fileSetConsistencyFlag
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> fileSetConsistencyFlag: aUSValue [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	directoryInformationIOM fileSetConsistencyFlag: aUSValue

]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> fileSetDescriptorFileID [

	fileSetIOM isNil ifTrue: [
		fileSetIOM := FileSetIOM new.
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
		fileSetIOM dataElementsValues: self dataElementsValues.
	].

	^fileSetIOM fileSetDescriptorFileID
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> fileSetDescriptorFileID: aCSValue [

	fileSetIOM isNil ifTrue: [
		fileSetIOM := FileSetIOM new.
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
		fileSetIOM dataElementsValues: self dataElementsValues.
	].

	fileSetIOM fileSetDescriptorFileID: aCSValue

]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> fileSetID [

	fileSetIOM isNil ifTrue: [
		fileSetIOM := FileSetIOM new.
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
		fileSetIOM dataElementsValues: self dataElementsValues.
	].

	^fileSetIOM fileSetID
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> fileSetID: aCSValue [

	fileSetIOM isNil ifTrue: [
		fileSetIOM := FileSetIOM new.
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
		fileSetIOM dataElementsValues: self dataElementsValues.
	].

	fileSetIOM fileSetID: aCSValue

]

{ #category : #'accessing IOM' }
BasicDirectoryIOD >> fileSetIOM [

	^fileSetIOM
]

{ #category : #'accessing IOM' }
BasicDirectoryIOD >> fileSetIOM: aFileSetIOM [

	fileSetIOM := aFileSetIOM.
	fileSetIOM encoder: self encoder.

	fileSetIOM dataElementsDictionary == self dataElementsDictionary ifFalse: [
		fileSetIOM dataElementsDictionary keysAndValuesDo: [:key :value |
			self dataElementsDictionary at: key put: value].
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
	].

	fileSetIOM dataElementsValues == self dataElementsValues ifFalse: [
		fileSetIOM dataElementsValues keysAndValuesDo: [:key :value |
			self dataElementsValues at: key put: value].
		fileSetIOM dataElementsValues: self dataElementsValues
	].


]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	^directoryInformationIOM offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity: aULValue [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	directoryInformationIOM offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity: aULValue

]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	^directoryInformationIOM offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity: aULValue [

	directoryInformationIOM isNil ifTrue: [
		directoryInformationIOM := DirectoryInformationIOM new.
		directoryInformationIOM dataElementsDictionary: self dataElementsDictionary.
		directoryInformationIOM dataElementsValues: self dataElementsValues.
	].

	directoryInformationIOM offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity: aULValue

]

{ #category : #accessing }
BasicDirectoryIOD >> sopClassUID [

	^'1.2.840.10008.1.3.10'
]

{ #category : #accessing }
BasicDirectoryIOD >> sopInstanceUID [

	^'1.2.840.66666.', Date today asSeconds printString, '.', Time now asSeconds printString, '.', Time millisecondClockValue printString.
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> specificCharacterSetOfFileSetDescriptorFile [

	fileSetIOM isNil ifTrue: [
		fileSetIOM := FileSetIOM new.
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
		fileSetIOM dataElementsValues: self dataElementsValues.
	].

	^fileSetIOM specificCharacterSetOfFileSetDescriptorFile
]

{ #category : #'accessing IOM data elements' }
BasicDirectoryIOD >> specificCharacterSetOfFileSetDescriptorFile: aCSValue [

	fileSetIOM isNil ifTrue: [
		fileSetIOM := FileSetIOM new.
		fileSetIOM dataElementsDictionary: self dataElementsDictionary.
		fileSetIOM dataElementsValues: self dataElementsValues.
	].

	fileSetIOM specificCharacterSetOfFileSetDescriptorFile: aCSValue

]
