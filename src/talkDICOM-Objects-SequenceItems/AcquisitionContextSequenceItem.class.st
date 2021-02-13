Class {
	#name : #AcquisitionContextSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
AcquisitionContextSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Acquisition Context Sequence Item'.
	SequenceName := 'acquisitionContextSequenceItem'.
	self
		addDataElement:
			(SQDataElement
				newWith: #conceptNameCodeSequence
				tag: #(16r0040 16rA043)
				vm: '1'
				type: '1C'
				sequenceItemClass: ConceptNameCodeSequenceItem).
	self
		addDataElement:
			(USDataElement
				newWith: #referencedFrameNumbers
				tag: #(16r0040 16rA136)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #numericValue
				tag: #(16r0040 16rA30A)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #measurementUnitCodeSequence
				tag: #(16r0040 16r08EA)
				vm: '1'
				type: '1C'
				sequenceItemClass: MeasurementUnitsCodeSequenceItem).
	self
		addDataElement:
			(DADataElement
				newWith: #date
				tag: #(16r0040 16rA121)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(TMDataElement
				newWith: #time
				tag: #(16r0040 16rA122)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(PNDataElement
				newWith: #personName
				tag: #(16r0040 16rA123)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UTDataElement
				newWith: #textValue
				tag: #(16r0040 16rA160)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #conceptCodeSequence
				tag: #(16r0040 16rA168)
				vm: '1'
				type: '1C'
				sequenceItemClass: ConceptCodeSequenceItem)
]

{ #category : #accessing }
AcquisitionContextSequenceItem >> conceptCodeSequence [

	^self dataElementsValues at: 'conceptCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptCodeSequence') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> conceptCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> conceptNameCodeSequence [

	^self dataElementsValues at: 'conceptNameCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptNameCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptNameCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptNameCodeSequence') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> conceptNameCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptNameCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptNameCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptNameCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptNameCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptNameCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> date [

	^self dataElementsValues at: 'date' ifAbsent: [
		self dataElementsDictionary at: 'date' ifPresent: [:dataElement |
			self dataElementsValues at: 'date' put: (self dataElementsDictionary removeKey: 'date') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> date: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'date' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #date.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'date' put: dataElement.
			self dataElementsValues removeKey: 'date' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'date' put: aDAValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
AcquisitionContextSequenceItem >> measurementUnitCodeSequence [

	^self dataElementsValues at: 'measurementUnitsCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: (self dataElementsDictionary removeKey: 'measurementUnitsCodeSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
AcquisitionContextSequenceItem >> measurementUnitCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #measurementUnitsCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'measurementUnitsCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'measurementUnitsCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> measurementUnitsCodeSequence [

	^self dataElementsValues at: 'measurementUnitsCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: (self dataElementsDictionary removeKey: 'measurementUnitsCodeSequence') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> measurementUnitsCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #measurementUnitsCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'measurementUnitsCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'measurementUnitsCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> numericValue [

	^self dataElementsValues at: 'numericValue' ifAbsent: [
		self dataElementsDictionary at: 'numericValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'numericValue' put: (self dataElementsDictionary removeKey: 'numericValue') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> numericValue: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numericValue' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numericValue.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'numericValue' put: dataElement.
			self dataElementsValues removeKey: 'numericValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numericValue' put: aDSValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> personName [

	^self dataElementsValues at: 'personName' ifAbsent: [
		self dataElementsDictionary at: 'personName' ifPresent: [:dataElement |
			self dataElementsValues at: 'personName' put: (self dataElementsDictionary removeKey: 'personName') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> personName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'personName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #personName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'personName' put: dataElement.
			self dataElementsValues removeKey: 'personName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'personName' put: aPNValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> referencedFrameNumbers [

	^self dataElementsValues at: 'referencedFrameNumbers' ifAbsent: [
		self dataElementsDictionary at: 'referencedFrameNumbers' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedFrameNumbers' put: (self dataElementsDictionary removeKey: 'referencedFrameNumbers') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> referencedFrameNumbers: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedFrameNumbers' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedFrameNumbers.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'referencedFrameNumbers' put: dataElement.
			self dataElementsValues removeKey: 'referencedFrameNumbers' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedFrameNumbers' put: aUSValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> textValue [

	^self dataElementsValues at: 'textValue' ifAbsent: [
		self dataElementsDictionary at: 'textValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'textValue' put: (self dataElementsDictionary removeKey: 'textValue') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> textValue: aUTValue [

	| dataElement |

	(self dataElementsDictionary at: 'textValue' ifPresent: [:aDataElement | aDataElement value: aUTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #textValue.
			dataElement encoder: self encoder.
			dataElement value: aUTValue.
			self dataElementsDictionary at: 'textValue' put: dataElement.
			self dataElementsValues removeKey: 'textValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'textValue' put: aUTValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> time [

	^self dataElementsValues at: 'time' ifAbsent: [
		self dataElementsDictionary at: 'time' ifPresent: [:dataElement |
			self dataElementsValues at: 'time' put: (self dataElementsDictionary removeKey: 'time') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextSequenceItem >> time: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'time' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #time.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'time' put: dataElement.
			self dataElementsValues removeKey: 'time' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'time' put: aTMValue
		]
	].

]
