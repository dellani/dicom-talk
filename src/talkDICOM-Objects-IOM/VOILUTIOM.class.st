Class {
	#name : #VOILUTIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
VOILUTIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the 
	DICOM VOI LUT Information Object Module
	PS 3.3-2000 Annex C.11.2 (Page 487) - PRD 04-06.2001"

	self resetDataElements.
	Name := 'VOI LUT Information Object Module'.
	moduleName := 'voiLUTIOM'.
	self
		addDataElement:
			(SQDataElement
				newWith: #voiLUTSequence
				tag: #(16r0028 16r3010)
				vm: '1'
				type: '3'
				sequenceItemClass: VOILUTSequenceItem).
	self
		addDataElement:
			(DSDataElement
				newWith: #windowCenter
				tag: #(16r0028 16r1050)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #windowWidth
				tag: #(16r0028 16r1051)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #windowCenterAndWidthExplanation
				tag: #(16r0028 16r1055)
				vm: '1-n'
				type: '3')
]

{ #category : #accessing }
VOILUTIOM >> vOILUTSequence [

	^self dataElementsValues at: 'vOILUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'vOILUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'vOILUTSequence' put: (self dataElementsDictionary removeKey: 'vOILUTSequence') value.
		]
	]

]

{ #category : #accessing }
VOILUTIOM >> vOILUTSequence: aSQValue [

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
VOILUTIOM >> voiLUTSequence [

	^self dataElementsValues at: 'vOILUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'vOILUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'vOILUTSequence' put: (self dataElementsDictionary removeKey: 'vOILUTSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTIOM >> voiLUTSequence: aSQValue [

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
VOILUTIOM >> windowCenter [

	^self dataElementsValues at: 'windowCenter' ifAbsent: [
		self dataElementsDictionary at: 'windowCenter' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowCenter' put: (self dataElementsDictionary removeKey: 'windowCenter') value.
		]
	]

]

{ #category : #accessing }
VOILUTIOM >> windowCenter: aDSValue [

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
VOILUTIOM >> windowCenterAndWidthExplanation [

	^self dataElementsValues at: 'windowCenterWidthExplanation' ifAbsent: [
		self dataElementsDictionary at: 'windowCenterWidthExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowCenterWidthExplanation' put: (self dataElementsDictionary removeKey: 'windowCenterWidthExplanation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTIOM >> windowCenterAndWidthExplanation: aLOValue [

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
VOILUTIOM >> windowCenterWidthExplanation [

	^self dataElementsValues at: 'windowCenterWidthExplanation' ifAbsent: [
		self dataElementsDictionary at: 'windowCenterWidthExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowCenterWidthExplanation' put: (self dataElementsDictionary removeKey: 'windowCenterWidthExplanation') value.
		]
	]

]

{ #category : #accessing }
VOILUTIOM >> windowCenterWidthExplanation: aLOValue [

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
VOILUTIOM >> windowWidth [

	^self dataElementsValues at: 'windowWidth' ifAbsent: [
		self dataElementsDictionary at: 'windowWidth' ifPresent: [:dataElement |
			self dataElementsValues at: 'windowWidth' put: (self dataElementsDictionary removeKey: 'windowWidth') value.
		]
	]

]

{ #category : #accessing }
VOILUTIOM >> windowWidth: aDSValue [

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
