Class {
	#name : #DetectorInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
DetectorInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Detector Information Sequence Item'.
	SequenceName := 'detectorInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(DSDataElement
				newWith: #distanceSourceToDetector
				tag: #(16r18 16r1110)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #gantryDetectorTilt
				tag: #(16r18 16r1120)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #radialPosition
				tag: #(16r18 16r1142)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #centerOfRorationOffset
				tag: #(16r18 16r1145)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #fieldOfViewShape
				tag: #(16r18 16r1147)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #fieldOfViewDimensions
				tag: #(16r18 16r1149)
				vm: '1-2'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #collimatorGridName
				tag: #(16r18 16r1180)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #collimatorType
				tag: #(16r18 16r1181)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(ISDataElement
				newWith: #focalDistance
				tag: #(16r18 16r1182)
				vm: '1-2'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #xFocusCenter
				tag: #(16r18 16r1183)
				vm: '1-2'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #yFocusCenter
				tag: #(16r18 16r1184)
				vm: '1-2'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #imagePositionPatient
				tag: #(16r20 16r32)
				vm: '3'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #imageOrientationPatient
				tag: #(16r20 16r37)
				vm: '6'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #zoomFactor
				tag: #(16r28 16r31)
				vm: '2'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #zoomCenter
				tag: #(16r28 16r32)
				vm: '2'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #startAngle
				tag: #(16r54 16r200)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #viewCodeSequence
				tag: #(16r54 16r220)
				vm: '1'
				type: '3'
				sequenceItemClass: ViewCodeSequenceItem)
]

