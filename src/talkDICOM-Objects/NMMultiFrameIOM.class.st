Class {
	#name : #NMMultiFrameIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
NMMultiFrameIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Multi-frame Information Object Module'.
	moduleName := 'nmMultiFrameIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(ATDataElement
				newWith: #frameIncrementPointer
				tag: #(16r28 16r9)
				vm: '1-n'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #energyWindowVector
				tag: #(16r54 16r10)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfEnergyWindows
				tag: #(16r54 16r11)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #detectorVector
				tag: #(16r54 16r20)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfDetectors
				tag: #(16r54 16r21)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #phaseVector
				tag: #(16r54 16r30)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfPhases
				tag: #(16r54 16r31)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #rotationVector
				tag: #(16r54 16r50)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfRotations
				tag: #(16r54 16r51)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #rrIntervalVector
				tag: #(16r54 16r60)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfRRIntervals
				tag: #(16r54 16r61)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #timeSlotVector
				tag: #(16r54 16r70)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfTimeSlots
				tag: #(16r54 16r71)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #sliceVector
				tag: #(16r54 16r80)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfSlices
				tag: #(16r54 16r81)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #angularViewVector
				tag: #(16r54 16r90)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #timeSliceVector
				tag: #(16r54 16r100)
				vm: '1-n'
				type: '1C')
]

