Class {
	#name : #GeneralSeriesIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
GeneralSeriesIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM General Series Information Object Module
	PS 3.3-2000 Annex C.7.3.1 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM General Series Information Object Module'.
	moduleName := 'generalSeriesIOM'.
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
			(CSDataElement
				newWith: #laterality
				tag: #(16r0020 16r0060)
				vm: '1'
				type: '2C').
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
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedStudyComponentSequence
				tag: #(16r0008 16r1111)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedStudyComponentSequenceItem).
	self
		addDataElement:
			(CSDataElement
				newWith: #bodyPartExamined
				tag: #(16r0018 16r0015)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #patientPosition
				tag: #(16r0018 16r5100)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(ISDataElement
				newWith: #numberOfSeriesRelatedInstances
				tag: #(16r0020 16r1209)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SSDataElement
				newWith: #smallestPixelValueInSeries
				tag: #(16r0028 16r0108)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SSDataElement
				newWith: #largestPixelValueInSeries
				tag: #(16r0028 16r0109)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #requestAttributesSequence
				tag: #(16r0040 16r0275)
				vm: '1'
				type: '3'
				sequenceItemClass: RequestAttributesSequenceItem).
	self
		addDataElement:
			(SHDataElement
				newWith: #performedProcedureStepID
				tag: #(16r0040 16r0253)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DADataElement
				newWith: #performedProcedureStepStartDate
				tag: #(16r0040 16r0244)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #performedProcedureStepStartTime
				tag: #(16r0040 16r0245)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #performedProcedureStepDescription
				tag: #(16r0040 16r0254)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #performedActionItemSequence
				tag: #(16r0040 16r0260)
				vm: '1'
				type: '3'
				sequenceItemClass: PerformedActionItemSequenceItem)
]

