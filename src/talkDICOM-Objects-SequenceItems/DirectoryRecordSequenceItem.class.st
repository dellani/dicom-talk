Class {
	#name : #DirectoryRecordSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
DirectoryRecordSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Directory Record Sequence Item'.
	SequenceName := 'directoryRecordSequenceItem'.
	self
		addDataElement:
			(ULDataElement
				newWith: #offsetOfTheNextDirectoryRecord
				tag: #(16r0004 16r1400)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #recordInUseFlag
				tag: #(16r0004 16r1410)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #offsetOfReferencedLowerLevelDirectoryEntity
				tag: #(16r0004 16r1420)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #directoryRecordType
				tag: #(16r0004 16r1430)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #privateRecordUID
				tag: #(16r0004 16r1432)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #referencedFileID
				tag: #(16r0004 16r1500)
				vm: '1-8'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #mrDRDirectoryRecordOffset
				tag: #(16r0004 16r1504)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPClassUIDInFile
				tag: #(16r0004 16r1510)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPInstanceUIDInFile
				tag: #(16r0004 16r1511)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedTransferSyntaxUIDInFile
				tag: #(16r0004 16r1512)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #specificCharacterSet
				tag: #(16r0008 16r0005)
				vm: '1-n'
				type: '1C').

	"****** Patient Keys *******"
	self
		addDataElement:
			(PNDataElement
				newWith: #patientsName
				tag: #(16r0010 16r0010)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(LODataElement
				newWith: #patientID
				tag: #(16r0010 16r0020)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DADataElement
				newWith: #patientsBirthDate
				tag: #(16r0010 16r0030)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #patientsSex
				tag: #(16r0010 16r0040)
				vm: '1'
				type: '3').

	"****** Study Keys *******"
	self
		addDataElement:
			(DADataElement
				newWith: #studyDate
				tag: #(16r0008 16r0020)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(TMDataElement
				newWith: #studyTime
				tag: #(16r0008 16r0030)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(LODataElement
				newWith: #studyDescription
				tag: #(16r0008 16r1030)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SHDataElement
				newWith: #studyID
				tag: #(16r0020 16r0010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SHDataElement
				newWith: #accessionNumber
				tag: #(16r0008 16r0050)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(PNDataElement
				newWith: #referringPhysiciansName
				tag: #(16r0008 16r0090)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(PNDataElement
				newWith: #physiciansOfRecord
				tag: #(16r0008 16r1048)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(PNDataElement
				newWith: #nameOfPhysiciansReadingStudy
				tag: #(16r0008 16r1060)
				vm: '1-n'
				type: '3').

	"****** Series Keys *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #modality
				tag: #(16r0008 16r0060)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(UIDataElement
				newWith: #seriesInstanceUID
				tag: #(16r0020 16r000E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ISDataElement
				newWith: #seriesNumber
				tag: #(16r0020 16r0011)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SQDataElement
				newWith: #iconImageSequence
				tag: #(16r0088 16r0200)
				vm: '1'
				type: '3'
				sequenceItemClass: IconImageSequenceItem).
	self
		addDataElement:
			(CSDataElement
				newWith: #bodyPartExamined
				tag: #(16r0018 16r0015)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DADataElement
				newWith: #seriesDate
				tag: #(16r0008 16r0021)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #seriesTime
				tag: #(16r0008 16r0031)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(PNDataElement
				newWith: #performingPhysiciansName
				tag: #(16r0008 16r1050)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #protocolName
				tag: #(16r0018 16r1030)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #seriesDescription
				tag: #(16r0008 16r103E)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(PNDataElement
				newWith: #operatorsName
				tag: #(16r0008 16r1070)
				vm: '1-n'
				type: '3').

	"******* Image Keys ******"
	self
		addDataElement:
			(ISDataElement
				newWith: #instanceNumber
				tag: #(16r0020 16r0013)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #imageType
				tag: #(16r0008 16r0008)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r0008 16r1140)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedImageSequenceItem)
]

