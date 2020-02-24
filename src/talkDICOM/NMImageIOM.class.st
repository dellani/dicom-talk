Class {
	#name : #NMImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
NMImageIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Image Information Object Module'.
	moduleName := 'nmImageIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #imageType
				tag: #(16r8 16r8)
				vm: '1-n'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedOverlaySequence
				tag: #(16r8 16r1130)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedOverlaySequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedCurveSequence
				tag: #(16r8 16r1145)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedCurveSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #anatomicRegionSequence
				tag: #(16r8 16r2218)
				vm: '1'
				type: '3'
				sequenceItemClass: AnatomicRegionSequenceItem).
	self
		addDataElement:
			(ISDataElement
				newWith: #countsAccumulated
				tag: #(16r18 16r70)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #acquisitionTerminationCondition
				tag: #(16r18 16r71)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #triggerSourceOrType
				tag: #(16r18 16r1061)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #tableHeight
				tag: #(16r18 16r1130)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #tableTransverse
				tag: #(16r18 16r1131)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #actualFrameDuration
				tag: #(16r18 16r1242)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #countRate
				tag: #(16r18 16r1243)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #scanVelocity
				tag: #(16r18 16r1300)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(CSDataElement
				newWith: #wholeBodyTechnique
				tag: #(16r18 16r1301)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #scanLength
				tag: #(16r18 16r1302)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(LODataElement
				newWith: #processingFunction
				tag: #(16r18 16r5020)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #correctedImage
				tag: #(16r28 16r51)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #lossyImageCompression
				tag: #(16r28 16r2110)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SHDataElement
				newWith: #imageID
				tag: #(16r54 16r400)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
NMImageIOM >> acquisitionTerminationCondition [

	^self dataElementsValues at: 'acquisitionTerminationCondition' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionTerminationCondition' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionTerminationCondition' put: (self dataElementsDictionary removeKey: 'acquisitionTerminationCondition') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> acquisitionTerminationCondition: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionTerminationCondition' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionTerminationCondition.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'acquisitionTerminationCondition' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionTerminationCondition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionTerminationCondition' put: aCSValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> actualFrameDuration [

	^self dataElementsValues at: 'actualFrameDuration' ifAbsent: [
		self dataElementsDictionary at: 'actualFrameDuration' ifPresent: [:dataElement |
			self dataElementsValues at: 'actualFrameDuration' put: (self dataElementsDictionary removeKey: 'actualFrameDuration') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> actualFrameDuration: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'actualFrameDuration' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #actualFrameDuration.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'actualFrameDuration' put: dataElement.
			self dataElementsValues removeKey: 'actualFrameDuration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'actualFrameDuration' put: aISValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> anatomicRegionSequence [

	^self dataElementsValues at: 'anatomicRegionSequence' ifAbsent: [
		self dataElementsDictionary at: 'anatomicRegionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'anatomicRegionSequence' put: (self dataElementsDictionary removeKey: 'anatomicRegionSequence') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> anatomicRegionSequence: aSQValue [

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
NMImageIOM >> correctedImage [

	^self dataElementsValues at: 'correctedImage' ifAbsent: [
		self dataElementsDictionary at: 'correctedImage' ifPresent: [:dataElement |
			self dataElementsValues at: 'correctedImage' put: (self dataElementsDictionary removeKey: 'correctedImage') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> correctedImage: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'correctedImage' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #correctedImage.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'correctedImage' put: dataElement.
			self dataElementsValues removeKey: 'correctedImage' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'correctedImage' put: aCSValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> countRate [

	^self dataElementsValues at: 'countRate' ifAbsent: [
		self dataElementsDictionary at: 'countRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'countRate' put: (self dataElementsDictionary removeKey: 'countRate') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> countRate: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'countRate' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #countRate.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'countRate' put: dataElement.
			self dataElementsValues removeKey: 'countRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'countRate' put: aISValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> countsAccumulated [

	^self dataElementsValues at: 'countsAccumulated' ifAbsent: [
		self dataElementsDictionary at: 'countsAccumulated' ifPresent: [:dataElement |
			self dataElementsValues at: 'countsAccumulated' put: (self dataElementsDictionary removeKey: 'countsAccumulated') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> countsAccumulated: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'countsAccumulated' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #countsAccumulated.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'countsAccumulated' put: dataElement.
			self dataElementsValues removeKey: 'countsAccumulated' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'countsAccumulated' put: aISValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> imageID [

	^self dataElementsValues at: 'imageID' ifAbsent: [
		self dataElementsDictionary at: 'imageID' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageID' put: (self dataElementsDictionary removeKey: 'imageID') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> imageID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'imageID' put: dataElement.
			self dataElementsValues removeKey: 'imageID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageID' put: aSHValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> imageType [

	^self dataElementsValues at: 'imageType' ifAbsent: [
		self dataElementsDictionary at: 'imageType' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageType' put: (self dataElementsDictionary removeKey: 'imageType') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> imageType: aCSValue [

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
NMImageIOM >> lossyImageCompression [

	^self dataElementsValues at: 'lossyImageCompression' ifAbsent: [
		self dataElementsDictionary at: 'lossyImageCompression' ifPresent: [:dataElement |
			self dataElementsValues at: 'lossyImageCompression' put: (self dataElementsDictionary removeKey: 'lossyImageCompression') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> lossyImageCompression: aCSValue [

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
NMImageIOM >> processingFunction [

	^self dataElementsValues at: 'processingFunction' ifAbsent: [
		self dataElementsDictionary at: 'processingFunction' ifPresent: [:dataElement |
			self dataElementsValues at: 'processingFunction' put: (self dataElementsDictionary removeKey: 'processingFunction') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> processingFunction: aLOValue [

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
NMImageIOM >> rETIRED_ReferencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> rETIRED_ReferencedCurveSequence: aSQValue [

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
NMImageIOM >> rETIRED_ReferencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> rETIRED_ReferencedOverlaySequence: aSQValue [

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
NMImageIOM >> referencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
NMImageIOM >> referencedCurveSequence: aSQValue [

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
NMImageIOM >> referencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
NMImageIOM >> referencedOverlaySequence: aSQValue [

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
NMImageIOM >> scanLength [

	^self dataElementsValues at: 'scanLength' ifAbsent: [
		self dataElementsDictionary at: 'scanLength' ifPresent: [:dataElement |
			self dataElementsValues at: 'scanLength' put: (self dataElementsDictionary removeKey: 'scanLength') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> scanLength: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'scanLength' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scanLength.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'scanLength' put: dataElement.
			self dataElementsValues removeKey: 'scanLength' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scanLength' put: aISValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> scanVelocity [

	^self dataElementsValues at: 'scanVelocity' ifAbsent: [
		self dataElementsDictionary at: 'scanVelocity' ifPresent: [:dataElement |
			self dataElementsValues at: 'scanVelocity' put: (self dataElementsDictionary removeKey: 'scanVelocity') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> scanVelocity: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'scanVelocity' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #scanVelocity.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'scanVelocity' put: dataElement.
			self dataElementsValues removeKey: 'scanVelocity' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'scanVelocity' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> tableHeight [

	^self dataElementsValues at: 'tableHeight' ifAbsent: [
		self dataElementsDictionary at: 'tableHeight' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableHeight' put: (self dataElementsDictionary removeKey: 'tableHeight') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> tableHeight: aDSValue [

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

{ #category : #'accessing - talkDICOM names' }
NMImageIOM >> tableTransverse [

	^self dataElementsValues at: 'tableTraverse' ifAbsent: [
		self dataElementsDictionary at: 'tableTraverse' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableTraverse' put: (self dataElementsDictionary removeKey: 'tableTraverse') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
NMImageIOM >> tableTransverse: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableTraverse' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableTraverse.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'tableTraverse' put: dataElement.
			self dataElementsValues removeKey: 'tableTraverse' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableTraverse' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> tableTraverse [

	^self dataElementsValues at: 'tableTraverse' ifAbsent: [
		self dataElementsDictionary at: 'tableTraverse' ifPresent: [:dataElement |
			self dataElementsValues at: 'tableTraverse' put: (self dataElementsDictionary removeKey: 'tableTraverse') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> tableTraverse: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'tableTraverse' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #tableTraverse.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'tableTraverse' put: dataElement.
			self dataElementsValues removeKey: 'tableTraverse' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'tableTraverse' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> triggerSourceOrType [

	^self dataElementsValues at: 'triggerSourceOrType' ifAbsent: [
		self dataElementsDictionary at: 'triggerSourceOrType' ifPresent: [:dataElement |
			self dataElementsValues at: 'triggerSourceOrType' put: (self dataElementsDictionary removeKey: 'triggerSourceOrType') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> triggerSourceOrType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'triggerSourceOrType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #triggerSourceOrType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'triggerSourceOrType' put: dataElement.
			self dataElementsValues removeKey: 'triggerSourceOrType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'triggerSourceOrType' put: aLOValue
		]
	].

]

{ #category : #accessing }
NMImageIOM >> wholeBodyTechnique [

	^self dataElementsValues at: 'wholeBodyTechnique' ifAbsent: [
		self dataElementsDictionary at: 'wholeBodyTechnique' ifPresent: [:dataElement |
			self dataElementsValues at: 'wholeBodyTechnique' put: (self dataElementsDictionary removeKey: 'wholeBodyTechnique') value.
		]
	]

]

{ #category : #accessing }
NMImageIOM >> wholeBodyTechnique: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'wholeBodyTechnique' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #wholeBodyTechnique.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'wholeBodyTechnique' put: dataElement.
			self dataElementsValues removeKey: 'wholeBodyTechnique' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'wholeBodyTechnique' put: aCSValue
		]
	].

]
