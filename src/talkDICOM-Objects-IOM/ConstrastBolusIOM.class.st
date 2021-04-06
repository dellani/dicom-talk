Class {
	#name : #ConstrastBolusIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
ConstrastBolusIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Contrast/Bolus Information Object Module
	PS 3.3-2000 Annex C.7.6.4 - PRD 04-10.2001"

	self resetDataElements.
	Name := 'DICOM Contrast/Bolus Information Object Module'.
	moduleName := 'constrastBolusIOM'.
	self
		addDataElement:
			(LODataElement
				newWith: #contrastBolusAgent
				tag: #(16r0018 16r0010)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SQDataElement
				newWith: #contrastBolusAgentSequence
				tag: #(16r0018 16r0012)
				vm: '1'
				type: '3'
				sequenceItemClass: ContrastBolusAgentSequenceItem).
	self
		addDataElement:
			(LODataElement
				newWith: #contrastBolusRoute
				tag: #(16r0018 16r1040)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #contrastBolusAdministrationRoute
				tag: #(16r0018 16r0014)
				vm: '1'
				type: '3'
				sequenceItemClass: ContrastBolusAdministrationRouteSequenceItem).
	self
		addDataElement:
			(DSDataElement
				newWith: #contrastBolusVolume
				tag: #(16r0018 16r1041)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #contrastBolusStartTime
				tag: #(16r0018 16r1042)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #contrastBolusStopTime
				tag: #(16r0018 16r1043)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #contrastBolusTotalDose
				tag: #(16r0018 16r1044)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #contrastFlowRate
				tag: #(16r0018 16r1046)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #contrastFlowDuration
				tag: #(16r0018 16r1047)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #contrastBolusIngredient
				tag: #(16r0018 16r1048)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #contrastBolusIngredientConcentration
				tag: #(16r0018 16r1049)
				vm: '1'
				type: '3')
]

{ #category : #'accessing - talkDICOM names' }
ConstrastBolusIOM >> contrastBolusAdministrationRoute [

	^self dataElementsValues at: 'contrastBolusAdministrationRouteSequence' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusAdministrationRouteSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusAdministrationRouteSequence' put: (self dataElementsDictionary removeKey: 'contrastBolusAdministrationRouteSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ConstrastBolusIOM >> contrastBolusAdministrationRoute: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusAdministrationRouteSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusAdministrationRouteSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contrastBolusAdministrationRouteSequence' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusAdministrationRouteSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusAdministrationRouteSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusAdministrationRouteSequence [

	^self dataElementsValues at: 'contrastBolusAdministrationRouteSequence' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusAdministrationRouteSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusAdministrationRouteSequence' put: (self dataElementsDictionary removeKey: 'contrastBolusAdministrationRouteSequence') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusAdministrationRouteSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusAdministrationRouteSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusAdministrationRouteSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contrastBolusAdministrationRouteSequence' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusAdministrationRouteSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusAdministrationRouteSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusAgent [

	^self dataElementsValues at: 'contrastBolusAgent' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusAgent' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusAgent' put: (self dataElementsDictionary removeKey: 'contrastBolusAgent') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusAgent: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusAgent' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusAgent.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'contrastBolusAgent' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusAgent' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusAgent' put: aLOValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusAgentSequence [

	^self dataElementsValues at: 'contrastBolusAgentSequence' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusAgentSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusAgentSequence' put: (self dataElementsDictionary removeKey: 'contrastBolusAgentSequence') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusAgentSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusAgentSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusAgentSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contrastBolusAgentSequence' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusAgentSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusAgentSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusIngredient [

	^self dataElementsValues at: 'contrastBolusIngredient' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusIngredient' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusIngredient' put: (self dataElementsDictionary removeKey: 'contrastBolusIngredient') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusIngredient: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusIngredient' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusIngredient.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'contrastBolusIngredient' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusIngredient' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusIngredient' put: aCSValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusIngredientConcentration [

	^self dataElementsValues at: 'contrastBolusIngredientConcentration' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusIngredientConcentration' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusIngredientConcentration' put: (self dataElementsDictionary removeKey: 'contrastBolusIngredientConcentration') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusIngredientConcentration: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusIngredientConcentration' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusIngredientConcentration.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'contrastBolusIngredientConcentration' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusIngredientConcentration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusIngredientConcentration' put: aDSValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusRoute [

	^self dataElementsValues at: 'contrastBolusRoute' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusRoute' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusRoute' put: (self dataElementsDictionary removeKey: 'contrastBolusRoute') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusRoute: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusRoute' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusRoute.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'contrastBolusRoute' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusRoute' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusRoute' put: aLOValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusStartTime [

	^self dataElementsValues at: 'contrastBolusStartTime' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusStartTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusStartTime' put: (self dataElementsDictionary removeKey: 'contrastBolusStartTime') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusStartTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusStartTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusStartTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'contrastBolusStartTime' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusStartTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusStartTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusStopTime [

	^self dataElementsValues at: 'contrastBolusStopTime' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusStopTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusStopTime' put: (self dataElementsDictionary removeKey: 'contrastBolusStopTime') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusStopTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusStopTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusStopTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'contrastBolusStopTime' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusStopTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusStopTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusTotalDose [

	^self dataElementsValues at: 'contrastBolusTotalDose' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusTotalDose' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusTotalDose' put: (self dataElementsDictionary removeKey: 'contrastBolusTotalDose') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusTotalDose: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusTotalDose' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusTotalDose.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'contrastBolusTotalDose' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusTotalDose' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusTotalDose' put: aDSValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusVolume [

	^self dataElementsValues at: 'contrastBolusVolume' ifAbsent: [
		self dataElementsDictionary at: 'contrastBolusVolume' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastBolusVolume' put: (self dataElementsDictionary removeKey: 'contrastBolusVolume') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastBolusVolume: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastBolusVolume' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastBolusVolume.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'contrastBolusVolume' put: dataElement.
			self dataElementsValues removeKey: 'contrastBolusVolume' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastBolusVolume' put: aDSValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastFlowDuration [

	^self dataElementsValues at: 'contrastFlowDuration' ifAbsent: [
		self dataElementsDictionary at: 'contrastFlowDuration' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastFlowDuration' put: (self dataElementsDictionary removeKey: 'contrastFlowDuration') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastFlowDuration: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastFlowDuration' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastFlowDuration.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'contrastFlowDuration' put: dataElement.
			self dataElementsValues removeKey: 'contrastFlowDuration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastFlowDuration' put: aDSValue
		]
	].

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastFlowRate [

	^self dataElementsValues at: 'contrastFlowRate' ifAbsent: [
		self dataElementsDictionary at: 'contrastFlowRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastFlowRate' put: (self dataElementsDictionary removeKey: 'contrastFlowRate') value.
		]
	]

]

{ #category : #accessing }
ConstrastBolusIOM >> contrastFlowRate: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastFlowRate' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastFlowRate.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'contrastFlowRate' put: dataElement.
			self dataElementsValues removeKey: 'contrastFlowRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastFlowRate' put: aDSValue
		]
	].

]