{ #category : #accessing }
GeneralSeriesIOM >> bodyPartExamined [

	^self dataElementsValues at: 'bodyPartExamined' ifAbsent: [
		self dataElementsDictionary at: 'bodyPartExamined' ifPresent: [:dataElement |
			self dataElementsValues at: 'bodyPartExamined' put: (self dataElementsDictionary removeKey: 'bodyPartExamined') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> bodyPartExamined: aCSValue [

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

{ #category : #checking }
GeneralSeriesIOM >> checkIOM [

	^true
]

{ #category : #accessing }
GeneralSeriesIOM >> largestPixelValueInSeries [

	^self dataElementsValues at: 'largestPixelValueInSeries' ifAbsent: [
		self dataElementsDictionary at: 'largestPixelValueInSeries' ifPresent: [:dataElement |
			self dataElementsValues at: 'largestPixelValueInSeries' put: (self dataElementsDictionary removeKey: 'largestPixelValueInSeries') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> largestPixelValueInSeries: aSSValue [

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
GeneralSeriesIOM >> laterality [

	^self dataElementsValues at: 'laterality' ifAbsent: [
		self dataElementsDictionary at: 'laterality' ifPresent: [:dataElement |
			self dataElementsValues at: 'laterality' put: (self dataElementsDictionary removeKey: 'laterality') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> laterality: aCSValue [

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

{ #category : #accessing }
GeneralSeriesIOM >> modality [

	^self dataElementsValues at: 'modality' ifAbsent: [
		self dataElementsDictionary at: 'modality' ifPresent: [:dataElement |
			self dataElementsValues at: 'modality' put: (self dataElementsDictionary removeKey: 'modality') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> modality: aCSValue [

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
GeneralSeriesIOM >> numberOfSeriesRelatedInstances [

	^self dataElementsValues at: 'numberOfSeriesRelatedInstances' ifAbsent: [
		self dataElementsDictionary at: 'numberOfSeriesRelatedInstances' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfSeriesRelatedInstances' put: (self dataElementsDictionary removeKey: 'numberOfSeriesRelatedInstances') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> numberOfSeriesRelatedInstances: aISValue [

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
GeneralSeriesIOM >> operatorsName [

	^self dataElementsValues at: 'operatorsName' ifAbsent: [
		self dataElementsDictionary at: 'operatorsName' ifPresent: [:dataElement |
			self dataElementsValues at: 'operatorsName' put: (self dataElementsDictionary removeKey: 'operatorsName') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> operatorsName: aPNValue [

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
GeneralSeriesIOM >> patientPosition [

	^self dataElementsValues at: 'patientPosition' ifAbsent: [
		self dataElementsDictionary at: 'patientPosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientPosition' put: (self dataElementsDictionary removeKey: 'patientPosition') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> patientPosition: aCSValue [

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

{ #category : #'accessing - talkDICOM names' }
GeneralSeriesIOM >> performedActionItemSequence [

	^self dataElementsValues at: 'performedProtocolCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'performedProtocolCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProtocolCodeSequence' put: (self dataElementsDictionary removeKey: 'performedProtocolCodeSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GeneralSeriesIOM >> performedActionItemSequence: aSQValue [

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
GeneralSeriesIOM >> performedProcedureStepDescription [

	^self dataElementsValues at: 'performedProcedureStepDescription' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepDescription' put: (self dataElementsDictionary removeKey: 'performedProcedureStepDescription') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> performedProcedureStepDescription: aLOValue [

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
GeneralSeriesIOM >> performedProcedureStepID [

	^self dataElementsValues at: 'performedProcedureStepID' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepID' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepID' put: (self dataElementsDictionary removeKey: 'performedProcedureStepID') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> performedProcedureStepID: aSHValue [

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
GeneralSeriesIOM >> performedProcedureStepStartDate [

	^self dataElementsValues at: 'performedProcedureStepStartDate' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepStartDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepStartDate' put: (self dataElementsDictionary removeKey: 'performedProcedureStepStartDate') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> performedProcedureStepStartDate: aDAValue [

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
GeneralSeriesIOM >> performedProcedureStepStartTime [

	^self dataElementsValues at: 'performedProcedureStepStartTime' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureStepStartTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureStepStartTime' put: (self dataElementsDictionary removeKey: 'performedProcedureStepStartTime') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> performedProcedureStepStartTime: aTMValue [

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
GeneralSeriesIOM >> performedProtocolCodeSequence [

	^self dataElementsValues at: 'performedProtocolCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'performedProtocolCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProtocolCodeSequence' put: (self dataElementsDictionary removeKey: 'performedProtocolCodeSequence') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> performedProtocolCodeSequence: aSQValue [

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
GeneralSeriesIOM >> performingPhysicianName [

	^self dataElementsValues at: 'performingPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'performingPhysicianName' put: (self dataElementsDictionary removeKey: 'performingPhysicianName') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> performingPhysicianName: aPNValue [

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
GeneralSeriesIOM >> performingPhysiciansName [

	^self dataElementsValues at: 'performingPhysicianName' ifAbsent: [
		self dataElementsDictionary at: 'performingPhysicianName' ifPresent: [:dataElement |
			self dataElementsValues at: 'performingPhysicianName' put: (self dataElementsDictionary removeKey: 'performingPhysicianName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GeneralSeriesIOM >> performingPhysiciansName: aPNValue [

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
GeneralSeriesIOM >> protocolName [

	^self dataElementsValues at: 'protocolName' ifAbsent: [
		self dataElementsDictionary at: 'protocolName' ifPresent: [:dataElement |
			self dataElementsValues at: 'protocolName' put: (self dataElementsDictionary removeKey: 'protocolName') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> protocolName: aLOValue [

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
GeneralSeriesIOM >> referencedPerformedProcedureStepSequence [

	^self dataElementsValues at: 'referencedPerformedProcedureStepSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: (self dataElementsDictionary removeKey: 'referencedPerformedProcedureStepSequence') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> referencedPerformedProcedureStepSequence: aSQValue [

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
GeneralSeriesIOM >> referencedStudyComponentSequence [

	^self dataElementsValues at: 'referencedPerformedProcedureStepSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: (self dataElementsDictionary removeKey: 'referencedPerformedProcedureStepSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GeneralSeriesIOM >> referencedStudyComponentSequence: aSQValue [

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
GeneralSeriesIOM >> requestAttributesSequence [

	^self dataElementsValues at: 'requestAttributesSequence' ifAbsent: [
		self dataElementsDictionary at: 'requestAttributesSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestAttributesSequence' put: (self dataElementsDictionary removeKey: 'requestAttributesSequence') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> requestAttributesSequence: aSQValue [

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
GeneralSeriesIOM >> seriesDate [

	^self dataElementsValues at: 'seriesDate' ifAbsent: [
		self dataElementsDictionary at: 'seriesDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesDate' put: (self dataElementsDictionary removeKey: 'seriesDate') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> seriesDate: aDAValue [

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
GeneralSeriesIOM >> seriesDescription [

	^self dataElementsValues at: 'seriesDescription' ifAbsent: [
		self dataElementsDictionary at: 'seriesDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesDescription' put: (self dataElementsDictionary removeKey: 'seriesDescription') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> seriesDescription: aLOValue [

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
GeneralSeriesIOM >> seriesInstanceUID [

	^self dataElementsValues at: 'seriesInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesInstanceUID' put: (self dataElementsDictionary removeKey: 'seriesInstanceUID') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> seriesInstanceUID: aUIValue [

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
GeneralSeriesIOM >> seriesNumber [

	^self dataElementsValues at: 'seriesNumber' ifAbsent: [
		self dataElementsDictionary at: 'seriesNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesNumber' put: (self dataElementsDictionary removeKey: 'seriesNumber') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> seriesNumber: aISValue [

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
GeneralSeriesIOM >> seriesTime [

	^self dataElementsValues at: 'seriesTime' ifAbsent: [
		self dataElementsDictionary at: 'seriesTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesTime' put: (self dataElementsDictionary removeKey: 'seriesTime') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> seriesTime: aTMValue [

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
GeneralSeriesIOM >> smallestPixelValueInSeries [

	^self dataElementsValues at: 'smallestPixelValueInSeries' ifAbsent: [
		self dataElementsDictionary at: 'smallestPixelValueInSeries' ifPresent: [:dataElement |
			self dataElementsValues at: 'smallestPixelValueInSeries' put: (self dataElementsDictionary removeKey: 'smallestPixelValueInSeries') value.
		]
	]

]

{ #category : #accessing }
GeneralSeriesIOM >> smallestPixelValueInSeries: aSSValue [

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
