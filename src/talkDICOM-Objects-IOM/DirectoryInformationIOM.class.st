Class {
	#name : #DirectoryInformationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
DirectoryInformationIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Directory Information Information Object Module
	PS 3.3-2001 Annex F Part 3 - PRD 08.2002"

	self resetDataElements.
	Name := 'Directory Information Information Object Module'.
	moduleName := 'directoryInformationIOM'.
	self
		addDataElement:
			(ULDataElement
				newWith: #offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity
				tag: #(16r0004 16r1200)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity
				tag: #(16r0004 16r1202)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #fileSetConsistencyFlag
				tag: #(16r0004 16r1212)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #directoryRecordSequence
				tag: #(16r0004 16r1220)
				vm: '1'
				type: '2'
				sequenceItemClass: DirectoryRecordSequenceItem)
]

{ #category : #accessing }
DirectoryInformationIOM >> directoryRecordSequence [

	^self dataElementsValues at: 'directoryRecordSequence' ifAbsent: [
		self dataElementsDictionary at: 'directoryRecordSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'directoryRecordSequence' put: (self dataElementsDictionary removeKey: 'directoryRecordSequence') value.
		]
	]

]

{ #category : #accessing }
DirectoryInformationIOM >> directoryRecordSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'directoryRecordSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #directoryRecordSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'directoryRecordSequence' put: dataElement.
			self dataElementsValues removeKey: 'directoryRecordSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'directoryRecordSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
DirectoryInformationIOM >> fileSetConsistencyFlag [

	^self dataElementsValues at: 'fileSetConsistencyFlag' ifAbsent: [
		self dataElementsDictionary at: 'fileSetConsistencyFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'fileSetConsistencyFlag' put: (self dataElementsDictionary removeKey: 'fileSetConsistencyFlag') value.
		]
	]

]

{ #category : #accessing }
DirectoryInformationIOM >> fileSetConsistencyFlag: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'fileSetConsistencyFlag' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fileSetConsistencyFlag.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'fileSetConsistencyFlag' put: dataElement.
			self dataElementsValues removeKey: 'fileSetConsistencyFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fileSetConsistencyFlag' put: aUSValue
		]
	].

]

{ #category : #accessing }
DirectoryInformationIOM >> offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity [

	^self dataElementsValues at: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' ifAbsent: [
		self dataElementsDictionary at: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' ifPresent: [:dataElement |
			self dataElementsValues at: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' put: (self dataElementsDictionary removeKey: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity') value.
		]
	]

]

{ #category : #accessing }
DirectoryInformationIOM >> offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' put: dataElement.
			self dataElementsValues removeKey: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'offsetOfTheFirstDirectoryRecordOfTheRootDirectoryEntity' put: aULValue
		]
	].

]

{ #category : #accessing }
DirectoryInformationIOM >> offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity [

	^self dataElementsValues at: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' ifAbsent: [
		self dataElementsDictionary at: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' ifPresent: [:dataElement |
			self dataElementsValues at: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' put: (self dataElementsDictionary removeKey: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity') value.
		]
	]

]

{ #category : #accessing }
DirectoryInformationIOM >> offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' put: dataElement.
			self dataElementsValues removeKey: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'offsetOfTheLastDirectoryRecordOfTheRootDirectoryEntity' put: aULValue
		]
	].

]
