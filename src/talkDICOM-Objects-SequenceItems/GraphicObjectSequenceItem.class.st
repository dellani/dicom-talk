Class {
	#name : #GraphicObjectSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
GraphicObjectSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Graphic Object Sequence Item'.
	SequenceName := 'graphicObjectSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0070 16r0009).

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #graphicAnnotationUnits
				tag: #(16r70 16r5)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #graphicDimensions
				tag: #(16r70 16r20)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfGraphicPoints
				tag: #(16r70 16r21)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(FLDataElement
				newWith: #graphicData
				tag: #(16r70 16r22)
				vm: '2-n'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #graphicType
				tag: #(16r70 16r23)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #graphicFilled
				tag: #(16r70 16r24)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicAnnotationUnits [

	^self dataElementsValues at: 'graphicAnnotationUnits' ifAbsent: [
		self dataElementsDictionary at: 'graphicAnnotationUnits' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicAnnotationUnits' put: (self dataElementsDictionary removeKey: 'graphicAnnotationUnits') value.
		]
	]

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicAnnotationUnits: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicAnnotationUnits' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicAnnotationUnits.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'graphicAnnotationUnits' put: dataElement.
			self dataElementsValues removeKey: 'graphicAnnotationUnits' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicAnnotationUnits' put: aCSValue
		]
	].

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicData [

	^self dataElementsValues at: 'graphicData' ifAbsent: [
		self dataElementsDictionary at: 'graphicData' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicData' put: (self dataElementsDictionary removeKey: 'graphicData') value.
		]
	]

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicData: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicData' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicData.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'graphicData' put: dataElement.
			self dataElementsValues removeKey: 'graphicData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicData' put: aFLValue
		]
	].

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicDimensions [

	^self dataElementsValues at: 'graphicDimensions' ifAbsent: [
		self dataElementsDictionary at: 'graphicDimensions' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicDimensions' put: (self dataElementsDictionary removeKey: 'graphicDimensions') value.
		]
	]

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicDimensions: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicDimensions' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicDimensions.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'graphicDimensions' put: dataElement.
			self dataElementsValues removeKey: 'graphicDimensions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicDimensions' put: aUSValue
		]
	].

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicFilled [

	^self dataElementsValues at: 'graphicFilled' ifAbsent: [
		self dataElementsDictionary at: 'graphicFilled' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicFilled' put: (self dataElementsDictionary removeKey: 'graphicFilled') value.
		]
	]

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicFilled: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicFilled' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicFilled.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'graphicFilled' put: dataElement.
			self dataElementsValues removeKey: 'graphicFilled' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicFilled' put: aCSValue
		]
	].

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicType [

	^self dataElementsValues at: 'graphicType' ifAbsent: [
		self dataElementsDictionary at: 'graphicType' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicType' put: (self dataElementsDictionary removeKey: 'graphicType') value.
		]
	]

]

{ #category : #accessing }
GraphicObjectSequenceItem >> graphicType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'graphicType' put: dataElement.
			self dataElementsValues removeKey: 'graphicType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicType' put: aCSValue
		]
	].

]

{ #category : #accessing }
GraphicObjectSequenceItem >> numberOfGraphicPoints [

	^self dataElementsValues at: 'numberOfGraphicPoints' ifAbsent: [
		self dataElementsDictionary at: 'numberOfGraphicPoints' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfGraphicPoints' put: (self dataElementsDictionary removeKey: 'numberOfGraphicPoints') value.
		]
	]

]

{ #category : #accessing }
GraphicObjectSequenceItem >> numberOfGraphicPoints: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfGraphicPoints' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfGraphicPoints.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfGraphicPoints' put: dataElement.
			self dataElementsValues removeKey: 'numberOfGraphicPoints' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfGraphicPoints' put: aUSValue
		]
	].

]
