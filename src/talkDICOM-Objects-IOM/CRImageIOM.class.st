"
CRImageIOM 

This class represents the DICOM CR Image Information Object Module (see more on PS 3.3-2000 Annex C.8.1.2)
PRD - June 12th, 2003

* Plate ID (0018,1004) 3
	The ID or serial number of the sensing plate upon which the image was acquired""
* Imager Pixel Spacing (0018,1164) 3
	Physical distance measured at the front plane of the Image Receptor housing between
	the center of each pixel. Specified by a numeric pair - row spacing value (delimiter)
	column spacing value - in mm. In the case of CR, 	the front plane is defined to be the
	external surface of the CR plate closest to the patient and radiation source.
* Acquisition Device Processing Description (0018,1400) 3
	Describes device-specific processing associated with the image (e.g. Organ Description)
* Acquisition Device Processing Code (0018,1401) 3
	Code representing the device-specific processing associated with the image
	(e.g. CR Organ Filtering code)
* Cassette Orientation (0018,1402) 3
	 Orientation of cassette, used to properly position the image for display. 
	Enumerated Values: LANDSCAPE PORTRAIT
* Cassette Size (0018,1403) 3
	Size of cassette. Defined Terms: 
		18CMX24CM
		8INX10IN
		24CMX30CM
		10INX12IN
		30CMX35CM
		30CMX40CM
		11INX14IN
		35CMX35CM
		14INX14IN
		35CMX43CM
		14INX17IN
* Exposures on Plate (0018,1404) 3
	Total number of x-ray exposures that have been made on the plate identified 
	in Plate ID (0018,1004)
* Relative X-ray Exposure (0018,1405) 3
	Relative x-ray exposure on the plate. Meaning of values is implementation specific.
	May be used to adjust the dynamic range of the plate digitizer (scanner).
* Sensitivity (0018,6000) 3
	Read out sensitivity.
