Class {
	#name : #CurveIdentificationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
CurveIdentificationIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Curve Identification Information Object Module
	PS 3.3-2001 Annex C.10.1 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM Curve Identification Information Object Module'.
	moduleName := 'curveIdentificationIOM'.
	self
		addDataElement:
			(ISDataElement
				newWith: #curveNumber
				tag: #(16r0020 16r0024)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(DADataElement
				newWith: #curveDate
				tag: #(16r0008 16r0025)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #curveTime
				tag: #(16r0008 16r0035)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r0008 16r1140)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedImageSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedOverlaySequence
				tag: #(16r0008 16r1130)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedOverlaySequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedCurveSequence
				tag: #(16r0008 16r1145)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedCurveSequenceItem)
]

{ #category : #checking }
CurveIdentificationIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> curveDate [

	^self dataElementsValues at: 'rETIRED_CurveDate' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDate' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDate') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> curveDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'rETIRED_CurveDate' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDate' put: aDAValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> curveNumber [

	^self dataElementsValues at: 'rETIRED_CurveNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> curveNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_CurveNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveNumber' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> curveTime [

	^self dataElementsValues at: 'rETIRED_CurveTime' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveTime' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> curveTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'rETIRED_CurveTime' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_CurveDate [

	^self dataElementsValues at: 'rETIRED_CurveDate' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveDate' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveDate') value.
		]
	]

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_CurveDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'rETIRED_CurveDate' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_CurveNumber [

	^self dataElementsValues at: 'rETIRED_CurveNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveNumber') value.
		]
	]

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_CurveNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'rETIRED_CurveNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_CurveTime [

	^self dataElementsValues at: 'rETIRED_CurveTime' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveTime' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveTime') value.
		]
	]

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_CurveTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'rETIRED_CurveTime' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_ReferencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_ReferencedCurveSequence: aSQValue [

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
CurveIdentificationIOM >> rETIRED_ReferencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #accessing }
CurveIdentificationIOM >> rETIRED_ReferencedOverlaySequence: aSQValue [

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
CurveIdentificationIOM >> referencedCurveSequence [

	^self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedCurveSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedCurveSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedCurveSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> referencedCurveSequence: aSQValue [

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
CurveIdentificationIOM >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
CurveIdentificationIOM >> referencedImageSequence: aSQValue [

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

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> referencedOverlaySequence [

	^self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_ReferencedOverlaySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_ReferencedOverlaySequence' put: (self dataElementsDictionary removeKey: 'rETIRED_ReferencedOverlaySequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
CurveIdentificationIOM >> referencedOverlaySequence: aSQValue [

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
