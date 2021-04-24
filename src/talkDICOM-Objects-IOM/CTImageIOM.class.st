Class {
	#name : #CTImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
CTImageIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM CT Image Information Object Module
	PS 3.3-2000 Annex C.8.2.1 (Page 206) - PRD 04-06.2001"

	self resetDataElements.
	Name := 'Computed Tomography Image Information Object Module'.
	moduleName := 'ctImageIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #imageType
				tag: #(16r0008 16r0008)
				vm: '1-n'
				type: '1').
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
			(DSDataElement
				newWith: #rescaleIntercept
				tag: #(16r0028 16r1052)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #rescaleSlope
				tag: #(16r0028 16r1053)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #kVP
				tag: #(16r0018 16r0060)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(ISDataElement
				newWith: #acquisitionNumber
				tag: #(16r0020 16r0012)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #scanOptions
				tag: #(16r0018 16r0022)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #dataCollectionDiameter
				tag: #(16r0018 16r0090)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #reconstrutionDiameter
				tag: #(16r0018 16r1100)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #distanceSourceToDetector
				tag: #(16r0018 16r1110)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #distanceSourceToPatient
				tag: #(16r0018 16r1111)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #gantryDetectorTilt
				tag: #(16r0018 16r1120)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #tableHeight
				tag: #(16r0018 16r1130)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #rotationDirection
				tag: #(16r0018 16r1140)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #exposureTime
				tag: #(16r0018 16r1150)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #xRayTubeCurrent
				tag: #(16r0018 16r1151)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #exposure
				tag: #(16r0018 16r1152)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #exposureInmAS
				tag: #(16r0018 16r1153)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #filterType
				tag: #(16r0018 16r1160)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #generatorPower
				tag: #(16r0018 16r1170)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #focalSpot
				tag: #(16r0018 16r1190)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #convolutionKernel
				tag: #(16r0018 16r1210)
				vm: '1-n'
				type: '3')
]

