Class {
	#name : #WaveformSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
WaveformSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Waveform Sequence Item'.
	SequenceName := 'waveformSequenceItem'.
	self
		addDataElement:
			(DSDataElement
				newWith: #multiplexGroupTimeOffset
				tag: #(16r0018 16r1068)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #triggerTimeOffset
				tag: #(16r0018 16r1069)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #triggerSamplePosition
				tag: #(16r0018 16r106E)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #waveformOriginality
				tag: #(16r003A 16r0004)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #numberofWaveformChannels
				tag: #(16r003A 16r0005)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #numberofWaveformSamples
				tag: #(16r003A 16r0010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #samplingFrequency
				tag: #(16r003A 16r001A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SHDataElement
				newWith: #multiplexGroupLabel
				tag: #(16r003A 16r0020)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #channelDefinitionSequence
				tag: #(16r003A 16r0200)
				vm: '1'
				type: '1'
				sequenceItemClass: ChannelDefinitionSequenceItem).
	self
		addDataElement:
			(USDataElement
				newWith: #waveformBitsAllocated
				tag: #(16r5400 16r1004)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #waveformSampleInterpretation
				tag: #(16r5400 16r1006)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(OWDataElement
				newWith: #waveformPaddingValue
				tag: #(16r5400 16r100A)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #waveformData
				tag: #(16r5400 16r1010)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
WaveformSequenceItem >> channelDefinitionSequence [

	^self dataElementsValues at: 'channelDefinitionSequence' ifAbsent: [
		self dataElementsDictionary at: 'channelDefinitionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelDefinitionSequence' put: (self dataElementsDictionary removeKey: 'channelDefinitionSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> channelDefinitionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelDefinitionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelDefinitionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'channelDefinitionSequence' put: dataElement.
			self dataElementsValues removeKey: 'channelDefinitionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelDefinitionSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> multiplexGroupLabel [

	^self dataElementsValues at: 'multiplexGroupLabel' ifAbsent: [
		self dataElementsDictionary at: 'multiplexGroupLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'multiplexGroupLabel' put: (self dataElementsDictionary removeKey: 'multiplexGroupLabel') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> multiplexGroupLabel: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'multiplexGroupLabel' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #multiplexGroupLabel.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'multiplexGroupLabel' put: dataElement.
			self dataElementsValues removeKey: 'multiplexGroupLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'multiplexGroupLabel' put: aSHValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> multiplexGroupTimeOffset [

	^self dataElementsValues at: 'multiplexGroupTimeOffset' ifAbsent: [
		self dataElementsDictionary at: 'multiplexGroupTimeOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'multiplexGroupTimeOffset' put: (self dataElementsDictionary removeKey: 'multiplexGroupTimeOffset') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> multiplexGroupTimeOffset: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'multiplexGroupTimeOffset' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #multiplexGroupTimeOffset.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'multiplexGroupTimeOffset' put: dataElement.
			self dataElementsValues removeKey: 'multiplexGroupTimeOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'multiplexGroupTimeOffset' put: aDSValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> numberOfWaveformChannels [

	^self dataElementsValues at: 'numberOfWaveformChannels' ifAbsent: [
		self dataElementsDictionary at: 'numberOfWaveformChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfWaveformChannels' put: (self dataElementsDictionary removeKey: 'numberOfWaveformChannels') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> numberOfWaveformChannels: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfWaveformChannels' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfWaveformChannels.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfWaveformChannels' put: dataElement.
			self dataElementsValues removeKey: 'numberOfWaveformChannels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfWaveformChannels' put: aUSValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> numberOfWaveformSamples [

	^self dataElementsValues at: 'numberOfWaveformSamples' ifAbsent: [
		self dataElementsDictionary at: 'numberOfWaveformSamples' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfWaveformSamples' put: (self dataElementsDictionary removeKey: 'numberOfWaveformSamples') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> numberOfWaveformSamples: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfWaveformSamples' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfWaveformSamples.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'numberOfWaveformSamples' put: dataElement.
			self dataElementsValues removeKey: 'numberOfWaveformSamples' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfWaveformSamples' put: aULValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
WaveformSequenceItem >> numberofWaveformChannels [

	^self dataElementsValues at: 'numberOfWaveformChannels' ifAbsent: [
		self dataElementsDictionary at: 'numberOfWaveformChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfWaveformChannels' put: (self dataElementsDictionary removeKey: 'numberOfWaveformChannels') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
WaveformSequenceItem >> numberofWaveformChannels: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfWaveformChannels' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfWaveformChannels.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'numberOfWaveformChannels' put: dataElement.
			self dataElementsValues removeKey: 'numberOfWaveformChannels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfWaveformChannels' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
WaveformSequenceItem >> numberofWaveformSamples [

	^self dataElementsValues at: 'numberOfWaveformSamples' ifAbsent: [
		self dataElementsDictionary at: 'numberOfWaveformSamples' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfWaveformSamples' put: (self dataElementsDictionary removeKey: 'numberOfWaveformSamples') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
WaveformSequenceItem >> numberofWaveformSamples: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfWaveformSamples' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfWaveformSamples.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'numberOfWaveformSamples' put: dataElement.
			self dataElementsValues removeKey: 'numberOfWaveformSamples' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfWaveformSamples' put: aULValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> samplingFrequency [

	^self dataElementsValues at: 'samplingFrequency' ifAbsent: [
		self dataElementsDictionary at: 'samplingFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplingFrequency' put: (self dataElementsDictionary removeKey: 'samplingFrequency') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> samplingFrequency: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'samplingFrequency' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #samplingFrequency.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'samplingFrequency' put: dataElement.
			self dataElementsValues removeKey: 'samplingFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'samplingFrequency' put: aDSValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> triggerSamplePosition [

	^self dataElementsValues at: 'triggerSamplePosition' ifAbsent: [
		self dataElementsDictionary at: 'triggerSamplePosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerSamplePosition' put: (self dataElementsDictionary removeKey: 'triggerSamplePosition') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> triggerSamplePosition: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerSamplePosition' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerSamplePosition.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'triggerSamplePosition' put: dataElement.
			self dataElementsValues removeKey: 'triggerSamplePosition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerSamplePosition' put: aULValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> triggerTimeOffset [

	^self dataElementsValues at: 'triggerTimeOffset' ifAbsent: [
		self dataElementsDictionary at: 'triggerTimeOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerTimeOffset' put: (self dataElementsDictionary removeKey: 'triggerTimeOffset') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> triggerTimeOffset: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerTimeOffset' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerTimeOffset.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'triggerTimeOffset' put: dataElement.
			self dataElementsValues removeKey: 'triggerTimeOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerTimeOffset' put: aDSValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> waveformBitsAllocated [

	^self dataElementsValues at: 'waveformBitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'waveformBitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformBitsAllocated' put: (self dataElementsDictionary removeKey: 'waveformBitsAllocated') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> waveformBitsAllocated: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformBitsAllocated' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformBitsAllocated.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'waveformBitsAllocated' put: dataElement.
			self dataElementsValues removeKey: 'waveformBitsAllocated' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformBitsAllocated' put: aUSValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> waveformData [

	^self dataElementsValues at: 'waveformData' ifAbsent: [
		self dataElementsDictionary at: 'waveformData' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformData' put: (self dataElementsDictionary removeKey: 'waveformData') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> waveformData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'waveformData' put: dataElement.
			self dataElementsValues removeKey: 'waveformData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformData' put: aOWValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> waveformOriginality [

	^self dataElementsValues at: 'waveformOriginality' ifAbsent: [
		self dataElementsDictionary at: 'waveformOriginality' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformOriginality' put: (self dataElementsDictionary removeKey: 'waveformOriginality') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> waveformOriginality: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformOriginality' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformOriginality.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'waveformOriginality' put: dataElement.
			self dataElementsValues removeKey: 'waveformOriginality' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformOriginality' put: aCSValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> waveformPaddingValue [

	^self dataElementsValues at: 'waveformPaddingValue' ifAbsent: [
		self dataElementsDictionary at: 'waveformPaddingValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformPaddingValue' put: (self dataElementsDictionary removeKey: 'waveformPaddingValue') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> waveformPaddingValue: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformPaddingValue' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformPaddingValue.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'waveformPaddingValue' put: dataElement.
			self dataElementsValues removeKey: 'waveformPaddingValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformPaddingValue' put: aOWValue
		]
	].

]

{ #category : #accessing }
WaveformSequenceItem >> waveformSampleInterpretation [

	^self dataElementsValues at: 'waveformSampleInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'waveformSampleInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformSampleInterpretation' put: (self dataElementsDictionary removeKey: 'waveformSampleInterpretation') value.
		]
	]

]

{ #category : #accessing }
WaveformSequenceItem >> waveformSampleInterpretation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformSampleInterpretation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformSampleInterpretation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'waveformSampleInterpretation' put: dataElement.
			self dataElementsValues removeKey: 'waveformSampleInterpretation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformSampleInterpretation' put: aCSValue
		]
	].

]
