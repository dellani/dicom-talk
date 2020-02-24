Class {
	#name : #RequestAttributesSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
RequestAttributesSequenceItem class >> initialize [

	self resetDataElements.
	Name := 'DICOM Request Attributes Sequence Item'.
	SequenceName := 'requestAttributesSequenceItem'.
	self addDataElement: (SHDataElement
				newWith: #requestProcedureID
				tag: #(16r0040 16r1001)
				vm: '1'
				type: '1C').
	self addDataElement: (SHDataElement
				newWith: #scheduledProcedureStepID
				tag: #(16r0040 16r0009)
				vm: '1'
				type: '1C').
	self addDataElement: (LODataElement
				newWith: #scheduledProcedureStepDescription
				tag: #(16r0040 16r0007)
				vm: '1'
				type: '3').
	self addDataElement: (SQDataElement
				newWith: #scheduledActionItemCodeSequence
				tag: #(16r0040 16r0008)
				vm: '1'
				type: '3'
				sequenceItemClass: ScheduledActionItemCodeSequenceItem)
]

{ #category : #'accessing - talkDICOM names' }
RequestAttributesSequenceItem >> requestProcedureID [

	^self dataElementsValues at: 'requestedProcedureID' ifAbsent: [
		self dataElementsDictionary at: 'requestedProcedureID' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestedProcedureID' put: (self dataElementsDictionary removeKey: 'requestedProcedureID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
RequestAttributesSequenceItem >> requestProcedureID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'requestedProcedureID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #requestedProcedureID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'requestedProcedureID' put: dataElement.
			self dataElementsValues removeKey: 'requestedProcedureID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'requestedProcedureID' put: aSHValue
		]
	].

]

{ #category : #accessing }
RequestAttributesSequenceItem >> requestedProcedureID [

	^self dataElementsValues at: 'requestedProcedureID' ifAbsent: [
		self dataElementsDictionary at: 'requestedProcedureID' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestedProcedureID' put: (self dataElementsDictionary removeKey: 'requestedProcedureID') value.
		]
	]

]

{ #category : #accessing }
RequestAttributesSequenceItem >> requestedProcedureID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'requestedProcedureID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #requestedProcedureID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'requestedProcedureID' put: dataElement.
			self dataElementsValues removeKey: 'requestedProcedureID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'requestedProcedureID' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
RequestAttributesSequenceItem >> scheduledActionItemCodeSequence [

	^self dataElementsValues at: 'scheduledProtocolCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'scheduledProtocolCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'scheduledProtocolCodeSequence' put: (self dataElementsDictionary removeKey: 'scheduledProtocolCodeSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
RequestAttributesSequenceItem >> scheduledActionItemCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'scheduledProtocolCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scheduledProtocolCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'scheduledProtocolCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'scheduledProtocolCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scheduledProtocolCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
RequestAttributesSequenceItem >> scheduledProcedureStepDescription [

	^self dataElementsValues at: 'scheduledProcedureStepDescription' ifAbsent: [
		self dataElementsDictionary at: 'scheduledProcedureStepDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'scheduledProcedureStepDescription' put: (self dataElementsDictionary removeKey: 'scheduledProcedureStepDescription') value.
		]
	]

]

{ #category : #accessing }
RequestAttributesSequenceItem >> scheduledProcedureStepDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'scheduledProcedureStepDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scheduledProcedureStepDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'scheduledProcedureStepDescription' put: dataElement.
			self dataElementsValues removeKey: 'scheduledProcedureStepDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scheduledProcedureStepDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
RequestAttributesSequenceItem >> scheduledProcedureStepID [

	^self dataElementsValues at: 'scheduledProcedureStepID' ifAbsent: [
		self dataElementsDictionary at: 'scheduledProcedureStepID' ifPresent: [:dataElement |
			self dataElementsValues at: 'scheduledProcedureStepID' put: (self dataElementsDictionary removeKey: 'scheduledProcedureStepID') value.
		]
	]

]

{ #category : #accessing }
RequestAttributesSequenceItem >> scheduledProcedureStepID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'scheduledProcedureStepID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scheduledProcedureStepID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'scheduledProcedureStepID' put: dataElement.
			self dataElementsValues removeKey: 'scheduledProcedureStepID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scheduledProcedureStepID' put: aSHValue
		]
	].

]

{ #category : #accessing }
RequestAttributesSequenceItem >> scheduledProtocolCodeSequence [

	^self dataElementsValues at: 'scheduledProtocolCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'scheduledProtocolCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'scheduledProtocolCodeSequence' put: (self dataElementsDictionary removeKey: 'scheduledProtocolCodeSequence') value.
		]
	]

]

{ #category : #accessing }
RequestAttributesSequenceItem >> scheduledProtocolCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'scheduledProtocolCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scheduledProtocolCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'scheduledProtocolCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'scheduledProtocolCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scheduledProtocolCodeSequence' put: aSQValue
		]
	].

]