{ #category : #accessing }
CTImageIOM >> acquisitionNumber [

	^self dataElementsValues at: 'acquisitionNumber' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionNumber' put: (self dataElementsDictionary removeKey: 'acquisitionNumber') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> acquisitionNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'acquisitionNumber' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> bitsAllocated [

	^self dataElementsValues at: 'bitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsAllocated' put: (self dataElementsDictionary removeKey: 'bitsAllocated') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> bitsAllocated: aUSValue [

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
CTImageIOM >> bitsStored [

	^self dataElementsValues at: 'bitsStored' ifAbsent: [
		self dataElementsDictionary at: 'bitsStored' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsStored' put: (self dataElementsDictionary removeKey: 'bitsStored') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> bitsStored: aUSValue [

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
CTImageIOM >> convolutionKernel [

	^self dataElementsValues at: 'convolutionKernel' ifAbsent: [
		self dataElementsDictionary at: 'convolutionKernel' ifPresent: [:dataElement |
			self dataElementsValues at: 'convolutionKernel' put: (self dataElementsDictionary removeKey: 'convolutionKernel') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> convolutionKernel: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'convolutionKernel' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #convolutionKernel.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'convolutionKernel' put: dataElement.
			self dataElementsValues removeKey: 'convolutionKernel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'convolutionKernel' put: aSHValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> dataCollectionDiameter [

	^self dataElementsValues at: 'dataCollectionDiameter' ifAbsent: [
		self dataElementsDictionary at: 'dataCollectionDiameter' ifPresent: [:dataElement |
			self dataElementsValues at: 'dataCollectionDiameter' put: (self dataElementsDictionary removeKey: 'dataCollectionDiameter') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> dataCollectionDiameter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'dataCollectionDiameter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dataCollectionDiameter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'dataCollectionDiameter' put: dataElement.
			self dataElementsValues removeKey: 'dataCollectionDiameter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dataCollectionDiameter' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> distanceSourceToDetector [

	^self dataElementsValues at: 'distanceSourceToDetector' ifAbsent: [
		self dataElementsDictionary at: 'distanceSourceToDetector' ifPresent: [:dataElement |
			self dataElementsValues at: 'distanceSourceToDetector' put: (self dataElementsDictionary removeKey: 'distanceSourceToDetector') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> distanceSourceToDetector: aDSValue [

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
CTImageIOM >> distanceSourceToPatient [

	^self dataElementsValues at: 'distanceSourceToPatient' ifAbsent: [
		self dataElementsDictionary at: 'distanceSourceToPatient' ifPresent: [:dataElement |
			self dataElementsValues at: 'distanceSourceToPatient' put: (self dataElementsDictionary removeKey: 'distanceSourceToPatient') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> distanceSourceToPatient: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'distanceSourceToPatient' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #distanceSourceToPatient.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'distanceSourceToPatient' put: dataElement.
			self dataElementsValues removeKey: 'distanceSourceToPatient' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'distanceSourceToPatient' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> exposure [

	^self dataElementsValues at: 'exposure' ifAbsent: [
		self dataElementsDictionary at: 'exposure' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposure' put: (self dataElementsDictionary removeKey: 'exposure') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> exposure: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'exposure' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #exposure.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'exposure' put: dataElement.
			self dataElementsValues removeKey: 'exposure' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'exposure' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CTImageIOM >> exposureInmAS [

	^self dataElementsValues at: 'exposureInuAs' ifAbsent: [
		self dataElementsDictionary at: 'exposureInuAs' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposureInuAs' put: (self dataElementsDictionary removeKey: 'exposureInuAs') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CTImageIOM >> exposureInmAS: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'exposureInuAs' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #exposureInuAs.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'exposureInuAs' put: dataElement.
			self dataElementsValues removeKey: 'exposureInuAs' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'exposureInuAs' put: aISValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> exposureInuAs [

	^self dataElementsValues at: 'exposureInuAs' ifAbsent: [
		self dataElementsDictionary at: 'exposureInuAs' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposureInuAs' put: (self dataElementsDictionary removeKey: 'exposureInuAs') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> exposureInuAs: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'exposureInuAs' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #exposureInuAs.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'exposureInuAs' put: dataElement.
			self dataElementsValues removeKey: 'exposureInuAs' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'exposureInuAs' put: aISValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> exposureTime [

	^self dataElementsValues at: 'exposureTime' ifAbsent: [
		self dataElementsDictionary at: 'exposureTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposureTime' put: (self dataElementsDictionary removeKey: 'exposureTime') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> exposureTime: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'exposureTime' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #exposureTime.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'exposureTime' put: dataElement.
			self dataElementsValues removeKey: 'exposureTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'exposureTime' put: aISValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> filterType [

	^self dataElementsValues at: 'filterType' ifAbsent: [
		self dataElementsDictionary at: 'filterType' ifPresent: [:dataElement |
			self dataElementsValues at: 'filterType' put: (self dataElementsDictionary removeKey: 'filterType') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> filterType: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'filterType' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #filterType.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'filterType' put: dataElement.
			self dataElementsValues removeKey: 'filterType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'filterType' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CTImageIOM >> focalSpot [

	^self dataElementsValues at: 'focalSpots' ifAbsent: [
		self dataElementsDictionary at: 'focalSpots' ifPresent: [:dataElement |
			self dataElementsValues at: 'focalSpots' put: (self dataElementsDictionary removeKey: 'focalSpots') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CTImageIOM >> focalSpot: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'focalSpots' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #focalSpots.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'focalSpots' put: dataElement.
			self dataElementsValues removeKey: 'focalSpots' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'focalSpots' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> focalSpots [

	^self dataElementsValues at: 'focalSpots' ifAbsent: [
		self dataElementsDictionary at: 'focalSpots' ifPresent: [:dataElement |
			self dataElementsValues at: 'focalSpots' put: (self dataElementsDictionary removeKey: 'focalSpots') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> focalSpots: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'focalSpots' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #focalSpots.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'focalSpots' put: dataElement.
			self dataElementsValues removeKey: 'focalSpots' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'focalSpots' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> gantryDetectorTilt [

	^self dataElementsValues at: 'gantryDetectorTilt' ifAbsent: [
		self dataElementsDictionary at: 'gantryDetectorTilt' ifPresent: [:dataElement |
			self dataElementsValues at: 'gantryDetectorTilt' put: (self dataElementsDictionary removeKey: 'gantryDetectorTilt') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> gantryDetectorTilt: aDSValue [

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
CTImageIOM >> generatorPower [

	^self dataElementsValues at: 'generatorPower' ifAbsent: [
		self dataElementsDictionary at: 'generatorPower' ifPresent: [:dataElement |
			self dataElementsValues at: 'generatorPower' put: (self dataElementsDictionary removeKey: 'generatorPower') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> generatorPower: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'generatorPower' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #generatorPower.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'generatorPower' put: dataElement.
			self dataElementsValues removeKey: 'generatorPower' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'generatorPower' put: aISValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> highBit [

	^self dataElementsValues at: 'highBit' ifAbsent: [
		self dataElementsDictionary at: 'highBit' ifPresent: [:dataElement |
			self dataElementsValues at: 'highBit' put: (self dataElementsDictionary removeKey: 'highBit') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> highBit: aUSValue [

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
CTImageIOM >> imageType [

	^self dataElementsValues at: 'imageType' ifAbsent: [
		self dataElementsDictionary at: 'imageType' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageType' put: (self dataElementsDictionary removeKey: 'imageType') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> imageType: aCSValue [

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

{ #category : #accessing }
CTImageIOM >> kVP [

	^self dataElementsValues at: 'kVP' ifAbsent: [
		self dataElementsDictionary at: 'kVP' ifPresent: [:dataElement |
			self dataElementsValues at: 'kVP' put: (self dataElementsDictionary removeKey: 'kVP') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> kVP: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'kVP' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #kVP.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'kVP' put: dataElement.
			self dataElementsValues removeKey: 'kVP' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'kVP' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> photometricInterpretation: aCSValue [

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
CTImageIOM >> reconstructionDiameter [

	^self dataElementsValues at: 'reconstructionDiameter' ifAbsent: [
		self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:dataElement |
			self dataElementsValues at: 'reconstructionDiameter' put: (self dataElementsDictionary removeKey: 'reconstructionDiameter') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> reconstructionDiameter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #reconstructionDiameter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'reconstructionDiameter' put: dataElement.
			self dataElementsValues removeKey: 'reconstructionDiameter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'reconstructionDiameter' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CTImageIOM >> reconstrutionDiameter [

	^self dataElementsValues at: 'reconstructionDiameter' ifAbsent: [
		self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:dataElement |
			self dataElementsValues at: 'reconstructionDiameter' put: (self dataElementsDictionary removeKey: 'reconstructionDiameter') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CTImageIOM >> reconstrutionDiameter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #reconstructionDiameter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'reconstructionDiameter' put: dataElement.
			self dataElementsValues removeKey: 'reconstructionDiameter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'reconstructionDiameter' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> rescaleIntercept [

	^self dataElementsValues at: 'rescaleIntercept' ifAbsent: [
		self dataElementsDictionary at: 'rescaleIntercept' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleIntercept' put: (self dataElementsDictionary removeKey: 'rescaleIntercept') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> rescaleIntercept: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rescaleIntercept' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rescaleIntercept.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rescaleIntercept' put: dataElement.
			self dataElementsValues removeKey: 'rescaleIntercept' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rescaleIntercept' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> rescaleSlope [

	^self dataElementsValues at: 'rescaleSlope' ifAbsent: [
		self dataElementsDictionary at: 'rescaleSlope' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleSlope' put: (self dataElementsDictionary removeKey: 'rescaleSlope') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> rescaleSlope: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rescaleSlope' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rescaleSlope.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rescaleSlope' put: dataElement.
			self dataElementsValues removeKey: 'rescaleSlope' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rescaleSlope' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> rotationDirection [

	^self dataElementsValues at: 'rotationDirection' ifAbsent: [
		self dataElementsDictionary at: 'rotationDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'rotationDirection' put: (self dataElementsDictionary removeKey: 'rotationDirection') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> rotationDirection: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rotationDirection' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rotationDirection.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rotationDirection' put: dataElement.
			self dataElementsValues removeKey: 'rotationDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rotationDirection' put: aCSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> samplesPerPixel [

	^self dataElementsValues at: 'samplesPerPixel' ifAbsent: [
		self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplesPerPixel' put: (self dataElementsDictionary removeKey: 'samplesPerPixel') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> samplesPerPixel: aUSValue [

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
CTImageIOM >> scanOptions [

	^self dataElementsValues at: 'scanOptions' ifAbsent: [
		self dataElementsDictionary at: 'scanOptions' ifPresent: [:dataElement |
			self dataElementsValues at: 'scanOptions' put: (self dataElementsDictionary removeKey: 'scanOptions') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> scanOptions: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'scanOptions' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scanOptions.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'scanOptions' put: dataElement.
			self dataElementsValues removeKey: 'scanOptions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scanOptions' put: aCSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> tableHeight [

	^self dataElementsValues at: 'tableHeight' ifAbsent: [
		self dataElementsDictionary at: 'tableHeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableHeight' put: (self dataElementsDictionary removeKey: 'tableHeight') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> tableHeight: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableHeight' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableHeight.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'tableHeight' put: dataElement.
			self dataElementsValues removeKey: 'tableHeight' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableHeight' put: aDSValue
		]
	].

]

{ #category : #accessing }
CTImageIOM >> xRayTubeCurrent [

	^self dataElementsValues at: 'xRayTubeCurrent' ifAbsent: [
		self dataElementsDictionary at: 'xRayTubeCurrent' ifPresent: [:dataElement |
			self dataElementsValues at: 'xRayTubeCurrent' put: (self dataElementsDictionary removeKey: 'xRayTubeCurrent') value.
		]
	]

]

{ #category : #accessing }
CTImageIOM >> xRayTubeCurrent: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'xRayTubeCurrent' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #xRayTubeCurrent.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'xRayTubeCurrent' put: dataElement.
			self dataElementsValues removeKey: 'xRayTubeCurrent' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'xRayTubeCurrent' put: aISValue
		]
	].

]
