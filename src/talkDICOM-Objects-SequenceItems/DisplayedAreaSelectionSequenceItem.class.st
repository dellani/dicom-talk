Class {
	#name : #DisplayedAreaSelectionSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
DisplayedAreaSelectionSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Displayed Area Selection Sequence Module'.
	SequenceName := 'displayedAreaSelectionSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r8 16r1140)
				vm: '1'
				type: '1'
				sequenceItemClass: ReferencedImageSequenceItem).
	self
		addDataElement:
			(SLDataElement
				newWith: #displayedAreaTopLeftHandCorner
				tag: #(16r70 16r52)
				vm: '2'
				type: '1').
	self
		addDataElement:
			(SLDataElement
				newWith: #dsplayedAreaBottomRightHandCorner
				tag: #(16r70 16r53)
				vm: '2'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #presentationSizeMode
				tag: #(16r70 16r100)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #presentationPixelSpacing
				tag: #(16r70 16r101)
				vm: '2'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #presentationPixelAspectRatio
				tag: #(16r70 16r102)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(FLDataElement
				newWith: #presentationPixelMagnificationRatio
				tag: #(16r70 16r103)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> displayedAreaBottomRightHandCorner [

	^self dataElementsValues at: 'displayedAreaBottomRightHandCorner' ifAbsent: [
		self dataElementsDictionary at: 'displayedAreaBottomRightHandCorner' ifPresent: [:dataElement |
			self dataElementsValues at: 'displayedAreaBottomRightHandCorner' put: (self dataElementsDictionary removeKey: 'displayedAreaBottomRightHandCorner') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> displayedAreaBottomRightHandCorner: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'displayedAreaBottomRightHandCorner' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #displayedAreaBottomRightHandCorner.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'displayedAreaBottomRightHandCorner' put: dataElement.
			self dataElementsValues removeKey: 'displayedAreaBottomRightHandCorner' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'displayedAreaBottomRightHandCorner' put: aSLValue
		]
	].

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> displayedAreaTopLeftHandCorner [

	^self dataElementsValues at: 'displayedAreaTopLeftHandCorner' ifAbsent: [
		self dataElementsDictionary at: 'displayedAreaTopLeftHandCorner' ifPresent: [:dataElement |
			self dataElementsValues at: 'displayedAreaTopLeftHandCorner' put: (self dataElementsDictionary removeKey: 'displayedAreaTopLeftHandCorner') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> displayedAreaTopLeftHandCorner: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'displayedAreaTopLeftHandCorner' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #displayedAreaTopLeftHandCorner.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'displayedAreaTopLeftHandCorner' put: dataElement.
			self dataElementsValues removeKey: 'displayedAreaTopLeftHandCorner' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'displayedAreaTopLeftHandCorner' put: aSLValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
DisplayedAreaSelectionSequenceItem >> dsplayedAreaBottomRightHandCorner [

	^self dataElementsValues at: 'displayedAreaBottomRightHandCorner' ifAbsent: [
		self dataElementsDictionary at: 'displayedAreaBottomRightHandCorner' ifPresent: [:dataElement |
			self dataElementsValues at: 'displayedAreaBottomRightHandCorner' put: (self dataElementsDictionary removeKey: 'displayedAreaBottomRightHandCorner') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DisplayedAreaSelectionSequenceItem >> dsplayedAreaBottomRightHandCorner: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'displayedAreaBottomRightHandCorner' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #displayedAreaBottomRightHandCorner.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'displayedAreaBottomRightHandCorner' put: dataElement.
			self dataElementsValues removeKey: 'displayedAreaBottomRightHandCorner' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'displayedAreaBottomRightHandCorner' put: aSLValue
		]
	].

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationPixelAspectRatio [

	^self dataElementsValues at: 'presentationPixelAspectRatio' ifAbsent: [
		self dataElementsDictionary at: 'presentationPixelAspectRatio' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationPixelAspectRatio' put: (self dataElementsDictionary removeKey: 'presentationPixelAspectRatio') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationPixelAspectRatio: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationPixelAspectRatio' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationPixelAspectRatio.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'presentationPixelAspectRatio' put: dataElement.
			self dataElementsValues removeKey: 'presentationPixelAspectRatio' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationPixelAspectRatio' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationPixelMagnificationRatio [

	^self dataElementsValues at: 'presentationPixelMagnificationRatio' ifAbsent: [
		self dataElementsDictionary at: 'presentationPixelMagnificationRatio' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationPixelMagnificationRatio' put: (self dataElementsDictionary removeKey: 'presentationPixelMagnificationRatio') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationPixelMagnificationRatio: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationPixelMagnificationRatio' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationPixelMagnificationRatio.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'presentationPixelMagnificationRatio' put: dataElement.
			self dataElementsValues removeKey: 'presentationPixelMagnificationRatio' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationPixelMagnificationRatio' put: aFLValue
		]
	].

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationPixelSpacing [

	^self dataElementsValues at: 'presentationPixelSpacing' ifAbsent: [
		self dataElementsDictionary at: 'presentationPixelSpacing' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationPixelSpacing' put: (self dataElementsDictionary removeKey: 'presentationPixelSpacing') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationPixelSpacing: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationPixelSpacing' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationPixelSpacing.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'presentationPixelSpacing' put: dataElement.
			self dataElementsValues removeKey: 'presentationPixelSpacing' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationPixelSpacing' put: aDSValue
		]
	].

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationSizeMode [

	^self dataElementsValues at: 'presentationSizeMode' ifAbsent: [
		self dataElementsDictionary at: 'presentationSizeMode' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationSizeMode' put: (self dataElementsDictionary removeKey: 'presentationSizeMode') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> presentationSizeMode: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationSizeMode' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationSizeMode.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'presentationSizeMode' put: dataElement.
			self dataElementsValues removeKey: 'presentationSizeMode' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationSizeMode' put: aCSValue
		]
	].

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaSelectionSequenceItem >> referencedImageSequence: aSQValue [

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
