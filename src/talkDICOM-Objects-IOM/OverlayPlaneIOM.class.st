Class {
	#name : #OverlayPlaneIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
OverlayPlaneIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Overlay Plane Information Object Module
	PS 3.3-2000 Annex C.9.2 (Page 450) - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM Overlay Plane Information Object Module'.
	moduleName := 'overlayPlaneIOM'.
	self
		addDataElement:
			(USDataElement
				newWith: #overlayRows
				tag: #(16r6000 16r0010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #overlayColumns
				tag: #(16r6000 16r0011)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #overlayType
				tag: #(16r6000 16r0040)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SSDataElement
				newWith: #overlayOrigin
				tag: #(16r6000 16r0050)
				vm: '2'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #overlayBitsAllocated
				tag: #(16r6000 16r0100)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #overlayBitPosition
				tag: #(16r6000 16r0102)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(OWDataElement
				newWith: #overlayData
				tag: #(16r6000 16r3000)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #overlayDescription
				tag: #(16r6000 16r0022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #overlaySubtype
				tag: #(16r6000 16r0045)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #overlayLabel
				tag: #(16r6000 16r1500)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #roiArea
				tag: #(16r6000 16r1301)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #roiMean
				tag: #(16r6000 16r1302)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #roiStandardDeviation
				tag: #(16r6000 16r1303)
				vm: '1'
				type: '3')
]