{ #category : #'accessing - talkDICOM names' }
DetectorInformationSequenceItem >> centerOfRorationOffset [

	^self dataElementsValues at: 'centerOfRotationOffset' ifAbsent: [
		self dataElementsDictionary at: 'centerOfRotationOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'centerOfRotationOffset' put: (self dataElementsDictionary removeKey: 'centerOfRotationOffset') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
DetectorInformationSequenceItem >> centerOfRorationOffset: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'centerOfRotationOffset' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #centerOfRotationOffset.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'centerOfRotationOffset' put: dataElement.
			self dataElementsValues removeKey: 'centerOfRotationOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'centerOfRotationOffset' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> centerOfRotationOffset [

	^self dataElementsValues at: 'centerOfRotationOffset' ifAbsent: [
		self dataElementsDictionary at: 'centerOfRotationOffset' ifPresent: [:dataElement |
			self dataElementsValues at: 'centerOfRotationOffset' put: (self dataElementsDictionary removeKey: 'centerOfRotationOffset') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> centerOfRotationOffset: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'centerOfRotationOffset' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #centerOfRotationOffset.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'centerOfRotationOffset' put: dataElement.
			self dataElementsValues removeKey: 'centerOfRotationOffset' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'centerOfRotationOffset' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> collimatorGridName [

	^self dataElementsValues at: 'collimatorGridName' ifAbsent: [
		self dataElementsDictionary at: 'collimatorGridName' ifPresent: [:dataElement |
			self dataElementsValues at: 'collimatorGridName' put: (self dataElementsDictionary removeKey: 'collimatorGridName') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> collimatorGridName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'collimatorGridName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #collimatorGridName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'collimatorGridName' put: dataElement.
			self dataElementsValues removeKey: 'collimatorGridName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'collimatorGridName' put: aSHValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> collimatorType [

	^self dataElementsValues at: 'collimatorType' ifAbsent: [
		self dataElementsDictionary at: 'collimatorType' ifPresent: [:dataElement |
			self dataElementsValues at: 'collimatorType' put: (self dataElementsDictionary removeKey: 'collimatorType') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> collimatorType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'collimatorType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #collimatorType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'collimatorType' put: dataElement.
			self dataElementsValues removeKey: 'collimatorType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'collimatorType' put: aCSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> distanceSourceToDetector [

	^self dataElementsValues at: 'distanceSourceToDetector' ifAbsent: [
		self dataElementsDictionary at: 'distanceSourceToDetector' ifPresent: [:dataElement |
			self dataElementsValues at: 'distanceSourceToDetector' put: (self dataElementsDictionary removeKey: 'distanceSourceToDetector') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> distanceSourceToDetector: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'distanceSourceToDetector' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #distanceSourceToDetector.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'distanceSourceToDetector' put: dataElement.
			self dataElementsValues removeKey: 'distanceSourceToDetector' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'distanceSourceToDetector' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> fieldOfViewDimensions [

	^self dataElementsValues at: 'fieldOfViewDimensions' ifAbsent: [
		self dataElementsDictionary at: 'fieldOfViewDimensions' ifPresent: [:dataElement |
			self dataElementsValues at: 'fieldOfViewDimensions' put: (self dataElementsDictionary removeKey: 'fieldOfViewDimensions') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> fieldOfViewDimensions: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'fieldOfViewDimensions' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fieldOfViewDimensions.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'fieldOfViewDimensions' put: dataElement.
			self dataElementsValues removeKey: 'fieldOfViewDimensions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fieldOfViewDimensions' put: aISValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> fieldOfViewShape [

	^self dataElementsValues at: 'fieldOfViewShape' ifAbsent: [
		self dataElementsDictionary at: 'fieldOfViewShape' ifPresent: [:dataElement |
			self dataElementsValues at: 'fieldOfViewShape' put: (self dataElementsDictionary removeKey: 'fieldOfViewShape') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> fieldOfViewShape: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'fieldOfViewShape' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fieldOfViewShape.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'fieldOfViewShape' put: dataElement.
			self dataElementsValues removeKey: 'fieldOfViewShape' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fieldOfViewShape' put: aCSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> focalDistance [

	^self dataElementsValues at: 'focalDistance' ifAbsent: [
		self dataElementsDictionary at: 'focalDistance' ifPresent: [:dataElement |
			self dataElementsValues at: 'focalDistance' put: (self dataElementsDictionary removeKey: 'focalDistance') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> focalDistance: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'focalDistance' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #focalDistance.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'focalDistance' put: dataElement.
			self dataElementsValues removeKey: 'focalDistance' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'focalDistance' put: aISValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> gantryDetectorTilt [

	^self dataElementsValues at: 'gantryDetectorTilt' ifAbsent: [
		self dataElementsDictionary at: 'gantryDetectorTilt' ifPresent: [:dataElement |
			self dataElementsValues at: 'gantryDetectorTilt' put: (self dataElementsDictionary removeKey: 'gantryDetectorTilt') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> gantryDetectorTilt: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'gantryDetectorTilt' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #gantryDetectorTilt.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'gantryDetectorTilt' put: dataElement.
			self dataElementsValues removeKey: 'gantryDetectorTilt' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'gantryDetectorTilt' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> imageOrientationPatient [

	^self dataElementsValues at: 'imageOrientationPatient' ifAbsent: [
		self dataElementsDictionary at: 'imageOrientationPatient' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageOrientationPatient' put: (self dataElementsDictionary removeKey: 'imageOrientationPatient') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> imageOrientationPatient: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageOrientationPatient' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageOrientationPatient.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'imageOrientationPatient' put: dataElement.
			self dataElementsValues removeKey: 'imageOrientationPatient' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageOrientationPatient' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> imagePositionPatient [

	^self dataElementsValues at: 'imagePositionPatient' ifAbsent: [
		self dataElementsDictionary at: 'imagePositionPatient' ifPresent: [:dataElement |
			self dataElementsValues at: 'imagePositionPatient' put: (self dataElementsDictionary removeKey: 'imagePositionPatient') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> imagePositionPatient: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imagePositionPatient' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imagePositionPatient.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'imagePositionPatient' put: dataElement.
			self dataElementsValues removeKey: 'imagePositionPatient' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imagePositionPatient' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> radialPosition [

	^self dataElementsValues at: 'radialPosition' ifAbsent: [
		self dataElementsDictionary at: 'radialPosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'radialPosition' put: (self dataElementsDictionary removeKey: 'radialPosition') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> radialPosition: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'radialPosition' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radialPosition.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'radialPosition' put: dataElement.
			self dataElementsValues removeKey: 'radialPosition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radialPosition' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> startAngle [

	^self dataElementsValues at: 'startAngle' ifAbsent: [
		self dataElementsDictionary at: 'startAngle' ifPresent: [:dataElement |
			self dataElementsValues at: 'startAngle' put: (self dataElementsDictionary removeKey: 'startAngle') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> startAngle: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'startAngle' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #startAngle.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'startAngle' put: dataElement.
			self dataElementsValues removeKey: 'startAngle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'startAngle' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> viewCodeSequence [

	^self dataElementsValues at: 'viewCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'viewCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'viewCodeSequence' put: (self dataElementsDictionary removeKey: 'viewCodeSequence') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> viewCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'viewCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #viewCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'viewCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'viewCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'viewCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> xFocusCenter [

	^self dataElementsValues at: 'xFocusCenter' ifAbsent: [
		self dataElementsDictionary at: 'xFocusCenter' ifPresent: [:dataElement |
			self dataElementsValues at: 'xFocusCenter' put: (self dataElementsDictionary removeKey: 'xFocusCenter') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> xFocusCenter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'xFocusCenter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #xFocusCenter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'xFocusCenter' put: dataElement.
			self dataElementsValues removeKey: 'xFocusCenter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'xFocusCenter' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> yFocusCenter [

	^self dataElementsValues at: 'yFocusCenter' ifAbsent: [
		self dataElementsDictionary at: 'yFocusCenter' ifPresent: [:dataElement |
			self dataElementsValues at: 'yFocusCenter' put: (self dataElementsDictionary removeKey: 'yFocusCenter') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> yFocusCenter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'yFocusCenter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #yFocusCenter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'yFocusCenter' put: dataElement.
			self dataElementsValues removeKey: 'yFocusCenter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'yFocusCenter' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> zoomCenter [

	^self dataElementsValues at: 'zoomCenter' ifAbsent: [
		self dataElementsDictionary at: 'zoomCenter' ifPresent: [:dataElement |
			self dataElementsValues at: 'zoomCenter' put: (self dataElementsDictionary removeKey: 'zoomCenter') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> zoomCenter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'zoomCenter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #zoomCenter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'zoomCenter' put: dataElement.
			self dataElementsValues removeKey: 'zoomCenter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'zoomCenter' put: aDSValue
		]
	].

]

{ #category : #accessing }
DetectorInformationSequenceItem >> zoomFactor [

	^self dataElementsValues at: 'zoomFactor' ifAbsent: [
		self dataElementsDictionary at: 'zoomFactor' ifPresent: [:dataElement |
			self dataElementsValues at: 'zoomFactor' put: (self dataElementsDictionary removeKey: 'zoomFactor') value.
		]
	]

]

{ #category : #accessing }
DetectorInformationSequenceItem >> zoomFactor: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'zoomFactor' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #zoomFactor.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'zoomFactor' put: dataElement.
			self dataElementsValues removeKey: 'zoomFactor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'zoomFactor' put: aDSValue
		]
	].

]
