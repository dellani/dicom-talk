Class {
	#name : #DataInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
DataInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Data Information Sequence Item'.
	SequenceName := 'dataInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(ISDataElement
				newWith: #nominalInterval
				tag: #(16r18 16r1062)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #frameTime
				tag: #(16r18 16r1063)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #lowRRValue
				tag: #(16r18 16r1081)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #highRRValue
				tag: #(16r18 16r1082)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #intervalsAcquired
				tag: #(16r18 16r1083)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #intervalsRejected
				tag: #(16r18 16r1084)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #timeSlotInformationSequence
				tag: #(16r54 16r72)
				vm: '1'
				type: '2C'
				sequenceItemClass: TimeSlotInformationSequenceItem)
]

{ #category : #accessing }
DataInformationSequenceItem >> frameTime [

	^self dataElementsValues at: 'frameTime' ifAbsent: [
		self dataElementsDictionary at: 'frameTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'frameTime' put: (self dataElementsDictionary removeKey: 'frameTime') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> frameTime: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'frameTime' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #frameTime.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'frameTime' put: dataElement.
			self dataElementsValues removeKey: 'frameTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'frameTime' put: aDSValue
		]
	].

]

{ #category : #accessing }
DataInformationSequenceItem >> highRRValue [

	^self dataElementsValues at: 'highRRValue' ifAbsent: [
		self dataElementsDictionary at: 'highRRValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'highRRValue' put: (self dataElementsDictionary removeKey: 'highRRValue') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> highRRValue: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'highRRValue' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #highRRValue.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'highRRValue' put: dataElement.
			self dataElementsValues removeKey: 'highRRValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'highRRValue' put: aISValue
		]
	].

]

{ #category : #accessing }
DataInformationSequenceItem >> intervalsAcquired [

	^self dataElementsValues at: 'intervalsAcquired' ifAbsent: [
		self dataElementsDictionary at: 'intervalsAcquired' ifPresent: [:dataElement |
			self dataElementsValues at: 'intervalsAcquired' put: (self dataElementsDictionary removeKey: 'intervalsAcquired') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> intervalsAcquired: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'intervalsAcquired' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #intervalsAcquired.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'intervalsAcquired' put: dataElement.
			self dataElementsValues removeKey: 'intervalsAcquired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'intervalsAcquired' put: aISValue
		]
	].

]

{ #category : #accessing }
DataInformationSequenceItem >> intervalsRejected [

	^self dataElementsValues at: 'intervalsRejected' ifAbsent: [
		self dataElementsDictionary at: 'intervalsRejected' ifPresent: [:dataElement |
			self dataElementsValues at: 'intervalsRejected' put: (self dataElementsDictionary removeKey: 'intervalsRejected') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> intervalsRejected: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'intervalsRejected' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #intervalsRejected.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'intervalsRejected' put: dataElement.
			self dataElementsValues removeKey: 'intervalsRejected' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'intervalsRejected' put: aISValue
		]
	].

]

{ #category : #accessing }
DataInformationSequenceItem >> lowRRValue [

	^self dataElementsValues at: 'lowRRValue' ifAbsent: [
		self dataElementsDictionary at: 'lowRRValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'lowRRValue' put: (self dataElementsDictionary removeKey: 'lowRRValue') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> lowRRValue: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'lowRRValue' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lowRRValue.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'lowRRValue' put: dataElement.
			self dataElementsValues removeKey: 'lowRRValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lowRRValue' put: aISValue
		]
	].

]

{ #category : #accessing }
DataInformationSequenceItem >> nominalInterval [

	^self dataElementsValues at: 'nominalInterval' ifAbsent: [
		self dataElementsDictionary at: 'nominalInterval' ifPresent: [:dataElement |
			self dataElementsValues at: 'nominalInterval' put: (self dataElementsDictionary removeKey: 'nominalInterval') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> nominalInterval: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'nominalInterval' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #nominalInterval.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'nominalInterval' put: dataElement.
			self dataElementsValues removeKey: 'nominalInterval' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'nominalInterval' put: aISValue
		]
	].

]

{ #category : #accessing }
DataInformationSequenceItem >> timeSlotInformationSequence [

	^self dataElementsValues at: 'timeSlotInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'timeSlotInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeSlotInformationSequence' put: (self dataElementsDictionary removeKey: 'timeSlotInformationSequence') value.
		]
	]

]

{ #category : #accessing }
DataInformationSequenceItem >> timeSlotInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeSlotInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeSlotInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'timeSlotInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'timeSlotInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeSlotInformationSequence' put: aSQValue
		]
	].

]
