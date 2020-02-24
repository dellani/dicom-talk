Class {
	#name : #PresentationLUTSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
PresentationLUTSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Presentation LUT Sequence Item'.
	SequenceName := 'presentationLUTSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SSDataElement
				newWith: #lutDescriptor
				tag: #(16r28 16r3002)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #lutExplanation
				tag: #(16r28 16r3003)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #lutData
				tag: #(16r28 16r3006)
				vm: '1-n'
				type: '1C')
]

{ #category : #accessing }
PresentationLUTSequenceItem >> lUTData [

	^self dataElementsValues at: 'lUTData' ifAbsent: [
		self dataElementsDictionary at: 'lUTData' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTData' put: (self dataElementsDictionary removeKey: 'lUTData') value.
		]
	]

]

{ #category : #accessing }
PresentationLUTSequenceItem >> lUTData: aLTValue [

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
PresentationLUTSequenceItem >> lUTDescriptor [

	^self dataElementsValues at: 'lUTDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTDescriptor' put: (self dataElementsDictionary removeKey: 'lUTDescriptor') value.
		]
	]

]

{ #category : #accessing }
PresentationLUTSequenceItem >> lUTDescriptor: aUNValue [

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
PresentationLUTSequenceItem >> lUTExplanation [

	^self dataElementsValues at: 'lUTExplanation' ifAbsent: [
		self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTExplanation' put: (self dataElementsDictionary removeKey: 'lUTExplanation') value.
		]
	]

]

{ #category : #accessing }
PresentationLUTSequenceItem >> lUTExplanation: aLOValue [

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
PresentationLUTSequenceItem >> lutData [

	^self dataElementsValues at: 'lUTData' ifAbsent: [
		self dataElementsDictionary at: 'lUTData' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTData' put: (self dataElementsDictionary removeKey: 'lUTData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PresentationLUTSequenceItem >> lutData: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTData' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTData.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'lUTData' put: dataElement.
			self dataElementsValues removeKey: 'lUTData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTData' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PresentationLUTSequenceItem >> lutDescriptor [

	^self dataElementsValues at: 'lUTDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTDescriptor' put: (self dataElementsDictionary removeKey: 'lUTDescriptor') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PresentationLUTSequenceItem >> lutDescriptor: aSSValue [

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
PresentationLUTSequenceItem >> lutExplanation [

	^self dataElementsValues at: 'lUTExplanation' ifAbsent: [
		self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTExplanation' put: (self dataElementsDictionary removeKey: 'lUTExplanation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PresentationLUTSequenceItem >> lutExplanation: aLOValue [

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
