Class {
	#name : #PresentationStateIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
PresentationStateIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Presentation State Information Object Module'.
	moduleName := 'presentationStateIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedSeriesSequence
				tag: #(16r8 16r1115)
				vm: '1'
				type: '1'
				sequenceItemClass: ReferencedSeriesSequenceItem).
	self
		addDataElement:
			(USDataElement
				newWith: #shutterPresentationValue
				tag: #(16r18 16r1622)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #instanceNumber
				tag: #(16r20 16r13)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #recommendedViewingMode
				tag: #(16r28 16r1090)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #maskSubtractionSequence
				tag: #(16r28 16r6100)
				vm: '1'
				type: '1C'
				sequenceItemClass: MaskSubtractionSequenceItem).
	self
		addDataElement:
			(CSDataElement
				newWith: #presentationLabel
				tag: #(16r70 16r80)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(LODataElement
				newWith: #presentationDescription
				tag: #(16r70 16r81)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DADataElement
				newWith: #presentationCreationDate
				tag: #(16r70 16r82)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(TMDataElement
				newWith: #presentationCreationTime
				tag: #(16r70 16r83)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(PNDataElement
				newWith: #presentationCreatorsName
				tag: #(16r70 16r84)
				vm: '1'
				type: '2')
]

{ #category : #accessing }
PresentationStateIOM >> contentCreatorName [

	^self dataElementsValues at: 'contentCreatorName' ifAbsent: [
		self dataElementsDictionary at: 'contentCreatorName' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentCreatorName' put: (self dataElementsDictionary removeKey: 'contentCreatorName') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> contentCreatorName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentCreatorName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentCreatorName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'contentCreatorName' put: dataElement.
			self dataElementsValues removeKey: 'contentCreatorName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentCreatorName' put: aPNValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> contentDescription [

	^self dataElementsValues at: 'contentDescription' ifAbsent: [
		self dataElementsDictionary at: 'contentDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentDescription' put: (self dataElementsDictionary removeKey: 'contentDescription') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> contentDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'contentDescription' put: dataElement.
			self dataElementsValues removeKey: 'contentDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> contentLabel [

	^self dataElementsValues at: 'contentLabel' ifAbsent: [
		self dataElementsDictionary at: 'contentLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentLabel' put: (self dataElementsDictionary removeKey: 'contentLabel') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> contentLabel: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentLabel' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentLabel.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'contentLabel' put: dataElement.
			self dataElementsValues removeKey: 'contentLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentLabel' put: aCSValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> instanceNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'instanceNumber' put: dataElement.
			self dataElementsValues removeKey: 'instanceNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> maskSubtractionSequence [

	^self dataElementsValues at: 'maskSubtractionSequence' ifAbsent: [
		self dataElementsDictionary at: 'maskSubtractionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskSubtractionSequence' put: (self dataElementsDictionary removeKey: 'maskSubtractionSequence') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> maskSubtractionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskSubtractionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskSubtractionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'maskSubtractionSequence' put: dataElement.
			self dataElementsValues removeKey: 'maskSubtractionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskSubtractionSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> presentationCreationDate [

	^self dataElementsValues at: 'presentationCreationDate' ifAbsent: [
		self dataElementsDictionary at: 'presentationCreationDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationCreationDate' put: (self dataElementsDictionary removeKey: 'presentationCreationDate') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> presentationCreationDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationCreationDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationCreationDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'presentationCreationDate' put: dataElement.
			self dataElementsValues removeKey: 'presentationCreationDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationCreationDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> presentationCreationTime [

	^self dataElementsValues at: 'presentationCreationTime' ifAbsent: [
		self dataElementsDictionary at: 'presentationCreationTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationCreationTime' put: (self dataElementsDictionary removeKey: 'presentationCreationTime') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> presentationCreationTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationCreationTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationCreationTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'presentationCreationTime' put: dataElement.
			self dataElementsValues removeKey: 'presentationCreationTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationCreationTime' put: aTMValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PresentationStateIOM >> presentationCreatorsName [

	^self dataElementsValues at: 'contentCreatorName' ifAbsent: [
		self dataElementsDictionary at: 'contentCreatorName' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentCreatorName' put: (self dataElementsDictionary removeKey: 'contentCreatorName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PresentationStateIOM >> presentationCreatorsName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentCreatorName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentCreatorName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'contentCreatorName' put: dataElement.
			self dataElementsValues removeKey: 'contentCreatorName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentCreatorName' put: aPNValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PresentationStateIOM >> presentationDescription [

	^self dataElementsValues at: 'contentDescription' ifAbsent: [
		self dataElementsDictionary at: 'contentDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentDescription' put: (self dataElementsDictionary removeKey: 'contentDescription') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PresentationStateIOM >> presentationDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'contentDescription' put: dataElement.
			self dataElementsValues removeKey: 'contentDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentDescription' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PresentationStateIOM >> presentationLabel [

	^self dataElementsValues at: 'contentLabel' ifAbsent: [
		self dataElementsDictionary at: 'contentLabel' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentLabel' put: (self dataElementsDictionary removeKey: 'contentLabel') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PresentationStateIOM >> presentationLabel: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentLabel' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentLabel.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'contentLabel' put: dataElement.
			self dataElementsValues removeKey: 'contentLabel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentLabel' put: aCSValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> recommendedViewingMode [

	^self dataElementsValues at: 'recommendedViewingMode' ifAbsent: [
		self dataElementsDictionary at: 'recommendedViewingMode' ifPresent: [:dataElement |
			self dataElementsValues at: 'recommendedViewingMode' put: (self dataElementsDictionary removeKey: 'recommendedViewingMode') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> recommendedViewingMode: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'recommendedViewingMode' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #recommendedViewingMode.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'recommendedViewingMode' put: dataElement.
			self dataElementsValues removeKey: 'recommendedViewingMode' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'recommendedViewingMode' put: aCSValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> referencedSeriesSequence [

	^self dataElementsValues at: 'referencedSeriesSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSeriesSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSeriesSequence' put: (self dataElementsDictionary removeKey: 'referencedSeriesSequence') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> referencedSeriesSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSeriesSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSeriesSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedSeriesSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedSeriesSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSeriesSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
PresentationStateIOM >> shutterPresentationValue [

	^self dataElementsValues at: 'shutterPresentationValue' ifAbsent: [
		self dataElementsDictionary at: 'shutterPresentationValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterPresentationValue' put: (self dataElementsDictionary removeKey: 'shutterPresentationValue') value.
		]
	]

]

{ #category : #accessing }
PresentationStateIOM >> shutterPresentationValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterPresentationValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterPresentationValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'shutterPresentationValue' put: dataElement.
			self dataElementsValues removeKey: 'shutterPresentationValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterPresentationValue' put: aUSValue
		]
	].

]