{ #category : #checking }
OverlayPlaneIOM >> checkIOM [

	^true
]

{ #category : #accessing }
OverlayPlaneIOM >> overlayBitPosition [

	^self dataElementsValues at: 'overlayBitPosition' ifAbsent: [
		self dataElementsDictionary at: 'overlayBitPosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayBitPosition' put: (self dataElementsDictionary removeKey: 'overlayBitPosition') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayBitPosition: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayBitPosition' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayBitPosition.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'overlayBitPosition' put: dataElement.
			self dataElementsValues removeKey: 'overlayBitPosition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayBitPosition' put: aUSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayBitsAllocated [

	^self dataElementsValues at: 'overlayBitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'overlayBitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayBitsAllocated' put: (self dataElementsDictionary removeKey: 'overlayBitsAllocated') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayBitsAllocated: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayBitsAllocated' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayBitsAllocated.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'overlayBitsAllocated' put: dataElement.
			self dataElementsValues removeKey: 'overlayBitsAllocated' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayBitsAllocated' put: aUSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayColumns [

	^self dataElementsValues at: 'overlayColumns' ifAbsent: [
		self dataElementsDictionary at: 'overlayColumns' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayColumns' put: (self dataElementsDictionary removeKey: 'overlayColumns') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayColumns: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayColumns' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayColumns.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'overlayColumns' put: dataElement.
			self dataElementsValues removeKey: 'overlayColumns' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayColumns' put: aUSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayData [

	^self dataElementsValues at: 'overlayData' ifAbsent: [
		self dataElementsDictionary at: 'overlayData' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayData' put: (self dataElementsDictionary removeKey: 'overlayData') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'overlayData' put: dataElement.
			self dataElementsValues removeKey: 'overlayData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayData' put: aOWValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayDescription [

	^self dataElementsValues at: 'overlayDescription' ifAbsent: [
		self dataElementsDictionary at: 'overlayDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayDescription' put: (self dataElementsDictionary removeKey: 'overlayDescription') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'overlayDescription' put: dataElement.
			self dataElementsValues removeKey: 'overlayDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayLabel [

	^self dataElementsValues at: 'overlayLabel' ifAbsent: [
		self dataElementsDictionary at: 'overlayLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayLabel' put: (self dataElementsDictionary removeKey: 'overlayLabel') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayLabel: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayLabel' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayLabel.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'overlayLabel' put: dataElement.
			self dataElementsValues removeKey: 'overlayLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayLabel' put: aLOValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayOrigin [

	^self dataElementsValues at: 'overlayOrigin' ifAbsent: [
		self dataElementsDictionary at: 'overlayOrigin' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayOrigin' put: (self dataElementsDictionary removeKey: 'overlayOrigin') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayOrigin: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayOrigin' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayOrigin.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'overlayOrigin' put: dataElement.
			self dataElementsValues removeKey: 'overlayOrigin' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayOrigin' put: aSSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayRows [

	^self dataElementsValues at: 'overlayRows' ifAbsent: [
		self dataElementsDictionary at: 'overlayRows' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayRows' put: (self dataElementsDictionary removeKey: 'overlayRows') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayRows: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayRows' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayRows.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'overlayRows' put: dataElement.
			self dataElementsValues removeKey: 'overlayRows' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayRows' put: aUSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> overlaySubtype [

	^self dataElementsValues at: 'overlaySubtype' ifAbsent: [
		self dataElementsDictionary at: 'overlaySubtype' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlaySubtype' put: (self dataElementsDictionary removeKey: 'overlaySubtype') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlaySubtype: aLOValue [

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
OverlayPlaneIOM >> overlayType [

	^self dataElementsValues at: 'overlayType' ifAbsent: [
		self dataElementsDictionary at: 'overlayType' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayType' put: (self dataElementsDictionary removeKey: 'overlayType') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> overlayType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'overlayType' put: dataElement.
			self dataElementsValues removeKey: 'overlayType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayType' put: aCSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> rOIArea [

	^self dataElementsValues at: 'rOIArea' ifAbsent: [
		self dataElementsDictionary at: 'rOIArea' ifPresent: [:dataElement |
			self dataElementsValues at: 'rOIArea' put: (self dataElementsDictionary removeKey: 'rOIArea') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> rOIArea: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rOIArea' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rOIArea.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rOIArea' put: dataElement.
			self dataElementsValues removeKey: 'rOIArea' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rOIArea' put: aISValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> rOIMean [

	^self dataElementsValues at: 'rOIMean' ifAbsent: [
		self dataElementsDictionary at: 'rOIMean' ifPresent: [:dataElement |
			self dataElementsValues at: 'rOIMean' put: (self dataElementsDictionary removeKey: 'rOIMean') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> rOIMean: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rOIMean' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rOIMean.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rOIMean' put: dataElement.
			self dataElementsValues removeKey: 'rOIMean' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rOIMean' put: aDSValue
		]
	].

]

{ #category : #accessing }
OverlayPlaneIOM >> rOIStandardDeviation [

	^self dataElementsValues at: 'rOIStandardDeviation' ifAbsent: [
		self dataElementsDictionary at: 'rOIStandardDeviation' ifPresent: [:dataElement |
			self dataElementsValues at: 'rOIStandardDeviation' put: (self dataElementsDictionary removeKey: 'rOIStandardDeviation') value.
		]
	]

]

{ #category : #accessing }
OverlayPlaneIOM >> rOIStandardDeviation: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rOIStandardDeviation' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rOIStandardDeviation.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rOIStandardDeviation' put: dataElement.
			self dataElementsValues removeKey: 'rOIStandardDeviation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rOIStandardDeviation' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
OverlayPlaneIOM >> roiArea [

	^self dataElementsValues at: 'rOIArea' ifAbsent: [
		self dataElementsDictionary at: 'rOIArea' ifPresent: [:dataElement |
			self dataElementsValues at: 'rOIArea' put: (self dataElementsDictionary removeKey: 'rOIArea') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
OverlayPlaneIOM >> roiArea: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rOIArea' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rOIArea.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rOIArea' put: dataElement.
			self dataElementsValues removeKey: 'rOIArea' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rOIArea' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
OverlayPlaneIOM >> roiMean [

	^self dataElementsValues at: 'rOIMean' ifAbsent: [
		self dataElementsDictionary at: 'rOIMean' ifPresent: [:dataElement |
			self dataElementsValues at: 'rOIMean' put: (self dataElementsDictionary removeKey: 'rOIMean') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
OverlayPlaneIOM >> roiMean: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rOIMean' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rOIMean.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rOIMean' put: dataElement.
			self dataElementsValues removeKey: 'rOIMean' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rOIMean' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
OverlayPlaneIOM >> roiStandardDeviation [

	^self dataElementsValues at: 'rOIStandardDeviation' ifAbsent: [
		self dataElementsDictionary at: 'rOIStandardDeviation' ifPresent: [:dataElement |
			self dataElementsValues at: 'rOIStandardDeviation' put: (self dataElementsDictionary removeKey: 'rOIStandardDeviation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
OverlayPlaneIOM >> roiStandardDeviation: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rOIStandardDeviation' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rOIStandardDeviation.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rOIStandardDeviation' put: dataElement.
			self dataElementsValues removeKey: 'rOIStandardDeviation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rOIStandardDeviation' put: aDSValue
		]
	].

]
