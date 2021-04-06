Class {
	#name : #AudioIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
AudioIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Audio Information Object Module
	PS 3.3-2001 Annex C.10.3 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM Audio Information Object Module'.
	moduleName := 'audioIOM'.
	self addDataElement: (USDataElement
				newWith: #audioType
				tag: #(16r5000 16r2000)
				vm: '1'
				type: '1').
	self addDataElement: (USDataElement
				newWith: #audioSampleFormat
				tag: #(16r5000 16r2002)
				vm: '1'
				type: '1').
	self addDataElement: (USDataElement
				newWith: #numberOfChannels
				tag: #(16r5000 16r2004)
				vm: '1'
				type: '1').
	self addDataElement: (ULDataElement
				newWith: #numberOfSamples
				tag: #(16r5000 16r2006)
				vm: '1'
				type: '1').
	self addDataElement: (ULDataElement
				newWith: #sampleRate
				tag: #(16r5000 16r2008)
				vm: '1'
				type: '1').
	self addDataElement: (ULDataElement
				newWith: #totalTime
				tag: #(16r5000 16r200A)
				vm: '1'
				type: '1').
	self addDataElement: (OWDataElement
				newWith: #audioSampleData
				tag: #(16r5000 16r200C)
				vm: '1'
				type: '1').
	self addDataElement: (SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r0008 16r1140)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedImageSequenceItem).
	self addDataElement: (LTDataElement
				newWith: #audioComments
				tag: #(16r5000 16r200E)
				vm: '1'
				type: '3')
]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioComments [

	^self dataElementsValues at: 'rETIRED_AudioComments' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioComments' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioComments' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioComments') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioComments: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioComments' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioComments.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'rETIRED_AudioComments' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioComments' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioComments' put: aLTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioSampleData [

	^self dataElementsValues at: 'rETIRED_AudioSampleData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioSampleData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioSampleData' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioSampleData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioSampleData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioSampleData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioSampleData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'rETIRED_AudioSampleData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioSampleData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioSampleData' put: aOWValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioSampleFormat [

	^self dataElementsValues at: 'rETIRED_AudioSampleFormat' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioSampleFormat' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioSampleFormat' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioSampleFormat') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioSampleFormat: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioSampleFormat' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioSampleFormat.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_AudioSampleFormat' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioSampleFormat' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioSampleFormat' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioType [

	^self dataElementsValues at: 'rETIRED_AudioType' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioType' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioType' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioType') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> audioType: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioType' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioType.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_AudioType' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioType' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> numberOfChannels [

	^self dataElementsValues at: 'rETIRED_NumberOfChannels' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_NumberOfChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_NumberOfChannels' put: (self dataElementsDictionary removeKey: 'rETIRED_NumberOfChannels') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> numberOfChannels: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_NumberOfChannels' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_NumberOfChannels.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_NumberOfChannels' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_NumberOfChannels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_NumberOfChannels' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> numberOfSamples [

	^self dataElementsValues at: 'rETIRED_NumberOfSamples' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_NumberOfSamples' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_NumberOfSamples' put: (self dataElementsDictionary removeKey: 'rETIRED_NumberOfSamples') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> numberOfSamples: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_NumberOfSamples' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_NumberOfSamples.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_NumberOfSamples' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_NumberOfSamples' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_NumberOfSamples' put: aULValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioComments [

	^self dataElementsValues at: 'rETIRED_AudioComments' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioComments' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioComments' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioComments') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioComments: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioComments' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioComments.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'rETIRED_AudioComments' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioComments' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioComments' put: aLTValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioSampleData [

	^self dataElementsValues at: 'rETIRED_AudioSampleData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioSampleData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioSampleData' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioSampleData') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioSampleData: aUNValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioSampleData' ifPresent: [:aDataElement | aDataElement value: aUNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioSampleData.
			dataElement encoder: self encoder.
			dataElement value: aUNValue.
			self dataElementsDictionary at: 'rETIRED_AudioSampleData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioSampleData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioSampleData' put: aUNValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioSampleFormat [

	^self dataElementsValues at: 'rETIRED_AudioSampleFormat' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioSampleFormat' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioSampleFormat' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioSampleFormat') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioSampleFormat: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioSampleFormat' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioSampleFormat.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_AudioSampleFormat' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioSampleFormat' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioSampleFormat' put: aUSValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioType [

	^self dataElementsValues at: 'rETIRED_AudioType' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AudioType' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AudioType' put: (self dataElementsDictionary removeKey: 'rETIRED_AudioType') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_AudioType: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AudioType' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AudioType.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_AudioType' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AudioType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AudioType' put: aUSValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_NumberOfChannels [

	^self dataElementsValues at: 'rETIRED_NumberOfChannels' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_NumberOfChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_NumberOfChannels' put: (self dataElementsDictionary removeKey: 'rETIRED_NumberOfChannels') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_NumberOfChannels: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_NumberOfChannels' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_NumberOfChannels.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_NumberOfChannels' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_NumberOfChannels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_NumberOfChannels' put: aUSValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_NumberOfSamples [

	^self dataElementsValues at: 'rETIRED_NumberOfSamples' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_NumberOfSamples' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_NumberOfSamples' put: (self dataElementsDictionary removeKey: 'rETIRED_NumberOfSamples') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_NumberOfSamples: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_NumberOfSamples' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_NumberOfSamples.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_NumberOfSamples' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_NumberOfSamples' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_NumberOfSamples' put: aULValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_SampleRate [

	^self dataElementsValues at: 'rETIRED_SampleRate' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SampleRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SampleRate' put: (self dataElementsDictionary removeKey: 'rETIRED_SampleRate') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_SampleRate: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SampleRate' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SampleRate.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_SampleRate' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SampleRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SampleRate' put: aULValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> rETIRED_TotalTime [

	^self dataElementsValues at: 'rETIRED_TotalTime' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TotalTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TotalTime' put: (self dataElementsDictionary removeKey: 'rETIRED_TotalTime') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> rETIRED_TotalTime: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TotalTime' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TotalTime.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TotalTime' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TotalTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TotalTime' put: aULValue
		]
	].

]

{ #category : #accessing }
AudioIOM >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
AudioIOM >> referencedImageSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedImageSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedImageSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedImageSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedImageSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> sampleRate [

	^self dataElementsValues at: 'rETIRED_SampleRate' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SampleRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SampleRate' put: (self dataElementsDictionary removeKey: 'rETIRED_SampleRate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> sampleRate: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SampleRate' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SampleRate.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_SampleRate' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SampleRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SampleRate' put: aULValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> totalTime [

	^self dataElementsValues at: 'rETIRED_TotalTime' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TotalTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TotalTime' put: (self dataElementsDictionary removeKey: 'rETIRED_TotalTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AudioIOM >> totalTime: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TotalTime' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TotalTime.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TotalTime' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TotalTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TotalTime' put: aULValue
		]
	].

]
