Class {
	#name : #UltrasoundRegionsSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
UltrasoundRegionsSequenceItem class >> initialize [
	"DICOM Ultrasound Regions Sequence Item data elements definition

	PRD 05.2002 - -02.2017"

	self resetDataElements.
	Name := 'DICOM Ultrasound Regions Sequence Item'.
	SequenceName := 'ultrasoundRegionsSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0018 16r6011).

	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMinX0
				tag: #(16r0018 16r6018)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMinY0
				tag: #(16r0018 16r601A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMaxX1
				tag: #(16r0018 16r601C)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMaxY1
				tag: #(16r0018 16r601E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #physicalUnitsXDirection
				tag: #(16r0018 16r6024)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #physicalUnitsYDirection
				tag: #(16r0018 16r6026)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(FDDataElement
				newWith: #physicalDeltaX
				tag: #(16r0018 16r602C)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(FDDataElement
				newWith: #physicalDeltaY
				tag: #(16r0018 16r602E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SLDataElement
				newWith: #referencePixelX0
				tag: #(16r0018 16r6020)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SLDataElement
				newWith: #referencePixelY0
				tag: #(16r0018 16r6022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(FDDataElement
				newWith: #referencePixelPhysicalValueX
				tag: #(16r0018 16r6028)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(FDDataElement
				newWith: #referencePixelPhysicalValueY
				tag: #(16r0018 16r602A)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #regionSpatialFormat
				tag: #(16r0018 16r6012)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #regionDataType
				tag: #(16r0018 16r6014)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionFlags
				tag: #(16r0018 16r6016)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #pixelComponentOrganization
				tag: #(16r0018 16r6044)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #pixelComponentMask
				tag: #(16r0018 16r6046)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #pixelComponentRangeStart
				tag: #(16r0018 16r6048)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #pixelComponentRangeStop
				tag: #(16r0018 16r604A)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #pixelComponentPhysicalUnits
				tag: #(16r0018 16r604C)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #pixelComponentDataType
				tag: #(16r0018 16r604E)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #numberOfTableBreakPoints
				tag: #(16r0018 16r6050)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #tableOfXBreakPoints
				tag: #(16r0018 16r6052)
				vm: '1-n'
				type: '1C').	"VM=1-n"
	self
		addDataElement:
			(FDDataElement
				newWith: #tableOfYBreakPoints
				tag: #(16r0018 16r6054)
				vm: '1-n'
				type: '1C').	"VM=1-n"
	self
		addDataElement:
			(ULDataElement
				newWith: #numberOfTableEntries
				tag: #(16r0018 16r6056)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ULDataElement
				newWith: #tableOfPixelValues
				tag: #(16r0018 16r6058)
				vm: '1-n'
				type: '1C').	"VM=1-n"
	self
		addDataElement:
			(FLDataElement
				newWith: #tableOfParameterValues
				tag: #(16r0018 16r605A)
				vm: '1-n'
				type: '1C').	"VM=1-n"
	self
		addDataElement:
			(ULDataElement
				newWith: #transducerFrequency
				tag: #(16r0018 16r6030)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #pulseRepetitionFrequency
				tag: #(16r0018 16r6032)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(FDDataElement
				newWith: #dopplerCorrectionAngle
				tag: #(16r0018 16r6034)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(FDDataElement
				newWith: #steeringAngle
				tag: #(16r0018 16r6036)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #dopplerSampleVolumeXPosition
				tag: #(16r0018 16r6038)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #dopplerSampleVolumeYPosition
				tag: #(16r0018 16r603A)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #tmLinePositionX0
				tag: #(16r0018 16r603C)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #tmLinePositionY0
				tag: #(16r0018 16r603E)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #tmLinePositionX1
				tag: #(16r0018 16r6040)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ULDataElement
				newWith: #tmLinePositionY1
				tag: #(16r0018 16r6042)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> dopplerCorrectionAngle [

	^self dataElementsValues at: 'dopplerCorrectionAngle' ifAbsent: [
		self dataElementsDictionary at: 'dopplerCorrectionAngle' ifPresent: [:dataElement |
			self dataElementsValues at: 'dopplerCorrectionAngle' put: (self dataElementsDictionary removeKey: 'dopplerCorrectionAngle') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> dopplerCorrectionAngle: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'dopplerCorrectionAngle' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dopplerCorrectionAngle.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'dopplerCorrectionAngle' put: dataElement.
			self dataElementsValues removeKey: 'dopplerCorrectionAngle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dopplerCorrectionAngle' put: aFDValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> dopplerSampleVolumeXPosition [

	^self dataElementsValues at: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeXPositionRetired' put: (self dataElementsDictionary removeKey: 'rETIRED_DopplerSampleVolumeXPositionRetired') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> dopplerSampleVolumeXPosition: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_DopplerSampleVolumeXPositionRetired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeXPositionRetired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeXPositionRetired' put: aULValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> dopplerSampleVolumeYPosition [

	^self dataElementsValues at: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeYPositionRetired' put: (self dataElementsDictionary removeKey: 'rETIRED_DopplerSampleVolumeYPositionRetired') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> dopplerSampleVolumeYPosition: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_DopplerSampleVolumeYPositionRetired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeYPositionRetired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeYPositionRetired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> numberOfTableBreakPoints [

	^self dataElementsValues at: 'numberOfTableBreakPoints' ifAbsent: [
		self dataElementsDictionary at: 'numberOfTableBreakPoints' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfTableBreakPoints' put: (self dataElementsDictionary removeKey: 'numberOfTableBreakPoints') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> numberOfTableBreakPoints: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfTableBreakPoints' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfTableBreakPoints.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'numberOfTableBreakPoints' put: dataElement.
			self dataElementsValues removeKey: 'numberOfTableBreakPoints' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfTableBreakPoints' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> numberOfTableEntries [

	^self dataElementsValues at: 'numberOfTableEntries' ifAbsent: [
		self dataElementsDictionary at: 'numberOfTableEntries' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfTableEntries' put: (self dataElementsDictionary removeKey: 'numberOfTableEntries') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> numberOfTableEntries: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfTableEntries' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfTableEntries.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'numberOfTableEntries' put: dataElement.
			self dataElementsValues removeKey: 'numberOfTableEntries' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfTableEntries' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalDeltaX [

	^self dataElementsValues at: 'physicalDeltaX' ifAbsent: [
		self dataElementsDictionary at: 'physicalDeltaX' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalDeltaX' put: (self dataElementsDictionary removeKey: 'physicalDeltaX') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalDeltaX: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalDeltaX' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalDeltaX.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'physicalDeltaX' put: dataElement.
			self dataElementsValues removeKey: 'physicalDeltaX' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalDeltaX' put: aFDValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalDeltaY [

	^self dataElementsValues at: 'physicalDeltaY' ifAbsent: [
		self dataElementsDictionary at: 'physicalDeltaY' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalDeltaY' put: (self dataElementsDictionary removeKey: 'physicalDeltaY') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalDeltaY: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalDeltaY' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalDeltaY.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'physicalDeltaY' put: dataElement.
			self dataElementsValues removeKey: 'physicalDeltaY' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalDeltaY' put: aFDValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalUnitsXDirection [

	^self dataElementsValues at: 'physicalUnitsXDirection' ifAbsent: [
		self dataElementsDictionary at: 'physicalUnitsXDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalUnitsXDirection' put: (self dataElementsDictionary removeKey: 'physicalUnitsXDirection') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalUnitsXDirection: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalUnitsXDirection' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalUnitsXDirection.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'physicalUnitsXDirection' put: dataElement.
			self dataElementsValues removeKey: 'physicalUnitsXDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalUnitsXDirection' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalUnitsYDirection [

	^self dataElementsValues at: 'physicalUnitsYDirection' ifAbsent: [
		self dataElementsDictionary at: 'physicalUnitsYDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalUnitsYDirection' put: (self dataElementsDictionary removeKey: 'physicalUnitsYDirection') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> physicalUnitsYDirection: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalUnitsYDirection' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalUnitsYDirection.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'physicalUnitsYDirection' put: dataElement.
			self dataElementsValues removeKey: 'physicalUnitsYDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalUnitsYDirection' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentDataType [

	^self dataElementsValues at: 'pixelComponentDataType' ifAbsent: [
		self dataElementsDictionary at: 'pixelComponentDataType' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelComponentDataType' put: (self dataElementsDictionary removeKey: 'pixelComponentDataType') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentDataType: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelComponentDataType' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelComponentDataType.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'pixelComponentDataType' put: dataElement.
			self dataElementsValues removeKey: 'pixelComponentDataType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelComponentDataType' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentMask [

	^self dataElementsValues at: 'pixelComponentMask' ifAbsent: [
		self dataElementsDictionary at: 'pixelComponentMask' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelComponentMask' put: (self dataElementsDictionary removeKey: 'pixelComponentMask') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentMask: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelComponentMask' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelComponentMask.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'pixelComponentMask' put: dataElement.
			self dataElementsValues removeKey: 'pixelComponentMask' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelComponentMask' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentOrganization [

	^self dataElementsValues at: 'pixelComponentOrganization' ifAbsent: [
		self dataElementsDictionary at: 'pixelComponentOrganization' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelComponentOrganization' put: (self dataElementsDictionary removeKey: 'pixelComponentOrganization') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentOrganization: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelComponentOrganization' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelComponentOrganization.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'pixelComponentOrganization' put: dataElement.
			self dataElementsValues removeKey: 'pixelComponentOrganization' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelComponentOrganization' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentPhysicalUnits [

	^self dataElementsValues at: 'pixelComponentPhysicalUnits' ifAbsent: [
		self dataElementsDictionary at: 'pixelComponentPhysicalUnits' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelComponentPhysicalUnits' put: (self dataElementsDictionary removeKey: 'pixelComponentPhysicalUnits') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentPhysicalUnits: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelComponentPhysicalUnits' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelComponentPhysicalUnits.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'pixelComponentPhysicalUnits' put: dataElement.
			self dataElementsValues removeKey: 'pixelComponentPhysicalUnits' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelComponentPhysicalUnits' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentRangeStart [

	^self dataElementsValues at: 'pixelComponentRangeStart' ifAbsent: [
		self dataElementsDictionary at: 'pixelComponentRangeStart' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelComponentRangeStart' put: (self dataElementsDictionary removeKey: 'pixelComponentRangeStart') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentRangeStart: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelComponentRangeStart' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelComponentRangeStart.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'pixelComponentRangeStart' put: dataElement.
			self dataElementsValues removeKey: 'pixelComponentRangeStart' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelComponentRangeStart' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentRangeStop [

	^self dataElementsValues at: 'pixelComponentRangeStop' ifAbsent: [
		self dataElementsDictionary at: 'pixelComponentRangeStop' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelComponentRangeStop' put: (self dataElementsDictionary removeKey: 'pixelComponentRangeStop') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pixelComponentRangeStop: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelComponentRangeStop' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelComponentRangeStop.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'pixelComponentRangeStop' put: dataElement.
			self dataElementsValues removeKey: 'pixelComponentRangeStop' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelComponentRangeStop' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pulseRepetitionFrequency [

	^self dataElementsValues at: 'pulseRepetitionFrequency' ifAbsent: [
		self dataElementsDictionary at: 'pulseRepetitionFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'pulseRepetitionFrequency' put: (self dataElementsDictionary removeKey: 'pulseRepetitionFrequency') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> pulseRepetitionFrequency: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'pulseRepetitionFrequency' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pulseRepetitionFrequency.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'pulseRepetitionFrequency' put: dataElement.
			self dataElementsValues removeKey: 'pulseRepetitionFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pulseRepetitionFrequency' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_DopplerSampleVolumeXPositionRetired [

	^self dataElementsValues at: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeXPositionRetired' put: (self dataElementsDictionary removeKey: 'rETIRED_DopplerSampleVolumeXPositionRetired') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_DopplerSampleVolumeXPositionRetired: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_DopplerSampleVolumeXPositionRetired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeXPositionRetired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_DopplerSampleVolumeXPositionRetired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeXPositionRetired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_DopplerSampleVolumeYPositionRetired [

	^self dataElementsValues at: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeYPositionRetired' put: (self dataElementsDictionary removeKey: 'rETIRED_DopplerSampleVolumeYPositionRetired') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_DopplerSampleVolumeYPositionRetired: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_DopplerSampleVolumeYPositionRetired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_DopplerSampleVolumeYPositionRetired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_DopplerSampleVolumeYPositionRetired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_DopplerSampleVolumeYPositionRetired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionX0Retired [

	^self dataElementsValues at: 'rETIRED_TMLinePositionX0Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionX0Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionX0Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionX0Retired') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionX0Retired: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionX0Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionX0Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionX0Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionX0Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionX0Retired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionX1Retired [

	^self dataElementsValues at: 'rETIRED_TMLinePositionX1Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionX1Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionX1Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionX1Retired') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionX1Retired: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionX1Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionX1Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionX1Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionX1Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionX1Retired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionY0Retired [

	^self dataElementsValues at: 'rETIRED_TMLinePositionY0Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionY0Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionY0Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionY0Retired') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionY0Retired: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionY0Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionY0Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionY0Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionY0Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionY0Retired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionY1Retired [

	^self dataElementsValues at: 'rETIRED_TMLinePositionY1Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionY1Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionY1Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionY1Retired') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> rETIRED_TMLinePositionY1Retired: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionY1Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionY1Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionY1Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionY1Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionY1Retired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelPhysicalValueX [

	^self dataElementsValues at: 'referencePixelPhysicalValueX' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelPhysicalValueX' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelPhysicalValueX' put: (self dataElementsDictionary removeKey: 'referencePixelPhysicalValueX') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelPhysicalValueX: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelPhysicalValueX' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelPhysicalValueX.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'referencePixelPhysicalValueX' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelPhysicalValueX' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelPhysicalValueX' put: aFDValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelPhysicalValueY [

	^self dataElementsValues at: 'referencePixelPhysicalValueY' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelPhysicalValueY' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelPhysicalValueY' put: (self dataElementsDictionary removeKey: 'referencePixelPhysicalValueY') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelPhysicalValueY: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelPhysicalValueY' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelPhysicalValueY.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'referencePixelPhysicalValueY' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelPhysicalValueY' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelPhysicalValueY' put: aFDValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelX0 [

	^self dataElementsValues at: 'referencePixelX0' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelX0' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelX0' put: (self dataElementsDictionary removeKey: 'referencePixelX0') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelX0: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelX0' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelX0.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'referencePixelX0' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelX0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelX0' put: aSLValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelY0 [

	^self dataElementsValues at: 'referencePixelY0' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelY0' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelY0' put: (self dataElementsDictionary removeKey: 'referencePixelY0') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> referencePixelY0: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelY0' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelY0.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'referencePixelY0' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelY0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelY0' put: aSLValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionDataType [

	^self dataElementsValues at: 'regionDataType' ifAbsent: [
		self dataElementsDictionary at: 'regionDataType' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionDataType' put: (self dataElementsDictionary removeKey: 'regionDataType') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionDataType: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionDataType' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionDataType.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'regionDataType' put: dataElement.
			self dataElementsValues removeKey: 'regionDataType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionDataType' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionFlags [

	^self dataElementsValues at: 'regionFlags' ifAbsent: [
		self dataElementsDictionary at: 'regionFlags' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionFlags' put: (self dataElementsDictionary removeKey: 'regionFlags') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionFlags: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionFlags' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionFlags.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionFlags' put: dataElement.
			self dataElementsValues removeKey: 'regionFlags' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionFlags' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMaxX1 [

	^self dataElementsValues at: 'regionLocationMaxX1' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMaxX1' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMaxX1' put: (self dataElementsDictionary removeKey: 'regionLocationMaxX1') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMaxX1: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMaxX1' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMaxX1.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMaxX1' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMaxX1' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMaxX1' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMaxY1 [

	^self dataElementsValues at: 'regionLocationMaxY1' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMaxY1' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMaxY1' put: (self dataElementsDictionary removeKey: 'regionLocationMaxY1') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMaxY1: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMaxY1' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMaxY1.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMaxY1' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMaxY1' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMaxY1' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMinX0 [

	^self dataElementsValues at: 'regionLocationMinX0' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMinX0' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMinX0' put: (self dataElementsDictionary removeKey: 'regionLocationMinX0') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMinX0: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMinX0' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMinX0.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMinX0' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMinX0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMinX0' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMinY0 [

	^self dataElementsValues at: 'regionLocationMinY0' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMinY0' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMinY0' put: (self dataElementsDictionary removeKey: 'regionLocationMinY0') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionLocationMinY0: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMinY0' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMinY0.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMinY0' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMinY0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMinY0' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionSpatialFormat [

	^self dataElementsValues at: 'regionSpatialFormat' ifAbsent: [
		self dataElementsDictionary at: 'regionSpatialFormat' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionSpatialFormat' put: (self dataElementsDictionary removeKey: 'regionSpatialFormat') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> regionSpatialFormat: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionSpatialFormat' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionSpatialFormat.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'regionSpatialFormat' put: dataElement.
			self dataElementsValues removeKey: 'regionSpatialFormat' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionSpatialFormat' put: aUSValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> steeringAngle [

	^self dataElementsValues at: 'steeringAngle' ifAbsent: [
		self dataElementsDictionary at: 'steeringAngle' ifPresent: [:dataElement |
			self dataElementsValues at: 'steeringAngle' put: (self dataElementsDictionary removeKey: 'steeringAngle') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> steeringAngle: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'steeringAngle' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #steeringAngle.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'steeringAngle' put: dataElement.
			self dataElementsValues removeKey: 'steeringAngle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'steeringAngle' put: aFDValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfParameterValues [

	^self dataElementsValues at: 'tableOfParameterValues' ifAbsent: [
		self dataElementsDictionary at: 'tableOfParameterValues' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableOfParameterValues' put: (self dataElementsDictionary removeKey: 'tableOfParameterValues') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfParameterValues: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableOfParameterValues' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableOfParameterValues.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'tableOfParameterValues' put: dataElement.
			self dataElementsValues removeKey: 'tableOfParameterValues' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableOfParameterValues' put: aFLValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfPixelValues [

	^self dataElementsValues at: 'tableOfPixelValues' ifAbsent: [
		self dataElementsDictionary at: 'tableOfPixelValues' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableOfPixelValues' put: (self dataElementsDictionary removeKey: 'tableOfPixelValues') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfPixelValues: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableOfPixelValues' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableOfPixelValues.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'tableOfPixelValues' put: dataElement.
			self dataElementsValues removeKey: 'tableOfPixelValues' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableOfPixelValues' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfXBreakPoints [

	^self dataElementsValues at: 'tableOfXBreakPoints' ifAbsent: [
		self dataElementsDictionary at: 'tableOfXBreakPoints' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableOfXBreakPoints' put: (self dataElementsDictionary removeKey: 'tableOfXBreakPoints') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfXBreakPoints: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableOfXBreakPoints' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableOfXBreakPoints.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'tableOfXBreakPoints' put: dataElement.
			self dataElementsValues removeKey: 'tableOfXBreakPoints' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableOfXBreakPoints' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfYBreakPoints [

	^self dataElementsValues at: 'tableOfYBreakPoints' ifAbsent: [
		self dataElementsDictionary at: 'tableOfYBreakPoints' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableOfYBreakPoints' put: (self dataElementsDictionary removeKey: 'tableOfYBreakPoints') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> tableOfYBreakPoints: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableOfYBreakPoints' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableOfYBreakPoints.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'tableOfYBreakPoints' put: dataElement.
			self dataElementsValues removeKey: 'tableOfYBreakPoints' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableOfYBreakPoints' put: aFDValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionX0 [

	^self dataElementsValues at: 'rETIRED_TMLinePositionX0Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionX0Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionX0Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionX0Retired') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionX0: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionX0Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionX0Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionX0Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionX0Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionX0Retired' put: aULValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionX1 [

	^self dataElementsValues at: 'rETIRED_TMLinePositionX1Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionX1Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionX1Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionX1Retired') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionX1: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionX1Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionX1Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionX1Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionX1Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionX1Retired' put: aULValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionY0 [

	^self dataElementsValues at: 'rETIRED_TMLinePositionY0Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionY0Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionY0Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionY0Retired') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionY0: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionY0Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionY0Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionY0Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionY0Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionY0Retired' put: aULValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionY1 [

	^self dataElementsValues at: 'rETIRED_TMLinePositionY1Retired' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TMLinePositionY1Retired' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TMLinePositionY1Retired' put: (self dataElementsDictionary removeKey: 'rETIRED_TMLinePositionY1Retired') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
UltrasoundRegionsSequenceItem >> tmLinePositionY1: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TMLinePositionY1Retired' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TMLinePositionY1Retired.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'rETIRED_TMLinePositionY1Retired' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TMLinePositionY1Retired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TMLinePositionY1Retired' put: aULValue
		]
	].

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> transducerFrequency [

	^self dataElementsValues at: 'transducerFrequency' ifAbsent: [
		self dataElementsDictionary at: 'transducerFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'transducerFrequency' put: (self dataElementsDictionary removeKey: 'transducerFrequency') value.
		]
	]

]

{ #category : #accessing }
UltrasoundRegionsSequenceItem >> transducerFrequency: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'transducerFrequency' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #transducerFrequency.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'transducerFrequency' put: dataElement.
			self dataElementsValues removeKey: 'transducerFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'transducerFrequency' put: aULValue
		]
	].

]
