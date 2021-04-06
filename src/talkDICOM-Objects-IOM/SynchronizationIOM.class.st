Class {
	#name : #SynchronizationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SynchronizationIOM class >> initialize [
	"//alterar o comentario ver com Dellani
	Initialize the dictionary of DICOM Data Elements for the DICOM Synchronization Information Object Module
	PS 3.3-2000 Annex C.7.4.2 (Page 159) - GA 09-10.2001"

	self resetDataElements.
	Name := 'DICOM Synchronization Image Information Object Module'.
	moduleName := 'synchronizationIOM'.
	self
		addDataElement:
			(UIDataElement
				newWith: #synchronizationFrameofReferenceUID
				tag: #(16r0020 16r0200)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #synchronizationTrigger
				tag: #(16r0018 16r106A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(LODataElement
				newWith: #triggerSourceorType
				tag: #(16r0018 16r1061)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #synchronizationChannel
				tag: #(16r0018 16r106C)
				vm: '2'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #aquisitionTimeSynchronized
				tag: #(16r0018 16r1800)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SHDataElement
				newWith: #timeSource
				tag: #(16r0018 16r1801)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #timeDistributionProtocol
				tag: #(16r0018 16r1802)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
SynchronizationIOM >> acquisitionTimeSynchronized [

	^self dataElementsValues at: 'acquisitionTimeSynchronized' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionTimeSynchronized' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionTimeSynchronized' put: (self dataElementsDictionary removeKey: 'acquisitionTimeSynchronized') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> acquisitionTimeSynchronized: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionTimeSynchronized' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionTimeSynchronized.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'acquisitionTimeSynchronized' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionTimeSynchronized' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionTimeSynchronized' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SynchronizationIOM >> aquisitionTimeSynchronized [

	^self dataElementsValues at: 'acquisitionTimeSynchronized' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionTimeSynchronized' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionTimeSynchronized' put: (self dataElementsDictionary removeKey: 'acquisitionTimeSynchronized') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SynchronizationIOM >> aquisitionTimeSynchronized: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionTimeSynchronized' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionTimeSynchronized.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'acquisitionTimeSynchronized' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionTimeSynchronized' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionTimeSynchronized' put: aCSValue
		]
	].

]

{ #category : #accessing }
SynchronizationIOM >> synchronizationChannel [

	^self dataElementsValues at: 'synchronizationChannel' ifAbsent: [
		self dataElementsDictionary at: 'synchronizationChannel' ifPresent: [:dataElement |
			self dataElementsValues at: 'synchronizationChannel' put: (self dataElementsDictionary removeKey: 'synchronizationChannel') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> synchronizationChannel: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'synchronizationChannel' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #synchronizationChannel.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'synchronizationChannel' put: dataElement.
			self dataElementsValues removeKey: 'synchronizationChannel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'synchronizationChannel' put: aUSValue
		]
	].

]

{ #category : #accessing }
SynchronizationIOM >> synchronizationFrameOfReferenceUID [

	^self dataElementsValues at: 'synchronizationFrameOfReferenceUID' ifAbsent: [
		self dataElementsDictionary at: 'synchronizationFrameOfReferenceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'synchronizationFrameOfReferenceUID' put: (self dataElementsDictionary removeKey: 'synchronizationFrameOfReferenceUID') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> synchronizationFrameOfReferenceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'synchronizationFrameOfReferenceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #synchronizationFrameOfReferenceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'synchronizationFrameOfReferenceUID' put: dataElement.
			self dataElementsValues removeKey: 'synchronizationFrameOfReferenceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'synchronizationFrameOfReferenceUID' put: aUIValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SynchronizationIOM >> synchronizationFrameofReferenceUID [

	^self dataElementsValues at: 'synchronizationFrameOfReferenceUID' ifAbsent: [
		self dataElementsDictionary at: 'synchronizationFrameOfReferenceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'synchronizationFrameOfReferenceUID' put: (self dataElementsDictionary removeKey: 'synchronizationFrameOfReferenceUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SynchronizationIOM >> synchronizationFrameofReferenceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'synchronizationFrameOfReferenceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #synchronizationFrameOfReferenceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'synchronizationFrameOfReferenceUID' put: dataElement.
			self dataElementsValues removeKey: 'synchronizationFrameOfReferenceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'synchronizationFrameOfReferenceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
SynchronizationIOM >> synchronizationTrigger [

	^self dataElementsValues at: 'synchronizationTrigger' ifAbsent: [
		self dataElementsDictionary at: 'synchronizationTrigger' ifPresent: [:dataElement |
			self dataElementsValues at: 'synchronizationTrigger' put: (self dataElementsDictionary removeKey: 'synchronizationTrigger') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> synchronizationTrigger: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'synchronizationTrigger' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #synchronizationTrigger.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'synchronizationTrigger' put: dataElement.
			self dataElementsValues removeKey: 'synchronizationTrigger' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'synchronizationTrigger' put: aCSValue
		]
	].

]

{ #category : #accessing }
SynchronizationIOM >> timeDistributionProtocol [

	^self dataElementsValues at: 'timeDistributionProtocol' ifAbsent: [
		self dataElementsDictionary at: 'timeDistributionProtocol' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeDistributionProtocol' put: (self dataElementsDictionary removeKey: 'timeDistributionProtocol') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> timeDistributionProtocol: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeDistributionProtocol' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeDistributionProtocol.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'timeDistributionProtocol' put: dataElement.
			self dataElementsValues removeKey: 'timeDistributionProtocol' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeDistributionProtocol' put: aCSValue
		]
	].

]

{ #category : #accessing }
SynchronizationIOM >> timeSource [

	^self dataElementsValues at: 'timeSource' ifAbsent: [
		self dataElementsDictionary at: 'timeSource' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeSource' put: (self dataElementsDictionary removeKey: 'timeSource') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> timeSource: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeSource' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeSource.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'timeSource' put: dataElement.
			self dataElementsValues removeKey: 'timeSource' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeSource' put: aSHValue
		]
	].

]

{ #category : #accessing }
SynchronizationIOM >> triggerSourceOrType [

	^self dataElementsValues at: 'triggerSourceOrType' ifAbsent: [
		self dataElementsDictionary at: 'triggerSourceOrType' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerSourceOrType' put: (self dataElementsDictionary removeKey: 'triggerSourceOrType') value.
		]
	]

]

{ #category : #accessing }
SynchronizationIOM >> triggerSourceOrType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerSourceOrType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerSourceOrType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'triggerSourceOrType' put: dataElement.
			self dataElementsValues removeKey: 'triggerSourceOrType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerSourceOrType' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SynchronizationIOM >> triggerSourceorType [

	^self dataElementsValues at: 'triggerSourceOrType' ifAbsent: [
		self dataElementsDictionary at: 'triggerSourceOrType' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerSourceOrType' put: (self dataElementsDictionary removeKey: 'triggerSourceOrType') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SynchronizationIOM >> triggerSourceorType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerSourceOrType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerSourceOrType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'triggerSourceOrType' put: dataElement.
			self dataElementsValues removeKey: 'triggerSourceOrType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerSourceOrType' put: aLOValue
		]
	].

]
