Class {
	#name : #GraphicLayerSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
GraphicLayerSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Graphic Layer Sequence Item'.
	SequenceName := 'graphicLayerSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #graphicLayer
				tag: #(16r70 16r2)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ISDataElement
				newWith: #graphicLayerOrder
				tag: #(16r70 16r62)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #graphicLayerRecommendedDisplayGrayscaleValue
				tag: #(16r70 16r66)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #graphicLayerRecommendedDisplayRGBValue
				tag: #(16r70 16r67)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #graphicLayerDescription
				tag: #(16r70 16r68)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayer [

	^self dataElementsValues at: 'graphicLayer' ifAbsent: [
		self dataElementsDictionary at: 'graphicLayer' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicLayer' put: (self dataElementsDictionary removeKey: 'graphicLayer') value.
		]
	]

]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayer: aCSValue [

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
GraphicLayerSequenceItem >> graphicLayerDescription [

	^self dataElementsValues at: 'graphicLayerDescription' ifAbsent: [
		self dataElementsDictionary at: 'graphicLayerDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicLayerDescription' put: (self dataElementsDictionary removeKey: 'graphicLayerDescription') value.
		]
	]

]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayerDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicLayerDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicLayerDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'graphicLayerDescription' put: dataElement.
			self dataElementsValues removeKey: 'graphicLayerDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicLayerDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayerOrder [

	^self dataElementsValues at: 'graphicLayerOrder' ifAbsent: [
		self dataElementsDictionary at: 'graphicLayerOrder' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicLayerOrder' put: (self dataElementsDictionary removeKey: 'graphicLayerOrder') value.
		]
	]

]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayerOrder: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicLayerOrder' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicLayerOrder.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'graphicLayerOrder' put: dataElement.
			self dataElementsValues removeKey: 'graphicLayerOrder' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicLayerOrder' put: aISValue
		]
	].

]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayerRecommendedDisplayGrayscaleValue [

	^self dataElementsValues at: 'graphicLayerRecommendedDisplayGrayscaleValue' ifAbsent: [
		self dataElementsDictionary at: 'graphicLayerRecommendedDisplayGrayscaleValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicLayerRecommendedDisplayGrayscaleValue' put: (self dataElementsDictionary removeKey: 'graphicLayerRecommendedDisplayGrayscaleValue') value.
		]
	]

]

{ #category : #accessing }
GraphicLayerSequenceItem >> graphicLayerRecommendedDisplayGrayscaleValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicLayerRecommendedDisplayGrayscaleValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicLayerRecommendedDisplayGrayscaleValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'graphicLayerRecommendedDisplayGrayscaleValue' put: dataElement.
			self dataElementsValues removeKey: 'graphicLayerRecommendedDisplayGrayscaleValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicLayerRecommendedDisplayGrayscaleValue' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
GraphicLayerSequenceItem >> graphicLayerRecommendedDisplayRGBValue [

	^self dataElementsValues at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' put: (self dataElementsDictionary removeKey: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GraphicLayerSequenceItem >> graphicLayerRecommendedDisplayRGBValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_GraphicLayerRecommendedDisplayRGBValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' put: aUSValue
		]
	].

]

{ #category : #accessing }
GraphicLayerSequenceItem >> rETIRED_GraphicLayerRecommendedDisplayRGBValue [

	^self dataElementsValues at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' put: (self dataElementsDictionary removeKey: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue') value.
		]
	]

]

{ #category : #accessing }
GraphicLayerSequenceItem >> rETIRED_GraphicLayerRecommendedDisplayRGBValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_GraphicLayerRecommendedDisplayRGBValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_GraphicLayerRecommendedDisplayRGBValue' put: aUSValue
		]
	].

]
