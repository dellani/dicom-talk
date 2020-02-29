Class {
	#name : #GeneralStudyIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
GeneralStudyIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM General Study Information Object Module
	PS 3.3-2000 Annex C.7.2.1 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM General Study Information Object Module'.
	moduleName := 'generalStudyIOM'.
	self
		addDataElement:
			(UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DADataElement
				newWith: #studyDate
				tag: #(16r0008 16r0020)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(TMDataElement
				newWith: #studyTime
				tag: #(16r0008 16r0030)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(PNDataElement
				newWith: #referringPhysiciansName
				tag: #(16r0008 16r0090)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SHDataElement
				newWith: #studyID
				tag: #(16r0020 16r0010)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SHDataElement
				newWith: #accessionNumber
				tag: #(16r0008 16r0050)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(LODataElement
				newWith: #studyDescription
				tag: #(16r0008 16r1030)
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
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedStudySequence
				tag: #(16r0008 16r1110)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedStudySequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #procedureCodeSequence
				tag: #(16r0008 16r1032)
				vm: '1'
				type: '3'
				sequenceItemClass: ProcedureCodeSequenceItem)
]

{ #category : #accessing }
GeneralStudyIOM >> accessionNumber [

	^self dataElementsValues at: 'accessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'accessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'accessionNumber' put: (self dataElementsDictionary removeKey: 'accessionNumber') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> accessionNumber: aSHValue [

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

{ #category : #checking }
GeneralStudyIOM >> checkIOM [

	^true
]

{ #category : #accessing }
GeneralStudyIOM >> nameOfPhysiciansReadingStudy [

	^self dataElementsValues at: 'nameOfPhysiciansReadingStudy' ifAbsent: [
		self dataElementsDictionary at: 'nameOfPhysiciansReadingStudy' ifPresent: [:dataElement |
			self dataElementsValues at: 'nameOfPhysiciansReadingStudy' put: (self dataElementsDictionary removeKey: 'nameOfPhysiciansReadingStudy') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> nameOfPhysiciansReadingStudy: aPNValue [

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
GeneralStudyIOM >> physiciansOfRecord [

	^self dataElementsValues at: 'physiciansOfRecord' ifAbsent: [
		self dataElementsDictionary at: 'physiciansOfRecord' ifPresent: [:dataElement |
			self dataElementsValues at: 'physiciansOfRecord' put: (self dataElementsDictionary removeKey: 'physiciansOfRecord') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> physiciansOfRecord: aPNValue [

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
GeneralStudyIOM >> procedureCodeSequence [

	^self dataElementsValues at: 'procedureCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'procedureCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'procedureCodeSequence' put: (self dataElementsDictionary removeKey: 'procedureCodeSequence') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> procedureCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'procedureCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #procedureCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'procedureCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'procedureCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'procedureCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
GeneralStudyIOM >> referencedStudySequence [

	^self dataElementsValues at: 'referencedStudySequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedStudySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedStudySequence' put: (self dataElementsDictionary removeKey: 'referencedStudySequence') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> referencedStudySequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedStudySequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedStudySequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedStudySequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedStudySequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedStudySequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
GeneralStudyIOM >> referringPhysicianName [

	^self dataElementsValues at: 'referringPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'referringPhysicianName' put: (self dataElementsDictionary removeKey: 'referringPhysicianName') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> referringPhysicianName: aPNValue [

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
GeneralStudyIOM >> referringPhysiciansName [

	^self dataElementsValues at: 'referringPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'referringPhysicianName' put: (self dataElementsDictionary removeKey: 'referringPhysicianName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GeneralStudyIOM >> referringPhysiciansName: aPNValue [

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
GeneralStudyIOM >> studyDate [

	^self dataElementsValues at: 'studyDate' ifAbsent: [
		self dataElementsDictionary at: 'studyDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyDate' put: (self dataElementsDictionary removeKey: 'studyDate') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> studyDate: aDAValue [

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
GeneralStudyIOM >> studyDescription [

	^self dataElementsValues at: 'studyDescription' ifAbsent: [
		self dataElementsDictionary at: 'studyDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyDescription' put: (self dataElementsDictionary removeKey: 'studyDescription') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> studyDescription: aLOValue [

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
GeneralStudyIOM >> studyID [

	^self dataElementsValues at: 'studyID' ifAbsent: [
		self dataElementsDictionary at: 'studyID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyID' put: (self dataElementsDictionary removeKey: 'studyID') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> studyID: aSHValue [

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
GeneralStudyIOM >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> studyInstanceUID: aUIValue [

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
GeneralStudyIOM >> studyTime [

	^self dataElementsValues at: 'studyTime' ifAbsent: [
		self dataElementsDictionary at: 'studyTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyTime' put: (self dataElementsDictionary removeKey: 'studyTime') value.
		]
	]

]

{ #category : #accessing }
GeneralStudyIOM >> studyTime: aTMValue [

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