{ #category : #accessing }
NMMultiFrameIOM >> angularViewVector [

	^self dataElementsValues at: 'angularViewVector' ifAbsent: [
		self dataElementsDictionary at: 'angularViewVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'angularViewVector' put: (self dataElementsDictionary removeKey: 'angularViewVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> angularViewVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'angularViewVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #angularViewVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'angularViewVector' put: dataElement.
			self dataElementsValues removeKey: 'angularViewVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'angularViewVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> detectorVector [

	^self dataElementsValues at: 'detectorVector' ifAbsent: [
		self dataElementsDictionary at: 'detectorVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'detectorVector' put: (self dataElementsDictionary removeKey: 'detectorVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> detectorVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'detectorVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #detectorVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'detectorVector' put: dataElement.
			self dataElementsValues removeKey: 'detectorVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'detectorVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> energyWindowVector [

	^self dataElementsValues at: 'energyWindowVector' ifAbsent: [
		self dataElementsDictionary at: 'energyWindowVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'energyWindowVector' put: (self dataElementsDictionary removeKey: 'energyWindowVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> energyWindowVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'energyWindowVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #energyWindowVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'energyWindowVector' put: dataElement.
			self dataElementsValues removeKey: 'energyWindowVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'energyWindowVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> frameIncrementPointer [

	^self dataElementsValues at: 'frameIncrementPointer' ifAbsent: [
		self dataElementsDictionary at: 'frameIncrementPointer' ifPresent: [:dataElement |
			self dataElementsValues at: 'frameIncrementPointer' put: (self dataElementsDictionary removeKey: 'frameIncrementPointer') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> frameIncrementPointer: aATValue [

	| dataElement |

	(self dataElementsDictionary at: 'frameIncrementPointer' ifPresent: [:aDataElement | aDataElement value: aATValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #frameIncrementPointer.
			dataElement encoder: self encoder.
			dataElement value: aATValue.
			self dataElementsDictionary at: 'frameIncrementPointer' put: dataElement.
			self dataElementsValues removeKey: 'frameIncrementPointer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'frameIncrementPointer' put: aATValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfDetectors [

	^self dataElementsValues at: 'numberOfDetectors' ifAbsent: [
		self dataElementsDictionary at: 'numberOfDetectors' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfDetectors' put: (self dataElementsDictionary removeKey: 'numberOfDetectors') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfDetectors: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfDetectors' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfDetectors.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfDetectors' put: dataElement.
			self dataElementsValues removeKey: 'numberOfDetectors' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfDetectors' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfEnergyWindows [

	^self dataElementsValues at: 'numberOfEnergyWindows' ifAbsent: [
		self dataElementsDictionary at: 'numberOfEnergyWindows' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfEnergyWindows' put: (self dataElementsDictionary removeKey: 'numberOfEnergyWindows') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfEnergyWindows: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfEnergyWindows' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfEnergyWindows.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfEnergyWindows' put: dataElement.
			self dataElementsValues removeKey: 'numberOfEnergyWindows' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfEnergyWindows' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfPhases [

	^self dataElementsValues at: 'numberOfPhases' ifAbsent: [
		self dataElementsDictionary at: 'numberOfPhases' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfPhases' put: (self dataElementsDictionary removeKey: 'numberOfPhases') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfPhases: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfPhases' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfPhases.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfPhases' put: dataElement.
			self dataElementsValues removeKey: 'numberOfPhases' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfPhases' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfRRIntervals [

	^self dataElementsValues at: 'numberOfRRIntervals' ifAbsent: [
		self dataElementsDictionary at: 'numberOfRRIntervals' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfRRIntervals' put: (self dataElementsDictionary removeKey: 'numberOfRRIntervals') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfRRIntervals: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfRRIntervals' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfRRIntervals.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfRRIntervals' put: dataElement.
			self dataElementsValues removeKey: 'numberOfRRIntervals' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfRRIntervals' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfRotations [

	^self dataElementsValues at: 'numberOfRotations' ifAbsent: [
		self dataElementsDictionary at: 'numberOfRotations' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfRotations' put: (self dataElementsDictionary removeKey: 'numberOfRotations') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfRotations: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfRotations' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfRotations.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfRotations' put: dataElement.
			self dataElementsValues removeKey: 'numberOfRotations' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfRotations' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfSlices [

	^self dataElementsValues at: 'numberOfSlices' ifAbsent: [
		self dataElementsDictionary at: 'numberOfSlices' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfSlices' put: (self dataElementsDictionary removeKey: 'numberOfSlices') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfSlices: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfSlices' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfSlices.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfSlices' put: dataElement.
			self dataElementsValues removeKey: 'numberOfSlices' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfSlices' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfTimeSlots [

	^self dataElementsValues at: 'numberOfTimeSlots' ifAbsent: [
		self dataElementsDictionary at: 'numberOfTimeSlots' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfTimeSlots' put: (self dataElementsDictionary removeKey: 'numberOfTimeSlots') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> numberOfTimeSlots: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfTimeSlots' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfTimeSlots.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfTimeSlots' put: dataElement.
			self dataElementsValues removeKey: 'numberOfTimeSlots' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfTimeSlots' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> phaseVector [

	^self dataElementsValues at: 'phaseVector' ifAbsent: [
		self dataElementsDictionary at: 'phaseVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'phaseVector' put: (self dataElementsDictionary removeKey: 'phaseVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> phaseVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'phaseVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #phaseVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'phaseVector' put: dataElement.
			self dataElementsValues removeKey: 'phaseVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'phaseVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> rRIntervalVector [

	^self dataElementsValues at: 'rRIntervalVector' ifAbsent: [
		self dataElementsDictionary at: 'rRIntervalVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'rRIntervalVector' put: (self dataElementsDictionary removeKey: 'rRIntervalVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> rRIntervalVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rRIntervalVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rRIntervalVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rRIntervalVector' put: dataElement.
			self dataElementsValues removeKey: 'rRIntervalVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rRIntervalVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> rotationVector [

	^self dataElementsValues at: 'rotationVector' ifAbsent: [
		self dataElementsDictionary at: 'rotationVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'rotationVector' put: (self dataElementsDictionary removeKey: 'rotationVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> rotationVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rotationVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rotationVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rotationVector' put: dataElement.
			self dataElementsValues removeKey: 'rotationVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rotationVector' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
NMMultiFrameIOM >> rrIntervalVector [

	^self dataElementsValues at: 'rRIntervalVector' ifAbsent: [
		self dataElementsDictionary at: 'rRIntervalVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'rRIntervalVector' put: (self dataElementsDictionary removeKey: 'rRIntervalVector') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
NMMultiFrameIOM >> rrIntervalVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rRIntervalVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rRIntervalVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rRIntervalVector' put: dataElement.
			self dataElementsValues removeKey: 'rRIntervalVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rRIntervalVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> sliceVector [

	^self dataElementsValues at: 'sliceVector' ifAbsent: [
		self dataElementsDictionary at: 'sliceVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'sliceVector' put: (self dataElementsDictionary removeKey: 'sliceVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> sliceVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sliceVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sliceVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'sliceVector' put: dataElement.
			self dataElementsValues removeKey: 'sliceVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sliceVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> timeSliceVector [

	^self dataElementsValues at: 'timeSliceVector' ifAbsent: [
		self dataElementsDictionary at: 'timeSliceVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeSliceVector' put: (self dataElementsDictionary removeKey: 'timeSliceVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> timeSliceVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeSliceVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeSliceVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'timeSliceVector' put: dataElement.
			self dataElementsValues removeKey: 'timeSliceVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeSliceVector' put: aUSValue
		]
	].

]

{ #category : #accessing }
NMMultiFrameIOM >> timeSlotVector [

	^self dataElementsValues at: 'timeSlotVector' ifAbsent: [
		self dataElementsDictionary at: 'timeSlotVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeSlotVector' put: (self dataElementsDictionary removeKey: 'timeSlotVector') value.
		]
	]

]

{ #category : #accessing }
NMMultiFrameIOM >> timeSlotVector: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeSlotVector' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeSlotVector.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'timeSlotVector' put: dataElement.
			self dataElementsValues removeKey: 'timeSlotVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeSlotVector' put: aUSValue
		]
	].

]
