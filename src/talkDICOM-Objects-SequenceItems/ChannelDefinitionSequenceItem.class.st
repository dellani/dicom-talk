Class {
	#name : #ChannelDefinitionSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ChannelDefinitionSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Channel Definition Sequence Item'.
	SequenceName := 'channelDefinitionSequenceItem'.
	self initializeSequenceDataElementTag: #(16r003A 16r0200).

	self
		addDataElement:
			(ISDataElement
				newWith: #waveformChannelNumber
				tag: #(16r003A 16r0202)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #channelLabel
				tag: #(16r003A 16r0203)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #channelStatus
				tag: #(16r003A 16r0205)
				vm: '1-n'
				type: '3').	"1-n"
	self
		addDataElement:
			(SQDataElement
				newWith: #channelSourceSequence
				tag: #(16r003A 16r0208)
				vm: '1'
				type: '1'
				sequenceItemClass: ChannelSourceSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #channelSourceModifiersSequence
				tag: #(16r003A 16r0209)
				vm: '1'
				type: '1C'
				sequenceItemClass: ChannelSourceModifiersSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #sourceWaveformSequence
				tag: #(16r003A 16r020A)
				vm: '1'
				type: '3'
				sequenceItemClass: SourceWaveformSequenceItem).
	self
		addDataElement:
			(LODataElement
				newWith: #channelDerivationDescription
				tag: #(16r003A 16r020C)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #channelSensitivity
				tag: #(16r003A 16r0210)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #channelSensitivityUnitsSequence
				tag: #(16r003A 16r0211)
				vm: '1'
				type: '1C'
				sequenceItemClass: ChannelSensitivityUnitsSequenceItem).
	self
		addDataElement:
			(DSDataElement
				newWith: #channelSensitivityCorrectionFactor
				tag: #(16r003A 16r0212)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #channelBaseline
				tag: #(16r003A 16r0213)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #channelTimeSkew
				tag: #(16r003A 16r0214)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #channelSampleSkew
				tag: #(16r003A 16r0215)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #channelOffset
				tag: #(16r003A 16r0218)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #waveformBitsStored
				tag: #(16r003A 16r021A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #filterLowFrequency
				tag: #(16r003A 16r0220)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #filterHighFrequency
				tag: #(16r003A 16r0221)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #notchFilterFrequency
				tag: #(16r003A 16r0222)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #notchFilterBandwidth
				tag: #(16r003A 16r0223)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(OBDataElement
				newWith: #channelMinimumValue
				tag: #(16r5400 16r0110)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(OBDataElement
				newWith: #channelMaximumValue
				tag: #(16r5400 16r0112)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelBaseline [

	^self dataElementsValues at: 'channelBaseline' ifAbsent: [
		self dataElementsDictionary at: 'channelBaseline' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelBaseline' put: (self dataElementsDictionary removeKey: 'channelBaseline') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelBaseline: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelBaseline' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelBaseline.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'channelBaseline' put: dataElement.
			self dataElementsValues removeKey: 'channelBaseline' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelBaseline' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelDerivationDescription [

	^self dataElementsValues at: 'channelDerivationDescription' ifAbsent: [
		self dataElementsDictionary at: 'channelDerivationDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelDerivationDescription' put: (self dataElementsDictionary removeKey: 'channelDerivationDescription') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelDerivationDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelDerivationDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelDerivationDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'channelDerivationDescription' put: dataElement.
			self dataElementsValues removeKey: 'channelDerivationDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelDerivationDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelLabel [

	^self dataElementsValues at: 'channelLabel' ifAbsent: [
		self dataElementsDictionary at: 'channelLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelLabel' put: (self dataElementsDictionary removeKey: 'channelLabel') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelLabel: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelLabel' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelLabel.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'channelLabel' put: dataElement.
			self dataElementsValues removeKey: 'channelLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelLabel' put: aSHValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelMaximumValue [

	^self dataElementsValues at: 'channelMaximumValue' ifAbsent: [
		self dataElementsDictionary at: 'channelMaximumValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelMaximumValue' put: (self dataElementsDictionary removeKey: 'channelMaximumValue') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelMaximumValue: aOBValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelMaximumValue' ifPresent: [:aDataElement | aDataElement value: aOBValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelMaximumValue.
			dataElement encoder: self encoder.
			dataElement value: aOBValue.
			self dataElementsDictionary at: 'channelMaximumValue' put: dataElement.
			self dataElementsValues removeKey: 'channelMaximumValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelMaximumValue' put: aOBValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelMinimumValue [

	^self dataElementsValues at: 'channelMinimumValue' ifAbsent: [
		self dataElementsDictionary at: 'channelMinimumValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelMinimumValue' put: (self dataElementsDictionary removeKey: 'channelMinimumValue') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelMinimumValue: aOBValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelMinimumValue' ifPresent: [:aDataElement | aDataElement value: aOBValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelMinimumValue.
			dataElement encoder: self encoder.
			dataElement value: aOBValue.
			self dataElementsDictionary at: 'channelMinimumValue' put: dataElement.
			self dataElementsValues removeKey: 'channelMinimumValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelMinimumValue' put: aOBValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelOffset [

	^self dataElementsValues at: 'channelOffset' ifAbsent: [
		self dataElementsDictionary at: 'channelOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelOffset' put: (self dataElementsDictionary removeKey: 'channelOffset') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelOffset: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelOffset' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelOffset.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'channelOffset' put: dataElement.
			self dataElementsValues removeKey: 'channelOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelOffset' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSampleSkew [

	^self dataElementsValues at: 'channelSampleSkew' ifAbsent: [
		self dataElementsDictionary at: 'channelSampleSkew' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelSampleSkew' put: (self dataElementsDictionary removeKey: 'channelSampleSkew') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSampleSkew: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelSampleSkew' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelSampleSkew.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'channelSampleSkew' put: dataElement.
			self dataElementsValues removeKey: 'channelSampleSkew' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelSampleSkew' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSensitivity [

	^self dataElementsValues at: 'channelSensitivity' ifAbsent: [
		self dataElementsDictionary at: 'channelSensitivity' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelSensitivity' put: (self dataElementsDictionary removeKey: 'channelSensitivity') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSensitivity: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelSensitivity' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelSensitivity.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'channelSensitivity' put: dataElement.
			self dataElementsValues removeKey: 'channelSensitivity' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelSensitivity' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSensitivityCorrectionFactor [

	^self dataElementsValues at: 'channelSensitivityCorrectionFactor' ifAbsent: [
		self dataElementsDictionary at: 'channelSensitivityCorrectionFactor' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelSensitivityCorrectionFactor' put: (self dataElementsDictionary removeKey: 'channelSensitivityCorrectionFactor') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSensitivityCorrectionFactor: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelSensitivityCorrectionFactor' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelSensitivityCorrectionFactor.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'channelSensitivityCorrectionFactor' put: dataElement.
			self dataElementsValues removeKey: 'channelSensitivityCorrectionFactor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelSensitivityCorrectionFactor' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSensitivityUnitsSequence [

	^self dataElementsValues at: 'channelSensitivityUnitsSequence' ifAbsent: [
		self dataElementsDictionary at: 'channelSensitivityUnitsSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelSensitivityUnitsSequence' put: (self dataElementsDictionary removeKey: 'channelSensitivityUnitsSequence') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSensitivityUnitsSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelSensitivityUnitsSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelSensitivityUnitsSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'channelSensitivityUnitsSequence' put: dataElement.
			self dataElementsValues removeKey: 'channelSensitivityUnitsSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelSensitivityUnitsSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSourceModifiersSequence [

	^self dataElementsValues at: 'channelSourceModifiersSequence' ifAbsent: [
		self dataElementsDictionary at: 'channelSourceModifiersSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelSourceModifiersSequence' put: (self dataElementsDictionary removeKey: 'channelSourceModifiersSequence') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSourceModifiersSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelSourceModifiersSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelSourceModifiersSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'channelSourceModifiersSequence' put: dataElement.
			self dataElementsValues removeKey: 'channelSourceModifiersSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelSourceModifiersSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSourceSequence [

	^self dataElementsValues at: 'channelSourceSequence' ifAbsent: [
		self dataElementsDictionary at: 'channelSourceSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelSourceSequence' put: (self dataElementsDictionary removeKey: 'channelSourceSequence') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelSourceSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelSourceSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelSourceSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'channelSourceSequence' put: dataElement.
			self dataElementsValues removeKey: 'channelSourceSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelSourceSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelStatus [

	^self dataElementsValues at: 'channelStatus' ifAbsent: [
		self dataElementsDictionary at: 'channelStatus' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelStatus' put: (self dataElementsDictionary removeKey: 'channelStatus') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelStatus: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelStatus' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelStatus.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'channelStatus' put: dataElement.
			self dataElementsValues removeKey: 'channelStatus' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelStatus' put: aCSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelTimeSkew [

	^self dataElementsValues at: 'channelTimeSkew' ifAbsent: [
		self dataElementsDictionary at: 'channelTimeSkew' ifPresent: [:dataElement |
			self dataElementsValues at: 'channelTimeSkew' put: (self dataElementsDictionary removeKey: 'channelTimeSkew') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> channelTimeSkew: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'channelTimeSkew' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #channelTimeSkew.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'channelTimeSkew' put: dataElement.
			self dataElementsValues removeKey: 'channelTimeSkew' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'channelTimeSkew' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> filterHighFrequency [

	^self dataElementsValues at: 'filterHighFrequency' ifAbsent: [
		self dataElementsDictionary at: 'filterHighFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'filterHighFrequency' put: (self dataElementsDictionary removeKey: 'filterHighFrequency') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> filterHighFrequency: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'filterHighFrequency' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #filterHighFrequency.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'filterHighFrequency' put: dataElement.
			self dataElementsValues removeKey: 'filterHighFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'filterHighFrequency' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> filterLowFrequency [

	^self dataElementsValues at: 'filterLowFrequency' ifAbsent: [
		self dataElementsDictionary at: 'filterLowFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'filterLowFrequency' put: (self dataElementsDictionary removeKey: 'filterLowFrequency') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> filterLowFrequency: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'filterLowFrequency' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #filterLowFrequency.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'filterLowFrequency' put: dataElement.
			self dataElementsValues removeKey: 'filterLowFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'filterLowFrequency' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> notchFilterBandwidth [

	^self dataElementsValues at: 'notchFilterBandwidth' ifAbsent: [
		self dataElementsDictionary at: 'notchFilterBandwidth' ifPresent: [:dataElement |
			self dataElementsValues at: 'notchFilterBandwidth' put: (self dataElementsDictionary removeKey: 'notchFilterBandwidth') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> notchFilterBandwidth: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'notchFilterBandwidth' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #notchFilterBandwidth.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'notchFilterBandwidth' put: dataElement.
			self dataElementsValues removeKey: 'notchFilterBandwidth' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'notchFilterBandwidth' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> notchFilterFrequency [

	^self dataElementsValues at: 'notchFilterFrequency' ifAbsent: [
		self dataElementsDictionary at: 'notchFilterFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'notchFilterFrequency' put: (self dataElementsDictionary removeKey: 'notchFilterFrequency') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> notchFilterFrequency: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'notchFilterFrequency' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #notchFilterFrequency.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'notchFilterFrequency' put: dataElement.
			self dataElementsValues removeKey: 'notchFilterFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'notchFilterFrequency' put: aDSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> sourceWaveformSequence [

	^self dataElementsValues at: 'sourceWaveformSequence' ifAbsent: [
		self dataElementsDictionary at: 'sourceWaveformSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'sourceWaveformSequence' put: (self dataElementsDictionary removeKey: 'sourceWaveformSequence') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> sourceWaveformSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'sourceWaveformSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sourceWaveformSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'sourceWaveformSequence' put: dataElement.
			self dataElementsValues removeKey: 'sourceWaveformSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sourceWaveformSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> waveformBitsStored [

	^self dataElementsValues at: 'waveformBitsStored' ifAbsent: [
		self dataElementsDictionary at: 'waveformBitsStored' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformBitsStored' put: (self dataElementsDictionary removeKey: 'waveformBitsStored') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> waveformBitsStored: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformBitsStored' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformBitsStored.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'waveformBitsStored' put: dataElement.
			self dataElementsValues removeKey: 'waveformBitsStored' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformBitsStored' put: aUSValue
		]
	].

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> waveformChannelNumber [

	^self dataElementsValues at: 'waveformChannelNumber' ifAbsent: [
		self dataElementsDictionary at: 'waveformChannelNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformChannelNumber' put: (self dataElementsDictionary removeKey: 'waveformChannelNumber') value.
		]
	]

]

{ #category : #accessing }
ChannelDefinitionSequenceItem >> waveformChannelNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformChannelNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformChannelNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'waveformChannelNumber' put: dataElement.
			self dataElementsValues removeKey: 'waveformChannelNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformChannelNumber' put: aISValue
		]
	].

]
