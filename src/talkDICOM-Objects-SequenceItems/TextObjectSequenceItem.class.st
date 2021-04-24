Class {
	#name : #TextObjectSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
TextObjectSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Text Object Sequence Item'.
	SequenceName := 'textObjectSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0070 16r0008).

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #boundingBoxAnnotationUnits
				tag: #(16r70 16r3)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #anchorPointAnnotationUnits
				tag: #(16r70 16r4)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(STDataElement
				newWith: #unformattedTextValue
				tag: #(16r70 16r6)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(FLDataElement
				newWith: #boundingBoxTopLeftHandCorner
				tag: #(16r70 16r10)
				vm: '2'
				type: '1C').
	self
		addDataElement:
			(FLDataElement
				newWith: #boundingBoxBottomRightHandCorner
				tag: #(16r70 16r11)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #boundingBoxTextHorizontalJustification
				tag: #(16r70 16r12)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(FLDataElement
				newWith: #anchorPoint
				tag: #(16r70 16r14)
				vm: '2'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #anchorPointVisibility
				tag: #(16r70 16r15)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
TextObjectSequenceItem >> anchorPoint [

	^self dataElementsValues at: 'anchorPoint' ifAbsent: [
		self dataElementsDictionary at: 'anchorPoint' ifPresent: [:dataElement |
			self dataElementsValues at: 'anchorPoint' put: (self dataElementsDictionary removeKey: 'anchorPoint') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> anchorPoint: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'anchorPoint' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #anchorPoint.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'anchorPoint' put: dataElement.
			self dataElementsValues removeKey: 'anchorPoint' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'anchorPoint' put: aFLValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> anchorPointAnnotationUnits [

	^self dataElementsValues at: 'anchorPointAnnotationUnits' ifAbsent: [
		self dataElementsDictionary at: 'anchorPointAnnotationUnits' ifPresent: [:dataElement |
			self dataElementsValues at: 'anchorPointAnnotationUnits' put: (self dataElementsDictionary removeKey: 'anchorPointAnnotationUnits') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> anchorPointAnnotationUnits: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'anchorPointAnnotationUnits' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #anchorPointAnnotationUnits.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'anchorPointAnnotationUnits' put: dataElement.
			self dataElementsValues removeKey: 'anchorPointAnnotationUnits' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'anchorPointAnnotationUnits' put: aCSValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> anchorPointVisibility [

	^self dataElementsValues at: 'anchorPointVisibility' ifAbsent: [
		self dataElementsDictionary at: 'anchorPointVisibility' ifPresent: [:dataElement |
			self dataElementsValues at: 'anchorPointVisibility' put: (self dataElementsDictionary removeKey: 'anchorPointVisibility') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> anchorPointVisibility: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'anchorPointVisibility' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #anchorPointVisibility.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'anchorPointVisibility' put: dataElement.
			self dataElementsValues removeKey: 'anchorPointVisibility' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'anchorPointVisibility' put: aCSValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxAnnotationUnits [

	^self dataElementsValues at: 'boundingBoxAnnotationUnits' ifAbsent: [
		self dataElementsDictionary at: 'boundingBoxAnnotationUnits' ifPresent: [:dataElement |
			self dataElementsValues at: 'boundingBoxAnnotationUnits' put: (self dataElementsDictionary removeKey: 'boundingBoxAnnotationUnits') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxAnnotationUnits: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'boundingBoxAnnotationUnits' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #boundingBoxAnnotationUnits.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'boundingBoxAnnotationUnits' put: dataElement.
			self dataElementsValues removeKey: 'boundingBoxAnnotationUnits' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'boundingBoxAnnotationUnits' put: aCSValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxBottomRightHandCorner [

	^self dataElementsValues at: 'boundingBoxBottomRightHandCorner' ifAbsent: [
		self dataElementsDictionary at: 'boundingBoxBottomRightHandCorner' ifPresent: [:dataElement |
			self dataElementsValues at: 'boundingBoxBottomRightHandCorner' put: (self dataElementsDictionary removeKey: 'boundingBoxBottomRightHandCorner') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxBottomRightHandCorner: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'boundingBoxBottomRightHandCorner' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #boundingBoxBottomRightHandCorner.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'boundingBoxBottomRightHandCorner' put: dataElement.
			self dataElementsValues removeKey: 'boundingBoxBottomRightHandCorner' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'boundingBoxBottomRightHandCorner' put: aFLValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxTextHorizontalJustification [

	^self dataElementsValues at: 'boundingBoxTextHorizontalJustification' ifAbsent: [
		self dataElementsDictionary at: 'boundingBoxTextHorizontalJustification' ifPresent: [:dataElement |
			self dataElementsValues at: 'boundingBoxTextHorizontalJustification' put: (self dataElementsDictionary removeKey: 'boundingBoxTextHorizontalJustification') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxTextHorizontalJustification: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'boundingBoxTextHorizontalJustification' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #boundingBoxTextHorizontalJustification.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'boundingBoxTextHorizontalJustification' put: dataElement.
			self dataElementsValues removeKey: 'boundingBoxTextHorizontalJustification' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'boundingBoxTextHorizontalJustification' put: aCSValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxTopLeftHandCorner [

	^self dataElementsValues at: 'boundingBoxTopLeftHandCorner' ifAbsent: [
		self dataElementsDictionary at: 'boundingBoxTopLeftHandCorner' ifPresent: [:dataElement |
			self dataElementsValues at: 'boundingBoxTopLeftHandCorner' put: (self dataElementsDictionary removeKey: 'boundingBoxTopLeftHandCorner') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> boundingBoxTopLeftHandCorner: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'boundingBoxTopLeftHandCorner' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #boundingBoxTopLeftHandCorner.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'boundingBoxTopLeftHandCorner' put: dataElement.
			self dataElementsValues removeKey: 'boundingBoxTopLeftHandCorner' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'boundingBoxTopLeftHandCorner' put: aFLValue
		]
	].

]

{ #category : #accessing }
TextObjectSequenceItem >> graphicData [

	^dataElementsValues at: #graphicData ifAbsent: [
		dataElementsDictionary at: #graphicData ifPresent: [:dataElement |
			dataElementsValues at: #graphicData put: (dataElementsDictionary removeKey: #graphicData) value.
		]
	]
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicData: aFLValue [

	| dataElement |

	(dataElementsDictionary at: #graphicData ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicData.
			dataElement encoder: encoder.
			dataElement value: aFLValue.
			dataElementsDictionary at: #graphicData put: dataElement.
			dataElementsValues removeKey: #graphicData ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #graphicData put: aFLValue
		]
	].
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicDimensions [

	^dataElementsValues at: #graphicDimensions ifAbsent: [
		dataElementsDictionary at: #graphicDimensions ifPresent: [:dataElement |
			dataElementsValues at: #graphicDimensions put: (dataElementsDictionary removeKey: #graphicDimensions) value.
		]
	]
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicDimensions: aUSValue [

	| dataElement |

	(dataElementsDictionary at: #graphicDimensions ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicDimensions.
			dataElement encoder: encoder.
			dataElement value: aUSValue.
			dataElementsDictionary at: #graphicDimensions put: dataElement.
			dataElementsValues removeKey: #graphicDimensions ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #graphicDimensions put: aUSValue
		]
	].
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicFilled [

	^dataElementsValues at: #graphicFilled ifAbsent: [
		dataElementsDictionary at: #graphicFilled ifPresent: [:dataElement |
			dataElementsValues at: #graphicFilled put: (dataElementsDictionary removeKey: #graphicFilled) value.
		]
	]
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicFilled: aCSValue [

	| dataElement |

	(dataElementsDictionary at: #graphicFilled ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicFilled.
			dataElement encoder: encoder.
			dataElement value: aCSValue.
			dataElementsDictionary at: #graphicFilled put: dataElement.
			dataElementsValues removeKey: #graphicFilled ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #graphicFilled put: aCSValue
		]
	].
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicObjectSequence [

	^dataElementsValues at: #graphicObjectSequence ifAbsent: [
		dataElementsDictionary at: #graphicObjectSequence ifPresent: [:dataElement |
			dataElementsValues at: #graphicObjectSequence put: (dataElementsDictionary removeKey: #graphicObjectSequence) value.
		]
	]
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicObjectSequence: aSQValue [

	| dataElement |

	(dataElementsDictionary at: #graphicObjectSequence ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicObjectSequence.
			dataElement encoder: encoder.
			dataElement value: aSQValue.
			dataElementsDictionary at: #graphicObjectSequence put: dataElement.
			dataElementsValues removeKey: #graphicObjectSequence ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #graphicObjectSequence put: aSQValue
		]
	].
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicType [

	^dataElementsValues at: #graphicType ifAbsent: [
		dataElementsDictionary at: #graphicType ifPresent: [:dataElement |
			dataElementsValues at: #graphicType put: (dataElementsDictionary removeKey: #graphicType) value.
		]
	]
]

{ #category : #accessing }
TextObjectSequenceItem >> graphicType: aCSValue [

	| dataElement |

	(dataElementsDictionary at: #graphicType ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicType.
			dataElement encoder: encoder.
			dataElement value: aCSValue.
			dataElementsDictionary at: #graphicType put: dataElement.
			dataElementsValues removeKey: #graphicType ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #graphicType put: aCSValue
		]
	].
]

{ #category : #accessing }
TextObjectSequenceItem >> numberOfGraphicPoints [

	^dataElementsValues at: #numberOfGraphicPoints ifAbsent: [
		dataElementsDictionary at: #numberOfGraphicPoints ifPresent: [:dataElement |
			dataElementsValues at: #numberOfGraphicPoints put: (dataElementsDictionary removeKey: #numberOfGraphicPoints) value.
		]
	]
]

{ #category : #accessing }
TextObjectSequenceItem >> numberOfGraphicPoints: aUSValue [

	| dataElement |

	(dataElementsDictionary at: #numberOfGraphicPoints ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfGraphicPoints.
			dataElement encoder: encoder.
			dataElement value: aUSValue.
			dataElementsDictionary at: #numberOfGraphicPoints put: dataElement.
			dataElementsValues removeKey: #numberOfGraphicPoints ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #numberOfGraphicPoints put: aUSValue
		]
	].
]

{ #category : #accessing }
TextObjectSequenceItem >> unformattedTextValue [

	^self dataElementsValues at: 'unformattedTextValue' ifAbsent: [
		self dataElementsDictionary at: 'unformattedTextValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'unformattedTextValue' put: (self dataElementsDictionary removeKey: 'unformattedTextValue') value.
		]
	]

]

{ #category : #accessing }
TextObjectSequenceItem >> unformattedTextValue: aSTValue [

	| dataElement |

	(self dataElementsDictionary at: 'unformattedTextValue' ifPresent: [:aDataElement | aDataElement value: aSTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #unformattedTextValue.
			dataElement encoder: self encoder.
			dataElement value: aSTValue.
			self dataElementsDictionary at: 'unformattedTextValue' put: dataElement.
			self dataElementsValues removeKey: 'unformattedTextValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'unformattedTextValue' put: aSTValue
		]
	].

]
