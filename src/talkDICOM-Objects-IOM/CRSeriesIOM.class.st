"
This classe corresponds to the DICOM CR Series Information Object Module
See in the DICOM Starndard further details (PS 3.3-2000 Annex C.8.1.1)
PRD June 12th, 2003

* Body Part Examined (0018,0015)
	Text description of the part of the body examined. Defined Terms: 
		SKULL 
		CSPINE 
		TSPINE 
		LSPINE 
		SSPINE 
		COCCYX 
		CHEST 
		CLAVICLE 
		BREAST 
		ABDOMEN 
		PELVIS 
		HIP 
		SHOULDER 
		ELBOW 
		KNEE 
		ANKLE 
		HAND 
		FOOT 
		EXTREMITY.
* View Position (0018,5101)
	Radiographic view associated with Patient Position (0018,5100). Defined Terms: 
		AP = Anterior/Posterior
		PA = Posterior/Anterior
		LL = Left Lateral
		RL = Right Lateral
		RLD = Right Lateral Decubitus
		LLD = Left Lateral Decubitus
		RLO = Right Lateral Oblique
		LLO = Left Lateral Oblique""
* Filter Type (0018,1160)
	 Label for the type of filter inserted into the x-ray beam
* Collimator/grid Name (0018,1180) 3
	Label describing any grid inserted.
* Focal Spot (0018,1190) 3 
	Size of the focal spot in mm. For devices with variable focal spot or multiple focal spots, 
	small dimension followed by large dimension.
* Plate Type (0018,1260) 3
	Label of the type of storage phosphor plates used in this series
* Phosphor Type (0018,1261) 3
	Label of type of phosphor on the plates
"
Class {
	#name : #CRSeriesIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
CRSeriesIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM CD Series Information Object Module
PS 3.3-2000 Annex C.8.1.1 - PRD June 12th, 2003"

	self resetDataElements.
	Name := 'DICOM CR Series Information Object Module'.
	moduleName := 'crSeriesIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #bodyPartExamined
				tag: #(16r0018 16r0015)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #viewPosition
				tag: #(16r0018 16r5101)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SHDataElement
				newWith: #filterType
				tag: #(16r0018 16r1160)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #collimatorGridName
				tag: #(16r0018 16r1180)
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
				newWith: #plateType
				tag: #(16r0018 16r1260)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #phosphorType
				tag: #(16r0018 16r1261)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
CRSeriesIOM >> bodyPartExamined [

	^self dataElementsValues at: 'bodyPartExamined' ifAbsent: [
		self dataElementsDictionary at: 'bodyPartExamined' ifPresent: [:dataElement |
			self dataElementsValues at: 'bodyPartExamined' put: (self dataElementsDictionary removeKey: 'bodyPartExamined') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> bodyPartExamined: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bodyPartExamined' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bodyPartExamined.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'bodyPartExamined' put: dataElement.
			self dataElementsValues removeKey: 'bodyPartExamined' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bodyPartExamined' put: aCSValue
		]
	].

]

{ #category : #checking }
CRSeriesIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
CRSeriesIOM >> collimatorGridName [

	^self dataElementsValues at: 'collimatorGridName' ifAbsent: [
		self dataElementsDictionary at: 'collimatorGridName' ifPresent: [:dataElement |
			self dataElementsValues at: 'collimatorGridName' put: (self dataElementsDictionary removeKey: 'collimatorGridName') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> collimatorGridName: aSHValue [

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
CRSeriesIOM >> filterType [

	^self dataElementsValues at: 'filterType' ifAbsent: [
		self dataElementsDictionary at: 'filterType' ifPresent: [:dataElement |
			self dataElementsValues at: 'filterType' put: (self dataElementsDictionary removeKey: 'filterType') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> filterType: aSHValue [

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
CRSeriesIOM >> focalSpot [

	^self dataElementsValues at: 'focalSpots' ifAbsent: [
		self dataElementsDictionary at: 'focalSpots' ifPresent: [:dataElement |
			self dataElementsValues at: 'focalSpots' put: (self dataElementsDictionary removeKey: 'focalSpots') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CRSeriesIOM >> focalSpot: aDSValue [

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
CRSeriesIOM >> focalSpots [

	^self dataElementsValues at: 'focalSpots' ifAbsent: [
		self dataElementsDictionary at: 'focalSpots' ifPresent: [:dataElement |
			self dataElementsValues at: 'focalSpots' put: (self dataElementsDictionary removeKey: 'focalSpots') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> focalSpots: aDSValue [

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
CRSeriesIOM >> phosphorType [

	^self dataElementsValues at: 'phosphorType' ifAbsent: [
		self dataElementsDictionary at: 'phosphorType' ifPresent: [:dataElement |
			self dataElementsValues at: 'phosphorType' put: (self dataElementsDictionary removeKey: 'phosphorType') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> phosphorType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'phosphorType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #phosphorType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'phosphorType' put: dataElement.
			self dataElementsValues removeKey: 'phosphorType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'phosphorType' put: aLOValue
		]
	].

]

{ #category : #accessing }
CRSeriesIOM >> plateType [

	^self dataElementsValues at: 'plateType' ifAbsent: [
		self dataElementsDictionary at: 'plateType' ifPresent: [:dataElement |
			self dataElementsValues at: 'plateType' put: (self dataElementsDictionary removeKey: 'plateType') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> plateType: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'plateType' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #plateType.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'plateType' put: dataElement.
			self dataElementsValues removeKey: 'plateType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'plateType' put: aSHValue
		]
	].

]

{ #category : #accessing }
CRSeriesIOM >> viewPosition [

	^self dataElementsValues at: 'viewPosition' ifAbsent: [
		self dataElementsDictionary at: 'viewPosition' ifPresent: [:dataElement |
			self dataElementsValues at: 'viewPosition' put: (self dataElementsDictionary removeKey: 'viewPosition') value.
		]
	]

]

{ #category : #accessing }
CRSeriesIOM >> viewPosition: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'viewPosition' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #viewPosition.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'viewPosition' put: dataElement.
			self dataElementsValues removeKey: 'viewPosition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'viewPosition' put: aCSValue
		]
	].

]
