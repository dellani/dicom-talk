Class {
	#name : #PatientStudyIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
PatientStudyIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Patient Study Information Object Module
	PS 3.3-2000 Annex C.7.2.2 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'Patient Study Information Object Module'.
	moduleName := 'patientStudyIOM'.
	self
		addDataElement:
			(LODataElement
				newWith: #admittingDiagnosesDescription
				tag: #(16r0008 16r1080)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(ASDataElement
				newWith: #patientsAge
				tag: #(16r0010 16r1010)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #patientsSize
				tag: #(16r0010 16r1020)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #patientsWeight
				tag: #(16r0010 16r1030)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #occupation
				tag: #(16r0010 16r2180)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LTDataElement
				newWith: #additionalPatientsHistory
				tag: #(16r0010 16r21B0)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
PatientStudyIOM >> additionalPatientHistory [

	^self dataElementsValues at: 'additionalPatientHistory' ifAbsent: [
		self dataElementsDictionary at: 'additionalPatientHistory' ifPresent: [:dataElement |
			self dataElementsValues at: 'additionalPatientHistory' put: (self dataElementsDictionary removeKey: 'additionalPatientHistory') value.
		]
	]

]

{ #category : #accessing }
PatientStudyIOM >> additionalPatientHistory: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'additionalPatientHistory' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #additionalPatientHistory.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'additionalPatientHistory' put: dataElement.
			self dataElementsValues removeKey: 'additionalPatientHistory' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'additionalPatientHistory' put: aLTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> additionalPatientsHistory [

	^self dataElementsValues at: 'additionalPatientHistory' ifAbsent: [
		self dataElementsDictionary at: 'additionalPatientHistory' ifPresent: [:dataElement |
			self dataElementsValues at: 'additionalPatientHistory' put: (self dataElementsDictionary removeKey: 'additionalPatientHistory') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> additionalPatientsHistory: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'additionalPatientHistory' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #additionalPatientHistory.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'additionalPatientHistory' put: dataElement.
			self dataElementsValues removeKey: 'additionalPatientHistory' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'additionalPatientHistory' put: aLTValue
		]
	].

]

{ #category : #accessing }
PatientStudyIOM >> admittingDiagnosesDescription [

	^self dataElementsValues at: 'admittingDiagnosesDescription' ifAbsent: [
		self dataElementsDictionary at: 'admittingDiagnosesDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'admittingDiagnosesDescription' put: (self dataElementsDictionary removeKey: 'admittingDiagnosesDescription') value.
		]
	]

]

{ #category : #accessing }
PatientStudyIOM >> admittingDiagnosesDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'admittingDiagnosesDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #admittingDiagnosesDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'admittingDiagnosesDescription' put: dataElement.
			self dataElementsValues removeKey: 'admittingDiagnosesDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'admittingDiagnosesDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
PatientStudyIOM >> occupation [

	^self dataElementsValues at: 'occupation' ifAbsent: [
		self dataElementsDictionary at: 'occupation' ifPresent: [:dataElement |
			self dataElementsValues at: 'occupation' put: (self dataElementsDictionary removeKey: 'occupation') value.
		]
	]

]

{ #category : #accessing }
PatientStudyIOM >> occupation: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'occupation' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #occupation.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'occupation' put: dataElement.
			self dataElementsValues removeKey: 'occupation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'occupation' put: aSHValue
		]
	].

]

{ #category : #accessing }
PatientStudyIOM >> patientAge [

	^self dataElementsValues at: 'patientAge' ifAbsent: [
		self dataElementsDictionary at: 'patientAge' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientAge' put: (self dataElementsDictionary removeKey: 'patientAge') value.
		]
	]

]

{ #category : #accessing }
PatientStudyIOM >> patientAge: aASValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientAge' ifPresent: [:aDataElement | aDataElement value: aASValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientAge.
			dataElement encoder: self encoder.
			dataElement value: aASValue.
			self dataElementsDictionary at: 'patientAge' put: dataElement.
			self dataElementsValues removeKey: 'patientAge' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientAge' put: aASValue
		]
	].

]

{ #category : #accessing }
PatientStudyIOM >> patientSize [

	^self dataElementsValues at: 'patientSize' ifAbsent: [
		self dataElementsDictionary at: 'patientSize' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSize' put: (self dataElementsDictionary removeKey: 'patientSize') value.
		]
	]

]

{ #category : #accessing }
PatientStudyIOM >> patientSize: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientSize' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientSize.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'patientSize' put: dataElement.
			self dataElementsValues removeKey: 'patientSize' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientSize' put: aDSValue
		]
	].

]

{ #category : #accessing }
PatientStudyIOM >> patientWeight [

	^self dataElementsValues at: 'patientWeight' ifAbsent: [
		self dataElementsDictionary at: 'patientWeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientWeight' put: (self dataElementsDictionary removeKey: 'patientWeight') value.
		]
	]

]

{ #category : #accessing }
PatientStudyIOM >> patientWeight: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientWeight' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientWeight.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'patientWeight' put: dataElement.
			self dataElementsValues removeKey: 'patientWeight' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientWeight' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> patientsAge [

	^self dataElementsValues at: 'patientAge' ifAbsent: [
		self dataElementsDictionary at: 'patientAge' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientAge' put: (self dataElementsDictionary removeKey: 'patientAge') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> patientsAge: aASValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientAge' ifPresent: [:aDataElement | aDataElement value: aASValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientAge.
			dataElement encoder: self encoder.
			dataElement value: aASValue.
			self dataElementsDictionary at: 'patientAge' put: dataElement.
			self dataElementsValues removeKey: 'patientAge' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientAge' put: aASValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> patientsSize [

	^self dataElementsValues at: 'patientSize' ifAbsent: [
		self dataElementsDictionary at: 'patientSize' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSize' put: (self dataElementsDictionary removeKey: 'patientSize') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> patientsSize: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientSize' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientSize.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'patientSize' put: dataElement.
			self dataElementsValues removeKey: 'patientSize' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientSize' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> patientsWeight [

	^self dataElementsValues at: 'patientWeight' ifAbsent: [
		self dataElementsDictionary at: 'patientWeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientWeight' put: (self dataElementsDictionary removeKey: 'patientWeight') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientStudyIOM >> patientsWeight: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientWeight' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientWeight.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'patientWeight' put: dataElement.
			self dataElementsValues removeKey: 'patientWeight' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientWeight' put: aDSValue
		]
	].

]