{ #category : #accessing }
DirectoryRecordSequenceItem >> accessionNumber [

	^self dataElementsValues at: 'accessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'accessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'accessionNumber' put: (self dataElementsDictionary removeKey: 'accessionNumber') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> accessionNumber: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'accessionNumber' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #accessionNumber.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'accessionNumber' put: dataElement.
			self dataElementsValues removeKey: 'accessionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'accessionNumber' put: aSHValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> bodyPartExamined [

	^self dataElementsValues at: 'bodyPartExamined' ifAbsent: [
		self dataElementsDictionary at: 'bodyPartExamined' ifPresent: [:dataElement |
			self dataElementsValues at: 'bodyPartExamined' put: (self dataElementsDictionary removeKey: 'bodyPartExamined') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> bodyPartExamined: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bodyPartExamined' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bodyPartExamined.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'bodyPartExamined' put: dataElement.
			self dataElementsValues removeKey: 'bodyPartExamined' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bodyPartExamined' put: aCSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> directoryRecordType [

	^self dataElementsValues at: 'directoryRecordType' ifAbsent: [
		self dataElementsDictionary at: 'directoryRecordType' ifPresent: [:dataElement |
			self dataElementsValues at: 'directoryRecordType' put: (self dataElementsDictionary removeKey: 'directoryRecordType') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> directoryRecordType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'directoryRecordType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #directoryRecordType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'directoryRecordType' put: dataElement.
			self dataElementsValues removeKey: 'directoryRecordType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'directoryRecordType' put: aCSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> iconImageSequence [

	^self dataElementsValues at: 'iconImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'iconImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'iconImageSequence' put: (self dataElementsDictionary removeKey: 'iconImageSequence') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> iconImageSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'iconImageSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iconImageSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'iconImageSequence' put: dataElement.
			self dataElementsValues removeKey: 'iconImageSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iconImageSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> imageType [

	^self dataElementsValues at: 'imageType' ifAbsent: [
		self dataElementsDictionary at: 'imageType' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageType' put: (self dataElementsDictionary removeKey: 'imageType') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> imageType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'imageType' put: dataElement.
			self dataElementsValues removeKey: 'imageType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageType' put: aCSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> instanceNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'instanceNumber' put: dataElement.
			self dataElementsValues removeKey: 'instanceNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> modality [

	^self dataElementsValues at: 'modality' ifAbsent: [
		self dataElementsDictionary at: 'modality' ifPresent: [:dataElement |
			self dataElementsValues at: 'modality' put: (self dataElementsDictionary removeKey: 'modality') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> modality: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'modality' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #modality.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'modality' put: dataElement.
			self dataElementsValues removeKey: 'modality' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'modality' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> mrDRDirectoryRecordOffset [

	^self dataElementsValues at: 'rETIRED_MRDRDirectoryRecordOffset' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_MRDRDirectoryRecordOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_MRDRDirectoryRecordOffset' put: (self dataElementsDictionary removeKey: 'rETIRED_MRDRDirectoryRecordOffset') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> mrDRDirectoryRecordOffset: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_MRDRDirectoryRecordOffset' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_MRDRDirectoryRecordOffset.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_MRDRDirectoryRecordOffset' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_MRDRDirectoryRecordOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_MRDRDirectoryRecordOffset' put: aULValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> nameOfPhysiciansReadingStudy [

	^self dataElementsValues at: 'nameOfPhysiciansReadingStudy' ifAbsent: [
		self dataElementsDictionary at: 'nameOfPhysiciansReadingStudy' ifPresent: [:dataElement |
			self dataElementsValues at: 'nameOfPhysiciansReadingStudy' put: (self dataElementsDictionary removeKey: 'nameOfPhysiciansReadingStudy') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> nameOfPhysiciansReadingStudy: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'nameOfPhysiciansReadingStudy' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #nameOfPhysiciansReadingStudy.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'nameOfPhysiciansReadingStudy' put: dataElement.
			self dataElementsValues removeKey: 'nameOfPhysiciansReadingStudy' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'nameOfPhysiciansReadingStudy' put: aPNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> offsetOfReferencedLowerLevelDirectoryEntity [

	^self dataElementsValues at: 'offsetOfReferencedLowerLevelDirectoryEntity' ifAbsent: [
		self dataElementsDictionary at: 'offsetOfReferencedLowerLevelDirectoryEntity' ifPresent: [:dataElement |
			self dataElementsValues at: 'offsetOfReferencedLowerLevelDirectoryEntity' put: (self dataElementsDictionary removeKey: 'offsetOfReferencedLowerLevelDirectoryEntity') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> offsetOfReferencedLowerLevelDirectoryEntity: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'offsetOfReferencedLowerLevelDirectoryEntity' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #offsetOfReferencedLowerLevelDirectoryEntity.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'offsetOfReferencedLowerLevelDirectoryEntity' put: dataElement.
			self dataElementsValues removeKey: 'offsetOfReferencedLowerLevelDirectoryEntity' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'offsetOfReferencedLowerLevelDirectoryEntity' put: aULValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> offsetOfTheNextDirectoryRecord [

	^self dataElementsValues at: 'offsetOfTheNextDirectoryRecord' ifAbsent: [
		self dataElementsDictionary at: 'offsetOfTheNextDirectoryRecord' ifPresent: [:dataElement |
			self dataElementsValues at: 'offsetOfTheNextDirectoryRecord' put: (self dataElementsDictionary removeKey: 'offsetOfTheNextDirectoryRecord') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> offsetOfTheNextDirectoryRecord: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'offsetOfTheNextDirectoryRecord' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #offsetOfTheNextDirectoryRecord.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'offsetOfTheNextDirectoryRecord' put: dataElement.
			self dataElementsValues removeKey: 'offsetOfTheNextDirectoryRecord' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'offsetOfTheNextDirectoryRecord' put: aULValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> operatorsName [

	^self dataElementsValues at: 'operatorsName' ifAbsent: [
		self dataElementsDictionary at: 'operatorsName' ifPresent: [:dataElement |
			self dataElementsValues at: 'operatorsName' put: (self dataElementsDictionary removeKey: 'operatorsName') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> operatorsName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'operatorsName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #operatorsName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'operatorsName' put: dataElement.
			self dataElementsValues removeKey: 'operatorsName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'operatorsName' put: aPNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientBirthDate [

	^self dataElementsValues at: 'patientBirthDate' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthDate' put: (self dataElementsDictionary removeKey: 'patientBirthDate') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientBirthDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientBirthDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'patientBirthDate' put: dataElement.
			self dataElementsValues removeKey: 'patientBirthDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientBirthDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientID [

	^self dataElementsValues at: 'patientID' ifAbsent: [
		self dataElementsDictionary at: 'patientID' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientID' put: (self dataElementsDictionary removeKey: 'patientID') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientID: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientID' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientID.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'patientID' put: dataElement.
			self dataElementsValues removeKey: 'patientID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientID' put: aLOValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientName [

	^self dataElementsValues at: 'patientName' ifAbsent: [
		self dataElementsDictionary at: 'patientName' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientName' put: (self dataElementsDictionary removeKey: 'patientName') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'patientName' put: dataElement.
			self dataElementsValues removeKey: 'patientName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientName' put: aPNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientSex [

	^self dataElementsValues at: 'patientSex' ifAbsent: [
		self dataElementsDictionary at: 'patientSex' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSex' put: (self dataElementsDictionary removeKey: 'patientSex') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> patientSex: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientSex' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientSex.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'patientSex' put: dataElement.
			self dataElementsValues removeKey: 'patientSex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientSex' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> patientsBirthDate [

	^self dataElementsValues at: 'patientBirthDate' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthDate' put: (self dataElementsDictionary removeKey: 'patientBirthDate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> patientsBirthDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientBirthDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'patientBirthDate' put: dataElement.
			self dataElementsValues removeKey: 'patientBirthDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientBirthDate' put: aDAValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> patientsName [

	^self dataElementsValues at: 'patientName' ifAbsent: [
		self dataElementsDictionary at: 'patientName' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientName' put: (self dataElementsDictionary removeKey: 'patientName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> patientsName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'patientName' put: dataElement.
			self dataElementsValues removeKey: 'patientName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientName' put: aPNValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> patientsSex [

	^self dataElementsValues at: 'patientSex' ifAbsent: [
		self dataElementsDictionary at: 'patientSex' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSex' put: (self dataElementsDictionary removeKey: 'patientSex') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> patientsSex: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientSex' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientSex.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'patientSex' put: dataElement.
			self dataElementsValues removeKey: 'patientSex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientSex' put: aCSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> performingPhysicianName [

	^self dataElementsValues at: 'performingPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'performingPhysicianName' put: (self dataElementsDictionary removeKey: 'performingPhysicianName') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> performingPhysicianName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performingPhysicianName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'performingPhysicianName' put: dataElement.
			self dataElementsValues removeKey: 'performingPhysicianName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performingPhysicianName' put: aPNValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> performingPhysiciansName [

	^self dataElementsValues at: 'performingPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'performingPhysicianName' put: (self dataElementsDictionary removeKey: 'performingPhysicianName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> performingPhysiciansName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performingPhysicianName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'performingPhysicianName' put: dataElement.
			self dataElementsValues removeKey: 'performingPhysicianName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performingPhysicianName' put: aPNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> physiciansOfRecord [

	^self dataElementsValues at: 'physiciansOfRecord' ifAbsent: [
		self dataElementsDictionary at: 'physiciansOfRecord' ifPresent: [:dataElement |
			self dataElementsValues at: 'physiciansOfRecord' put: (self dataElementsDictionary removeKey: 'physiciansOfRecord') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> physiciansOfRecord: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'physiciansOfRecord' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physiciansOfRecord.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'physiciansOfRecord' put: dataElement.
			self dataElementsValues removeKey: 'physiciansOfRecord' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physiciansOfRecord' put: aPNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> privateRecordUID [

	^self dataElementsValues at: 'privateRecordUID' ifAbsent: [
		self dataElementsDictionary at: 'privateRecordUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'privateRecordUID' put: (self dataElementsDictionary removeKey: 'privateRecordUID') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> privateRecordUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'privateRecordUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #privateRecordUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'privateRecordUID' put: dataElement.
			self dataElementsValues removeKey: 'privateRecordUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'privateRecordUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> protocolName [

	^self dataElementsValues at: 'protocolName' ifAbsent: [
		self dataElementsDictionary at: 'protocolName' ifPresent: [:dataElement |
			self dataElementsValues at: 'protocolName' put: (self dataElementsDictionary removeKey: 'protocolName') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> protocolName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'protocolName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #protocolName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'protocolName' put: dataElement.
			self dataElementsValues removeKey: 'protocolName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'protocolName' put: aLOValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> rETIRED_MRDRDirectoryRecordOffset [

	^self dataElementsValues at: 'rETIRED_MRDRDirectoryRecordOffset' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_MRDRDirectoryRecordOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_MRDRDirectoryRecordOffset' put: (self dataElementsDictionary removeKey: 'rETIRED_MRDRDirectoryRecordOffset') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> rETIRED_MRDRDirectoryRecordOffset: aUNValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_MRDRDirectoryRecordOffset' ifPresent: [:aDataElement | aDataElement value: aUNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_MRDRDirectoryRecordOffset.
			dataElement encoder: self encoder.
			dataElement value: aUNValue.
			self dataElementsDictionary at: 'rETIRED_MRDRDirectoryRecordOffset' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_MRDRDirectoryRecordOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_MRDRDirectoryRecordOffset' put: aUNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> recordInUseFlag [

	^self dataElementsValues at: 'recordInUseFlag' ifAbsent: [
		self dataElementsDictionary at: 'recordInUseFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'recordInUseFlag' put: (self dataElementsDictionary removeKey: 'recordInUseFlag') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> recordInUseFlag: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'recordInUseFlag' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #recordInUseFlag.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'recordInUseFlag' put: dataElement.
			self dataElementsValues removeKey: 'recordInUseFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'recordInUseFlag' put: aUSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedFileID [

	^self dataElementsValues at: 'referencedFileID' ifAbsent: [
		self dataElementsDictionary at: 'referencedFileID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedFileID' put: (self dataElementsDictionary removeKey: 'referencedFileID') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedFileID: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedFileID' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedFileID.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'referencedFileID' put: dataElement.
			self dataElementsValues removeKey: 'referencedFileID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedFileID' put: aCSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedImageSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedImageSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedImageSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedImageSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedImageSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedSOPClassUIDInFile [

	^self dataElementsValues at: 'referencedSOPClassUIDInFile' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPClassUIDInFile' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPClassUIDInFile' put: (self dataElementsDictionary removeKey: 'referencedSOPClassUIDInFile') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedSOPClassUIDInFile: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPClassUIDInFile' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPClassUIDInFile.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPClassUIDInFile' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPClassUIDInFile' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPClassUIDInFile' put: aUIValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedSOPInstanceUIDInFile [

	^self dataElementsValues at: 'referencedSOPInstanceUIDInFile' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPInstanceUIDInFile' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPInstanceUIDInFile' put: (self dataElementsDictionary removeKey: 'referencedSOPInstanceUIDInFile') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedSOPInstanceUIDInFile: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPInstanceUIDInFile' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPInstanceUIDInFile.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPInstanceUIDInFile' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPInstanceUIDInFile' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPInstanceUIDInFile' put: aUIValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedTransferSyntaxUIDInFile [

	^self dataElementsValues at: 'referencedTransferSyntaxUIDInFile' ifAbsent: [
		self dataElementsDictionary at: 'referencedTransferSyntaxUIDInFile' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedTransferSyntaxUIDInFile' put: (self dataElementsDictionary removeKey: 'referencedTransferSyntaxUIDInFile') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referencedTransferSyntaxUIDInFile: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedTransferSyntaxUIDInFile' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedTransferSyntaxUIDInFile.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedTransferSyntaxUIDInFile' put: dataElement.
			self dataElementsValues removeKey: 'referencedTransferSyntaxUIDInFile' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedTransferSyntaxUIDInFile' put: aUIValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referringPhysicianName [

	^self dataElementsValues at: 'referringPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'referringPhysicianName' put: (self dataElementsDictionary removeKey: 'referringPhysicianName') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> referringPhysicianName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referringPhysicianName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'referringPhysicianName' put: dataElement.
			self dataElementsValues removeKey: 'referringPhysicianName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referringPhysicianName' put: aPNValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> referringPhysiciansName [

	^self dataElementsValues at: 'referringPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'referringPhysicianName' put: (self dataElementsDictionary removeKey: 'referringPhysicianName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DirectoryRecordSequenceItem >> referringPhysiciansName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referringPhysicianName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'referringPhysicianName' put: dataElement.
			self dataElementsValues removeKey: 'referringPhysicianName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referringPhysicianName' put: aPNValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesDate [

	^self dataElementsValues at: 'seriesDate' ifAbsent: [
		self dataElementsDictionary at: 'seriesDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesDate' put: (self dataElementsDictionary removeKey: 'seriesDate') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'seriesDate' put: dataElement.
			self dataElementsValues removeKey: 'seriesDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesDescription [

	^self dataElementsValues at: 'seriesDescription' ifAbsent: [
		self dataElementsDictionary at: 'seriesDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesDescription' put: (self dataElementsDictionary removeKey: 'seriesDescription') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'seriesDescription' put: dataElement.
			self dataElementsValues removeKey: 'seriesDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesInstanceUID [

	^self dataElementsValues at: 'seriesInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesInstanceUID' put: (self dataElementsDictionary removeKey: 'seriesInstanceUID') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'seriesInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'seriesInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesNumber [

	^self dataElementsValues at: 'seriesNumber' ifAbsent: [
		self dataElementsDictionary at: 'seriesNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesNumber' put: (self dataElementsDictionary removeKey: 'seriesNumber') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'seriesNumber' put: dataElement.
			self dataElementsValues removeKey: 'seriesNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesTime [

	^self dataElementsValues at: 'seriesTime' ifAbsent: [
		self dataElementsDictionary at: 'seriesTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesTime' put: (self dataElementsDictionary removeKey: 'seriesTime') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> seriesTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'seriesTime' put: dataElement.
			self dataElementsValues removeKey: 'seriesTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> specificCharacterSet [

	^self dataElementsValues at: 'specificCharacterSet' ifAbsent: [
		self dataElementsDictionary at: 'specificCharacterSet' ifPresent: [:dataElement |
			self dataElementsValues at: 'specificCharacterSet' put: (self dataElementsDictionary removeKey: 'specificCharacterSet') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> specificCharacterSet: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'specificCharacterSet' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #specificCharacterSet.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'specificCharacterSet' put: dataElement.
			self dataElementsValues removeKey: 'specificCharacterSet' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'specificCharacterSet' put: aCSValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyDate [

	^self dataElementsValues at: 'studyDate' ifAbsent: [
		self dataElementsDictionary at: 'studyDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyDate' put: (self dataElementsDictionary removeKey: 'studyDate') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'studyDate' put: dataElement.
			self dataElementsValues removeKey: 'studyDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyDescription [

	^self dataElementsValues at: 'studyDescription' ifAbsent: [
		self dataElementsDictionary at: 'studyDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyDescription' put: (self dataElementsDictionary removeKey: 'studyDescription') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'studyDescription' put: dataElement.
			self dataElementsValues removeKey: 'studyDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyID [

	^self dataElementsValues at: 'studyID' ifAbsent: [
		self dataElementsDictionary at: 'studyID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyID' put: (self dataElementsDictionary removeKey: 'studyID') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'studyID' put: dataElement.
			self dataElementsValues removeKey: 'studyID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyID' put: aSHValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'studyInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'studyInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyTime [

	^self dataElementsValues at: 'studyTime' ifAbsent: [
		self dataElementsDictionary at: 'studyTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyTime' put: (self dataElementsDictionary removeKey: 'studyTime') value.
		]
	]

]

{ #category : #accessing }
DirectoryRecordSequenceItem >> studyTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'studyTime' put: dataElement.
			self dataElementsValues removeKey: 'studyTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyTime' put: aTMValue
		]
	].

]