"
Class {
	#name : #CRImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
CRImageIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM CR Image Information Object Module
	(see more on PS 3.3-2000 Annex C.8.1.2) - PRD June 12th 2003"

	self resetDataElements.
	Name := 'DICOM Computed Radiography Image Information Object Module'.
	moduleName := 'crImageIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #photometricInterpretation
				tag: #(16r0028 16r0004)
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
			(LODataElement
				newWith: #plateID
				tag: #(16r0018 16r1004)
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
			(DSDataElement
				newWith: #imagerPixelSpacing
				tag: #(16r0018 16r1164)
				vm: '2'
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
			(LODataElement
				newWith: #acquisitionDeviceProcessingDescription
				tag: #(16r0018 16r1400)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #acquisitionDeviceProcessingCode
				tag: #(16r0018 16r1401)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #casseteOrientation
				tag: #(16r0018 16r1402)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #casseteSize
				tag: #(16r0018 16r1403)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(USDataElement
				newWith: #exposuresOnPlate
				tag: #(16r0018 16r1404)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #relativeXRayExposure
				tag: #(16r0018 16r1405)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #sensitivity
				tag: #(16r0018 16r6000)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
CRImageIOM >> acquisitionDeviceProcessingCode [

	^self dataElementsValues at: 'acquisitionDeviceProcessingCode' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDeviceProcessingCode' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDeviceProcessingCode' put: (self dataElementsDictionary removeKey: 'acquisitionDeviceProcessingCode') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> acquisitionDeviceProcessingCode: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDeviceProcessingCode' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDeviceProcessingCode.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'acquisitionDeviceProcessingCode' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDeviceProcessingCode' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDeviceProcessingCode' put: aLOValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> acquisitionDeviceProcessingDescription [

	^self dataElementsValues at: 'acquisitionDeviceProcessingDescription' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDeviceProcessingDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDeviceProcessingDescription' put: (self dataElementsDictionary removeKey: 'acquisitionDeviceProcessingDescription') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> acquisitionDeviceProcessingDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDeviceProcessingDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDeviceProcessingDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'acquisitionDeviceProcessingDescription' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDeviceProcessingDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDeviceProcessingDescription' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CRImageIOM >> casseteOrientation [

	^self dataElementsValues at: 'cassetteOrientation' ifAbsent: [
		self dataElementsDictionary at: 'cassetteOrientation' ifPresent: [:dataElement |
			self dataElementsValues at: 'cassetteOrientation' put: (self dataElementsDictionary removeKey: 'cassetteOrientation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CRImageIOM >> casseteOrientation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'cassetteOrientation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cassetteOrientation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'cassetteOrientation' put: dataElement.
			self dataElementsValues removeKey: 'cassetteOrientation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cassetteOrientation' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CRImageIOM >> casseteSize [

	^self dataElementsValues at: 'cassetteSize' ifAbsent: [
		self dataElementsDictionary at: 'cassetteSize' ifPresent: [:dataElement |
			self dataElementsValues at: 'cassetteSize' put: (self dataElementsDictionary removeKey: 'cassetteSize') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CRImageIOM >> casseteSize: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'cassetteSize' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cassetteSize.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'cassetteSize' put: dataElement.
			self dataElementsValues removeKey: 'cassetteSize' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cassetteSize' put: aCSValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> cassetteOrientation [

	^self dataElementsValues at: 'cassetteOrientation' ifAbsent: [
		self dataElementsDictionary at: 'cassetteOrientation' ifPresent: [:dataElement |
			self dataElementsValues at: 'cassetteOrientation' put: (self dataElementsDictionary removeKey: 'cassetteOrientation') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> cassetteOrientation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'cassetteOrientation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cassetteOrientation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'cassetteOrientation' put: dataElement.
			self dataElementsValues removeKey: 'cassetteOrientation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cassetteOrientation' put: aCSValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> cassetteSize [

	^self dataElementsValues at: 'cassetteSize' ifAbsent: [
		self dataElementsDictionary at: 'cassetteSize' ifPresent: [:dataElement |
			self dataElementsValues at: 'cassetteSize' put: (self dataElementsDictionary removeKey: 'cassetteSize') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> cassetteSize: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'cassetteSize' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #cassetteSize.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'cassetteSize' put: dataElement.
			self dataElementsValues removeKey: 'cassetteSize' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'cassetteSize' put: aCSValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> distanceSourceToDetector [

	^self dataElementsValues at: 'distanceSourceToDetector' ifAbsent: [
		self dataElementsDictionary at: 'distanceSourceToDetector' ifPresent: [:dataElement |
			self dataElementsValues at: 'distanceSourceToDetector' put: (self dataElementsDictionary removeKey: 'distanceSourceToDetector') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> distanceSourceToDetector: aDSValue [

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
CRImageIOM >> distanceSourceToPatient [

	^self dataElementsValues at: 'distanceSourceToPatient' ifAbsent: [
		self dataElementsDictionary at: 'distanceSourceToPatient' ifPresent: [:dataElement |
			self dataElementsValues at: 'distanceSourceToPatient' put: (self dataElementsDictionary removeKey: 'distanceSourceToPatient') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> distanceSourceToPatient: aDSValue [

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
CRImageIOM >> exposure [

	^self dataElementsValues at: 'exposure' ifAbsent: [
		self dataElementsDictionary at: 'exposure' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposure' put: (self dataElementsDictionary removeKey: 'exposure') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> exposure: aISValue [

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
CRImageIOM >> exposureInmAS [

	^self dataElementsValues at: 'exposureInuAs' ifAbsent: [
		self dataElementsDictionary at: 'exposureInuAs' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposureInuAs' put: (self dataElementsDictionary removeKey: 'exposureInuAs') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CRImageIOM >> exposureInmAS: aISValue [

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
CRImageIOM >> exposureInuAs [

	^self dataElementsValues at: 'exposureInuAs' ifAbsent: [
		self dataElementsDictionary at: 'exposureInuAs' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposureInuAs' put: (self dataElementsDictionary removeKey: 'exposureInuAs') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> exposureInuAs: aISValue [

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
CRImageIOM >> exposureTime [

	^self dataElementsValues at: 'exposureTime' ifAbsent: [
		self dataElementsDictionary at: 'exposureTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposureTime' put: (self dataElementsDictionary removeKey: 'exposureTime') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> exposureTime: aISValue [

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
CRImageIOM >> exposuresOnPlate [

	^self dataElementsValues at: 'exposuresOnPlate' ifAbsent: [
		self dataElementsDictionary at: 'exposuresOnPlate' ifPresent: [:dataElement |
			self dataElementsValues at: 'exposuresOnPlate' put: (self dataElementsDictionary removeKey: 'exposuresOnPlate') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> exposuresOnPlate: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'exposuresOnPlate' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #exposuresOnPlate.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'exposuresOnPlate' put: dataElement.
			self dataElementsValues removeKey: 'exposuresOnPlate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'exposuresOnPlate' put: aUSValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> generatorPower [

	^self dataElementsValues at: 'generatorPower' ifAbsent: [
		self dataElementsDictionary at: 'generatorPower' ifPresent: [:dataElement |
			self dataElementsValues at: 'generatorPower' put: (self dataElementsDictionary removeKey: 'generatorPower') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> generatorPower: aISValue [

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
CRImageIOM >> imagerPixelSpacing [

	^self dataElementsValues at: 'imagerPixelSpacing' ifAbsent: [
		self dataElementsDictionary at: 'imagerPixelSpacing' ifPresent: [:dataElement |
			self dataElementsValues at: 'imagerPixelSpacing' put: (self dataElementsDictionary removeKey: 'imagerPixelSpacing') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> imagerPixelSpacing: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imagerPixelSpacing' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imagerPixelSpacing.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'imagerPixelSpacing' put: dataElement.
			self dataElementsValues removeKey: 'imagerPixelSpacing' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imagerPixelSpacing' put: aDSValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> kVP [

	^self dataElementsValues at: 'kVP' ifAbsent: [
		self dataElementsDictionary at: 'kVP' ifPresent: [:dataElement |
			self dataElementsValues at: 'kVP' put: (self dataElementsDictionary removeKey: 'kVP') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> kVP: aDSValue [

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
CRImageIOM >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> photometricInterpretation: aCSValue [

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
CRImageIOM >> plateID [

	^self dataElementsValues at: 'plateID' ifAbsent: [
		self dataElementsDictionary at: 'plateID' ifPresent: [:dataElement |
			self dataElementsValues at: 'plateID' put: (self dataElementsDictionary removeKey: 'plateID') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> plateID: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'plateID' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #plateID.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'plateID' put: dataElement.
			self dataElementsValues removeKey: 'plateID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'plateID' put: aLOValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> relativeXRayExposure [

	^self dataElementsValues at: 'relativeXRayExposure' ifAbsent: [
		self dataElementsDictionary at: 'relativeXRayExposure' ifPresent: [:dataElement |
			self dataElementsValues at: 'relativeXRayExposure' put: (self dataElementsDictionary removeKey: 'relativeXRayExposure') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> relativeXRayExposure: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'relativeXRayExposure' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #relativeXRayExposure.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'relativeXRayExposure' put: dataElement.
			self dataElementsValues removeKey: 'relativeXRayExposure' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'relativeXRayExposure' put: aISValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> sensitivity [

	^self dataElementsValues at: 'sensitivity' ifAbsent: [
		self dataElementsDictionary at: 'sensitivity' ifPresent: [:dataElement |
			self dataElementsValues at: 'sensitivity' put: (self dataElementsDictionary removeKey: 'sensitivity') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> sensitivity: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sensitivity' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sensitivity.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sensitivity' put: dataElement.
			self dataElementsValues removeKey: 'sensitivity' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sensitivity' put: aDSValue
		]
	].

]

{ #category : #accessing }
CRImageIOM >> xRayTubeCurrent [

	^self dataElementsValues at: 'xRayTubeCurrent' ifAbsent: [
		self dataElementsDictionary at: 'xRayTubeCurrent' ifPresent: [:dataElement |
			self dataElementsValues at: 'xRayTubeCurrent' put: (self dataElementsDictionary removeKey: 'xRayTubeCurrent') value.
		]
	]

]

{ #category : #accessing }
CRImageIOM >> xRayTubeCurrent: aISValue [

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
