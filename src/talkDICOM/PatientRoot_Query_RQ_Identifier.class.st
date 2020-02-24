Class {
	#name : #'PatientRoot_Query_RQ_Identifier',
	#superclass : #DicomObject,
	#classInstVars : [
		'PatientLevelKeys',
		'StudyLevelKeys',
		'SeriesLevelKeys',
		'ImageLevelKeys'
	],
	#category : #'talkDICOM-Interfaces'
}

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier class >> ImageLevelKeys [

	^ImageLevelKeys.
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier class >> PatientLevelKeys [

	^PatientLevelKeys.
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier class >> SeriesLevelKeys [

	^SeriesLevelKeys.
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier class >> StudyLevelKeys [

	^StudyLevelKeys.
]

{ #category : #'class initialization' }
PatientRoot_Query_RQ_Identifier class >> defineIMAGELevelKeys [
	"IMAGE Level Information Keys.
	
	PRD 06.2001 - 06.2002, 03.2016"

	ImageLevelKeys := 
		Dictionary new 
			addAll: (SOPCommonIOM initialize; DataElements);
			addAll: (CurveIdentificationIOM initialize; DataElements);
			yourself.

	ImageLevelKeys at: #(16r0020 16r0022)
		put: (ISDataElement
				newWith: #overlayNumber
				tag: #(16r0020 16r0022)
				vm: '1').
	ImageLevelKeys at: #(16r0020 16r0026)
		put: (ISDataElement
				newWith: #lutNumber
				tag: #(16r0020 16r0026)
				vm: '1').
	ImageLevelKeys at: #(16r0020 16r000E)
		put: (UIDataElement
				newWith: #seriesInstanceUID
				tag: #(16r0020 16r000E)
				vm: 'n').
	ImageLevelKeys at: #(16r0020 16r000D)
		put: (UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: 'n').
	ImageLevelKeys at: #(16r0010 16r0020)
		put: (LODataElement
				newWith: #patientID
				tag: #(16r0010 16r0020)
				vm: '1').
	ImageLevelKeys
		do: [:dataElement | self addDataElement: dataElement]
]

{ #category : #'class initialization' }
PatientRoot_Query_RQ_Identifier class >> definePATIENTLevelKeys [
	"PATIENT Level Information Keys.
	
	PRD 06.2001 - 06.2002, 03.2016"

	PatientLevelKeys := 
		Dictionary new 
			addAll: (PatientIOM initialize; DataElements);
			addAll: (PatientStudyIOM initialize; DataElements);
			addAll: (SpecimenIdentificationIOM initialize; DataElements);
			yourself.

	"PatientLevelKeys := Dictionary new.
	PatientLevelKeys at: #(16r0010 16r0010)
		put: (PNDataElement
				newWith: #patientsName
				tag: #(16r0010 16r0010)
				vm: '1').
	PatientLevelKeys at: #(16r0010 16r0020)
		put: (LODataElement
				newWith: #patientID
				tag: #(16r0010 16r0020)
				vm: '1').
	PatientLevelKeys at: #(16r0010 16r0030)
		put: (DADataElement
				newWith: #patientsBirthDate
				tag: #(16r0010 16r0030)
				vm: '1').
	PatientLevelKeys at: #(16r0010 16r0031)
		put: (TMDataElement
				newWith: #patientsBirthTime
				tag: #(16r0010 16r0032)
				vm: '1').
	PatientLevelKeys at: #(16r0010 16r0040)
		put: (CSDataElement
				newWith: #patientsSex
				tag: #(16r0010 16r0040)
				vm: '1')."
	PatientLevelKeys
		do: [:dataElement | self addDataElement: dataElement]
]

{ #category : #'class initialization' }
PatientRoot_Query_RQ_Identifier class >> defineSERIESLevelKeys [
	"SERIES Level Information Keys
	
	PRD 06.2001 - 06.2002, 03.2016"

	SeriesLevelKeys := 
		Dictionary new 
			addAll: (GeneralSeriesIOM initialize; DataElements); 
			yourself.

	"SeriesLevelKeys := 
		GeneralSeriesIOM DataElements."

	"SeriesLevelKeys := Dictionary new.
	SeriesLevelKeys at: #(16r0008 16r0060)
		put: (CSDataElement
				newWith: #modality
				tag: #(16r0008 16r0060)
				vm: '1').
	SeriesLevelKeys at: #(16r0008 16r0021)
		put: (DADataElement
				newWith: #seriesDate
				tag: #(16r0008 16r0021)
				vm: '1').
	SeriesLevelKeys at: #(16r0008 16r0031)
		put: (TMDataElement
				newWith: #seriesTime
				tag: #(16r0008 16r0031)
				vm: '1').
	SeriesLevelKeys at: #(16r0018 16r0015)
		put: (CSDataElement
				newWith: #bodyPartExamined
				tag: #(16r0018 16r0015)
				vm: '1').
	SeriesLevelKeys at: #(16r0020 16r000E)
		put: (UIDataElement
				newWith: #seriesInstanceUID
				tag: #(16r0020 16r000E)
				vm: 'n').
	SeriesLevelKeys at: #(16r0020 16r0011)
		put: (ISDataElement
				newWith: #seriesNumber
				tag: #(16r0020 16r0011)
				vm: '1').
	SeriesLevelKeys at: #(16r0020 16r1209)
		put: (ISDataElement
				newWith: #numberOfSeriesRelatedInstances
				tag: #(16r0020 16r1209)
				vm: '1').
	SeriesLevelKeys at: #(16r0008 16r103E)
		put: (LODataElement
				newWith: #seriesDescription
				tag: #(16r0008 16r103E)
				vm: '1'
				type: '3')."
				
	SeriesLevelKeys at: #(16r0020 16r000D)
		put: (UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: 'n').
				
	SeriesLevelKeys at: #(16r0010 16r0020)
		put: (LODataElement
				newWith: #patientID
				tag: #(16r0010 16r0020)
				vm: '1').

	SeriesLevelKeys
		do: [:dataElement | self addDataElement: dataElement]
]

{ #category : #'class initialization' }
PatientRoot_Query_RQ_Identifier class >> defineSTUDYLevelKeys [
	"STUDY Level Information Keys.
	
	PRD 06.2001 - 06.2002, 03.2016"

	StudyLevelKeys := 
		Dictionary new 
			addAll: (GeneralStudyIOM initialize; DataElements);
			addAll: (PatientStudyIOM initialize; DataElements);
			yourself.

	"StudyLevelKeys := Dictionary new.
	StudyLevelKeys at: #(16r0020 16r000D)
		put: (UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: 'n').
	StudyLevelKeys at: #(16r0008 16r0020)
		put: (DADataElement
				newWith: #studyDate
				tag: #(16r0008 16r0020)
				vm: '1').
	StudyLevelKeys at: #(16r0008 16r0030)
		put: (TMDataElement
				newWith: #studyTime
				tag: #(16r0008 16r0030)
				vm: '1').
	StudyLevelKeys at: #(16r0020 16r0010)
		put: (SHDataElement
				newWith: #studyID
				tag: #(16r0020 16r0010)
				vm: '1').
	StudyLevelKeys at: #(16r0008 16r0050)
		put: (SHDataElement
				newWith: #accessionNumber
				tag: #(16r0008 16r0050)
				vm: '1').
	StudyLevelKeys at: #(16r0008 16r1030)
		put: (LODataElement
				newWith: #studyDescription
				tag: #(16r0008 16r1030)
				vm: '1')"
		
	StudyLevelKeys at: #(16r0020 16r1208)
		put: (ISDataElement
				newWith: #numberOfStudyRelatedInstances
				tag: #(16r0020 16r1208)
				vm: '1').
	StudyLevelKeys at: #(16r0010 16r0020)
		put: (LODataElement
				newWith: #patientID
				tag: #(16r0010 16r0020)
				vm: '1').
	StudyLevelKeys
		do: [:dataElement | self addDataElement: dataElement]
]

{ #category : #'class initialization' }
PatientRoot_Query_RQ_Identifier class >> initialize [
	self resetDataElements.
	self definePATIENTLevelKeys.
	self defineSTUDYLevelKeys.
	self defineSERIESLevelKeys.
	self defineIMAGELevelKeys.
	self addDataElement: (CSDataElement newWith: #queryRetrieveLevel tag: #(16r0008 16r0052) vm: '1')
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> SOPClassUID [

	^self class SOPClassUID.
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> accessionNumber [

	^self dataElementsValues at: 'accessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'accessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'accessionNumber' put: (self dataElementsDictionary removeKey: 'accessionNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> accessionNumber: aSHValue [

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
PatientRoot_Query_RQ_Identifier >> additionalPatientHistory [

	^self dataElementsValues at: 'additionalPatientHistory' ifAbsent: [
		self dataElementsDictionary at: 'additionalPatientHistory' ifPresent: [:dataElement |
			self dataElementsValues at: 'additionalPatientHistory' put: (self dataElementsDictionary removeKey: 'additionalPatientHistory') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> additionalPatientHistory: aLTValue [

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
PatientRoot_Query_RQ_Identifier >> additionalPatientsHistory [

	^self dataElementsValues at: 'additionalPatientHistory' ifAbsent: [
		self dataElementsDictionary at: 'additionalPatientHistory' ifPresent: [:dataElement |
			self dataElementsValues at: 'additionalPatientHistory' put: (self dataElementsDictionary removeKey: 'additionalPatientHistory') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> additionalPatientsHistory: aLTValue [

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
PatientRoot_Query_RQ_Identifier >> admittingDiagnosesDescription [

	^self dataElementsValues at: 'admittingDiagnosesDescription' ifAbsent: [
		self dataElementsDictionary at: 'admittingDiagnosesDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'admittingDiagnosesDescription' put: (self dataElementsDictionary removeKey: 'admittingDiagnosesDescription') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> admittingDiagnosesDescription: aLOValue [

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
PatientRoot_Query_RQ_Identifier >> authorizationEquipmentCertificationNumber [

	^self dataElementsValues at: 'authorizationEquipmentCertificationNumber' ifAbsent: [
		self dataElementsDictionary at: 'authorizationEquipmentCertificationNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'authorizationEquipmentCertificationNumber' put: (self dataElementsDictionary removeKey: 'authorizationEquipmentCertificationNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> authorizationEquipmentCertificationNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'authorizationEquipmentCertificationNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #authorizationEquipmentCertificationNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'authorizationEquipmentCertificationNumber' put: dataElement.
			self dataElementsValues removeKey: 'authorizationEquipmentCertificationNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'authorizationEquipmentCertificationNumber' put: aLOValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> bodyPartExamined [

	^self dataElementsValues at: 'bodyPartExamined' ifAbsent: [
		self dataElementsDictionary at: 'bodyPartExamined' ifPresent: [:dataElement |
			self dataElementsValues at: 'bodyPartExamined' put: (self dataElementsDictionary removeKey: 'bodyPartExamined') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> bodyPartExamined: aCSValue [

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

{ #category : #queryLevel }
PatientRoot_Query_RQ_Identifier >> compositeObjectInstanceInformation [

	self queryRetrieveLevel: 'IMAGE'.
]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> curveDate [

	^self dataElementsValues at: 'rETIRED_CurveDate' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDate' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> curveDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'rETIRED_CurveDate' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDate' put: aDAValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> curveNumber [

	^self dataElementsValues at: 'rETIRED_CurveNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> curveNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_CurveNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveNumber' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> curveTime [

	^self dataElementsValues at: 'rETIRED_CurveTime' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveTime' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> curveTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'rETIRED_CurveTime' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> ethnicGroup [

	^self dataElementsValues at: 'ethnicGroup' ifAbsent: [
		self dataElementsDictionary at: 'ethnicGroup' ifPresent: [:dataElement |
			self dataElementsValues at: 'ethnicGroup' put: (self dataElementsDictionary removeKey: 'ethnicGroup') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> ethnicGroup: aSHValue [

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
PatientRoot_Query_RQ_Identifier >> ethnnicGroup [

	^self dataElementsValues at: 'ethnicGroup' ifAbsent: [
		self dataElementsDictionary at: 'ethnicGroup' ifPresent: [:dataElement |
			self dataElementsValues at: 'ethnicGroup' put: (self dataElementsDictionary removeKey: 'ethnicGroup') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> ethnnicGroup: aSHValue [

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

{ #category : #'accessing - key data elements' }
PatientRoot_Query_RQ_Identifier >> imageKeyDataElements [

	^self class ImageLevelKeys
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceAvailability [

	^self dataElementsValues at: 'instanceAvailability' ifAbsent: [
		self dataElementsDictionary at: 'instanceAvailability' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceAvailability' put: (self dataElementsDictionary removeKey: 'instanceAvailability') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceAvailability: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceAvailability' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceAvailability.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'instanceAvailability' put: dataElement.
			self dataElementsValues removeKey: 'instanceAvailability' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceAvailability' put: aCSValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceCreationDate [

	^self dataElementsValues at: 'instanceCreationDate' ifAbsent: [
		self dataElementsDictionary at: 'instanceCreationDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceCreationDate' put: (self dataElementsDictionary removeKey: 'instanceCreationDate') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceCreationDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceCreationDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceCreationDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'instanceCreationDate' put: dataElement.
			self dataElementsValues removeKey: 'instanceCreationDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceCreationDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceCreationTime [

	^self dataElementsValues at: 'instanceCreationTime' ifAbsent: [
		self dataElementsDictionary at: 'instanceCreationTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceCreationTime' put: (self dataElementsDictionary removeKey: 'instanceCreationTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceCreationTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceCreationTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceCreationTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'instanceCreationTime' put: dataElement.
			self dataElementsValues removeKey: 'instanceCreationTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceCreationTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceCreatorUID [

	^self dataElementsValues at: 'instanceCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'instanceCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceCreatorUID' put: (self dataElementsDictionary removeKey: 'instanceCreatorUID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceCreatorUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceCreatorUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceCreatorUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'instanceCreatorUID' put: dataElement.
			self dataElementsValues removeKey: 'instanceCreatorUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceCreatorUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> instanceNumber: aISValue [

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
PatientRoot_Query_RQ_Identifier >> largestPixelValueInSeries [

	^self dataElementsValues at: 'largestPixelValueInSeries' ifAbsent: [
		self dataElementsDictionary at: 'largestPixelValueInSeries' ifPresent: [:dataElement |
			self dataElementsValues at: 'largestPixelValueInSeries' put: (self dataElementsDictionary removeKey: 'largestPixelValueInSeries') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> largestPixelValueInSeries: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'largestPixelValueInSeries' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #largestPixelValueInSeries.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'largestPixelValueInSeries' put: dataElement.
			self dataElementsValues removeKey: 'largestPixelValueInSeries' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'largestPixelValueInSeries' put: aSSValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> laterality [

	^self dataElementsValues at: 'laterality' ifAbsent: [
		self dataElementsDictionary at: 'laterality' ifPresent: [:dataElement |
			self dataElementsValues at: 'laterality' put: (self dataElementsDictionary removeKey: 'laterality') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> laterality: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'laterality' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #laterality.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'laterality' put: dataElement.
			self dataElementsValues removeKey: 'laterality' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'laterality' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> lutNumber [

	^self dataElementsValues at: 'rETIRED_LUTNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_LUTNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_LUTNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_LUTNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> lutNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_LUTNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_LUTNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_LUTNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_LUTNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_LUTNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> modality [

	^self dataElementsValues at: 'modality' ifAbsent: [
		self dataElementsDictionary at: 'modality' ifPresent: [:dataElement |
			self dataElementsValues at: 'modality' put: (self dataElementsDictionary removeKey: 'modality') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> modality: aCSValue [

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

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> nameOfPhysiciansReadingStudy [

	^self dataElementsValues at: 'nameOfPhysiciansReadingStudy' ifAbsent: [
		self dataElementsDictionary at: 'nameOfPhysiciansReadingStudy' ifPresent: [:dataElement |
			self dataElementsValues at: 'nameOfPhysiciansReadingStudy' put: (self dataElementsDictionary removeKey: 'nameOfPhysiciansReadingStudy') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> nameOfPhysiciansReadingStudy: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> numberOfSeriesRelatedInstances [

	^self dataElementsValues at: 'numberOfSeriesRelatedInstances' ifAbsent: [
		self dataElementsDictionary at: 'numberOfSeriesRelatedInstances' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfSeriesRelatedInstances' put: (self dataElementsDictionary removeKey: 'numberOfSeriesRelatedInstances') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> numberOfSeriesRelatedInstances: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfSeriesRelatedInstances' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfSeriesRelatedInstances.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfSeriesRelatedInstances' put: dataElement.
			self dataElementsValues removeKey: 'numberOfSeriesRelatedInstances' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfSeriesRelatedInstances' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> numberOfStudyRelatedInstances [

	^self dataElementsValues at: 'numberOfStudyRelatedInstances' ifAbsent: [
		self dataElementsDictionary at: 'numberOfStudyRelatedInstances' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfStudyRelatedInstances' put: (self dataElementsDictionary removeKey: 'numberOfStudyRelatedInstances') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> numberOfStudyRelatedInstances: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfStudyRelatedInstances' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfStudyRelatedInstances.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfStudyRelatedInstances' put: dataElement.
			self dataElementsValues removeKey: 'numberOfStudyRelatedInstances' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfStudyRelatedInstances' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> occupation [

	^self dataElementsValues at: 'occupation' ifAbsent: [
		self dataElementsDictionary at: 'occupation' ifPresent: [:dataElement |
			self dataElementsValues at: 'occupation' put: (self dataElementsDictionary removeKey: 'occupation') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> occupation: aSHValue [

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
PatientRoot_Query_RQ_Identifier >> operatorsName [

	^self dataElementsValues at: 'operatorsName' ifAbsent: [
		self dataElementsDictionary at: 'operatorsName' ifPresent: [:dataElement |
			self dataElementsValues at: 'operatorsName' put: (self dataElementsDictionary removeKey: 'operatorsName') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> operatorsName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> otherPatientNames [

	^self dataElementsValues at: 'otherPatientNames' ifAbsent: [
		self dataElementsDictionary at: 'otherPatientNames' ifPresent: [:dataElement |
			self dataElementsValues at: 'otherPatientNames' put: (self dataElementsDictionary removeKey: 'otherPatientNames') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> otherPatientNames: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> otherPatientsIDs [

	^self dataElementsValues at: 'rETIRED_OtherPatientIDs' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_OtherPatientIDs' put: (self dataElementsDictionary removeKey: 'rETIRED_OtherPatientIDs') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> otherPatientsIDs: aLOValue [

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
PatientRoot_Query_RQ_Identifier >> otherPatientsNames [

	^self dataElementsValues at: 'otherPatientNames' ifAbsent: [
		self dataElementsDictionary at: 'otherPatientNames' ifPresent: [:dataElement |
			self dataElementsValues at: 'otherPatientNames' put: (self dataElementsDictionary removeKey: 'otherPatientNames') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> otherPatientsNames: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> overlayNumber [

	^self dataElementsValues at: 'rETIRED_OverlayNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_OverlayNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_OverlayNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_OverlayNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> overlayNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_OverlayNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_OverlayNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_OverlayNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_OverlayNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_OverlayNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientAge [

	^self dataElementsValues at: 'patientAge' ifAbsent: [
		self dataElementsDictionary at: 'patientAge' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientAge' put: (self dataElementsDictionary removeKey: 'patientAge') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientAge: aASValue [

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
PatientRoot_Query_RQ_Identifier >> patientBirthDate [

	^self dataElementsValues at: 'patientBirthDate' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthDate' put: (self dataElementsDictionary removeKey: 'patientBirthDate') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientBirthDate: aDAValue [

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
PatientRoot_Query_RQ_Identifier >> patientBirthTime [

	^self dataElementsValues at: 'patientBirthTime' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthTime' put: (self dataElementsDictionary removeKey: 'patientBirthTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientBirthTime: aTMValue [

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
PatientRoot_Query_RQ_Identifier >> patientComments [

	^self dataElementsValues at: 'patientComments' ifAbsent: [
		self dataElementsDictionary at: 'patientComments' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientComments' put: (self dataElementsDictionary removeKey: 'patientComments') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientComments: aLTValue [

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
PatientRoot_Query_RQ_Identifier >> patientID [

	^self dataElementsValues at: 'patientID' ifAbsent: [
		self dataElementsDictionary at: 'patientID' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientID' put: (self dataElementsDictionary removeKey: 'patientID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientID: aLOValue [

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

{ #category : #queryLevel }
PatientRoot_Query_RQ_Identifier >> patientInformation [

	self queryRetrieveLevel: 'PATIENT'.
]

{ #category : #'accessing - key data elements' }
PatientRoot_Query_RQ_Identifier >> patientKeyDataElements [

	^self class PatientLevelKeys
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientName [

	^self dataElementsValues at: 'patientName' ifAbsent: [
		self dataElementsDictionary at: 'patientName' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientName' put: (self dataElementsDictionary removeKey: 'patientName') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> patientPosition [

	^self dataElementsValues at: 'patientPosition' ifAbsent: [
		self dataElementsDictionary at: 'patientPosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientPosition' put: (self dataElementsDictionary removeKey: 'patientPosition') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientPosition: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientPosition' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientPosition.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'patientPosition' put: dataElement.
			self dataElementsValues removeKey: 'patientPosition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientPosition' put: aCSValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientSex [

	^self dataElementsValues at: 'patientSex' ifAbsent: [
		self dataElementsDictionary at: 'patientSex' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSex' put: (self dataElementsDictionary removeKey: 'patientSex') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientSex: aCSValue [

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
PatientRoot_Query_RQ_Identifier >> patientSize [

	^self dataElementsValues at: 'patientSize' ifAbsent: [
		self dataElementsDictionary at: 'patientSize' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSize' put: (self dataElementsDictionary removeKey: 'patientSize') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientSize: aDSValue [

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
PatientRoot_Query_RQ_Identifier >> patientWeight [

	^self dataElementsValues at: 'patientWeight' ifAbsent: [
		self dataElementsDictionary at: 'patientWeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientWeight' put: (self dataElementsDictionary removeKey: 'patientWeight') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> patientWeight: aDSValue [

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
PatientRoot_Query_RQ_Identifier >> patientsAge [

	^self dataElementsValues at: 'patientAge' ifAbsent: [
		self dataElementsDictionary at: 'patientAge' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientAge' put: (self dataElementsDictionary removeKey: 'patientAge') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsAge: aASValue [

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
PatientRoot_Query_RQ_Identifier >> patientsBirthDate [

	^self dataElementsValues at: 'patientBirthDate' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthDate' put: (self dataElementsDictionary removeKey: 'patientBirthDate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsBirthDate: aDAValue [

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
PatientRoot_Query_RQ_Identifier >> patientsBirthTime [

	^self dataElementsValues at: 'patientBirthTime' ifAbsent: [
		self dataElementsDictionary at: 'patientBirthTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientBirthTime' put: (self dataElementsDictionary removeKey: 'patientBirthTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsBirthTime: aTMValue [

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
PatientRoot_Query_RQ_Identifier >> patientsName [

	^self dataElementsValues at: 'patientName' ifAbsent: [
		self dataElementsDictionary at: 'patientName' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientName' put: (self dataElementsDictionary removeKey: 'patientName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> patientsSex [

	^self dataElementsValues at: 'patientSex' ifAbsent: [
		self dataElementsDictionary at: 'patientSex' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSex' put: (self dataElementsDictionary removeKey: 'patientSex') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsSex: aCSValue [

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
PatientRoot_Query_RQ_Identifier >> patientsSize [

	^self dataElementsValues at: 'patientSize' ifAbsent: [
		self dataElementsDictionary at: 'patientSize' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientSize' put: (self dataElementsDictionary removeKey: 'patientSize') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsSize: aDSValue [

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
PatientRoot_Query_RQ_Identifier >> patientsWeight [

	^self dataElementsValues at: 'patientWeight' ifAbsent: [
		self dataElementsDictionary at: 'patientWeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientWeight' put: (self dataElementsDictionary removeKey: 'patientWeight') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> patientsWeight: aDSValue [

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
PatientRoot_Query_RQ_Identifier >> performedActionItemSequence [

	^self dataElementsValues at: 'performedProtocolCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'performedProtocolCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProtocolCodeSequence' put: (self dataElementsDictionary removeKey: 'performedProtocolCodeSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> performedActionItemSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProtocolCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProtocolCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'performedProtocolCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'performedProtocolCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProtocolCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepDescription [

	^self dataElementsValues at: 'performedProcedureStepDescription' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepDescription' put: (self dataElementsDictionary removeKey: 'performedProcedureStepDescription') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProcedureStepDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProcedureStepDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'performedProcedureStepDescription' put: dataElement.
			self dataElementsValues removeKey: 'performedProcedureStepDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProcedureStepDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepID [

	^self dataElementsValues at: 'performedProcedureStepID' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepID' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepID' put: (self dataElementsDictionary removeKey: 'performedProcedureStepID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProcedureStepID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProcedureStepID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'performedProcedureStepID' put: dataElement.
			self dataElementsValues removeKey: 'performedProcedureStepID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProcedureStepID' put: aSHValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepStartDate [

	^self dataElementsValues at: 'performedProcedureStepStartDate' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepStartDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepStartDate' put: (self dataElementsDictionary removeKey: 'performedProcedureStepStartDate') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepStartDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProcedureStepStartDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProcedureStepStartDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'performedProcedureStepStartDate' put: dataElement.
			self dataElementsValues removeKey: 'performedProcedureStepStartDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProcedureStepStartDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepStartTime [

	^self dataElementsValues at: 'performedProcedureStepStartTime' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepStartTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepStartTime' put: (self dataElementsDictionary removeKey: 'performedProcedureStepStartTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProcedureStepStartTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProcedureStepStartTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProcedureStepStartTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'performedProcedureStepStartTime' put: dataElement.
			self dataElementsValues removeKey: 'performedProcedureStepStartTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProcedureStepStartTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProtocolCodeSequence [

	^self dataElementsValues at: 'performedProtocolCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'performedProtocolCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProtocolCodeSequence' put: (self dataElementsDictionary removeKey: 'performedProtocolCodeSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performedProtocolCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProtocolCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProtocolCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'performedProtocolCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'performedProtocolCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProtocolCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performingPhysicianName [

	^self dataElementsValues at: 'performingPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'performingPhysicianName' put: (self dataElementsDictionary removeKey: 'performingPhysicianName') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> performingPhysicianName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> performingPhysiciansName [

	^self dataElementsValues at: 'performingPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'performingPhysicianName' put: (self dataElementsDictionary removeKey: 'performingPhysicianName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> performingPhysiciansName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> physiciansOfRecord [

	^self dataElementsValues at: 'physiciansOfRecord' ifAbsent: [
		self dataElementsDictionary at: 'physiciansOfRecord' ifPresent: [:dataElement |
			self dataElementsValues at: 'physiciansOfRecord' put: (self dataElementsDictionary removeKey: 'physiciansOfRecord') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> physiciansOfRecord: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> procedureCodeSequence [

	^self dataElementsValues at: 'procedureCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'procedureCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'procedureCodeSequence' put: (self dataElementsDictionary removeKey: 'procedureCodeSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> procedureCodeSequence: aSQValue [

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
PatientRoot_Query_RQ_Identifier >> protocolName [

	^self dataElementsValues at: 'protocolName' ifAbsent: [
		self dataElementsDictionary at: 'protocolName' ifPresent: [:dataElement |
			self dataElementsValues at: 'protocolName' put: (self dataElementsDictionary removeKey: 'protocolName') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> protocolName: aLOValue [

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
PatientRoot_Query_RQ_Identifier >> queryRetrieveLevel [

	^self dataElementsValues at: 'queryRetrieveLevel' ifAbsent: [
		self dataElementsDictionary at: 'queryRetrieveLevel' ifPresent: [:dataElement |
			self dataElementsValues at: 'queryRetrieveLevel' put: (self dataElementsDictionary removeKey: 'queryRetrieveLevel') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> queryRetrieveLevel: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'queryRetrieveLevel' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #queryRetrieveLevel.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'queryRetrieveLevel' put: dataElement.
			self dataElementsValues removeKey: 'queryRetrieveLevel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'queryRetrieveLevel' put: aCSValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_CurveDate [

	^self dataElementsValues at: 'rETIRED_CurveDate' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDate' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDate') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_CurveDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'rETIRED_CurveDate' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_CurveNumber [

	^self dataElementsValues at: 'rETIRED_CurveNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_CurveNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_CurveNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_CurveTime [

	^self dataElementsValues at: 'rETIRED_CurveTime' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveTime' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_CurveTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'rETIRED_CurveTime' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_LUTNumber [

	^self dataElementsValues at: 'rETIRED_LUTNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_LUTNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_LUTNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_LUTNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_LUTNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_LUTNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_LUTNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_LUTNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_LUTNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_LUTNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_OtherPatientIDs [

	^self dataElementsValues at: 'rETIRED_OtherPatientIDs' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_OtherPatientIDs' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_OtherPatientIDs' put: (self dataElementsDictionary removeKey: 'rETIRED_OtherPatientIDs') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_OtherPatientIDs: aLOValue [

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
PatientRoot_Query_RQ_Identifier >> rETIRED_OverlayNumber [

	^self dataElementsValues at: 'rETIRED_OverlayNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_OverlayNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_OverlayNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_OverlayNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_OverlayNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_OverlayNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_OverlayNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_OverlayNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_OverlayNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_OverlayNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_ReferencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_ReferencedCurveSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedCurveSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedCurveSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_ReferencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_ReferencedOverlaySequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedOverlaySequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_SpecimenAccessionNumber [

	^self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenAccessionNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_SpecimenAccessionNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenAccessionNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: aLOValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_SpecimenSequence [

	^self dataElementsValues at: 'rETIRED_SpecimenSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> rETIRED_SpecimenSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referencedCurveSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedCurveSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedCurveSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedImageSequence: aSQValue [

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

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referencedOverlaySequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedOverlaySequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedPatientSequence [

	^self dataElementsValues at: 'referencedPatientSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPatientSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPatientSequence' put: (self dataElementsDictionary removeKey: 'referencedPatientSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedPatientSequence: aSQValue [

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

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedPerformedProcedureStepSequence [

	^self dataElementsValues at: 'referencedPerformedProcedureStepSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: (self dataElementsDictionary removeKey: 'referencedPerformedProcedureStepSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedPerformedProcedureStepSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedPerformedProcedureStepSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedPerformedProcedureStepSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referencedStudyComponentSequence [

	^self dataElementsValues at: 'referencedPerformedProcedureStepSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: (self dataElementsDictionary removeKey: 'referencedPerformedProcedureStepSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referencedStudyComponentSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedPerformedProcedureStepSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedPerformedProcedureStepSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedStudySequence [

	^self dataElementsValues at: 'referencedStudySequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedStudySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedStudySequence' put: (self dataElementsDictionary removeKey: 'referencedStudySequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referencedStudySequence: aSQValue [

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
PatientRoot_Query_RQ_Identifier >> referringPhysicianName [

	^self dataElementsValues at: 'referringPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'referringPhysicianName' put: (self dataElementsDictionary removeKey: 'referringPhysicianName') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> referringPhysicianName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> referringPhysiciansName [

	^self dataElementsValues at: 'referringPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'referringPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'referringPhysicianName' put: (self dataElementsDictionary removeKey: 'referringPhysicianName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> referringPhysiciansName: aPNValue [

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
PatientRoot_Query_RQ_Identifier >> requestAttributesSequence [

	^self dataElementsValues at: 'requestAttributesSequence' ifAbsent: [
		self dataElementsDictionary at: 'requestAttributesSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestAttributesSequence' put: (self dataElementsDictionary removeKey: 'requestAttributesSequence') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> requestAttributesSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'requestAttributesSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #requestAttributesSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'requestAttributesSequence' put: dataElement.
			self dataElementsValues removeKey: 'requestAttributesSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'requestAttributesSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPAuthorizationComment [

	^self dataElementsValues at: 'sOPAuthorizationComment' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationComment' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationComment') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPAuthorizationComment: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationComment.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'sOPAuthorizationComment' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationComment' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationComment' put: aLTValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPAuthorizationDateTime [

	^self dataElementsValues at: 'sOPAuthorizationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationDateTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPAuthorizationDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'sOPAuthorizationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPClassUID [

	^self dataElementsValues at: 'sOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPClassUID' put: (self dataElementsDictionary removeKey: 'sOPClassUID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPInstanceStatus [

	^self dataElementsValues at: 'sOPInstanceStatus' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceStatus' put: (self dataElementsDictionary removeKey: 'sOPInstanceStatus') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPInstanceStatus: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceStatus.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'sOPInstanceStatus' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceStatus' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceStatus' put: aCSValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPInstanceUID [

	^self dataElementsValues at: 'sOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceUID' put: (self dataElementsDictionary removeKey: 'sOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> sOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesDate [

	^self dataElementsValues at: 'seriesDate' ifAbsent: [
		self dataElementsDictionary at: 'seriesDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesDate' put: (self dataElementsDictionary removeKey: 'seriesDate') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesDate: aDAValue [

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
PatientRoot_Query_RQ_Identifier >> seriesDescription [

	^self dataElementsValues at: 'seriesDescription' ifAbsent: [
		self dataElementsDictionary at: 'seriesDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesDescription' put: (self dataElementsDictionary removeKey: 'seriesDescription') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesDescription: aLOValue [

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

{ #category : #queryLevel }
PatientRoot_Query_RQ_Identifier >> seriesInformation [

	self queryRetrieveLevel: 'SERIES'.
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesInstanceUID [

	^self dataElementsValues at: 'seriesInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesInstanceUID' put: (self dataElementsDictionary removeKey: 'seriesInstanceUID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesInstanceUID: aUIValue [

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

{ #category : #'accessing - key data elements' }
PatientRoot_Query_RQ_Identifier >> seriesKeyDataElements [

	^self class SeriesLevelKeys
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesNumber [

	^self dataElementsValues at: 'seriesNumber' ifAbsent: [
		self dataElementsDictionary at: 'seriesNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesNumber' put: (self dataElementsDictionary removeKey: 'seriesNumber') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesNumber: aISValue [

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
PatientRoot_Query_RQ_Identifier >> seriesTime [

	^self dataElementsValues at: 'seriesTime' ifAbsent: [
		self dataElementsDictionary at: 'seriesTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesTime' put: (self dataElementsDictionary removeKey: 'seriesTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> seriesTime: aTMValue [

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
PatientRoot_Query_RQ_Identifier >> smallestPixelValueInSeries [

	^self dataElementsValues at: 'smallestPixelValueInSeries' ifAbsent: [
		self dataElementsDictionary at: 'smallestPixelValueInSeries' ifPresent: [:dataElement |
			self dataElementsValues at: 'smallestPixelValueInSeries' put: (self dataElementsDictionary removeKey: 'smallestPixelValueInSeries') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> smallestPixelValueInSeries: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'smallestPixelValueInSeries' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #smallestPixelValueInSeries.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'smallestPixelValueInSeries' put: dataElement.
			self dataElementsValues removeKey: 'smallestPixelValueInSeries' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'smallestPixelValueInSeries' put: aSSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopAuthorizationComment [

	^self dataElementsValues at: 'sOPAuthorizationComment' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationComment' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationComment') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopAuthorizationComment: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationComment.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'sOPAuthorizationComment' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationComment' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationComment' put: aLTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopAuthorizationDateAndTime [

	^self dataElementsValues at: 'sOPAuthorizationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationDateTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopAuthorizationDateAndTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'sOPAuthorizationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopClassUID [

	^self dataElementsValues at: 'sOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPClassUID' put: (self dataElementsDictionary removeKey: 'sOPClassUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPClassUID' put: aUIValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopInstanceStatus [

	^self dataElementsValues at: 'sOPInstanceStatus' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceStatus' put: (self dataElementsDictionary removeKey: 'sOPInstanceStatus') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopInstanceStatus: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceStatus.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'sOPInstanceStatus' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceStatus' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceStatus' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopInstanceUID [

	^self dataElementsValues at: 'sOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceUID' put: (self dataElementsDictionary removeKey: 'sOPInstanceUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> sopInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> specificCharacterSet [

	^self dataElementsValues at: 'specificCharacterSet' ifAbsent: [
		self dataElementsDictionary at: 'specificCharacterSet' ifPresent: [:dataElement |
			self dataElementsValues at: 'specificCharacterSet' put: (self dataElementsDictionary removeKey: 'specificCharacterSet') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> specificCharacterSet: aCSValue [

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

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> specimenAccessionNumber [

	^self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenAccessionNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> specimenAccessionNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenAccessionNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> specimenSequence [

	^self dataElementsValues at: 'rETIRED_SpecimenSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PatientRoot_Query_RQ_Identifier >> specimenSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyDate [

	^self dataElementsValues at: 'studyDate' ifAbsent: [
		self dataElementsDictionary at: 'studyDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyDate' put: (self dataElementsDictionary removeKey: 'studyDate') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyDate: aDAValue [

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
PatientRoot_Query_RQ_Identifier >> studyDescription [

	^self dataElementsValues at: 'studyDescription' ifAbsent: [
		self dataElementsDictionary at: 'studyDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyDescription' put: (self dataElementsDictionary removeKey: 'studyDescription') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyDescription: aLOValue [

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
PatientRoot_Query_RQ_Identifier >> studyID [

	^self dataElementsValues at: 'studyID' ifAbsent: [
		self dataElementsDictionary at: 'studyID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyID' put: (self dataElementsDictionary removeKey: 'studyID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyID: aSHValue [

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

{ #category : #queryLevel }
PatientRoot_Query_RQ_Identifier >> studyInformation [

	self queryRetrieveLevel: 'STUDY'.
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyInstanceUID: aUIValue [

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

{ #category : #'accessing - key data elements' }
PatientRoot_Query_RQ_Identifier >> studyKeyDataElements [

	^self class StudyLevelKeys
]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyTime [

	^self dataElementsValues at: 'studyTime' ifAbsent: [
		self dataElementsDictionary at: 'studyTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyTime' put: (self dataElementsDictionary removeKey: 'studyTime') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> studyTime: aTMValue [

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

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> timezoneOffsetFromUTC [

	^self dataElementsValues at: 'timezoneOffsetFromUTC' ifAbsent: [
		self dataElementsDictionary at: 'timezoneOffsetFromUTC' ifPresent: [:dataElement |
			self dataElementsValues at: 'timezoneOffsetFromUTC' put: (self dataElementsDictionary removeKey: 'timezoneOffsetFromUTC') value.
		]
	]

]

{ #category : #accessing }
PatientRoot_Query_RQ_Identifier >> timezoneOffsetFromUTC: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'timezoneOffsetFromUTC' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timezoneOffsetFromUTC.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'timezoneOffsetFromUTC' put: dataElement.
			self dataElementsValues removeKey: 'timezoneOffsetFromUTC' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timezoneOffsetFromUTC' put: aSHValue
		]
	].

]
