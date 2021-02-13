Class {
	#name : #GraphicAnnotationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
GraphicAnnotationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'GraphicAnnotationSequenceItem'.
	SequenceName := 'graphicAnnotationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r8 16r1140)
				vm: '1'
				type: '1C'
				sequenceItemClass: ReferencedImageSequenceItem).
	self
		addDataElement:
			(CSDataElement
				newWith: #graphicLayer
				tag: #(16r70 16r2)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #textObjectSequence
				tag: #(16r70 16r8)
				vm: '1'
				type: '1C'
				sequenceItemClass: TextObjectSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #graphicObjectSequence
				tag: #(16r70 16r9)
				vm: '1'
				type: '1'
				sequenceItemClass: GraphicObjectSequenceItem)
]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> graphicLayer [

	^self dataElementsValues at: 'graphicLayer' ifAbsent: [
		self dataElementsDictionary at: 'graphicLayer' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicLayer' put: (self dataElementsDictionary removeKey: 'graphicLayer') value.
		]
	]

]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> graphicLayer: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicLayer' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicLayer.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'graphicLayer' put: dataElement.
			self dataElementsValues removeKey: 'graphicLayer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicLayer' put: aCSValue
		]
	].

]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> graphicObjectSequence [

	^self dataElementsValues at: 'graphicObjectSequence' ifAbsent: [
		self dataElementsDictionary at: 'graphicObjectSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicObjectSequence' put: (self dataElementsDictionary removeKey: 'graphicObjectSequence') value.
		]
	]

]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> graphicObjectSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicObjectSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicObjectSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'graphicObjectSequence' put: dataElement.
			self dataElementsValues removeKey: 'graphicObjectSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicObjectSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> referencedImageSequence: aSQValue [

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

{ #category : #accessing }
GraphicAnnotationSequenceItem >> textObjectSequence [

	^self dataElementsValues at: 'textObjectSequence' ifAbsent: [
		self dataElementsDictionary at: 'textObjectSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'textObjectSequence' put: (self dataElementsDictionary removeKey: 'textObjectSequence') value.
		]
	]

]

{ #category : #accessing }
GraphicAnnotationSequenceItem >> textObjectSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'textObjectSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #textObjectSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'textObjectSequence' put: dataElement.
			self dataElementsValues removeKey: 'textObjectSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'textObjectSequence' put: aSQValue
		]
	].

]
