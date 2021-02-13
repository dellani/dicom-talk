Class {
	#name : #RotationInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
RotationInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Rotation Information Sequence Item'.
	SequenceName := 'rotationInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(DSDataElement
				newWith: #distanceSourceToDetector
				tag: #(16r18 16r1110)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #tableHeight
				tag: #(16r18 16r1130)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #tableReverse
				tag: #(16r18 16r1131)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #rotationDirection
				tag: #(16r18 16r1140)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #radialPosition
				tag: #(16r18 16r1142)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #scanArc
				tag: #(16r18 16r1143)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #angularStep
				tag: #(16r18 16r1144)
				vm: '1'
				type: '1C').
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
				newWith: #numberOfFramesInRotation
				tag: #(16r54 16r53)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #startAngle
				tag: #(16r54 16r200)
				vm: '1'
				type: '2')
]

{ #category : #accessing }
RotationInformationSequenceItem >> actualFrameDuration [

	^self dataElementsValues at: 'actualFrameDuration' ifAbsent: [
		self dataElementsDictionary at: 'actualFrameDuration' ifPresent: [:dataElement |
			self dataElementsValues at: 'actualFrameDuration' put: (self dataElementsDictionary removeKey: 'actualFrameDuration') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> actualFrameDuration: aISValue [

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
RotationInformationSequenceItem >> angularStep [

	^self dataElementsValues at: 'angularStep' ifAbsent: [
		self dataElementsDictionary at: 'angularStep' ifPresent: [:dataElement |
			self dataElementsValues at: 'angularStep' put: (self dataElementsDictionary removeKey: 'angularStep') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> angularStep: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'angularStep' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #angularStep.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'angularStep' put: dataElement.
			self dataElementsValues removeKey: 'angularStep' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'angularStep' put: aDSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> distanceSourceToDetector [

	^self dataElementsValues at: 'distanceSourceToDetector' ifAbsent: [
		self dataElementsDictionary at: 'distanceSourceToDetector' ifPresent: [:dataElement |
			self dataElementsValues at: 'distanceSourceToDetector' put: (self dataElementsDictionary removeKey: 'distanceSourceToDetector') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> distanceSourceToDetector: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'distanceSourceToDetector' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #distanceSourceToDetector.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'distanceSourceToDetector' put: dataElement.
			self dataElementsValues removeKey: 'distanceSourceToDetector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'distanceSourceToDetector' put: aDSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> numberOfFramesInRotation [

	^self dataElementsValues at: 'numberOfFramesInRotation' ifAbsent: [
		self dataElementsDictionary at: 'numberOfFramesInRotation' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfFramesInRotation' put: (self dataElementsDictionary removeKey: 'numberOfFramesInRotation') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> numberOfFramesInRotation: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfFramesInRotation' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfFramesInRotation.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfFramesInRotation' put: dataElement.
			self dataElementsValues removeKey: 'numberOfFramesInRotation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfFramesInRotation' put: aUSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> radialPosition [

	^self dataElementsValues at: 'radialPosition' ifAbsent: [
		self dataElementsDictionary at: 'radialPosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'radialPosition' put: (self dataElementsDictionary removeKey: 'radialPosition') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> radialPosition: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'radialPosition' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radialPosition.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'radialPosition' put: dataElement.
			self dataElementsValues removeKey: 'radialPosition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radialPosition' put: aDSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> rotationDirection [

	^self dataElementsValues at: 'rotationDirection' ifAbsent: [
		self dataElementsDictionary at: 'rotationDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'rotationDirection' put: (self dataElementsDictionary removeKey: 'rotationDirection') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> rotationDirection: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rotationDirection' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rotationDirection.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rotationDirection' put: dataElement.
			self dataElementsValues removeKey: 'rotationDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rotationDirection' put: aCSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> scanArc [

	^self dataElementsValues at: 'scanArc' ifAbsent: [
		self dataElementsDictionary at: 'scanArc' ifPresent: [:dataElement |
			self dataElementsValues at: 'scanArc' put: (self dataElementsDictionary removeKey: 'scanArc') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> scanArc: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'scanArc' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scanArc.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'scanArc' put: dataElement.
			self dataElementsValues removeKey: 'scanArc' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scanArc' put: aDSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> startAngle [

	^self dataElementsValues at: 'startAngle' ifAbsent: [
		self dataElementsDictionary at: 'startAngle' ifPresent: [:dataElement |
			self dataElementsValues at: 'startAngle' put: (self dataElementsDictionary removeKey: 'startAngle') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> startAngle: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'startAngle' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #startAngle.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'startAngle' put: dataElement.
			self dataElementsValues removeKey: 'startAngle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'startAngle' put: aDSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> tableHeight [

	^self dataElementsValues at: 'tableHeight' ifAbsent: [
		self dataElementsDictionary at: 'tableHeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableHeight' put: (self dataElementsDictionary removeKey: 'tableHeight') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> tableHeight: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableHeight' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableHeight.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'tableHeight' put: dataElement.
			self dataElementsValues removeKey: 'tableHeight' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableHeight' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
RotationInformationSequenceItem >> tableReverse [

	^self dataElementsValues at: 'tableTraverse' ifAbsent: [
		self dataElementsDictionary at: 'tableTraverse' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableTraverse' put: (self dataElementsDictionary removeKey: 'tableTraverse') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
RotationInformationSequenceItem >> tableReverse: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableTraverse' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableTraverse.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'tableTraverse' put: dataElement.
			self dataElementsValues removeKey: 'tableTraverse' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableTraverse' put: aDSValue
		]
	].

]

{ #category : #accessing }
RotationInformationSequenceItem >> tableTraverse [

	^self dataElementsValues at: 'tableTraverse' ifAbsent: [
		self dataElementsDictionary at: 'tableTraverse' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableTraverse' put: (self dataElementsDictionary removeKey: 'tableTraverse') value.
		]
	]

]

{ #category : #accessing }
RotationInformationSequenceItem >> tableTraverse: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableTraverse' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableTraverse.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'tableTraverse' put: dataElement.
			self dataElementsValues removeKey: 'tableTraverse' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableTraverse' put: aDSValue
		]
	].

]
