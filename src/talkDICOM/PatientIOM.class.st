Class {
	#name : #PatientIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
PatientIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Patient Information Object Module
	PS 3.3-2000 Annex C.7.1.1 - PRD 04-06.2001
	
	Review and update according to DICOM PS3.3-2017c Annex C.7.1.1 - PRD August 15, 2017"

	self resetDataElements.
	Name := 'Patient Information Object Module'.
	moduleName := 'patientIOM'.
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
				type: '2').
	self
		addDataElement:
			(DADataElement
				newWith: #patientsBirthDate
				tag: #(16r0010 16r0030)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #patientsSex
				tag: #(16r0010 16r0040)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedPatientSequence
				tag: #(16r0008 16r1120)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedPatientSequenceItem).
	self
		addDataElement:
			(TMDataElement
				newWith: #patientsBirthTime
				tag: #(16r0010 16r0032)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #otherPatientsIDs
				tag: #(16r0010 16r1000)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(PNDataElement
				newWith: #otherPatientsNames
				tag: #(16r0010 16r1001)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #ethnnicGroup
				tag: #(16r0010 16r2160)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LTDataElement
				newWith: #patientComments
				tag: #(16r0010 16r4000)
				vm: '1'
				type: '3')
]

{ #category : #checking }
PatientIOM >> checkIOM [

	^true
	"self patientID isEmpty
		ifTrue: 
			[self patientID: Date today asSeconds printString
						, Time now asSeconds printString]."
]

{ #category : #accessing }
PatientIOM >> ethnicGroup [

	^self dataElementsValues at: 'ethnicGroup' ifAbsent: [
		self dataElementsDictionary at: 'ethnicGroup' ifPresent: [:dataElement |
			self dataElementsValues at: 'ethnicGroup' put: (self dataElementsDictionary removeKey: 'ethnicGroup') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> ethnicGroup: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'ethnicGroup' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #ethnicGroup.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'ethnicGroup' put: dataElement.
			self dataElementsValues removeKey: 'ethnicGroup' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'ethnicGroup' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> ethnnicGroup [

	^self dataElementsValues at: 'ethnicGroup' ifAbsent: [
		self dataElementsDictionary at: 'ethnicGroup' ifPresent: [:dataElement |
			self dataElementsValues at: 'ethnicGroup' put: (self dataElementsDictionary removeKey: 'ethnicGroup') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> ethnnicGroup: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'ethnicGroup' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #ethnicGroup.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'ethnicGroup' put: dataElement.
			self dataElementsValues removeKey: 'ethnicGroup' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'ethnicGroup' put: aSHValue
		]
	].

]

{ #category : #accessing }
PatientIOM >> otherPatientNames [

	^self dataElementsValues at: 'otherPatientNames' ifAbsent: [
		self dataElementsDictionary at: 'otherPatientNames' ifPresent: [:dataElement |
			self dataElementsValues at: 'otherPatientNames' put: (self dataElementsDictionary removeKey: 'otherPatientNames') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> otherPatientNames: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'otherPatientNames' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #otherPatientNames.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'otherPatientNames' put: dataElement.
			self dataElementsValues removeKey: 'otherPatientNames' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'otherPatientNames' put: aPNValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> otherPatientsIDs [

	^self dataElementsValues at: 'rETIRED_OtherPatientIDs' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_OtherPatientIDs' put: (self dataElementsDictionary removeKey: 'rETIRED_OtherPatientIDs') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> otherPatientsIDs: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_OtherPatientIDs.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_OtherPatientIDs' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_OtherPatientIDs' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> otherPatientsNames [

	^self dataElementsValues at: 'otherPatientNames' ifAbsent: [
		self dataElementsDictionary at: 'otherPatientNames' ifPresent: [:dataElement |
			self dataElementsValues at: 'otherPatientNames' put: (self dataElementsDictionary removeKey: 'otherPatientNames') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> otherPatientsNames: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'otherPatientNames' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #otherPatientNames.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'otherPatientNames' put: dataElement.
			self dataElementsValues removeKey: 'otherPatientNames' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'otherPatientNames' put: aPNValue
		]
	].

]

{ #category : #accessing }
PatientIOM >> patientBirthDate [

	^self dataElementsValues at: 'patientBirthDate' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthDate' put: (self dataElementsDictionary removeKey: 'patientBirthDate') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> patientBirthDate: aDAValue [

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
PatientIOM >> patientBirthTime [

	^self dataElementsValues at: 'patientBirthTime' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthTime' put: (self dataElementsDictionary removeKey: 'patientBirthTime') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> patientBirthTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientBirthTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientBirthTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'patientBirthTime' put: dataElement.
			self dataElementsValues removeKey: 'patientBirthTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientBirthTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
PatientIOM >> patientComments [

	^self dataElementsValues at: 'patientComments' ifAbsent: [
		self dataElementsDictionary at: 'patientComments' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientComments' put: (self dataElementsDictionary removeKey: 'patientComments') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> patientComments: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientComments' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientComments.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'patientComments' put: dataElement.
			self dataElementsValues removeKey: 'patientComments' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientComments' put: aLTValue
		]
	].

]

{ #category : #accessing }
PatientIOM >> patientID [

	^self dataElementsValues at: 'patientID' ifAbsent: [
		self dataElementsDictionary at: 'patientID' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientID' put: (self dataElementsDictionary removeKey: 'patientID') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> patientID: aLOValue [

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
PatientIOM >> patientName [

	^self dataElementsValues at: 'patientName' ifAbsent: [
		self dataElementsDictionary at: 'patientName' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientName' put: (self dataElementsDictionary removeKey: 'patientName') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> patientName: aPNValue [

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
PatientIOM >> patientSex [

	^self dataElementsValues at: 'patientSex' ifAbsent: [
		self dataElementsDictionary at: 'patientSex' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSex' put: (self dataElementsDictionary removeKey: 'patientSex') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> patientSex: aCSValue [

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
PatientIOM >> patientsBirthDate [

	^self dataElementsValues at: 'patientBirthDate' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthDate' put: (self dataElementsDictionary removeKey: 'patientBirthDate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> patientsBirthDate: aDAValue [

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
PatientIOM >> patientsBirthTime [

	^self dataElementsValues at: 'patientBirthTime' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthTime' put: (self dataElementsDictionary removeKey: 'patientBirthTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> patientsBirthTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientBirthTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientBirthTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'patientBirthTime' put: dataElement.
			self dataElementsValues removeKey: 'patientBirthTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientBirthTime' put: aTMValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> patientsName [

	^self dataElementsValues at: 'patientName' ifAbsent: [
		self dataElementsDictionary at: 'patientName' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientName' put: (self dataElementsDictionary removeKey: 'patientName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> patientsName: aPNValue [

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
PatientIOM >> patientsSex [

	^self dataElementsValues at: 'patientSex' ifAbsent: [
		self dataElementsDictionary at: 'patientSex' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSex' put: (self dataElementsDictionary removeKey: 'patientSex') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientIOM >> patientsSex: aCSValue [

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
PatientIOM >> rETIRED_OtherPatientIDs [

	^self dataElementsValues at: 'rETIRED_OtherPatientIDs' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_OtherPatientIDs' put: (self dataElementsDictionary removeKey: 'rETIRED_OtherPatientIDs') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> rETIRED_OtherPatientIDs: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_OtherPatientIDs.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_OtherPatientIDs' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_OtherPatientIDs' put: aLOValue
		]
	].

]

{ #category : #accessing }
PatientIOM >> referencedPatientSequence [

	^self dataElementsValues at: 'referencedPatientSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPatientSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPatientSequence' put: (self dataElementsDictionary removeKey: 'referencedPatientSequence') value.
		]
	]

]

{ #category : #accessing }
PatientIOM >> referencedPatientSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedPatientSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedPatientSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedPatientSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedPatientSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedPatientSequence' put: aSQValue
		]
	].

]
