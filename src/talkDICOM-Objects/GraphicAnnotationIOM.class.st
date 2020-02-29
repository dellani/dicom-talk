Class {
	#name : #GraphicAnnotationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
GraphicAnnotationIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Graphic Annotation IOM'.
	moduleName := 'graphicAnnotationIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #graphicAnnotationSequence
				tag: #(16r70 16r1)
				vm: '1'
				type: '1'
				sequenceItemClass: GraphicAnnotationSequenceItem)
]

{ #category : #accessing }
GraphicAnnotationIOM >> graphicAnnotationSequence [

	^self dataElementsValues at: 'graphicAnnotationSequence' ifAbsent: [
		self dataElementsDictionary at: 'graphicAnnotationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicAnnotationSequence' put: (self dataElementsDictionary removeKey: 'graphicAnnotationSequence') value.
		]
	]

]

{ #category : #accessing }
GraphicAnnotationIOM >> graphicAnnotationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicAnnotationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicAnnotationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'graphicAnnotationSequence' put: dataElement.
			self dataElementsValues removeKey: 'graphicAnnotationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicAnnotationSequence' put: aSQValue
		]
	].

]
