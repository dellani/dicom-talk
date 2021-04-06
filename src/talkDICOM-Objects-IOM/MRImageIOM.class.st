Class {
	#name : #MRImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
MRImageIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM MR Image Information Object Module
	PS 3.3-2000 Annex C.8.3.1 (Page 209) - GA 17-10.2001"

	self resetDataElements.
	Name := 'DICOM Magnetic Resonance Image Information Object Module'.
	moduleName := 'mrImageIOM'.
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
			(CSDataElement
				newWith: #scanningSequence
				tag: #(16r0018 16r0020)
				vm: '1-n'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #sequenceVariant
				tag: #(16r0018 16r0021)
				vm: '1-n'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #scanOptions
				tag: #(16r0018 16r0022)
				vm: '1-n'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #mrAcquisitionType
				tag: #(16r0018 16r0023)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(DSDataElement
				newWith: #repetitionTime
				tag: #(16r0018 16r0080)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #echoTime
				tag: #(16r0018 16r0081)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(ISDataElement
				newWith: #echoTrainLength
				tag: #(16r0018 16r0091)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(DSDataElement
				newWith: #inversionTime
				tag: #(16r0018 16r0082)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(DSDataElement
				newWith: #triggerTime
				tag: #(16r0018 16r1060)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(SHDataElement
				newWith: #sequenceName
				tag: #(16r0018 16r0024)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #angioFlag
				tag: #(16r0018 16r0025)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #numberofAverages
				tag: #(16r0018 16r0083)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #imagingFrequency
				tag: #(16r0018 16r0084)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #imagedNucleus
				tag: #(16r0018 16r0085)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #echoNumber
				tag: #(16r0018 16r0086)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #magneticFieldStrength
				tag: #(16r0018 16r0087)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #spacingBetweenSlices
				tag: #(16r0018 16r0088)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #numberofPhaseFieldofView
				tag: #(16r0018 16r0089)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #percentSampling
				tag: #(16r0018 16r0093)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #percentPhaseFieldofView
				tag: #(16r0018 16r0094)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #pixelBandwidth
				tag: #(16r0018 16r0095)
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
				newWith: #intervalsAcquired
				tag: #(16r0018 16r1083)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #intervalsRejected
				tag: #(16r0018 16r1084)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #pvcRejection
				tag: #(16r0018 16r1085)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #skipBeats
				tag: #(16r0018 16r1086)
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
			(ISDataElement
				newWith: #cardiacNumberofImages
				tag: #(16r0018 16r1090)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #triggerWindow
				tag: #(16r0018 16r1094)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #reconstructionDiameter
				tag: #(16r0018 16r1100)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #receivingCoil
				tag: #(16r0018 16r1250)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #transmitionCoil
				tag: #(16r0018 16r1251)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #acquisitionMatrix
				tag: #(16r0018 16r1310)
				vm: '4'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #phaseEncodingDirection
				tag: #(16r0018 16r1312)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #flipAngle
				tag: #(16r0018 16r1314)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #sar
				tag: #(16r0018 16r1316)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #variableFlipAngleFlag
				tag: #(16r0018 16r1315)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #dbdt
				tag: #(16r0018 16r1318)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #temporalPositionIdentifier
				tag: #(16r0020 16r0100)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #numberofTemporalPositions
				tag: #(16r0020 16r0105)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #temporalResolution
				tag: #(16r0020 16r0110)
				vm: '1'
				type: '3').

	"This do not belong here, but some Siemens MR data does represent negative values using this"
	self
		addDataElement:
			(DSDataElement
				newWith: #rescaleIntercept
				tag: #(16r0028 16r1052)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #rescaleSlope
				tag: #(16r0028 16r1053)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #rescaleType
				tag: #(16r0028 16r1054)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
MRImageIOM >> acquisitionMatrix [

	^self dataElementsValues at: 'acquisitionMatrix' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionMatrix' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionMatrix' put: (self dataElementsDictionary removeKey: 'acquisitionMatrix') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> acquisitionMatrix: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionMatrix' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionMatrix.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'acquisitionMatrix' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionMatrix' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionMatrix' put: aUSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> angioFlag [

	^self dataElementsValues at: 'angioFlag' ifAbsent: [
		self dataElementsDictionary at: 'angioFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'angioFlag' put: (self dataElementsDictionary removeKey: 'angioFlag') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> angioFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'angioFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #angioFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'angioFlag' put: dataElement.
			self dataElementsValues removeKey: 'angioFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'angioFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> beatRejectionFlag [

	^self dataElementsValues at: 'beatRejectionFlag' ifAbsent: [
		self dataElementsDictionary at: 'beatRejectionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'beatRejectionFlag' put: (self dataElementsDictionary removeKey: 'beatRejectionFlag') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> beatRejectionFlag: aCSValue [

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
MRImageIOM >> bitsAllocated [

	^self dataElementsValues at: 'bitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsAllocated' put: (self dataElementsDictionary removeKey: 'bitsAllocated') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> bitsAllocated: aUSValue [

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
MRImageIOM >> cardiacNumberOfImages [

	^self dataElementsValues at: 'cardiacNumberOfImages' ifAbsent: [
		self dataElementsDictionary at: 'cardiacNumberOfImages' ifPresent: [:dataElement |
			self dataElementsValues at: 'cardiacNumberOfImages' put: (self dataElementsDictionary removeKey: 'cardiacNumberOfImages') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> cardiacNumberOfImages: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'cardiacNumberOfImages' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cardiacNumberOfImages.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'cardiacNumberOfImages' put: dataElement.
			self dataElementsValues removeKey: 'cardiacNumberOfImages' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cardiacNumberOfImages' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> cardiacNumberofImages [

	^self dataElementsValues at: 'cardiacNumberOfImages' ifAbsent: [
		self dataElementsDictionary at: 'cardiacNumberOfImages' ifPresent: [:dataElement |
			self dataElementsValues at: 'cardiacNumberOfImages' put: (self dataElementsDictionary removeKey: 'cardiacNumberOfImages') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> cardiacNumberofImages: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'cardiacNumberOfImages' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cardiacNumberOfImages.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'cardiacNumberOfImages' put: dataElement.
			self dataElementsValues removeKey: 'cardiacNumberOfImages' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cardiacNumberOfImages' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> dBdt [

	^self dataElementsValues at: 'dBdt' ifAbsent: [
		self dataElementsDictionary at: 'dBdt' ifPresent: [:dataElement |
			self dataElementsValues at: 'dBdt' put: (self dataElementsDictionary removeKey: 'dBdt') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> dBdt: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'dBdt' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dBdt.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'dBdt' put: dataElement.
			self dataElementsValues removeKey: 'dBdt' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dBdt' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> dbdt [

	^self dataElementsValues at: 'dBdt' ifAbsent: [
		self dataElementsDictionary at: 'dBdt' ifPresent: [:dataElement |
			self dataElementsValues at: 'dBdt' put: (self dataElementsDictionary removeKey: 'dBdt') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> dbdt: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'dBdt' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dBdt.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'dBdt' put: dataElement.
			self dataElementsValues removeKey: 'dBdt' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dBdt' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> echoNumber [

	^self dataElementsValues at: 'echoNumbers' ifAbsent: [
		self dataElementsDictionary at: 'echoNumbers' ifPresent: [:dataElement |
			self dataElementsValues at: 'echoNumbers' put: (self dataElementsDictionary removeKey: 'echoNumbers') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> echoNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'echoNumbers' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #echoNumbers.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'echoNumbers' put: dataElement.
			self dataElementsValues removeKey: 'echoNumbers' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'echoNumbers' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> echoNumbers [

	^self dataElementsValues at: 'echoNumbers' ifAbsent: [
		self dataElementsDictionary at: 'echoNumbers' ifPresent: [:dataElement |
			self dataElementsValues at: 'echoNumbers' put: (self dataElementsDictionary removeKey: 'echoNumbers') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> echoNumbers: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'echoNumbers' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #echoNumbers.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'echoNumbers' put: dataElement.
			self dataElementsValues removeKey: 'echoNumbers' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'echoNumbers' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> echoTime [

	^self dataElementsValues at: 'echoTime' ifAbsent: [
		self dataElementsDictionary at: 'echoTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'echoTime' put: (self dataElementsDictionary removeKey: 'echoTime') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> echoTime: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'echoTime' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #echoTime.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'echoTime' put: dataElement.
			self dataElementsValues removeKey: 'echoTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'echoTime' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> echoTrainLength [

	^self dataElementsValues at: 'echoTrainLength' ifAbsent: [
		self dataElementsDictionary at: 'echoTrainLength' ifPresent: [:dataElement |
			self dataElementsValues at: 'echoTrainLength' put: (self dataElementsDictionary removeKey: 'echoTrainLength') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> echoTrainLength: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'echoTrainLength' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #echoTrainLength.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'echoTrainLength' put: dataElement.
			self dataElementsValues removeKey: 'echoTrainLength' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'echoTrainLength' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> flipAngle [

	^self dataElementsValues at: 'flipAngle' ifAbsent: [
		self dataElementsDictionary at: 'flipAngle' ifPresent: [:dataElement |
			self dataElementsValues at: 'flipAngle' put: (self dataElementsDictionary removeKey: 'flipAngle') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> flipAngle: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'flipAngle' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #flipAngle.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'flipAngle' put: dataElement.
			self dataElementsValues removeKey: 'flipAngle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'flipAngle' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> heartRate [

	^self dataElementsValues at: 'heartRate' ifAbsent: [
		self dataElementsDictionary at: 'heartRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'heartRate' put: (self dataElementsDictionary removeKey: 'heartRate') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> heartRate: aISValue [

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
MRImageIOM >> highRRValue [

	^self dataElementsValues at: 'highRRValue' ifAbsent: [
		self dataElementsDictionary at: 'highRRValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'highRRValue' put: (self dataElementsDictionary removeKey: 'highRRValue') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> highRRValue: aISValue [

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
MRImageIOM >> imageType [

	^self dataElementsValues at: 'imageType' ifAbsent: [
		self dataElementsDictionary at: 'imageType' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageType' put: (self dataElementsDictionary removeKey: 'imageType') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> imageType: aCSValue [

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
MRImageIOM >> imagedNucleus [

	^self dataElementsValues at: 'imagedNucleus' ifAbsent: [
		self dataElementsDictionary at: 'imagedNucleus' ifPresent: [:dataElement |
			self dataElementsValues at: 'imagedNucleus' put: (self dataElementsDictionary removeKey: 'imagedNucleus') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> imagedNucleus: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'imagedNucleus' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imagedNucleus.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'imagedNucleus' put: dataElement.
			self dataElementsValues removeKey: 'imagedNucleus' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imagedNucleus' put: aSHValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> imagingFrequency [

	^self dataElementsValues at: 'imagingFrequency' ifAbsent: [
		self dataElementsDictionary at: 'imagingFrequency' ifPresent: [:dataElement |
			self dataElementsValues at: 'imagingFrequency' put: (self dataElementsDictionary removeKey: 'imagingFrequency') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> imagingFrequency: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imagingFrequency' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imagingFrequency.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'imagingFrequency' put: dataElement.
			self dataElementsValues removeKey: 'imagingFrequency' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imagingFrequency' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> inPlanePhaseEncodingDirection [

	^self dataElementsValues at: 'inPlanePhaseEncodingDirection' ifAbsent: [
		self dataElementsDictionary at: 'inPlanePhaseEncodingDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'inPlanePhaseEncodingDirection' put: (self dataElementsDictionary removeKey: 'inPlanePhaseEncodingDirection') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> inPlanePhaseEncodingDirection: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'inPlanePhaseEncodingDirection' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #inPlanePhaseEncodingDirection.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'inPlanePhaseEncodingDirection' put: dataElement.
			self dataElementsValues removeKey: 'inPlanePhaseEncodingDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'inPlanePhaseEncodingDirection' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> intervalsAcquired [

	^self dataElementsValues at: 'intervalsAcquired' ifAbsent: [
		self dataElementsDictionary at: 'intervalsAcquired' ifPresent: [:dataElement |
			self dataElementsValues at: 'intervalsAcquired' put: (self dataElementsDictionary removeKey: 'intervalsAcquired') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> intervalsAcquired: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'intervalsAcquired' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #intervalsAcquired.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'intervalsAcquired' put: dataElement.
			self dataElementsValues removeKey: 'intervalsAcquired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'intervalsAcquired' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> intervalsRejected [

	^self dataElementsValues at: 'intervalsRejected' ifAbsent: [
		self dataElementsDictionary at: 'intervalsRejected' ifPresent: [:dataElement |
			self dataElementsValues at: 'intervalsRejected' put: (self dataElementsDictionary removeKey: 'intervalsRejected') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> intervalsRejected: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'intervalsRejected' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #intervalsRejected.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'intervalsRejected' put: dataElement.
			self dataElementsValues removeKey: 'intervalsRejected' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'intervalsRejected' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> inversionTime [

	^self dataElementsValues at: 'inversionTime' ifAbsent: [
		self dataElementsDictionary at: 'inversionTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'inversionTime' put: (self dataElementsDictionary removeKey: 'inversionTime') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> inversionTime: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'inversionTime' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #inversionTime.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'inversionTime' put: dataElement.
			self dataElementsValues removeKey: 'inversionTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'inversionTime' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> lowRRValue [

	^self dataElementsValues at: 'lowRRValue' ifAbsent: [
		self dataElementsDictionary at: 'lowRRValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'lowRRValue' put: (self dataElementsDictionary removeKey: 'lowRRValue') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> lowRRValue: aISValue [

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
MRImageIOM >> mRAcquisitionType [

	^self dataElementsValues at: 'mRAcquisitionType' ifAbsent: [
		self dataElementsDictionary at: 'mRAcquisitionType' ifPresent: [:dataElement |
			self dataElementsValues at: 'mRAcquisitionType' put: (self dataElementsDictionary removeKey: 'mRAcquisitionType') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> mRAcquisitionType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'mRAcquisitionType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #mRAcquisitionType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'mRAcquisitionType' put: dataElement.
			self dataElementsValues removeKey: 'mRAcquisitionType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'mRAcquisitionType' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> magneticFieldStrength [

	^self dataElementsValues at: 'magneticFieldStrength' ifAbsent: [
		self dataElementsDictionary at: 'magneticFieldStrength' ifPresent: [:dataElement |
			self dataElementsValues at: 'magneticFieldStrength' put: (self dataElementsDictionary removeKey: 'magneticFieldStrength') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> magneticFieldStrength: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'magneticFieldStrength' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #magneticFieldStrength.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'magneticFieldStrength' put: dataElement.
			self dataElementsValues removeKey: 'magneticFieldStrength' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'magneticFieldStrength' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> mrAcquisitionType [

	^self dataElementsValues at: 'mRAcquisitionType' ifAbsent: [
		self dataElementsDictionary at: 'mRAcquisitionType' ifPresent: [:dataElement |
			self dataElementsValues at: 'mRAcquisitionType' put: (self dataElementsDictionary removeKey: 'mRAcquisitionType') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> mrAcquisitionType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'mRAcquisitionType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #mRAcquisitionType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'mRAcquisitionType' put: dataElement.
			self dataElementsValues removeKey: 'mRAcquisitionType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'mRAcquisitionType' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> nominalInterval [

	^self dataElementsValues at: 'nominalInterval' ifAbsent: [
		self dataElementsDictionary at: 'nominalInterval' ifPresent: [:dataElement |
			self dataElementsValues at: 'nominalInterval' put: (self dataElementsDictionary removeKey: 'nominalInterval') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> nominalInterval: aISValue [

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
MRImageIOM >> numberOfAverages [

	^self dataElementsValues at: 'numberOfAverages' ifAbsent: [
		self dataElementsDictionary at: 'numberOfAverages' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfAverages' put: (self dataElementsDictionary removeKey: 'numberOfAverages') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> numberOfAverages: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfAverages' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfAverages.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'numberOfAverages' put: dataElement.
			self dataElementsValues removeKey: 'numberOfAverages' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfAverages' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> numberOfPhaseEncodingSteps [

	^self dataElementsValues at: 'numberOfPhaseEncodingSteps' ifAbsent: [
		self dataElementsDictionary at: 'numberOfPhaseEncodingSteps' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfPhaseEncodingSteps' put: (self dataElementsDictionary removeKey: 'numberOfPhaseEncodingSteps') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> numberOfPhaseEncodingSteps: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfPhaseEncodingSteps' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfPhaseEncodingSteps.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfPhaseEncodingSteps' put: dataElement.
			self dataElementsValues removeKey: 'numberOfPhaseEncodingSteps' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfPhaseEncodingSteps' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> numberOfTemporalPositions [

	^self dataElementsValues at: 'numberOfTemporalPositions' ifAbsent: [
		self dataElementsDictionary at: 'numberOfTemporalPositions' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfTemporalPositions' put: (self dataElementsDictionary removeKey: 'numberOfTemporalPositions') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> numberOfTemporalPositions: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfTemporalPositions' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfTemporalPositions.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfTemporalPositions' put: dataElement.
			self dataElementsValues removeKey: 'numberOfTemporalPositions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfTemporalPositions' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> numberofAverages [

	^self dataElementsValues at: 'numberOfAverages' ifAbsent: [
		self dataElementsDictionary at: 'numberOfAverages' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfAverages' put: (self dataElementsDictionary removeKey: 'numberOfAverages') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> numberofAverages: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfAverages' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfAverages.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'numberOfAverages' put: dataElement.
			self dataElementsValues removeKey: 'numberOfAverages' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfAverages' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> numberofPhaseFieldofView [

	^self dataElementsValues at: 'numberOfPhaseEncodingSteps' ifAbsent: [
		self dataElementsDictionary at: 'numberOfPhaseEncodingSteps' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfPhaseEncodingSteps' put: (self dataElementsDictionary removeKey: 'numberOfPhaseEncodingSteps') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> numberofPhaseFieldofView: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfPhaseEncodingSteps' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfPhaseEncodingSteps.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfPhaseEncodingSteps' put: dataElement.
			self dataElementsValues removeKey: 'numberOfPhaseEncodingSteps' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfPhaseEncodingSteps' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> numberofTemporalPositions [

	^self dataElementsValues at: 'numberOfTemporalPositions' ifAbsent: [
		self dataElementsDictionary at: 'numberOfTemporalPositions' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfTemporalPositions' put: (self dataElementsDictionary removeKey: 'numberOfTemporalPositions') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> numberofTemporalPositions: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfTemporalPositions' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfTemporalPositions.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfTemporalPositions' put: dataElement.
			self dataElementsValues removeKey: 'numberOfTemporalPositions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfTemporalPositions' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> pVCRejection [

	^self dataElementsValues at: 'pVCRejection' ifAbsent: [
		self dataElementsDictionary at: 'pVCRejection' ifPresent: [:dataElement |
			self dataElementsValues at: 'pVCRejection' put: (self dataElementsDictionary removeKey: 'pVCRejection') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> pVCRejection: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'pVCRejection' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pVCRejection.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'pVCRejection' put: dataElement.
			self dataElementsValues removeKey: 'pVCRejection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pVCRejection' put: aLOValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> percentPhaseFieldOfView [

	^self dataElementsValues at: 'percentPhaseFieldOfView' ifAbsent: [
		self dataElementsDictionary at: 'percentPhaseFieldOfView' ifPresent: [:dataElement |
			self dataElementsValues at: 'percentPhaseFieldOfView' put: (self dataElementsDictionary removeKey: 'percentPhaseFieldOfView') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> percentPhaseFieldOfView: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'percentPhaseFieldOfView' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #percentPhaseFieldOfView.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'percentPhaseFieldOfView' put: dataElement.
			self dataElementsValues removeKey: 'percentPhaseFieldOfView' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'percentPhaseFieldOfView' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> percentPhaseFieldofView [

	^self dataElementsValues at: 'percentPhaseFieldOfView' ifAbsent: [
		self dataElementsDictionary at: 'percentPhaseFieldOfView' ifPresent: [:dataElement |
			self dataElementsValues at: 'percentPhaseFieldOfView' put: (self dataElementsDictionary removeKey: 'percentPhaseFieldOfView') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> percentPhaseFieldofView: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'percentPhaseFieldOfView' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #percentPhaseFieldOfView.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'percentPhaseFieldOfView' put: dataElement.
			self dataElementsValues removeKey: 'percentPhaseFieldOfView' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'percentPhaseFieldOfView' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> percentSampling [

	^self dataElementsValues at: 'percentSampling' ifAbsent: [
		self dataElementsDictionary at: 'percentSampling' ifPresent: [:dataElement |
			self dataElementsValues at: 'percentSampling' put: (self dataElementsDictionary removeKey: 'percentSampling') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> percentSampling: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'percentSampling' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #percentSampling.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'percentSampling' put: dataElement.
			self dataElementsValues removeKey: 'percentSampling' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'percentSampling' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> phaseEncodingDirection [

	^self dataElementsValues at: 'inPlanePhaseEncodingDirection' ifAbsent: [
		self dataElementsDictionary at: 'inPlanePhaseEncodingDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'inPlanePhaseEncodingDirection' put: (self dataElementsDictionary removeKey: 'inPlanePhaseEncodingDirection') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> phaseEncodingDirection: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'inPlanePhaseEncodingDirection' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #inPlanePhaseEncodingDirection.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'inPlanePhaseEncodingDirection' put: dataElement.
			self dataElementsValues removeKey: 'inPlanePhaseEncodingDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'inPlanePhaseEncodingDirection' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> photometricInterpretation: aCSValue [

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
MRImageIOM >> pixelBandwidth [

	^self dataElementsValues at: 'pixelBandwidth' ifAbsent: [
		self dataElementsDictionary at: 'pixelBandwidth' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelBandwidth' put: (self dataElementsDictionary removeKey: 'pixelBandwidth') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> pixelBandwidth: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelBandwidth' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelBandwidth.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'pixelBandwidth' put: dataElement.
			self dataElementsValues removeKey: 'pixelBandwidth' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelBandwidth' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> pvcRejection [

	^self dataElementsValues at: 'pVCRejection' ifAbsent: [
		self dataElementsDictionary at: 'pVCRejection' ifPresent: [:dataElement |
			self dataElementsValues at: 'pVCRejection' put: (self dataElementsDictionary removeKey: 'pVCRejection') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> pvcRejection: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'pVCRejection' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pVCRejection.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'pVCRejection' put: dataElement.
			self dataElementsValues removeKey: 'pVCRejection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pVCRejection' put: aLOValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> receiveCoilName [

	^self dataElementsValues at: 'receiveCoilName' ifAbsent: [
		self dataElementsDictionary at: 'receiveCoilName' ifPresent: [:dataElement |
			self dataElementsValues at: 'receiveCoilName' put: (self dataElementsDictionary removeKey: 'receiveCoilName') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> receiveCoilName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'receiveCoilName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #receiveCoilName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'receiveCoilName' put: dataElement.
			self dataElementsValues removeKey: 'receiveCoilName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'receiveCoilName' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> receivingCoil [

	^self dataElementsValues at: 'receiveCoilName' ifAbsent: [
		self dataElementsDictionary at: 'receiveCoilName' ifPresent: [:dataElement |
			self dataElementsValues at: 'receiveCoilName' put: (self dataElementsDictionary removeKey: 'receiveCoilName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> receivingCoil: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'receiveCoilName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #receiveCoilName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'receiveCoilName' put: dataElement.
			self dataElementsValues removeKey: 'receiveCoilName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'receiveCoilName' put: aSHValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> reconstructionDiameter [

	^self dataElementsValues at: 'reconstructionDiameter' ifAbsent: [
		self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:dataElement |
			self dataElementsValues at: 'reconstructionDiameter' put: (self dataElementsDictionary removeKey: 'reconstructionDiameter') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> reconstructionDiameter: aDSValue [

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
MRImageIOM >> repetitionTime [

	^self dataElementsValues at: 'repetitionTime' ifAbsent: [
		self dataElementsDictionary at: 'repetitionTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'repetitionTime' put: (self dataElementsDictionary removeKey: 'repetitionTime') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> repetitionTime: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'repetitionTime' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #repetitionTime.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'repetitionTime' put: dataElement.
			self dataElementsValues removeKey: 'repetitionTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'repetitionTime' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> rescaleIntercept [

	^self dataElementsValues at: 'rescaleIntercept' ifAbsent: [
		self dataElementsDictionary at: 'rescaleIntercept' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleIntercept' put: (self dataElementsDictionary removeKey: 'rescaleIntercept') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> rescaleIntercept: aDSValue [

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
MRImageIOM >> rescaleSlope [

	^self dataElementsValues at: 'rescaleSlope' ifAbsent: [
		self dataElementsDictionary at: 'rescaleSlope' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleSlope' put: (self dataElementsDictionary removeKey: 'rescaleSlope') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> rescaleSlope: aDSValue [

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
MRImageIOM >> rescaleType [

	^self dataElementsValues at: 'rescaleType' ifAbsent: [
		self dataElementsDictionary at: 'rescaleType' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleType' put: (self dataElementsDictionary removeKey: 'rescaleType') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> rescaleType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rescaleType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rescaleType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rescaleType' put: dataElement.
			self dataElementsValues removeKey: 'rescaleType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rescaleType' put: aLOValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> sAR [

	^self dataElementsValues at: 'sAR' ifAbsent: [
		self dataElementsDictionary at: 'sAR' ifPresent: [:dataElement |
			self dataElementsValues at: 'sAR' put: (self dataElementsDictionary removeKey: 'sAR') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> sAR: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sAR' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sAR.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sAR' put: dataElement.
			self dataElementsValues removeKey: 'sAR' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sAR' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> samplesPerPixel [

	^self dataElementsValues at: 'samplesPerPixel' ifAbsent: [
		self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplesPerPixel' put: (self dataElementsDictionary removeKey: 'samplesPerPixel') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> samplesPerPixel: aUSValue [

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

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> sar [

	^self dataElementsValues at: 'sAR' ifAbsent: [
		self dataElementsDictionary at: 'sAR' ifPresent: [:dataElement |
			self dataElementsValues at: 'sAR' put: (self dataElementsDictionary removeKey: 'sAR') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> sar: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sAR' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sAR.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sAR' put: dataElement.
			self dataElementsValues removeKey: 'sAR' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sAR' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> scanOptions [

	^self dataElementsValues at: 'scanOptions' ifAbsent: [
		self dataElementsDictionary at: 'scanOptions' ifPresent: [:dataElement |
			self dataElementsValues at: 'scanOptions' put: (self dataElementsDictionary removeKey: 'scanOptions') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> scanOptions: aCSValue [

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
MRImageIOM >> scanningSequence [

	^self dataElementsValues at: 'scanningSequence' ifAbsent: [
		self dataElementsDictionary at: 'scanningSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'scanningSequence' put: (self dataElementsDictionary removeKey: 'scanningSequence') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> scanningSequence: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'scanningSequence' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scanningSequence.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'scanningSequence' put: dataElement.
			self dataElementsValues removeKey: 'scanningSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scanningSequence' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> sequenceName [

	^self dataElementsValues at: 'sequenceName' ifAbsent: [
		self dataElementsDictionary at: 'sequenceName' ifPresent: [:dataElement |
			self dataElementsValues at: 'sequenceName' put: (self dataElementsDictionary removeKey: 'sequenceName') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> sequenceName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'sequenceName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sequenceName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'sequenceName' put: dataElement.
			self dataElementsValues removeKey: 'sequenceName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sequenceName' put: aSHValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> sequenceVariant [

	^self dataElementsValues at: 'sequenceVariant' ifAbsent: [
		self dataElementsDictionary at: 'sequenceVariant' ifPresent: [:dataElement |
			self dataElementsValues at: 'sequenceVariant' put: (self dataElementsDictionary removeKey: 'sequenceVariant') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> sequenceVariant: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sequenceVariant' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sequenceVariant.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'sequenceVariant' put: dataElement.
			self dataElementsValues removeKey: 'sequenceVariant' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sequenceVariant' put: aCSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> skipBeats [

	^self dataElementsValues at: 'skipBeats' ifAbsent: [
		self dataElementsDictionary at: 'skipBeats' ifPresent: [:dataElement |
			self dataElementsValues at: 'skipBeats' put: (self dataElementsDictionary removeKey: 'skipBeats') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> skipBeats: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'skipBeats' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #skipBeats.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'skipBeats' put: dataElement.
			self dataElementsValues removeKey: 'skipBeats' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'skipBeats' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> spacingBetweenSlices [

	^self dataElementsValues at: 'spacingBetweenSlices' ifAbsent: [
		self dataElementsDictionary at: 'spacingBetweenSlices' ifPresent: [:dataElement |
			self dataElementsValues at: 'spacingBetweenSlices' put: (self dataElementsDictionary removeKey: 'spacingBetweenSlices') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> spacingBetweenSlices: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'spacingBetweenSlices' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #spacingBetweenSlices.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'spacingBetweenSlices' put: dataElement.
			self dataElementsValues removeKey: 'spacingBetweenSlices' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'spacingBetweenSlices' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> temporalPositionIdentifier [

	^self dataElementsValues at: 'temporalPositionIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'temporalPositionIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'temporalPositionIdentifier' put: (self dataElementsDictionary removeKey: 'temporalPositionIdentifier') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> temporalPositionIdentifier: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'temporalPositionIdentifier' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #temporalPositionIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'temporalPositionIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'temporalPositionIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'temporalPositionIdentifier' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> temporalResolution [

	^self dataElementsValues at: 'temporalResolution' ifAbsent: [
		self dataElementsDictionary at: 'temporalResolution' ifPresent: [:dataElement |
			self dataElementsValues at: 'temporalResolution' put: (self dataElementsDictionary removeKey: 'temporalResolution') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> temporalResolution: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'temporalResolution' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #temporalResolution.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'temporalResolution' put: dataElement.
			self dataElementsValues removeKey: 'temporalResolution' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'temporalResolution' put: aDSValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> transmitCoilName [

	^self dataElementsValues at: 'transmitCoilName' ifAbsent: [
		self dataElementsDictionary at: 'transmitCoilName' ifPresent: [:dataElement |
			self dataElementsValues at: 'transmitCoilName' put: (self dataElementsDictionary removeKey: 'transmitCoilName') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> transmitCoilName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'transmitCoilName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #transmitCoilName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'transmitCoilName' put: dataElement.
			self dataElementsValues removeKey: 'transmitCoilName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'transmitCoilName' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> transmitionCoil [

	^self dataElementsValues at: 'transmitCoilName' ifAbsent: [
		self dataElementsDictionary at: 'transmitCoilName' ifPresent: [:dataElement |
			self dataElementsValues at: 'transmitCoilName' put: (self dataElementsDictionary removeKey: 'transmitCoilName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
MRImageIOM >> transmitionCoil: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'transmitCoilName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #transmitCoilName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'transmitCoilName' put: dataElement.
			self dataElementsValues removeKey: 'transmitCoilName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'transmitCoilName' put: aSHValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> triggerTime [

	^self dataElementsValues at: 'triggerTime' ifAbsent: [
		self dataElementsDictionary at: 'triggerTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerTime' put: (self dataElementsDictionary removeKey: 'triggerTime') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> triggerTime: aDSValue [

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
MRImageIOM >> triggerWindow [

	^self dataElementsValues at: 'triggerWindow' ifAbsent: [
		self dataElementsDictionary at: 'triggerWindow' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerWindow' put: (self dataElementsDictionary removeKey: 'triggerWindow') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> triggerWindow: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerWindow' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerWindow.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'triggerWindow' put: dataElement.
			self dataElementsValues removeKey: 'triggerWindow' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerWindow' put: aISValue
		]
	].

]

{ #category : #accessing }
MRImageIOM >> variableFlipAngleFlag [

	^self dataElementsValues at: 'variableFlipAngleFlag' ifAbsent: [
		self dataElementsDictionary at: 'variableFlipAngleFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'variableFlipAngleFlag' put: (self dataElementsDictionary removeKey: 'variableFlipAngleFlag') value.
		]
	]

]

{ #category : #accessing }
MRImageIOM >> variableFlipAngleFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'variableFlipAngleFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #variableFlipAngleFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'variableFlipAngleFlag' put: dataElement.
			self dataElementsValues removeKey: 'variableFlipAngleFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'variableFlipAngleFlag' put: aCSValue
		]
	].

]
