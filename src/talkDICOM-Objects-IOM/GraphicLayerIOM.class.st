Class {
	#name : #GraphicLayerIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
GraphicLayerIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Graphic Layer IOM'.
	moduleName := 'graphicLayerIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #graphicLayerSequence
				tag: #(16r70 16r60)
				vm: '1'
				type: '1'
				sequenceItemClass: GraphicLayerSequenceItem)
]

{ #category : #accessing }
GraphicLayerIOM >> graphicLayerSequence [

	^self dataElementsValues at: 'graphicLayerSequence' ifAbsent: [
		self dataElementsDictionary at: 'graphicLayerSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicLayerSequence' put: (self dataElementsDictionary removeKey: 'graphicLayerSequence') value.
		]
	]

]

{ #category : #accessing }
GraphicLayerIOM >> graphicLayerSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicLayerSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicLayerSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'graphicLayerSequence' put: dataElement.
			self dataElementsValues removeKey: 'graphicLayerSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicLayerSequence' put: aSQValue
		]
	].

]
