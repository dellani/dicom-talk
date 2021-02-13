Class {
	#name : #EnergyWindowInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
EnergyWindowInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Energy Window Information Sequence Item'.
	SequenceName := 'energyWindowInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #energyWindowRangeSequence
				tag: #(16r54 16r13)
				vm: '1'
				type: '3'
				sequenceItemClass: EnergyWindowRangeSequenceItem).
	self
		addDataElement:
			(SHDataElement
				newWith: #energyWindowName
				tag: #(16r54 16r18)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
EnergyWindowInformationSequenceItem >> energyWindowName [

	^self dataElementsValues at: 'energyWindowName' ifAbsent: [
		self dataElementsDictionary at: 'energyWindowName' ifPresent: [:dataElement |
			self dataElementsValues at: 'energyWindowName' put: (self dataElementsDictionary removeKey: 'energyWindowName') value.
		]
	]

]

{ #category : #accessing }
EnergyWindowInformationSequenceItem >> energyWindowName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'energyWindowName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #energyWindowName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'energyWindowName' put: dataElement.
			self dataElementsValues removeKey: 'energyWindowName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'energyWindowName' put: aSHValue
		]
	].

]

{ #category : #accessing }
EnergyWindowInformationSequenceItem >> energyWindowRangeSequence [

	^self dataElementsValues at: 'energyWindowRangeSequence' ifAbsent: [
		self dataElementsDictionary at: 'energyWindowRangeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'energyWindowRangeSequence' put: (self dataElementsDictionary removeKey: 'energyWindowRangeSequence') value.
		]
	]

]

{ #category : #accessing }
EnergyWindowInformationSequenceItem >> energyWindowRangeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'energyWindowRangeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #energyWindowRangeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'energyWindowRangeSequence' put: dataElement.
			self dataElementsValues removeKey: 'energyWindowRangeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'energyWindowRangeSequence' put: aSQValue
		]
	].

]
