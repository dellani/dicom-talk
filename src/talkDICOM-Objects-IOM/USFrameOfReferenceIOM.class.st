Class {
	#name : #USFrameOfReferenceIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
USFrameOfReferenceIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM US Frame of Reference Information Object Module
	PS 3.3-2001 Annex C.8.5.4 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM US Frame of Reference Information Object Module'.
	moduleName := 'usFrameOfReferenceIOM'.
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMinX0
				tag: #(16r0018 16r6018)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMinY0
				tag: #(16r0018 16r601A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMaxX1
				tag: #(16r0018 16r601C)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #regionLocationMaxY1
				tag: #(16r0018 16r601E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #physicalUnitsXDirection
				tag: #(16r0018 16r6024)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #physicalUnitsYDirection
				tag: #(16r0018 16r6026)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(FDDataElement
				newWith: #physicalDeltaX
				tag: #(16r0018 16r602C)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(FDDataElement
				newWith: #physicalDeltaY
				tag: #(16r0018 16r602E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SLDataElement
				newWith: #referencePixelX0
				tag: #(16r0018 16r6020)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SLDataElement
				newWith: #referencePixelY0
				tag: #(16r0018 16r6022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(FDDataElement
				newWith: #referencePixelPhysicalValueX
				tag: #(16r0018 16r6028)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(FDDataElement
				newWith: #referencePixelPhysicalValueY
				tag: #(16r0018 16r602A)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalDeltaX [

	^self dataElementsValues at: 'physicalDeltaX' ifAbsent: [
		self dataElementsDictionary at: 'physicalDeltaX' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalDeltaX' put: (self dataElementsDictionary removeKey: 'physicalDeltaX') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalDeltaX: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalDeltaX' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalDeltaX.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'physicalDeltaX' put: dataElement.
			self dataElementsValues removeKey: 'physicalDeltaX' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalDeltaX' put: aFDValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalDeltaY [

	^self dataElementsValues at: 'physicalDeltaY' ifAbsent: [
		self dataElementsDictionary at: 'physicalDeltaY' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalDeltaY' put: (self dataElementsDictionary removeKey: 'physicalDeltaY') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalDeltaY: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalDeltaY' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalDeltaY.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'physicalDeltaY' put: dataElement.
			self dataElementsValues removeKey: 'physicalDeltaY' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalDeltaY' put: aFDValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalUnitsXDirection [

	^self dataElementsValues at: 'physicalUnitsXDirection' ifAbsent: [
		self dataElementsDictionary at: 'physicalUnitsXDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalUnitsXDirection' put: (self dataElementsDictionary removeKey: 'physicalUnitsXDirection') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalUnitsXDirection: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalUnitsXDirection' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalUnitsXDirection.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'physicalUnitsXDirection' put: dataElement.
			self dataElementsValues removeKey: 'physicalUnitsXDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalUnitsXDirection' put: aUSValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalUnitsYDirection [

	^self dataElementsValues at: 'physicalUnitsYDirection' ifAbsent: [
		self dataElementsDictionary at: 'physicalUnitsYDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'physicalUnitsYDirection' put: (self dataElementsDictionary removeKey: 'physicalUnitsYDirection') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> physicalUnitsYDirection: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'physicalUnitsYDirection' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #physicalUnitsYDirection.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'physicalUnitsYDirection' put: dataElement.
			self dataElementsValues removeKey: 'physicalUnitsYDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'physicalUnitsYDirection' put: aUSValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelPhysicalValueX [

	^self dataElementsValues at: 'referencePixelPhysicalValueX' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelPhysicalValueX' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelPhysicalValueX' put: (self dataElementsDictionary removeKey: 'referencePixelPhysicalValueX') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelPhysicalValueX: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelPhysicalValueX' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelPhysicalValueX.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'referencePixelPhysicalValueX' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelPhysicalValueX' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelPhysicalValueX' put: aFDValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelPhysicalValueY [

	^self dataElementsValues at: 'referencePixelPhysicalValueY' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelPhysicalValueY' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelPhysicalValueY' put: (self dataElementsDictionary removeKey: 'referencePixelPhysicalValueY') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelPhysicalValueY: aFDValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelPhysicalValueY' ifPresent: [:aDataElement | aDataElement value: aFDValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelPhysicalValueY.
			dataElement encoder: self encoder.
			dataElement value: aFDValue.
			self dataElementsDictionary at: 'referencePixelPhysicalValueY' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelPhysicalValueY' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelPhysicalValueY' put: aFDValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelX0 [

	^self dataElementsValues at: 'referencePixelX0' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelX0' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelX0' put: (self dataElementsDictionary removeKey: 'referencePixelX0') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelX0: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelX0' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelX0.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'referencePixelX0' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelX0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelX0' put: aSLValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelY0 [

	^self dataElementsValues at: 'referencePixelY0' ifAbsent: [
		self dataElementsDictionary at: 'referencePixelY0' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencePixelY0' put: (self dataElementsDictionary removeKey: 'referencePixelY0') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> referencePixelY0: aSLValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencePixelY0' ifPresent: [:aDataElement | aDataElement value: aSLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencePixelY0.
			dataElement encoder: self encoder.
			dataElement value: aSLValue.
			self dataElementsDictionary at: 'referencePixelY0' put: dataElement.
			self dataElementsValues removeKey: 'referencePixelY0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencePixelY0' put: aSLValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMaxX1 [

	^self dataElementsValues at: 'regionLocationMaxX1' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMaxX1' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMaxX1' put: (self dataElementsDictionary removeKey: 'regionLocationMaxX1') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMaxX1: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMaxX1' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMaxX1.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMaxX1' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMaxX1' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMaxX1' put: aULValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMaxY1 [

	^self dataElementsValues at: 'regionLocationMaxY1' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMaxY1' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMaxY1' put: (self dataElementsDictionary removeKey: 'regionLocationMaxY1') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMaxY1: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMaxY1' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMaxY1.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMaxY1' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMaxY1' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMaxY1' put: aULValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMinX0 [

	^self dataElementsValues at: 'regionLocationMinX0' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMinX0' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMinX0' put: (self dataElementsDictionary removeKey: 'regionLocationMinX0') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMinX0: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMinX0' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMinX0.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMinX0' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMinX0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMinX0' put: aULValue
		]
	].

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMinY0 [

	^self dataElementsValues at: 'regionLocationMinY0' ifAbsent: [
		self dataElementsDictionary at: 'regionLocationMinY0' ifPresent: [:dataElement |
			self dataElementsValues at: 'regionLocationMinY0' put: (self dataElementsDictionary removeKey: 'regionLocationMinY0') value.
		]
	]

]

{ #category : #accessing }
USFrameOfReferenceIOM >> regionLocationMinY0: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'regionLocationMinY0' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #regionLocationMinY0.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'regionLocationMinY0' put: dataElement.
			self dataElementsValues removeKey: 'regionLocationMinY0' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'regionLocationMinY0' put: aULValue
		]
	].

]
