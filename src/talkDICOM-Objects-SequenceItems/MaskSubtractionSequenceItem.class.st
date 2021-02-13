Class {
	#name : #MaskSubtractionSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
MaskSubtractionSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Mask Subtraction Sequence Item'.
	SequenceName := 'maskSubtractionSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #maskOperation
				tag: #(16r28 16r6101)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #applicationFrameRange
				tag: #(16r28 16r6102)
				vm: '2-2n'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #maskFrameNumbers
				tag: #(16r28 16r6110)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #contrastFrameAveraging
				tag: #(16r28 16r6112)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(FLDataElement
				newWith: #maskSubpixelShift
				tag: #(16r28 16r6114)
				vm: '2'
				type: '3').
	self
		addDataElement:
			(SSDataElement
				newWith: #tidOffset
				tag: #(16r28 16r6120)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(STDataElement
				newWith: #maskOperationExplanation
				tag: #(16r28 16r6190)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
MaskSubtractionSequenceItem >> applicableFrameRange [

	^self dataElementsValues at: 'applicableFrameRange' ifAbsent: [
		self dataElementsDictionary at: 'applicableFrameRange' ifPresent: [:dataElement |
			self dataElementsValues at: 'applicableFrameRange' put: (self dataElementsDictionary removeKey: 'applicableFrameRange') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> applicableFrameRange: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'applicableFrameRange' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #applicableFrameRange.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'applicableFrameRange' put: dataElement.
			self dataElementsValues removeKey: 'applicableFrameRange' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'applicableFrameRange' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MaskSubtractionSequenceItem >> applicationFrameRange [

	^self dataElementsValues at: 'applicableFrameRange' ifAbsent: [
		self dataElementsDictionary at: 'applicableFrameRange' ifPresent: [:dataElement |
			self dataElementsValues at: 'applicableFrameRange' put: (self dataElementsDictionary removeKey: 'applicableFrameRange') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MaskSubtractionSequenceItem >> applicationFrameRange: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'applicableFrameRange' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #applicableFrameRange.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'applicableFrameRange' put: dataElement.
			self dataElementsValues removeKey: 'applicableFrameRange' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'applicableFrameRange' put: aUSValue
		]
	].

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> changeMe [

	^dataElementsValues at: #changeMe ifAbsent: [
		dataElementsDictionary at: #changeMe ifPresent: [:dataElement |
			dataElementsValues at: #changeMe put: (dataElementsDictionary removeKey: #changeMe) value.
		]
	]
]

{ #category : #accessing }
MaskSubtractionSequenceItem >> changeMe: aAEValue [

	| dataElement |

	(dataElementsDictionary at: #changeMe ifPresent: [:aDataElement | aDataElement value: aAEValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #changeMe.
			dataElement encoder: encoder.
			dataElement value: aAEValue.
			dataElementsDictionary at: #changeMe put: dataElement.
			dataElementsValues removeKey: #changeMe ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #changeMe put: aAEValue
		]
	].
]

{ #category : #accessing }
MaskSubtractionSequenceItem >> contrastFrameAveraging [

	^self dataElementsValues at: 'contrastFrameAveraging' ifAbsent: [
		self dataElementsDictionary at: 'contrastFrameAveraging' ifPresent: [:dataElement |
			self dataElementsValues at: 'contrastFrameAveraging' put: (self dataElementsDictionary removeKey: 'contrastFrameAveraging') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> contrastFrameAveraging: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contrastFrameAveraging' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contrastFrameAveraging.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'contrastFrameAveraging' put: dataElement.
			self dataElementsValues removeKey: 'contrastFrameAveraging' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contrastFrameAveraging' put: aUSValue
		]
	].

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskFrameNumbers [

	^self dataElementsValues at: 'maskFrameNumbers' ifAbsent: [
		self dataElementsDictionary at: 'maskFrameNumbers' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskFrameNumbers' put: (self dataElementsDictionary removeKey: 'maskFrameNumbers') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskFrameNumbers: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskFrameNumbers' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskFrameNumbers.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'maskFrameNumbers' put: dataElement.
			self dataElementsValues removeKey: 'maskFrameNumbers' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskFrameNumbers' put: aUSValue
		]
	].

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskOperation [

	^self dataElementsValues at: 'maskOperation' ifAbsent: [
		self dataElementsDictionary at: 'maskOperation' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskOperation' put: (self dataElementsDictionary removeKey: 'maskOperation') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskOperation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskOperation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskOperation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'maskOperation' put: dataElement.
			self dataElementsValues removeKey: 'maskOperation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskOperation' put: aCSValue
		]
	].

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskOperationExplanation [

	^self dataElementsValues at: 'maskOperationExplanation' ifAbsent: [
		self dataElementsDictionary at: 'maskOperationExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskOperationExplanation' put: (self dataElementsDictionary removeKey: 'maskOperationExplanation') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskOperationExplanation: aSTValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskOperationExplanation' ifPresent: [:aDataElement | aDataElement value: aSTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskOperationExplanation.
			dataElement encoder: self encoder.
			dataElement value: aSTValue.
			self dataElementsDictionary at: 'maskOperationExplanation' put: dataElement.
			self dataElementsValues removeKey: 'maskOperationExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskOperationExplanation' put: aSTValue
		]
	].

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskSubPixelShift [

	^self dataElementsValues at: 'maskSubPixelShift' ifAbsent: [
		self dataElementsDictionary at: 'maskSubPixelShift' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskSubPixelShift' put: (self dataElementsDictionary removeKey: 'maskSubPixelShift') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> maskSubPixelShift: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskSubPixelShift' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskSubPixelShift.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'maskSubPixelShift' put: dataElement.
			self dataElementsValues removeKey: 'maskSubPixelShift' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskSubPixelShift' put: aFLValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MaskSubtractionSequenceItem >> maskSubpixelShift [

	^self dataElementsValues at: 'maskSubPixelShift' ifAbsent: [
		self dataElementsDictionary at: 'maskSubPixelShift' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskSubPixelShift' put: (self dataElementsDictionary removeKey: 'maskSubPixelShift') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MaskSubtractionSequenceItem >> maskSubpixelShift: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskSubPixelShift' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskSubPixelShift.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'maskSubPixelShift' put: dataElement.
			self dataElementsValues removeKey: 'maskSubPixelShift' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskSubPixelShift' put: aFLValue
		]
	].

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> tIDOffset [

	^self dataElementsValues at: 'tIDOffset' ifAbsent: [
		self dataElementsDictionary at: 'tIDOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'tIDOffset' put: (self dataElementsDictionary removeKey: 'tIDOffset') value.
		]
	]

]

{ #category : #accessing }
MaskSubtractionSequenceItem >> tIDOffset: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tIDOffset' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tIDOffset.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'tIDOffset' put: dataElement.
			self dataElementsValues removeKey: 'tIDOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tIDOffset' put: aSSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MaskSubtractionSequenceItem >> tidOffset [

	^self dataElementsValues at: 'tIDOffset' ifAbsent: [
		self dataElementsDictionary at: 'tIDOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'tIDOffset' put: (self dataElementsDictionary removeKey: 'tIDOffset') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MaskSubtractionSequenceItem >> tidOffset: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tIDOffset' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tIDOffset.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'tIDOffset' put: dataElement.
			self dataElementsValues removeKey: 'tIDOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tIDOffset' put: aSSValue
		]
	].

]
