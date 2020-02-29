Class {
	#name : #NMPhaseIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
NMPhaseIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Phase IOM'.
	moduleName := 'nmPhaseIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #phaseInformationSequence
				tag: #(16r54 16r32)
				vm: '1'
				type: '2C'
				sequenceItemClass: PhaseInformationSequenceItem)
]

{ #category : #accessing }
NMPhaseIOM >> phaseInformationSequence [

	^self dataElementsValues at: 'phaseInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'phaseInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'phaseInformationSequence' put: (self dataElementsDictionary removeKey: 'phaseInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMPhaseIOM >> phaseInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'phaseInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #phaseInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'phaseInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'phaseInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'phaseInformationSequence' put: aSQValue
		]
	].

]
