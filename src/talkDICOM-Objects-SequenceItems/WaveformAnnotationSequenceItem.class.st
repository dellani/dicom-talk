Class {
	#name : #WaveformAnnotationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
WaveformAnnotationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Waveform Annotation Sequence Item'.
	SequenceName := 'waveformAnnotationSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0040 16rB020).

	self
		addDataElement:
			(STDataElement
				newWith: #unformattedTextValue
				tag: #(16r0070 16r0006)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #conceptNameCodeSequence
				tag: #(16r0040 16rA043)
				vm: '1'
				type: '1C'
				sequenceItemClass: ConceptNameCodeSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #conceptCodeSequence
				tag: #(16r0040 16rA168)
				vm: '1'
				type: '1C'
				sequenceItemClass: ConceptCodeSequenceItem).
	self
		addDataElement:
			(DSDataElement
				newWith: #numericValue
				tag: #(16r0040 16rA30A)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #measurementUnitsCodeSequence
				tag: #(16r0040 16r08EA)
				vm: '1'
				type: '3'
				sequenceItemClass: MeasurementUnitsCodeSequenceItem).
	self
		addDataElement:
			(USDataElement
				newWith: #referencedWaveformChannels
				tag: #(16r0040 16rA0B0)
				vm: '2-2n'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #temporalRangeType
				tag: #(16r0040 16rA130)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #referencedSamplePositions
				tag: #(16r0040 16rA132)
				vm: '1-n'
				type: '1C').	"*1-n**"
	self
		addDataElement:
			(DSDataElement
				newWith: #referencedTimeOffsets
				tag: #(16r0040 16rA138)
				vm: '1-n'
				type: '1C').	"**1-n**"
	self
		addDataElement:
			(DTDataElement
				newWith: #referencedDateTime
				tag: #(16r0040 16rA13A)
				vm: '1-n'
				type: '1C').	"**1-n**"
	self
		addDataElement:
			(USDataElement
				newWith: #annotationGroupNumber
				tag: #(16r0040 16rA180)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> annotationGroupNumber [

	^self dataElementsValues at: 'annotationGroupNumber' ifAbsent: [
		self dataElementsDictionary at: 'annotationGroupNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'annotationGroupNumber' put: (self dataElementsDictionary removeKey: 'annotationGroupNumber') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> annotationGroupNumber: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'annotationGroupNumber' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #annotationGroupNumber.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'annotationGroupNumber' put: dataElement.
			self dataElementsValues removeKey: 'annotationGroupNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'annotationGroupNumber' put: aUSValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> conceptCodeSequence [

	^self dataElementsValues at: 'conceptCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptCodeSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> conceptCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> conceptNameCodeSequence [

	^self dataElementsValues at: 'conceptNameCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptNameCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptNameCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptNameCodeSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> conceptNameCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptNameCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptNameCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptNameCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptNameCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptNameCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> measurementUnitsCodeSequence [

	^self dataElementsValues at: 'measurementUnitsCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: (self dataElementsDictionary removeKey: 'measurementUnitsCodeSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> measurementUnitsCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #measurementUnitsCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'measurementUnitsCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'measurementUnitsCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> numericValue [

	^self dataElementsValues at: 'numericValue' ifAbsent: [
		self dataElementsDictionary at: 'numericValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'numericValue' put: (self dataElementsDictionary removeKey: 'numericValue') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> numericValue: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numericValue' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numericValue.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'numericValue' put: dataElement.
			self dataElementsValues removeKey: 'numericValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numericValue' put: aDSValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedDateTime [

	^self dataElementsValues at: 'referencedDateTime' ifAbsent: [
		self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedDateTime' put: (self dataElementsDictionary removeKey: 'referencedDateTime') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'referencedDateTime' put: dataElement.
			self dataElementsValues removeKey: 'referencedDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedSamplePositions [

	^self dataElementsValues at: 'referencedSamplePositions' ifAbsent: [
		self dataElementsDictionary at: 'referencedSamplePositions' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSamplePositions' put: (self dataElementsDictionary removeKey: 'referencedSamplePositions') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedSamplePositions: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSamplePositions' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSamplePositions.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'referencedSamplePositions' put: dataElement.
			self dataElementsValues removeKey: 'referencedSamplePositions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSamplePositions' put: aULValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedTimeOffsets [

	^self dataElementsValues at: 'referencedTimeOffsets' ifAbsent: [
		self dataElementsDictionary at: 'referencedTimeOffsets' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedTimeOffsets' put: (self dataElementsDictionary removeKey: 'referencedTimeOffsets') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedTimeOffsets: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedTimeOffsets' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedTimeOffsets.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'referencedTimeOffsets' put: dataElement.
			self dataElementsValues removeKey: 'referencedTimeOffsets' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedTimeOffsets' put: aDSValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedWaveformChannels [

	^self dataElementsValues at: 'referencedWaveformChannels' ifAbsent: [
		self dataElementsDictionary at: 'referencedWaveformChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedWaveformChannels' put: (self dataElementsDictionary removeKey: 'referencedWaveformChannels') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> referencedWaveformChannels: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedWaveformChannels' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedWaveformChannels.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'referencedWaveformChannels' put: dataElement.
			self dataElementsValues removeKey: 'referencedWaveformChannels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedWaveformChannels' put: aUSValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> temporalRangeType [

	^self dataElementsValues at: 'temporalRangeType' ifAbsent: [
		self dataElementsDictionary at: 'temporalRangeType' ifPresent: [:dataElement |
			self dataElementsValues at: 'temporalRangeType' put: (self dataElementsDictionary removeKey: 'temporalRangeType') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> temporalRangeType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'temporalRangeType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #temporalRangeType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'temporalRangeType' put: dataElement.
			self dataElementsValues removeKey: 'temporalRangeType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'temporalRangeType' put: aCSValue
		]
	].

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> unformattedTextValue [

	^self dataElementsValues at: 'unformattedTextValue' ifAbsent: [
		self dataElementsDictionary at: 'unformattedTextValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'unformattedTextValue' put: (self dataElementsDictionary removeKey: 'unformattedTextValue') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationSequenceItem >> unformattedTextValue: aSTValue [

	| dataElement |

	(self dataElementsDictionary at: 'unformattedTextValue' ifPresent: [:aDataElement | aDataElement value: aSTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #unformattedTextValue.
			dataElement encoder: self encoder.
			dataElement value: aSTValue.
			self dataElementsDictionary at: 'unformattedTextValue' put: dataElement.
			self dataElementsValues removeKey: 'unformattedTextValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'unformattedTextValue' put: aSTValue
		]
	].

]
