Class {
	#name : #ModalityLUTSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ModalityLUTSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Modality LUT Sequence Item'.
	SequenceName := 'modalityLUTSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0028 16r3000).

	self
		addDataElement:
			(SSDataElement
				newWith: #lutDescriptor
				tag: #(16r0028 16r3002)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #lutExplanation
				tag: #(16r0028 16r3003)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #modalityLUTType
				tag: #(16r0028 16r3004)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #lutData
				tag: #(16r0028 16r3006)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
ModalityLUTSequenceItem >> lUTData [

	^self dataElementsValues at: 'lUTData' ifAbsent: [
		self dataElementsDictionary at: 'lUTData' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTData' put: (self dataElementsDictionary removeKey: 'lUTData') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTSequenceItem >> lUTData: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTData' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTData.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'lUTData' put: dataElement.
			self dataElementsValues removeKey: 'lUTData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTData' put: aLTValue
		]
	].

]

{ #category : #accessing }
ModalityLUTSequenceItem >> lUTDescriptor [

	^self dataElementsValues at: 'lUTDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTDescriptor' put: (self dataElementsDictionary removeKey: 'lUTDescriptor') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTSequenceItem >> lUTDescriptor: aUNValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:aDataElement | aDataElement value: aUNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUNValue.
			self dataElementsDictionary at: 'lUTDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'lUTDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTDescriptor' put: aUNValue
		]
	].

]

{ #category : #accessing }
ModalityLUTSequenceItem >> lUTExplanation [

	^self dataElementsValues at: 'lUTExplanation' ifAbsent: [
		self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTExplanation' put: (self dataElementsDictionary removeKey: 'lUTExplanation') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTSequenceItem >> lUTExplanation: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTExplanation.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'lUTExplanation' put: dataElement.
			self dataElementsValues removeKey: 'lUTExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTExplanation' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ModalityLUTSequenceItem >> lutData [

	^self dataElementsValues at: 'lUTData' ifAbsent: [
		self dataElementsDictionary at: 'lUTData' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTData' put: (self dataElementsDictionary removeKey: 'lUTData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ModalityLUTSequenceItem >> lutData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'lUTData' put: dataElement.
			self dataElementsValues removeKey: 'lUTData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTData' put: aOWValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ModalityLUTSequenceItem >> lutDescriptor [

	^self dataElementsValues at: 'lUTDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTDescriptor' put: (self dataElementsDictionary removeKey: 'lUTDescriptor') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ModalityLUTSequenceItem >> lutDescriptor: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'lUTDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'lUTDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTDescriptor' put: aSSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ModalityLUTSequenceItem >> lutExplanation [

	^self dataElementsValues at: 'lUTExplanation' ifAbsent: [
		self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTExplanation' put: (self dataElementsDictionary removeKey: 'lUTExplanation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ModalityLUTSequenceItem >> lutExplanation: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTExplanation.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'lUTExplanation' put: dataElement.
			self dataElementsValues removeKey: 'lUTExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTExplanation' put: aLOValue
		]
	].

]

{ #category : #accessing }
ModalityLUTSequenceItem >> modalityLUTType [

	^self dataElementsValues at: 'modalityLUTType' ifAbsent: [
		self dataElementsDictionary at: 'modalityLUTType' ifPresent: [:dataElement |
			self dataElementsValues at: 'modalityLUTType' put: (self dataElementsDictionary removeKey: 'modalityLUTType') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTSequenceItem >> modalityLUTType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'modalityLUTType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #modalityLUTType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'modalityLUTType' put: dataElement.
			self dataElementsValues removeKey: 'modalityLUTType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'modalityLUTType' put: aLOValue
		]
	].

]
