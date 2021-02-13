Class {
	#name : #USImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
USImageIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the 
	DICOM US Image Information Object Module
	PS 3.3-2001 Annex C.8.5.6 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM US Image Information Object Module'.
	moduleName := 'usImageIOM'.
	self
		addDataElement:
			(USDataElement
				newWith: #samplesPerPixel
				tag: #(16r0028 16r0002)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #photometricInterpretation
				tag: #(16r0028 16r0004)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #bitsAllocated
				tag: #(16r0028 16r0100)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #bitsStored
				tag: #(16r0028 16r0101)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #highBit
				tag: #(16r0028 16r0102)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #planarConfiguration
				tag: #(16r0028 16r0006)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #pixelRepresentation
				tag: #(16r0028 16r0103)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #frameIncrementPointer
				tag: #(16r0028 16r0009)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #imageType
				tag: #(16r0008 16r0008)
				vm: '1-n'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #lossyImageCompression
				tag: #(16r0028 16r2110)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #numberOfStages
				tag: #(16r0008 16r2124)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(ISDataElement
				newWith: #numberOfViewsInStage
				tag: #(16r0008 16r212A)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(USDataElement
				newWith: #ultrasoundColorDataPresent
				tag: #(16r0028 16r0014)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedOverlaySequence
				tag: #(16r0008 16r1130)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedOverlaySequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedCurveSequence
				tag: #(16r0008 16r1145)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedCurveSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedWaveformSequence
				tag: #(16r0008 16r113A)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedWaveformSequenceItem).
	self
		addDataElement:
			(SHDataElement
				newWith: #stageName
				tag: #(16r0008 16r2120)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #stageCodeSequence
				tag: #(16r0040 16r000A)
				vm: '1'
				type: '3'
				sequenceItemClass: StageCodeSequenceItem).
	self
		addDataElement:
			(ISDataElement
				newWith: #stageNumber
				tag: #(16r0008 16r2122)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #viewName
				tag: #(16r0008 16r2127)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #viewNumber
				tag: #(16r0008 16r2128)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #numberOfEventTimers
				tag: #(16r0008 16r2129)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #eventElapsedTimes
				tag: #(16r0008 16r2130)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #eventTimerNames
				tag: #(16r0008 16r2132)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #anatomicRegionSequence
				tag: #(16r0008 16r2218)
				vm: '1'
				type: '3'
				sequenceItemClass: AnatomicRegionSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #primaryAnatomicStructureSequence
				tag: #(16r0008 16r2228)
				vm: '1'
				type: '3'
				sequenceItemClass: PrimaryAnatomicStructureSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #transducerPositionSequence
				tag: #(16r0008 16r2240)
				vm: '1'
				type: '3'
				sequenceItemClass: TransducerPositionSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #transducerOrientationSequence
				tag: #(16r0008 16r2244)
				vm: '1'
				type: '3'
				sequenceItemClass: TransducerOrientationSequenceItem).
	self
		addDataElement:
			(DTDataElement
				newWith: #acquisitionDatetime
				tag: #(16r0008 16r002A)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #triggerTime
				tag: #(16r0018 16r1060)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #nominalInterval
				tag: #(16r0018 16r1062)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #beatRejectionFlag
				tag: #(16r0018 16r1080)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #lowRRValue
				tag: #(16r0018 16r1081)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #highRRValue
				tag: #(16r0018 16r1082)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #heartRate
				tag: #(16r0018 16r1088)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #ivusAcquisition
				tag: #(16r0018 16r3100)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #ivusPullbackRate
				tag: #(16r0018 16r3101)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #ivusGatedRate
				tag: #(16r0018 16r3102)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #ivusPullbackStartFrameNumber
				tag: #(16r0018 16r3103)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #ivusPullbackStopFrameNumber
				tag: #(16r0018 16r3104)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #lesionNumber
				tag: #(16r0018 16r3105)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #outputPower
				tag: #(16r0018 16r5000)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #transducerData
				tag: #(16r0018 16r5010)
				vm: '3'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #transducerType
				tag: #(16r0018 16r6031)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #focusDepth
				tag: #(16r0018 16r5012)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #preprocessingFunction
				tag: #(16r0018 16r5020)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #mechanicalIndex
				tag: #(16r0018 16r5022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #boneThermalIndex
				tag: #(16r0018 16r5024)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #cranialThermalIndex
				tag: #(16r0018 16r5026)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #softTissueThermalIndex
				tag: #(16r0018 16r5027)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #softTissueFocusThermalIndex
				tag: #(16r0018 16r5028)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #softTissueSurfaceThermalIndex
				tag: #(16r0018 16r5029)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #depthOfScanField
				tag: #(16r0018 16r5050)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #imageTransformationMatrix
				tag: #(16r0018 16r5210)
				vm: '6'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #imageTranslationVector
				tag: #(16r0018 16r5212)
				vm: '3'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #overlaySubtype
				tag: #(16r6000 16r0045)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
USImageIOM >> acquisitionDateTime [

	^self dataElementsValues at: 'acquisitionDateTime' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDateTime' put: (self dataElementsDictionary removeKey: 'acquisitionDateTime') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> acquisitionDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'acquisitionDateTime' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDateTime' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> acquisitionDatetime [

	^self dataElementsValues at: 'acquisitionDateTime' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDateTime' put: (self dataElementsDictionary removeKey: 'acquisitionDateTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> acquisitionDatetime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'acquisitionDateTime' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> anatomicRegionSequence [

	^self dataElementsValues at: 'anatomicRegionSequence' ifAbsent: [
		self dataElementsDictionary at: 'anatomicRegionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'anatomicRegionSequence' put: (self dataElementsDictionary removeKey: 'anatomicRegionSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> anatomicRegionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'anatomicRegionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #anatomicRegionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'anatomicRegionSequence' put: dataElement.
			self dataElementsValues removeKey: 'anatomicRegionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'anatomicRegionSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> beatRejectionFlag [

	^self dataElementsValues at: 'beatRejectionFlag' ifAbsent: [
		self dataElementsDictionary at: 'beatRejectionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'beatRejectionFlag' put: (self dataElementsDictionary removeKey: 'beatRejectionFlag') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> beatRejectionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'beatRejectionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #beatRejectionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'beatRejectionFlag' put: dataElement.
			self dataElementsValues removeKey: 'beatRejectionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'beatRejectionFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> bitsAllocated [

	^self dataElementsValues at: 'bitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsAllocated' put: (self dataElementsDictionary removeKey: 'bitsAllocated') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> bitsAllocated: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bitsAllocated.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'bitsAllocated' put: dataElement.
			self dataElementsValues removeKey: 'bitsAllocated' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bitsAllocated' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> bitsStored [

	^self dataElementsValues at: 'bitsStored' ifAbsent: [
		self dataElementsDictionary at: 'bitsStored' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsStored' put: (self dataElementsDictionary removeKey: 'bitsStored') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> bitsStored: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bitsStored' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bitsStored.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'bitsStored' put: dataElement.
			self dataElementsValues removeKey: 'bitsStored' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bitsStored' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> boneThermalIndex [

	^self dataElementsValues at: 'boneThermalIndex' ifAbsent: [
		self dataElementsDictionary at: 'boneThermalIndex' ifPresent: [:dataElement |
			self dataElementsValues at: 'boneThermalIndex' put: (self dataElementsDictionary removeKey: 'boneThermalIndex') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> boneThermalIndex: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'boneThermalIndex' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #boneThermalIndex.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'boneThermalIndex' put: dataElement.
			self dataElementsValues removeKey: 'boneThermalIndex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'boneThermalIndex' put: aDSValue
		]
	].

]

{ #category : #checking }
USImageIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
USImageIOM >> cranialThermalIndex [

	^self dataElementsValues at: 'cranialThermalIndex' ifAbsent: [
		self dataElementsDictionary at: 'cranialThermalIndex' ifPresent: [:dataElement |
			self dataElementsValues at: 'cranialThermalIndex' put: (self dataElementsDictionary removeKey: 'cranialThermalIndex') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> cranialThermalIndex: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'cranialThermalIndex' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cranialThermalIndex.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'cranialThermalIndex' put: dataElement.
			self dataElementsValues removeKey: 'cranialThermalIndex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cranialThermalIndex' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> depthOfScanField [

	^self dataElementsValues at: 'depthOfScanField' ifAbsent: [
		self dataElementsDictionary at: 'depthOfScanField' ifPresent: [:dataElement |
			self dataElementsValues at: 'depthOfScanField' put: (self dataElementsDictionary removeKey: 'depthOfScanField') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> depthOfScanField: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'depthOfScanField' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #depthOfScanField.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'depthOfScanField' put: dataElement.
			self dataElementsValues removeKey: 'depthOfScanField' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'depthOfScanField' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> eventElapsedTimes [

	^self dataElementsValues at: 'eventElapsedTimes' ifAbsent: [
		self dataElementsDictionary at: 'eventElapsedTimes' ifPresent: [:dataElement |
			self dataElementsValues at: 'eventElapsedTimes' put: (self dataElementsDictionary removeKey: 'eventElapsedTimes') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> eventElapsedTimes: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'eventElapsedTimes' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #eventElapsedTimes.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'eventElapsedTimes' put: dataElement.
			self dataElementsValues removeKey: 'eventElapsedTimes' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'eventElapsedTimes' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> eventTimerNames [

	^self dataElementsValues at: 'eventTimerNames' ifAbsent: [
		self dataElementsDictionary at: 'eventTimerNames' ifPresent: [:dataElement |
			self dataElementsValues at: 'eventTimerNames' put: (self dataElementsDictionary removeKey: 'eventTimerNames') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> eventTimerNames: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'eventTimerNames' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #eventTimerNames.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'eventTimerNames' put: dataElement.
			self dataElementsValues removeKey: 'eventTimerNames' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'eventTimerNames' put: aLOValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> focusDepth [

	^self dataElementsValues at: 'focusDepth' ifAbsent: [
		self dataElementsDictionary at: 'focusDepth' ifPresent: [:dataElement |
			self dataElementsValues at: 'focusDepth' put: (self dataElementsDictionary removeKey: 'focusDepth') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> focusDepth: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'focusDepth' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #focusDepth.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'focusDepth' put: dataElement.
			self dataElementsValues removeKey: 'focusDepth' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'focusDepth' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> frameIncrementPointer [

	^self dataElementsValues at: 'frameIncrementPointer' ifAbsent: [
		self dataElementsDictionary at: 'frameIncrementPointer' ifPresent: [:dataElement |
			self dataElementsValues at: 'frameIncrementPointer' put: (self dataElementsDictionary removeKey: 'frameIncrementPointer') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> frameIncrementPointer: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'frameIncrementPointer' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #frameIncrementPointer.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'frameIncrementPointer' put: dataElement.
			self dataElementsValues removeKey: 'frameIncrementPointer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'frameIncrementPointer' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> heartRate [

	^self dataElementsValues at: 'heartRate' ifAbsent: [
		self dataElementsDictionary at: 'heartRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'heartRate' put: (self dataElementsDictionary removeKey: 'heartRate') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> heartRate: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'heartRate' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #heartRate.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'heartRate' put: dataElement.
			self dataElementsValues removeKey: 'heartRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'heartRate' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> highBit [

	^self dataElementsValues at: 'highBit' ifAbsent: [
		self dataElementsDictionary at: 'highBit' ifPresent: [:dataElement |
			self dataElementsValues at: 'highBit' put: (self dataElementsDictionary removeKey: 'highBit') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> highBit: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'highBit' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #highBit.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'highBit' put: dataElement.
			self dataElementsValues removeKey: 'highBit' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'highBit' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> highRRValue [

	^self dataElementsValues at: 'highRRValue' ifAbsent: [
		self dataElementsDictionary at: 'highRRValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'highRRValue' put: (self dataElementsDictionary removeKey: 'highRRValue') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> highRRValue: aISValue [

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
USImageIOM >> iVUSAcquisition [

	^self dataElementsValues at: 'iVUSAcquisition' ifAbsent: [
		self dataElementsDictionary at: 'iVUSAcquisition' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSAcquisition' put: (self dataElementsDictionary removeKey: 'iVUSAcquisition') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> iVUSAcquisition: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSAcquisition' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSAcquisition.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'iVUSAcquisition' put: dataElement.
			self dataElementsValues removeKey: 'iVUSAcquisition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSAcquisition' put: aCSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> iVUSGatedRate [

	^self dataElementsValues at: 'iVUSGatedRate' ifAbsent: [
		self dataElementsDictionary at: 'iVUSGatedRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSGatedRate' put: (self dataElementsDictionary removeKey: 'iVUSGatedRate') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> iVUSGatedRate: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSGatedRate' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSGatedRate.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'iVUSGatedRate' put: dataElement.
			self dataElementsValues removeKey: 'iVUSGatedRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSGatedRate' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> iVUSPullbackRate [

	^self dataElementsValues at: 'iVUSPullbackRate' ifAbsent: [
		self dataElementsDictionary at: 'iVUSPullbackRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSPullbackRate' put: (self dataElementsDictionary removeKey: 'iVUSPullbackRate') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> iVUSPullbackRate: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSPullbackRate' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSPullbackRate.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'iVUSPullbackRate' put: dataElement.
			self dataElementsValues removeKey: 'iVUSPullbackRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSPullbackRate' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> iVUSPullbackStartFrameNumber [

	^self dataElementsValues at: 'iVUSPullbackStartFrameNumber' ifAbsent: [
		self dataElementsDictionary at: 'iVUSPullbackStartFrameNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSPullbackStartFrameNumber' put: (self dataElementsDictionary removeKey: 'iVUSPullbackStartFrameNumber') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> iVUSPullbackStartFrameNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSPullbackStartFrameNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSPullbackStartFrameNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'iVUSPullbackStartFrameNumber' put: dataElement.
			self dataElementsValues removeKey: 'iVUSPullbackStartFrameNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSPullbackStartFrameNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> iVUSPullbackStopFrameNumber [

	^self dataElementsValues at: 'iVUSPullbackStopFrameNumber' ifAbsent: [
		self dataElementsDictionary at: 'iVUSPullbackStopFrameNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSPullbackStopFrameNumber' put: (self dataElementsDictionary removeKey: 'iVUSPullbackStopFrameNumber') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> iVUSPullbackStopFrameNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSPullbackStopFrameNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSPullbackStopFrameNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'iVUSPullbackStopFrameNumber' put: dataElement.
			self dataElementsValues removeKey: 'iVUSPullbackStopFrameNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSPullbackStopFrameNumber' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> imageTransformationMatrix [

	^self dataElementsValues at: 'rETIRED_ImageTransformationMatrix' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ImageTransformationMatrix' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ImageTransformationMatrix' put: (self dataElementsDictionary removeKey: 'rETIRED_ImageTransformationMatrix') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> imageTransformationMatrix: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ImageTransformationMatrix' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ImageTransformationMatrix.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rETIRED_ImageTransformationMatrix' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ImageTransformationMatrix' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ImageTransformationMatrix' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> imageTranslationVector [

	^self dataElementsValues at: 'rETIRED_ImageTranslationVector' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ImageTranslationVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ImageTranslationVector' put: (self dataElementsDictionary removeKey: 'rETIRED_ImageTranslationVector') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> imageTranslationVector: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ImageTranslationVector' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ImageTranslationVector.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rETIRED_ImageTranslationVector' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ImageTranslationVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ImageTranslationVector' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> imageType [

	^self dataElementsValues at: 'imageType' ifAbsent: [
		self dataElementsDictionary at: 'imageType' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageType' put: (self dataElementsDictionary removeKey: 'imageType') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> imageType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'imageType' put: dataElement.
			self dataElementsValues removeKey: 'imageType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageType' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusAcquisition [

	^self dataElementsValues at: 'iVUSAcquisition' ifAbsent: [
		self dataElementsDictionary at: 'iVUSAcquisition' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSAcquisition' put: (self dataElementsDictionary removeKey: 'iVUSAcquisition') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusAcquisition: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSAcquisition' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSAcquisition.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'iVUSAcquisition' put: dataElement.
			self dataElementsValues removeKey: 'iVUSAcquisition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSAcquisition' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusGatedRate [

	^self dataElementsValues at: 'iVUSGatedRate' ifAbsent: [
		self dataElementsDictionary at: 'iVUSGatedRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSGatedRate' put: (self dataElementsDictionary removeKey: 'iVUSGatedRate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusGatedRate: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSGatedRate' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSGatedRate.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'iVUSGatedRate' put: dataElement.
			self dataElementsValues removeKey: 'iVUSGatedRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSGatedRate' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusPullbackRate [

	^self dataElementsValues at: 'iVUSPullbackRate' ifAbsent: [
		self dataElementsDictionary at: 'iVUSPullbackRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSPullbackRate' put: (self dataElementsDictionary removeKey: 'iVUSPullbackRate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusPullbackRate: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSPullbackRate' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSPullbackRate.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'iVUSPullbackRate' put: dataElement.
			self dataElementsValues removeKey: 'iVUSPullbackRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSPullbackRate' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusPullbackStartFrameNumber [

	^self dataElementsValues at: 'iVUSPullbackStartFrameNumber' ifAbsent: [
		self dataElementsDictionary at: 'iVUSPullbackStartFrameNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSPullbackStartFrameNumber' put: (self dataElementsDictionary removeKey: 'iVUSPullbackStartFrameNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusPullbackStartFrameNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSPullbackStartFrameNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSPullbackStartFrameNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'iVUSPullbackStartFrameNumber' put: dataElement.
			self dataElementsValues removeKey: 'iVUSPullbackStartFrameNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSPullbackStartFrameNumber' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusPullbackStopFrameNumber [

	^self dataElementsValues at: 'iVUSPullbackStopFrameNumber' ifAbsent: [
		self dataElementsDictionary at: 'iVUSPullbackStopFrameNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'iVUSPullbackStopFrameNumber' put: (self dataElementsDictionary removeKey: 'iVUSPullbackStopFrameNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> ivusPullbackStopFrameNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'iVUSPullbackStopFrameNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #iVUSPullbackStopFrameNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'iVUSPullbackStopFrameNumber' put: dataElement.
			self dataElementsValues removeKey: 'iVUSPullbackStopFrameNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'iVUSPullbackStopFrameNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> lesionNumber [

	^self dataElementsValues at: 'lesionNumber' ifAbsent: [
		self dataElementsDictionary at: 'lesionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'lesionNumber' put: (self dataElementsDictionary removeKey: 'lesionNumber') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> lesionNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'lesionNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lesionNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'lesionNumber' put: dataElement.
			self dataElementsValues removeKey: 'lesionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lesionNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> lossyImageCompression [

	^self dataElementsValues at: 'lossyImageCompression' ifAbsent: [
		self dataElementsDictionary at: 'lossyImageCompression' ifPresent: [:dataElement |
			self dataElementsValues at: 'lossyImageCompression' put: (self dataElementsDictionary removeKey: 'lossyImageCompression') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> lossyImageCompression: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'lossyImageCompression' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lossyImageCompression.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'lossyImageCompression' put: dataElement.
			self dataElementsValues removeKey: 'lossyImageCompression' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lossyImageCompression' put: aCSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> lowRRValue [

	^self dataElementsValues at: 'lowRRValue' ifAbsent: [
		self dataElementsDictionary at: 'lowRRValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'lowRRValue' put: (self dataElementsDictionary removeKey: 'lowRRValue') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> lowRRValue: aISValue [

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
USImageIOM >> mechanicalIndex [

	^self dataElementsValues at: 'mechanicalIndex' ifAbsent: [
		self dataElementsDictionary at: 'mechanicalIndex' ifPresent: [:dataElement |
			self dataElementsValues at: 'mechanicalIndex' put: (self dataElementsDictionary removeKey: 'mechanicalIndex') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> mechanicalIndex: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'mechanicalIndex' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #mechanicalIndex.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'mechanicalIndex' put: dataElement.
			self dataElementsValues removeKey: 'mechanicalIndex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'mechanicalIndex' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> nominalInterval [

	^self dataElementsValues at: 'nominalInterval' ifAbsent: [
		self dataElementsDictionary at: 'nominalInterval' ifPresent: [:dataElement |
			self dataElementsValues at: 'nominalInterval' put: (self dataElementsDictionary removeKey: 'nominalInterval') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> nominalInterval: aISValue [

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
USImageIOM >> numberOfEventTimers [

	^self dataElementsValues at: 'numberOfEventTimers' ifAbsent: [
		self dataElementsDictionary at: 'numberOfEventTimers' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfEventTimers' put: (self dataElementsDictionary removeKey: 'numberOfEventTimers') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> numberOfEventTimers: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfEventTimers' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfEventTimers.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfEventTimers' put: dataElement.
			self dataElementsValues removeKey: 'numberOfEventTimers' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfEventTimers' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> numberOfStages [

	^self dataElementsValues at: 'numberOfStages' ifAbsent: [
		self dataElementsDictionary at: 'numberOfStages' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfStages' put: (self dataElementsDictionary removeKey: 'numberOfStages') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> numberOfStages: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfStages' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfStages.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfStages' put: dataElement.
			self dataElementsValues removeKey: 'numberOfStages' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfStages' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> numberOfViewsInStage [

	^self dataElementsValues at: 'numberOfViewsInStage' ifAbsent: [
		self dataElementsDictionary at: 'numberOfViewsInStage' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfViewsInStage' put: (self dataElementsDictionary removeKey: 'numberOfViewsInStage') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> numberOfViewsInStage: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfViewsInStage' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfViewsInStage.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfViewsInStage' put: dataElement.
			self dataElementsValues removeKey: 'numberOfViewsInStage' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfViewsInStage' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> outputPower [

	^self dataElementsValues at: 'outputPower' ifAbsent: [
		self dataElementsDictionary at: 'outputPower' ifPresent: [:dataElement |
			self dataElementsValues at: 'outputPower' put: (self dataElementsDictionary removeKey: 'outputPower') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> outputPower: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'outputPower' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #outputPower.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'outputPower' put: dataElement.
			self dataElementsValues removeKey: 'outputPower' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'outputPower' put: aSHValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> overlaySubtype [

	^self dataElementsValues at: 'overlaySubtype' ifAbsent: [
		self dataElementsDictionary at: 'overlaySubtype' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlaySubtype' put: (self dataElementsDictionary removeKey: 'overlaySubtype') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> overlaySubtype: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlaySubtype' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlaySubtype.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'overlaySubtype' put: dataElement.
			self dataElementsValues removeKey: 'overlaySubtype' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlaySubtype' put: aLOValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> photometricInterpretation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #photometricInterpretation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'photometricInterpretation' put: dataElement.
			self dataElementsValues removeKey: 'photometricInterpretation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'photometricInterpretation' put: aCSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> pixelRepresentation [

	^self dataElementsValues at: 'pixelRepresentation' ifAbsent: [
		self dataElementsDictionary at: 'pixelRepresentation' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelRepresentation' put: (self dataElementsDictionary removeKey: 'pixelRepresentation') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> pixelRepresentation: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelRepresentation' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelRepresentation.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'pixelRepresentation' put: dataElement.
			self dataElementsValues removeKey: 'pixelRepresentation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelRepresentation' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> planarConfiguration [

	^self dataElementsValues at: 'planarConfiguration' ifAbsent: [
		self dataElementsDictionary at: 'planarConfiguration' ifPresent: [:dataElement |
			self dataElementsValues at: 'planarConfiguration' put: (self dataElementsDictionary removeKey: 'planarConfiguration') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> planarConfiguration: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'planarConfiguration' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #planarConfiguration.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'planarConfiguration' put: dataElement.
			self dataElementsValues removeKey: 'planarConfiguration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'planarConfiguration' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> preprocessingFunction [

	^self dataElementsValues at: 'processingFunction' ifAbsent: [
		self dataElementsDictionary at: 'processingFunction' ifPresent: [:dataElement |
			self dataElementsValues at: 'processingFunction' put: (self dataElementsDictionary removeKey: 'processingFunction') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> preprocessingFunction: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'processingFunction' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #processingFunction.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'processingFunction' put: dataElement.
			self dataElementsValues removeKey: 'processingFunction' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'processingFunction' put: aLOValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> primaryAnatomicStructureSequence [

	^self dataElementsValues at: 'primaryAnatomicStructureSequence' ifAbsent: [
		self dataElementsDictionary at: 'primaryAnatomicStructureSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'primaryAnatomicStructureSequence' put: (self dataElementsDictionary removeKey: 'primaryAnatomicStructureSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> primaryAnatomicStructureSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'primaryAnatomicStructureSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #primaryAnatomicStructureSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'primaryAnatomicStructureSequence' put: dataElement.
			self dataElementsValues removeKey: 'primaryAnatomicStructureSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'primaryAnatomicStructureSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> processingFunction [

	^self dataElementsValues at: 'processingFunction' ifAbsent: [
		self dataElementsDictionary at: 'processingFunction' ifPresent: [:dataElement |
			self dataElementsValues at: 'processingFunction' put: (self dataElementsDictionary removeKey: 'processingFunction') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> processingFunction: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'processingFunction' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #processingFunction.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'processingFunction' put: dataElement.
			self dataElementsValues removeKey: 'processingFunction' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'processingFunction' put: aLOValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> rETIRED_ImageTransformationMatrix [

	^self dataElementsValues at: 'rETIRED_ImageTransformationMatrix' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ImageTransformationMatrix' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ImageTransformationMatrix' put: (self dataElementsDictionary removeKey: 'rETIRED_ImageTransformationMatrix') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> rETIRED_ImageTransformationMatrix: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ImageTransformationMatrix' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ImageTransformationMatrix.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rETIRED_ImageTransformationMatrix' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ImageTransformationMatrix' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ImageTransformationMatrix' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> rETIRED_ImageTranslationVector [

	^self dataElementsValues at: 'rETIRED_ImageTranslationVector' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ImageTranslationVector' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ImageTranslationVector' put: (self dataElementsDictionary removeKey: 'rETIRED_ImageTranslationVector') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> rETIRED_ImageTranslationVector: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ImageTranslationVector' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ImageTranslationVector.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rETIRED_ImageTranslationVector' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ImageTranslationVector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ImageTranslationVector' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> rETIRED_ReferencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> rETIRED_ReferencedCurveSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedCurveSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedCurveSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> rETIRED_ReferencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> rETIRED_ReferencedOverlaySequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedOverlaySequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> rETIRED_TransducerOrientationSequence [

	^self dataElementsValues at: 'rETIRED_TransducerOrientationSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TransducerOrientationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TransducerOrientationSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_TransducerOrientationSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> rETIRED_TransducerOrientationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TransducerOrientationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TransducerOrientationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_TransducerOrientationSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TransducerOrientationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TransducerOrientationSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> rETIRED_TransducerPositionSequence [

	^self dataElementsValues at: 'rETIRED_TransducerPositionSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TransducerPositionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TransducerPositionSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_TransducerPositionSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> rETIRED_TransducerPositionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TransducerPositionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TransducerPositionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_TransducerPositionSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TransducerPositionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TransducerPositionSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> referencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> referencedCurveSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedCurveSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedCurveSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> referencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> referencedOverlaySequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_ReferencedOverlaySequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> referencedWaveformSequence [

	^self dataElementsValues at: 'referencedWaveformSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedWaveformSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedWaveformSequence' put: (self dataElementsDictionary removeKey: 'referencedWaveformSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> referencedWaveformSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedWaveformSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedWaveformSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedWaveformSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedWaveformSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedWaveformSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> samplesPerPixel [

	^self dataElementsValues at: 'samplesPerPixel' ifAbsent: [
		self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplesPerPixel' put: (self dataElementsDictionary removeKey: 'samplesPerPixel') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> samplesPerPixel: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #samplesPerPixel.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'samplesPerPixel' put: dataElement.
			self dataElementsValues removeKey: 'samplesPerPixel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'samplesPerPixel' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> softTissueFocusThermalIndex [

	^self dataElementsValues at: 'softTissueFocusThermalIndex' ifAbsent: [
		self dataElementsDictionary at: 'softTissueFocusThermalIndex' ifPresent: [:dataElement |
			self dataElementsValues at: 'softTissueFocusThermalIndex' put: (self dataElementsDictionary removeKey: 'softTissueFocusThermalIndex') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> softTissueFocusThermalIndex: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'softTissueFocusThermalIndex' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #softTissueFocusThermalIndex.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'softTissueFocusThermalIndex' put: dataElement.
			self dataElementsValues removeKey: 'softTissueFocusThermalIndex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'softTissueFocusThermalIndex' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> softTissueSurfaceThermalIndex [

	^self dataElementsValues at: 'softTissueSurfaceThermalIndex' ifAbsent: [
		self dataElementsDictionary at: 'softTissueSurfaceThermalIndex' ifPresent: [:dataElement |
			self dataElementsValues at: 'softTissueSurfaceThermalIndex' put: (self dataElementsDictionary removeKey: 'softTissueSurfaceThermalIndex') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> softTissueSurfaceThermalIndex: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'softTissueSurfaceThermalIndex' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #softTissueSurfaceThermalIndex.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'softTissueSurfaceThermalIndex' put: dataElement.
			self dataElementsValues removeKey: 'softTissueSurfaceThermalIndex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'softTissueSurfaceThermalIndex' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> softTissueThermalIndex [

	^self dataElementsValues at: 'softTissueThermalIndex' ifAbsent: [
		self dataElementsDictionary at: 'softTissueThermalIndex' ifPresent: [:dataElement |
			self dataElementsValues at: 'softTissueThermalIndex' put: (self dataElementsDictionary removeKey: 'softTissueThermalIndex') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> softTissueThermalIndex: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'softTissueThermalIndex' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #softTissueThermalIndex.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'softTissueThermalIndex' put: dataElement.
			self dataElementsValues removeKey: 'softTissueThermalIndex' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'softTissueThermalIndex' put: aDSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> stageCodeSequence [

	^self dataElementsValues at: 'stageCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'stageCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'stageCodeSequence' put: (self dataElementsDictionary removeKey: 'stageCodeSequence') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> stageCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'stageCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #stageCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'stageCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'stageCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'stageCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> stageName [

	^self dataElementsValues at: 'stageName' ifAbsent: [
		self dataElementsDictionary at: 'stageName' ifPresent: [:dataElement |
			self dataElementsValues at: 'stageName' put: (self dataElementsDictionary removeKey: 'stageName') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> stageName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'stageName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #stageName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'stageName' put: dataElement.
			self dataElementsValues removeKey: 'stageName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'stageName' put: aSHValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> stageNumber [

	^self dataElementsValues at: 'stageNumber' ifAbsent: [
		self dataElementsDictionary at: 'stageNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'stageNumber' put: (self dataElementsDictionary removeKey: 'stageNumber') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> stageNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'stageNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #stageNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'stageNumber' put: dataElement.
			self dataElementsValues removeKey: 'stageNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'stageNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> transducerData [

	^self dataElementsValues at: 'transducerData' ifAbsent: [
		self dataElementsDictionary at: 'transducerData' ifPresent: [:dataElement |
			self dataElementsValues at: 'transducerData' put: (self dataElementsDictionary removeKey: 'transducerData') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> transducerData: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'transducerData' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #transducerData.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'transducerData' put: dataElement.
			self dataElementsValues removeKey: 'transducerData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'transducerData' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> transducerOrientationSequence [

	^self dataElementsValues at: 'rETIRED_TransducerOrientationSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TransducerOrientationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TransducerOrientationSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_TransducerOrientationSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> transducerOrientationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TransducerOrientationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TransducerOrientationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_TransducerOrientationSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TransducerOrientationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TransducerOrientationSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> transducerPositionSequence [

	^self dataElementsValues at: 'rETIRED_TransducerPositionSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TransducerPositionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TransducerPositionSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_TransducerPositionSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USImageIOM >> transducerPositionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TransducerPositionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TransducerPositionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_TransducerPositionSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TransducerPositionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TransducerPositionSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> transducerType [

	^self dataElementsValues at: 'transducerType' ifAbsent: [
		self dataElementsDictionary at: 'transducerType' ifPresent: [:dataElement |
			self dataElementsValues at: 'transducerType' put: (self dataElementsDictionary removeKey: 'transducerType') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> transducerType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'transducerType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #transducerType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'transducerType' put: dataElement.
			self dataElementsValues removeKey: 'transducerType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'transducerType' put: aCSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> triggerTime [

	^self dataElementsValues at: 'triggerTime' ifAbsent: [
		self dataElementsDictionary at: 'triggerTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerTime' put: (self dataElementsDictionary removeKey: 'triggerTime') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> triggerTime: aDSValue [

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

{ #category : #accessing }
USImageIOM >> ultrasoundColorDataPresent [

	^self dataElementsValues at: 'ultrasoundColorDataPresent' ifAbsent: [
		self dataElementsDictionary at: 'ultrasoundColorDataPresent' ifPresent: [:dataElement |
			self dataElementsValues at: 'ultrasoundColorDataPresent' put: (self dataElementsDictionary removeKey: 'ultrasoundColorDataPresent') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> ultrasoundColorDataPresent: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'ultrasoundColorDataPresent' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #ultrasoundColorDataPresent.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'ultrasoundColorDataPresent' put: dataElement.
			self dataElementsValues removeKey: 'ultrasoundColorDataPresent' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'ultrasoundColorDataPresent' put: aUSValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> viewName [

	^self dataElementsValues at: 'viewName' ifAbsent: [
		self dataElementsDictionary at: 'viewName' ifPresent: [:dataElement |
			self dataElementsValues at: 'viewName' put: (self dataElementsDictionary removeKey: 'viewName') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> viewName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'viewName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #viewName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'viewName' put: dataElement.
			self dataElementsValues removeKey: 'viewName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'viewName' put: aSHValue
		]
	].

]

{ #category : #accessing }
USImageIOM >> viewNumber [

	^self dataElementsValues at: 'viewNumber' ifAbsent: [
		self dataElementsDictionary at: 'viewNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'viewNumber' put: (self dataElementsDictionary removeKey: 'viewNumber') value.
		]
	]

]

{ #category : #accessing }
USImageIOM >> viewNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'viewNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #viewNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'viewNumber' put: dataElement.
			self dataElementsValues removeKey: 'viewNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'viewNumber' put: aISValue
		]
	].

]
