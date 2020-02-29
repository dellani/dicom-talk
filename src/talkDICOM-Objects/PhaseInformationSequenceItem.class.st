Class {
	#name : #PhaseInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
PhaseInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Phase Information Sequence Item'.
	SequenceName := 'phaseInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(ISDataElement
				newWith: #actualFrameDuration
				tag: #(16r18 16r1242)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfFramesInPhase
				tag: #(16r54 16r33)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #phaseDelay
				tag: #(16r54 16r36)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #pauseBetweenFrames
				tag: #(16r54 16r38)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #phaseDescription
				tag: #(16r54 16r39)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #triggerVector
				tag: #(16r54 16r210)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfTriggersInPhase
				tag: #(16r54 16r211)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
PhaseInformationSequenceItem >> actualFrameDuration [

	^self dataElementsValues at: 'actualFrameDuration' ifAbsent: [
		self dataElementsDictionary at: 'actualFrameDuration' ifPresent: [:dataElement |
			self dataElementsValues at: 'actualFrameDuration' put: (self dataElementsDictionary removeKey: 'actualFrameDuration') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> actualFrameDuration: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'actualFrameDuration' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #actualFrameDuration.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'actualFrameDuration' put: dataElement.
			self dataElementsValues removeKey: 'actualFrameDuration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'actualFrameDuration' put: aISValue
		]
	].

]

{ #category : #accessing }
PhaseInformationSequenceItem >> numberOfFramesInPhase [

	^self dataElementsValues at: 'numberOfFramesInPhase' ifAbsent: [
		self dataElementsDictionary at: 'numberOfFramesInPhase' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfFramesInPhase' put: (self dataElementsDictionary removeKey: 'numberOfFramesInPhase') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> numberOfFramesInPhase: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfFramesInPhase' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfFramesInPhase.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfFramesInPhase' put: dataElement.
			self dataElementsValues removeKey: 'numberOfFramesInPhase' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfFramesInPhase' put: aUSValue
		]
	].

]

{ #category : #accessing }
PhaseInformationSequenceItem >> numberOfTriggersInPhase [

	^self dataElementsValues at: 'numberOfTriggersInPhase' ifAbsent: [
		self dataElementsDictionary at: 'numberOfTriggersInPhase' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfTriggersInPhase' put: (self dataElementsDictionary removeKey: 'numberOfTriggersInPhase') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> numberOfTriggersInPhase: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfTriggersInPhase' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfTriggersInPhase.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfTriggersInPhase' put: dataElement.
			self dataElementsValues removeKey: 'numberOfTriggersInPhase' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfTriggersInPhase' put: aUSValue
		]
	].

]

{ #category : #accessing }
PhaseInformationSequenceItem >> pauseBetweenFrames [

	^self dataElementsValues at: 'pauseBetweenFrames' ifAbsent: [
		self dataElementsDictionary at: 'pauseBetweenFrames' ifPresent: [:dataElement |
			self dataElementsValues at: 'pauseBetweenFrames' put: (self dataElementsDictionary removeKey: 'pauseBetweenFrames') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> pauseBetweenFrames: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'pauseBetweenFrames' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pauseBetweenFrames.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'pauseBetweenFrames' put: dataElement.
			self dataElementsValues removeKey: 'pauseBetweenFrames' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pauseBetweenFrames' put: aISValue
		]
	].

]

{ #category : #accessing }
PhaseInformationSequenceItem >> phaseDelay [

	^self dataElementsValues at: 'phaseDelay' ifAbsent: [
		self dataElementsDictionary at: 'phaseDelay' ifPresent: [:dataElement |
			self dataElementsValues at: 'phaseDelay' put: (self dataElementsDictionary removeKey: 'phaseDelay') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> phaseDelay: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'phaseDelay' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #phaseDelay.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'phaseDelay' put: dataElement.
			self dataElementsValues removeKey: 'phaseDelay' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'phaseDelay' put: aISValue
		]
	].

]

{ #category : #accessing }
PhaseInformationSequenceItem >> phaseDescription [

	^self dataElementsValues at: 'phaseDescription' ifAbsent: [
		self dataElementsDictionary at: 'phaseDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'phaseDescription' put: (self dataElementsDictionary removeKey: 'phaseDescription') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> phaseDescription: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'phaseDescription' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #phaseDescription.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'phaseDescription' put: dataElement.
			self dataElementsValues removeKey: 'phaseDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'phaseDescription' put: aCSValue
		]
	].

]

{ #category : #accessing }
PhaseInformationSequenceItem >> triggerVector [

	^self dataElementsValues at: 'triggerVector' ifAbsent: [
		self dataElementsDictionary at: 'triggerVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerVector' put: (self dataElementsDictionary removeKey: 'triggerVector') value.
		]
	]

]

{ #category : #accessing }
PhaseInformationSequenceItem >> triggerVector: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerVector' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerVector.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'triggerVector' put: dataElement.
			self dataElementsValues removeKey: 'triggerVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerVector' put: aISValue
		]
	].

]
