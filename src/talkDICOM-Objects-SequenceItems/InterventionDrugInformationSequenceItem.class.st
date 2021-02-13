Class {
	#name : #InterventionDrugInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
InterventionDrugInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Intervention Drug Information Sequence Item'.
	SequenceName := 'interventionDrugInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(TMDataElement
				newWith: #interventionDrugStopTime
				tag: #(16r18 16r27)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #InterventionDrugDose
				tag: #(16r18 16r28)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #interventionDrugCodeSequence
				tag: #(16r18 16r29)
				vm: '1'
				type: '3'
				sequenceItemClass: InterventionDrugCodeSequenceItem).
	self
		addDataElement:
			(LODataElement
				newWith: #interventionDrugName
				tag: #(16r18 16r34)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #interventionDrugStartTime
				tag: #(16r18 16r35)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #administrationRouteCodeSequence
				tag: #(16r54 16r302)
				vm: '1'
				type: '3'
				sequenceItemClass: AdministrationRouteCodeSequenceItem)
]

{ #category : #'accessing - talkDICOM names' }
InterventionDrugInformationSequenceItem >> InterventionDrugDose [

	^self dataElementsValues at: 'interventionDrugDose' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugDose' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugDose' put: (self dataElementsDictionary removeKey: 'interventionDrugDose') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
InterventionDrugInformationSequenceItem >> InterventionDrugDose: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugDose' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugDose.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'interventionDrugDose' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugDose' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugDose' put: aDSValue
		]
	].

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> administrationRouteCodeSequence [

	^self dataElementsValues at: 'administrationRouteCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'administrationRouteCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'administrationRouteCodeSequence' put: (self dataElementsDictionary removeKey: 'administrationRouteCodeSequence') value.
		]
	]

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> administrationRouteCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'administrationRouteCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #administrationRouteCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'administrationRouteCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'administrationRouteCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'administrationRouteCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugCodeSequence [

	^self dataElementsValues at: 'interventionDrugCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugCodeSequence' put: (self dataElementsDictionary removeKey: 'interventionDrugCodeSequence') value.
		]
	]

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'interventionDrugCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugDose [

	^self dataElementsValues at: 'interventionDrugDose' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugDose' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugDose' put: (self dataElementsDictionary removeKey: 'interventionDrugDose') value.
		]
	]

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugDose: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugDose' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugDose.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'interventionDrugDose' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugDose' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugDose' put: aDSValue
		]
	].

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugName [

	^self dataElementsValues at: 'interventionDrugName' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugName' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugName' put: (self dataElementsDictionary removeKey: 'interventionDrugName') value.
		]
	]

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'interventionDrugName' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugName' put: aLOValue
		]
	].

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugStartTime [

	^self dataElementsValues at: 'interventionDrugStartTime' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugStartTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugStartTime' put: (self dataElementsDictionary removeKey: 'interventionDrugStartTime') value.
		]
	]

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugStartTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugStartTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugStartTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'interventionDrugStartTime' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugStartTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugStartTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugStopTime [

	^self dataElementsValues at: 'interventionDrugStopTime' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugStopTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugStopTime' put: (self dataElementsDictionary removeKey: 'interventionDrugStopTime') value.
		]
	]

]

{ #category : #accessing }
InterventionDrugInformationSequenceItem >> interventionDrugStopTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugStopTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugStopTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'interventionDrugStopTime' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugStopTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugStopTime' put: aTMValue
		]
	].

]
