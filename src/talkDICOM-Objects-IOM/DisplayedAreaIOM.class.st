Class {
	#name : #DisplayedAreaIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
DisplayedAreaIOM class >> initialize [
	self resetDataElements.
	Name := 'Displayed Area IOM'.
	moduleName := 'displayedAreaIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #displayedAreaSelectionSequence
				tag: #(16r70 16r5A)
				vm: '1'
				type: '1'
				sequenceItemClass: DisplayedAreaSelectionSequenceItem)
]

{ #category : #accessing }
DisplayedAreaIOM >> displayedAreaSelectionSequence [

	^self dataElementsValues at: 'displayedAreaSelectionSequence' ifAbsent: [
		self dataElementsDictionary at: 'displayedAreaSelectionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'displayedAreaSelectionSequence' put: (self dataElementsDictionary removeKey: 'displayedAreaSelectionSequence') value.
		]
	]

]

{ #category : #accessing }
DisplayedAreaIOM >> displayedAreaSelectionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'displayedAreaSelectionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #displayedAreaSelectionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'displayedAreaSelectionSequence' put: dataElement.
			self dataElementsValues removeKey: 'displayedAreaSelectionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'displayedAreaSelectionSequence' put: aSQValue
		]
	].

]
