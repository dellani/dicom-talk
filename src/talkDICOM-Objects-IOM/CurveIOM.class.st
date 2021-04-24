Class {
	#name : #CurveIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
CurveIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Curve Information Object Module
	PS 3.3-2001 Annex C.10.2 - PRD 05.2002"

	self resetDataElements.
	Name := 'Curve Information Object Module'.
	moduleName := 'curveIOM'.
	self
		addDataElement:
			(USDataElement
				newWith: #curveDimensions
				tag: #(16r5000 16r0005)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #numberOfPoints
				tag: #(16r5000 16r0010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #typeOfData
				tag: #(16r5000 16r0020)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #dataValueRepresentation
				tag: #(16r5000 16r0103)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(OWDataElement
				newWith: #curveData
				tag: #(16r5000 16r3000)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(LODataElement
				newWith: #curveDescription
				tag: #(16r5000 16r0022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #axisUnits
				tag: #(16r5000 16r0030)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #axisLabels
				tag: #(16r5000 16r0040)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #minimumCoordinateValue
				tag: #(16r5000 16r0104)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #maximumCoordinateValue
				tag: #(16r5000 16r0105)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #curveRange
				tag: #(16r5000 16r0106)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #curveDataDescriptor
				tag: #(16r5000 16r0110)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #coordinateStartValue
				tag: #(16r5000 16r0112)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #coordinateStepValue
				tag: #(16r5000 16r0114)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #curveLabel
				tag: #(16r5000 16r2500)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedOverlaySequence
				tag: #(16r0008 16r1130)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedOverlaySequenceItem)
]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> axisLabels [

	^self dataElementsValues at: 'rETIRED_AxisLabels' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AxisLabels' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AxisLabels' put: (self dataElementsDictionary removeKey: 'rETIRED_AxisLabels') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> axisLabels: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AxisLabels' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AxisLabels.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'rETIRED_AxisLabels' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AxisLabels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AxisLabels' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> axisUnits [

	^self dataElementsValues at: 'rETIRED_AxisUnits' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AxisUnits' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AxisUnits' put: (self dataElementsDictionary removeKey: 'rETIRED_AxisUnits') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> axisUnits: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AxisUnits' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AxisUnits.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'rETIRED_AxisUnits' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AxisUnits' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AxisUnits' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> coordinateStartValue [

	^self dataElementsValues at: 'rETIRED_CoordinateStartValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CoordinateStartValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CoordinateStartValue' put: (self dataElementsDictionary removeKey: 'rETIRED_CoordinateStartValue') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> coordinateStartValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CoordinateStartValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CoordinateStartValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CoordinateStartValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CoordinateStartValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CoordinateStartValue' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> coordinateStepValue [

	^self dataElementsValues at: 'rETIRED_CoordinateStepValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CoordinateStepValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CoordinateStepValue' put: (self dataElementsDictionary removeKey: 'rETIRED_CoordinateStepValue') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> coordinateStepValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CoordinateStepValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CoordinateStepValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CoordinateStepValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CoordinateStepValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CoordinateStepValue' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveData [

	^self dataElementsValues at: 'rETIRED_CurveData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveData' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'rETIRED_CurveData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveData' put: aOWValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveDataDescriptor [

	^self dataElementsValues at: 'rETIRED_CurveDataDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDataDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDataDescriptor' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDataDescriptor') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveDataDescriptor: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDataDescriptor' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDataDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CurveDataDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDataDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDataDescriptor' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveDescription [

	^self dataElementsValues at: 'rETIRED_CurveDescription' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDescription' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDescription') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_CurveDescription' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDescription' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveDimensions [

	^self dataElementsValues at: 'rETIRED_CurveDimensions' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDimensions' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDimensions' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDimensions') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveDimensions: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDimensions' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDimensions.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CurveDimensions' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDimensions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDimensions' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveLabel [

	^self dataElementsValues at: 'rETIRED_CurveLabel' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveLabel' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveLabel') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveLabel: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveLabel' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveLabel.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_CurveLabel' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveLabel' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveRange [

	^self dataElementsValues at: 'rETIRED_CurveRange' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveRange' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveRange' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveRange') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> curveRange: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveRange' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveRange.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'rETIRED_CurveRange' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveRange' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveRange' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> dataValueRepresentation [

	^self dataElementsValues at: 'rETIRED_DataValueRepresentation' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_DataValueRepresentation' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_DataValueRepresentation' put: (self dataElementsDictionary removeKey: 'rETIRED_DataValueRepresentation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> dataValueRepresentation: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_DataValueRepresentation' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_DataValueRepresentation.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_DataValueRepresentation' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_DataValueRepresentation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_DataValueRepresentation' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> maximumCoordinateValue [

	^self dataElementsValues at: 'rETIRED_MaximumCoordinateValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_MaximumCoordinateValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_MaximumCoordinateValue' put: (self dataElementsDictionary removeKey: 'rETIRED_MaximumCoordinateValue') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> maximumCoordinateValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_MaximumCoordinateValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_MaximumCoordinateValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_MaximumCoordinateValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_MaximumCoordinateValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_MaximumCoordinateValue' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> minimumCoordinateValue [

	^self dataElementsValues at: 'rETIRED_MinimumCoordinateValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_MinimumCoordinateValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_MinimumCoordinateValue' put: (self dataElementsDictionary removeKey: 'rETIRED_MinimumCoordinateValue') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> minimumCoordinateValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_MinimumCoordinateValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_MinimumCoordinateValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_MinimumCoordinateValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_MinimumCoordinateValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_MinimumCoordinateValue' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> numberOfPoints [

	^self dataElementsValues at: 'rETIRED_NumberOfPoints' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_NumberOfPoints' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_NumberOfPoints' put: (self dataElementsDictionary removeKey: 'rETIRED_NumberOfPoints') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> numberOfPoints: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_NumberOfPoints' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_NumberOfPoints.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_NumberOfPoints' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_NumberOfPoints' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_NumberOfPoints' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_AxisLabels [

	^self dataElementsValues at: 'rETIRED_AxisLabels' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AxisLabels' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AxisLabels' put: (self dataElementsDictionary removeKey: 'rETIRED_AxisLabels') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_AxisLabels: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AxisLabels' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AxisLabels.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'rETIRED_AxisLabels' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AxisLabels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AxisLabels' put: aSHValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_AxisUnits [

	^self dataElementsValues at: 'rETIRED_AxisUnits' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_AxisUnits' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_AxisUnits' put: (self dataElementsDictionary removeKey: 'rETIRED_AxisUnits') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_AxisUnits: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_AxisUnits' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_AxisUnits.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'rETIRED_AxisUnits' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_AxisUnits' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_AxisUnits' put: aSHValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CoordinateStartValue [

	^self dataElementsValues at: 'rETIRED_CoordinateStartValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CoordinateStartValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CoordinateStartValue' put: (self dataElementsDictionary removeKey: 'rETIRED_CoordinateStartValue') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CoordinateStartValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CoordinateStartValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CoordinateStartValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CoordinateStartValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CoordinateStartValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CoordinateStartValue' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CoordinateStepValue [

	^self dataElementsValues at: 'rETIRED_CoordinateStepValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CoordinateStepValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CoordinateStepValue' put: (self dataElementsDictionary removeKey: 'rETIRED_CoordinateStepValue') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CoordinateStepValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CoordinateStepValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CoordinateStepValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CoordinateStepValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CoordinateStepValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CoordinateStepValue' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveData [

	^self dataElementsValues at: 'rETIRED_CurveData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveData' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveData') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveData: aUNValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveData' ifPresent: [:aDataElement | aDataElement value: aUNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveData.
			dataElement encoder: self encoder.
			dataElement value: aUNValue.
			self dataElementsDictionary at: 'rETIRED_CurveData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveData' put: aUNValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveDataDescriptor [

	^self dataElementsValues at: 'rETIRED_CurveDataDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDataDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDataDescriptor' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDataDescriptor') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveDataDescriptor: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDataDescriptor' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDataDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CurveDataDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDataDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDataDescriptor' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveDescription [

	^self dataElementsValues at: 'rETIRED_CurveDescription' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDescription' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDescription') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_CurveDescription' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveDimensions [

	^self dataElementsValues at: 'rETIRED_CurveDimensions' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDimensions' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDimensions' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDimensions') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveDimensions: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDimensions' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDimensions.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_CurveDimensions' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDimensions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDimensions' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveLabel [

	^self dataElementsValues at: 'rETIRED_CurveLabel' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveLabel' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveLabel') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveLabel: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveLabel' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveLabel.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_CurveLabel' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveLabel' put: aLOValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveRange [

	^self dataElementsValues at: 'rETIRED_CurveRange' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveRange' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveRange' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveRange') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_CurveRange: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveRange' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveRange.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'rETIRED_CurveRange' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveRange' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveRange' put: aSHValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_DataValueRepresentation [

	^self dataElementsValues at: 'rETIRED_DataValueRepresentation' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_DataValueRepresentation' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_DataValueRepresentation' put: (self dataElementsDictionary removeKey: 'rETIRED_DataValueRepresentation') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_DataValueRepresentation: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_DataValueRepresentation' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_DataValueRepresentation.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_DataValueRepresentation' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_DataValueRepresentation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_DataValueRepresentation' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_MaximumCoordinateValue [

	^self dataElementsValues at: 'rETIRED_MaximumCoordinateValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_MaximumCoordinateValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_MaximumCoordinateValue' put: (self dataElementsDictionary removeKey: 'rETIRED_MaximumCoordinateValue') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_MaximumCoordinateValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_MaximumCoordinateValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_MaximumCoordinateValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_MaximumCoordinateValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_MaximumCoordinateValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_MaximumCoordinateValue' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_MinimumCoordinateValue [

	^self dataElementsValues at: 'rETIRED_MinimumCoordinateValue' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_MinimumCoordinateValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_MinimumCoordinateValue' put: (self dataElementsDictionary removeKey: 'rETIRED_MinimumCoordinateValue') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_MinimumCoordinateValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_MinimumCoordinateValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_MinimumCoordinateValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_MinimumCoordinateValue' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_MinimumCoordinateValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_MinimumCoordinateValue' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_NumberOfPoints [

	^self dataElementsValues at: 'rETIRED_NumberOfPoints' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_NumberOfPoints' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_NumberOfPoints' put: (self dataElementsDictionary removeKey: 'rETIRED_NumberOfPoints') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_NumberOfPoints: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_NumberOfPoints' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_NumberOfPoints.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rETIRED_NumberOfPoints' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_NumberOfPoints' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_NumberOfPoints' put: aUSValue
		]
	].

]

{ #category : #accessing }
CurveIOM >> rETIRED_ReferencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_ReferencedOverlaySequence: aSQValue [

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
CurveIOM >> rETIRED_TypeOfData [

	^self dataElementsValues at: 'rETIRED_TypeOfData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TypeOfData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TypeOfData' put: (self dataElementsDictionary removeKey: 'rETIRED_TypeOfData') value.
		]
	]

]

{ #category : #accessing }
CurveIOM >> rETIRED_TypeOfData: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TypeOfData' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TypeOfData.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rETIRED_TypeOfData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TypeOfData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TypeOfData' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> referencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> referencedOverlaySequence: aSQValue [

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

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> typeOfData [

	^self dataElementsValues at: 'rETIRED_TypeOfData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TypeOfData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TypeOfData' put: (self dataElementsDictionary removeKey: 'rETIRED_TypeOfData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIOM >> typeOfData: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TypeOfData' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TypeOfData.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rETIRED_TypeOfData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TypeOfData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TypeOfData' put: aCSValue
		]
	].

]
