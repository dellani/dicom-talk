Class {
	#name : #PaletteColorLookupTableIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
PaletteColorLookupTableIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Pallete Color Lookup Table Information Object Module
	PS 3.3-2001 Annex C.7.9 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM Pallete Color Lookup Table Information Object Module'.
	moduleName := 'paletteColorLookupTableIOM'.
	self
		addDataElement:
			(USDataElement
				newWith: #redPaletteColorLookupTableDescriptor
				tag: #(16r0028 16r1101)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #greenPaletteColorLookupTableDescriptor
				tag: #(16r0028 16r1102)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #bluePaletteColorLookupTableDescriptor
				tag: #(16r0028 16r1103)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #paletteColorLookupTableID
				tag: #(16r0028 16r1199)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #redPaletteColorLookupTableData
				tag: #(16r0028 16r1201)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #greenPaletteColorLookupTableData
				tag: #(16r0028 16r1202)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #bluePaletteColorLookupTableData
				tag: #(16r0028 16r1203)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #segmentedRedPaletteColorLookupTableData
				tag: #(16r0028 16r1221)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #segmentedGreenPaletteColorLookupTableData
				tag: #(16r0028 16r1222)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(OWDataElement
				newWith: #segmentedBluePaletteColorLookupTableData
				tag: #(16r0028 16r1223)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
PaletteColorLookupTableIOM >> bluePaletteColorLookupTableData [

	^self dataElementsValues at: 'bluePaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'bluePaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'bluePaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'bluePaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> bluePaletteColorLookupTableData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'bluePaletteColorLookupTableData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bluePaletteColorLookupTableData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'bluePaletteColorLookupTableData' put: dataElement.
			self dataElementsValues removeKey: 'bluePaletteColorLookupTableData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bluePaletteColorLookupTableData' put: aOWValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> bluePaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'bluePaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> bluePaletteColorLookupTableDescriptor: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bluePaletteColorLookupTableDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'bluePaletteColorLookupTableDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' put: aUSValue
		]
	].

]

{ #category : #checking }
PaletteColorLookupTableIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
PaletteColorLookupTableIOM >> greenPaletteColorLookupTableData [

	^self dataElementsValues at: 'greenPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'greenPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'greenPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'greenPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> greenPaletteColorLookupTableData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'greenPaletteColorLookupTableData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #greenPaletteColorLookupTableData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'greenPaletteColorLookupTableData' put: dataElement.
			self dataElementsValues removeKey: 'greenPaletteColorLookupTableData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'greenPaletteColorLookupTableData' put: aOWValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> greenPaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'greenPaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> greenPaletteColorLookupTableDescriptor: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #greenPaletteColorLookupTableDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'greenPaletteColorLookupTableDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' put: aUSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
PaletteColorLookupTableIOM >> paletteColorLookupTableID [

	^self dataElementsValues at: 'paletteColorLookupTableUID' ifAbsent: [
		self dataElementsDictionary at: 'paletteColorLookupTableUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'paletteColorLookupTableUID' put: (self dataElementsDictionary removeKey: 'paletteColorLookupTableUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
PaletteColorLookupTableIOM >> paletteColorLookupTableID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'paletteColorLookupTableUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #paletteColorLookupTableUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'paletteColorLookupTableUID' put: dataElement.
			self dataElementsValues removeKey: 'paletteColorLookupTableUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'paletteColorLookupTableUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> paletteColorLookupTableUID [

	^self dataElementsValues at: 'paletteColorLookupTableUID' ifAbsent: [
		self dataElementsDictionary at: 'paletteColorLookupTableUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'paletteColorLookupTableUID' put: (self dataElementsDictionary removeKey: 'paletteColorLookupTableUID') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> paletteColorLookupTableUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'paletteColorLookupTableUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #paletteColorLookupTableUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'paletteColorLookupTableUID' put: dataElement.
			self dataElementsValues removeKey: 'paletteColorLookupTableUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'paletteColorLookupTableUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> redPaletteColorLookupTableData [

	^self dataElementsValues at: 'redPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'redPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'redPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'redPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> redPaletteColorLookupTableData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'redPaletteColorLookupTableData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #redPaletteColorLookupTableData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'redPaletteColorLookupTableData' put: dataElement.
			self dataElementsValues removeKey: 'redPaletteColorLookupTableData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'redPaletteColorLookupTableData' put: aOWValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> redPaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'redPaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> redPaletteColorLookupTableDescriptor: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #redPaletteColorLookupTableDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'redPaletteColorLookupTableDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' put: aUSValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> segmentedBluePaletteColorLookupTableData [

	^self dataElementsValues at: 'segmentedBluePaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'segmentedBluePaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'segmentedBluePaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'segmentedBluePaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> segmentedBluePaletteColorLookupTableData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'segmentedBluePaletteColorLookupTableData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #segmentedBluePaletteColorLookupTableData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'segmentedBluePaletteColorLookupTableData' put: dataElement.
			self dataElementsValues removeKey: 'segmentedBluePaletteColorLookupTableData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'segmentedBluePaletteColorLookupTableData' put: aOWValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> segmentedGreenPaletteColorLookupTableData [

	^self dataElementsValues at: 'segmentedGreenPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'segmentedGreenPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'segmentedGreenPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'segmentedGreenPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> segmentedGreenPaletteColorLookupTableData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'segmentedGreenPaletteColorLookupTableData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #segmentedGreenPaletteColorLookupTableData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'segmentedGreenPaletteColorLookupTableData' put: dataElement.
			self dataElementsValues removeKey: 'segmentedGreenPaletteColorLookupTableData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'segmentedGreenPaletteColorLookupTableData' put: aOWValue
		]
	].

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> segmentedRedPaletteColorLookupTableData [

	^self dataElementsValues at: 'segmentedRedPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'segmentedRedPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'segmentedRedPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'segmentedRedPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
PaletteColorLookupTableIOM >> segmentedRedPaletteColorLookupTableData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'segmentedRedPaletteColorLookupTableData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #segmentedRedPaletteColorLookupTableData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'segmentedRedPaletteColorLookupTableData' put: dataElement.
			self dataElementsValues removeKey: 'segmentedRedPaletteColorLookupTableData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'segmentedRedPaletteColorLookupTableData' put: aOWValue
		]
	].

]
