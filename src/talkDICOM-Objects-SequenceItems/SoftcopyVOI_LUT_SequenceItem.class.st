Class {
	#name : #'SoftcopyVOI_LUT_SequenceItem',
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
SoftcopyVOI_LUT_SequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Softcopy VOI LUT Sequence Item'.
	SequenceName := 'softcopyVOI_LUT_SequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r8 16r1140)
				vm: '1'
				type: '1C'
				sequenceItemClass: ReferencedImageSequenceItem).
	self
		addDataElement:
			(DSDataElement
				newWith: #windowCenter
				tag: #(16r28 16r1050)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #windowWidth
				tag: #(16r28 16r1051)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #windowCenterAndWidthExplanation
				tag: #(16r28 16r1055)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #voiLUTSequence
				tag: #(16r28 16r3010)
				vm: '1'
				type: '1C'
				sequenceItemClass: VOILUTSequenceItem)
]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> referencedImageSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedImageSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedImageSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedImageSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedImageSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> vOILUTSequence [

	^self dataElementsValues at: 'vOILUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'vOILUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'vOILUTSequence' put: (self dataElementsDictionary removeKey: 'vOILUTSequence') value.
		]
	]

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> vOILUTSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'vOILUTSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #vOILUTSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'vOILUTSequence' put: dataElement.
			self dataElementsValues removeKey: 'vOILUTSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'vOILUTSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SoftcopyVOI_LUT_SequenceItem >> voiLUTSequence [

	^self dataElementsValues at: 'vOILUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'vOILUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'vOILUTSequence' put: (self dataElementsDictionary removeKey: 'vOILUTSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SoftcopyVOI_LUT_SequenceItem >> voiLUTSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'vOILUTSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #vOILUTSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'vOILUTSequence' put: dataElement.
			self dataElementsValues removeKey: 'vOILUTSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'vOILUTSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> windowCenter [

	^self dataElementsValues at: 'windowCenter' ifAbsent: [
		self dataElementsDictionary at: 'windowCenter' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowCenter' put: (self dataElementsDictionary removeKey: 'windowCenter') value.
		]
	]

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> windowCenter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'windowCenter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #windowCenter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'windowCenter' put: dataElement.
			self dataElementsValues removeKey: 'windowCenter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'windowCenter' put: aDSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SoftcopyVOI_LUT_SequenceItem >> windowCenterAndWidthExplanation [

	^self dataElementsValues at: 'windowCenterWidthExplanation' ifAbsent: [
		self dataElementsDictionary at: 'windowCenterWidthExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowCenterWidthExplanation' put: (self dataElementsDictionary removeKey: 'windowCenterWidthExplanation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SoftcopyVOI_LUT_SequenceItem >> windowCenterAndWidthExplanation: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'windowCenterWidthExplanation' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #windowCenterWidthExplanation.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'windowCenterWidthExplanation' put: dataElement.
			self dataElementsValues removeKey: 'windowCenterWidthExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'windowCenterWidthExplanation' put: aLOValue
		]
	].

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> windowCenterWidthExplanation [

	^self dataElementsValues at: 'windowCenterWidthExplanation' ifAbsent: [
		self dataElementsDictionary at: 'windowCenterWidthExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowCenterWidthExplanation' put: (self dataElementsDictionary removeKey: 'windowCenterWidthExplanation') value.
		]
	]

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> windowCenterWidthExplanation: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'windowCenterWidthExplanation' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #windowCenterWidthExplanation.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'windowCenterWidthExplanation' put: dataElement.
			self dataElementsValues removeKey: 'windowCenterWidthExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'windowCenterWidthExplanation' put: aLOValue
		]
	].

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> windowWidth [

	^self dataElementsValues at: 'windowWidth' ifAbsent: [
		self dataElementsDictionary at: 'windowWidth' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowWidth' put: (self dataElementsDictionary removeKey: 'windowWidth') value.
		]
	]

]

{ #category : #accessing }
SoftcopyVOI_LUT_SequenceItem >> windowWidth: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'windowWidth' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #windowWidth.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'windowWidth' put: dataElement.
			self dataElementsValues removeKey: 'windowWidth' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'windowWidth' put: aDSValue
		]
	].

]
