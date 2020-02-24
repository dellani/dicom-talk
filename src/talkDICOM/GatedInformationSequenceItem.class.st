Class {
	#name : #GatedInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
GatedInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Gated Information Sequence Item'.
	SequenceName := 'gatedInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(DSDataElement
				newWith: #triggerTime
				tag: #(16r18 16r1060)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #framingType
				tag: #(16r18 16r1064)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #dataInformationSequence
				tag: #(16r54 16r63)
				vm: '1'
				type: '2C'
				sequenceItemClass: DataInformationSequenceItem)
]

{ #category : #accessing }
GatedInformationSequenceItem >> cardiacFramingType [

	^self dataElementsValues at: 'cardiacFramingType' ifAbsent: [
		self dataElementsDictionary at: 'cardiacFramingType' ifPresent: [:dataElement |
			self dataElementsValues at: 'cardiacFramingType' put: (self dataElementsDictionary removeKey: 'cardiacFramingType') value.
		]
	]

]

{ #category : #accessing }
GatedInformationSequenceItem >> cardiacFramingType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'cardiacFramingType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cardiacFramingType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'cardiacFramingType' put: dataElement.
			self dataElementsValues removeKey: 'cardiacFramingType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cardiacFramingType' put: aLOValue
		]
	].

]

{ #category : #accessing }
GatedInformationSequenceItem >> dataInformationSequence [

	^self dataElementsValues at: 'dataInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'dataInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'dataInformationSequence' put: (self dataElementsDictionary removeKey: 'dataInformationSequence') value.
		]
	]

]

{ #category : #accessing }
GatedInformationSequenceItem >> dataInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'dataInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dataInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'dataInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'dataInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dataInformationSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
GatedInformationSequenceItem >> framingType [

	^self dataElementsValues at: 'cardiacFramingType' ifAbsent: [
		self dataElementsDictionary at: 'cardiacFramingType' ifPresent: [:dataElement |
			self dataElementsValues at: 'cardiacFramingType' put: (self dataElementsDictionary removeKey: 'cardiacFramingType') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GatedInformationSequenceItem >> framingType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'cardiacFramingType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cardiacFramingType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'cardiacFramingType' put: dataElement.
			self dataElementsValues removeKey: 'cardiacFramingType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cardiacFramingType' put: aLOValue
		]
	].

]

{ #category : #accessing }
GatedInformationSequenceItem >> triggerTime [

	^self dataElementsValues at: 'triggerTime' ifAbsent: [
		self dataElementsDictionary at: 'triggerTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerTime' put: (self dataElementsDictionary removeKey: 'triggerTime') value.
		]
	]

]

{ #category : #accessing }
GatedInformationSequenceItem >> triggerTime: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerTime' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerTime.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'triggerTime' put: dataElement.
			self dataElementsValues removeKey: 'triggerTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerTime' put: aDSValue
		]
	].

]
