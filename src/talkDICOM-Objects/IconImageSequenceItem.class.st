Class {
	#name : #IconImageSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
IconImageSequenceItem class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the
	DICOM Icon Image Sequence Item. Contains the same 
	data elements of the Image Pixel IOM - PS 3.3-2001 Annex F Part 7

	PRD 08.2002"

	self resetDataElements.
	Name := 'DICOM Icon Image Sequence Item'.
	SequenceName := 'iconImageSequenceItem'.
	self
		addDataElement:
			(USDataElement
				newWith: #samplesPerPixel
				tag: #(16r0028 16r0002)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #photometricInterpretation
				tag: #(16r0028 16r0004)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #rows
				tag: #(16r0028 16r0010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #columns
				tag: #(16r0028 16r0011)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #bitsAllocated
				tag: #(16r0028 16r0100)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #bitsStored
				tag: #(16r0028 16r0101)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #highBit
				tag: #(16r0028 16r0102)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #pixelRepresentation
				tag: #(16r0028 16r0103)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(OWDataElement
				newWith: #pixelData
				tag: #(16r7FE0 16r0010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #planarConfiguration
				tag: #(16r0028 16r0006)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #pixelAspectRatio
				tag: #(16r0028 16r0034)
				vm: '2'
				type: '1C').
	self
		addDataElement:
			(SSDataElement
				newWith: #smallestImagePixelValue
				tag: #(16r0028 16r0106)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SSDataElement
				newWith: #largestImagePixelValue
				tag: #(16r0028 16r0107)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SSDataElement
				newWith: #redPaletteColorLookupTableDescriptor
				tag: #(16r0028 16r1101)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(SSDataElement
				newWith: #greenPaletteColorLookupTableDescriptor
				tag: #(16r0028 16r1102)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(SSDataElement
				newWith: #bluePaletteColorLookupTableDescriptor
				tag: #(16r0028 16r1103)
				vm: '3'
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
				type: '1C')
]

{ #category : #accessing }
IconImageSequenceItem >> bitsAllocated [

	^self dataElementsValues at: 'bitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsAllocated' put: (self dataElementsDictionary removeKey: 'bitsAllocated') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> bitsAllocated: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bitsAllocated.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'bitsAllocated' put: dataElement.
			self dataElementsValues removeKey: 'bitsAllocated' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bitsAllocated' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> bitsStored [

	^self dataElementsValues at: 'bitsStored' ifAbsent: [
		self dataElementsDictionary at: 'bitsStored' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsStored' put: (self dataElementsDictionary removeKey: 'bitsStored') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> bitsStored: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bitsStored' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bitsStored.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'bitsStored' put: dataElement.
			self dataElementsValues removeKey: 'bitsStored' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bitsStored' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> bluePaletteColorLookupTableData [

	^self dataElementsValues at: 'bluePaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'bluePaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'bluePaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'bluePaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> bluePaletteColorLookupTableData: aOWValue [

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
IconImageSequenceItem >> bluePaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'bluePaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> bluePaletteColorLookupTableDescriptor: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #bluePaletteColorLookupTableDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'bluePaletteColorLookupTableDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' put: aSSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> columns [

	^self dataElementsValues at: 'columns' ifAbsent: [
		self dataElementsDictionary at: 'columns' ifPresent: [:dataElement |
			self dataElementsValues at: 'columns' put: (self dataElementsDictionary removeKey: 'columns') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> columns: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'columns' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #columns.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'columns' put: dataElement.
			self dataElementsValues removeKey: 'columns' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'columns' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> greenPaletteColorLookupTableData [

	^self dataElementsValues at: 'greenPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'greenPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'greenPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'greenPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> greenPaletteColorLookupTableData: aOWValue [

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
IconImageSequenceItem >> greenPaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'greenPaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> greenPaletteColorLookupTableDescriptor: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #greenPaletteColorLookupTableDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'greenPaletteColorLookupTableDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' put: aSSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> highBit [

	^self dataElementsValues at: 'highBit' ifAbsent: [
		self dataElementsDictionary at: 'highBit' ifPresent: [:dataElement |
			self dataElementsValues at: 'highBit' put: (self dataElementsDictionary removeKey: 'highBit') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> highBit: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'highBit' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #highBit.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'highBit' put: dataElement.
			self dataElementsValues removeKey: 'highBit' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'highBit' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> largestImagePixelValue [

	^self dataElementsValues at: 'largestImagePixelValue' ifAbsent: [
		self dataElementsDictionary at: 'largestImagePixelValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'largestImagePixelValue' put: (self dataElementsDictionary removeKey: 'largestImagePixelValue') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> largestImagePixelValue: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'largestImagePixelValue' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #largestImagePixelValue.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'largestImagePixelValue' put: dataElement.
			self dataElementsValues removeKey: 'largestImagePixelValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'largestImagePixelValue' put: aSSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> photometricInterpretation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #photometricInterpretation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'photometricInterpretation' put: dataElement.
			self dataElementsValues removeKey: 'photometricInterpretation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'photometricInterpretation' put: aCSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> pixelAspectRatio [

	^self dataElementsValues at: 'pixelAspectRatio' ifAbsent: [
		self dataElementsDictionary at: 'pixelAspectRatio' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelAspectRatio' put: (self dataElementsDictionary removeKey: 'pixelAspectRatio') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> pixelAspectRatio: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelAspectRatio' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelAspectRatio.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'pixelAspectRatio' put: dataElement.
			self dataElementsValues removeKey: 'pixelAspectRatio' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelAspectRatio' put: aISValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
IconImageSequenceItem >> pixelData [

	^self dataElementsValues at: 'rETIRED_VariablePixelData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_VariablePixelData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_VariablePixelData' put: (self dataElementsDictionary removeKey: 'rETIRED_VariablePixelData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
IconImageSequenceItem >> pixelData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_VariablePixelData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_VariablePixelData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'rETIRED_VariablePixelData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_VariablePixelData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_VariablePixelData' put: aOWValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> pixelRepresentation [

	^self dataElementsValues at: 'pixelRepresentation' ifAbsent: [
		self dataElementsDictionary at: 'pixelRepresentation' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelRepresentation' put: (self dataElementsDictionary removeKey: 'pixelRepresentation') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> pixelRepresentation: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelRepresentation' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelRepresentation.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'pixelRepresentation' put: dataElement.
			self dataElementsValues removeKey: 'pixelRepresentation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelRepresentation' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> planarConfiguration [

	^self dataElementsValues at: 'planarConfiguration' ifAbsent: [
		self dataElementsDictionary at: 'planarConfiguration' ifPresent: [:dataElement |
			self dataElementsValues at: 'planarConfiguration' put: (self dataElementsDictionary removeKey: 'planarConfiguration') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> planarConfiguration: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'planarConfiguration' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #planarConfiguration.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'planarConfiguration' put: dataElement.
			self dataElementsValues removeKey: 'planarConfiguration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'planarConfiguration' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> rETIRED_VariablePixelData [

	^self dataElementsValues at: 'rETIRED_VariablePixelData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_VariablePixelData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_VariablePixelData' put: (self dataElementsDictionary removeKey: 'rETIRED_VariablePixelData') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> rETIRED_VariablePixelData: aUNValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_VariablePixelData' ifPresent: [:aDataElement | aDataElement value: aUNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_VariablePixelData.
			dataElement encoder: self encoder.
			dataElement value: aUNValue.
			self dataElementsDictionary at: 'rETIRED_VariablePixelData' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_VariablePixelData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_VariablePixelData' put: aUNValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> redPaletteColorLookupTableData [

	^self dataElementsValues at: 'redPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'redPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'redPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'redPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> redPaletteColorLookupTableData: aOWValue [

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
IconImageSequenceItem >> redPaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'redPaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> redPaletteColorLookupTableDescriptor: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #redPaletteColorLookupTableDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'redPaletteColorLookupTableDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' put: aSSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> rows [

	^self dataElementsValues at: 'rows' ifAbsent: [
		self dataElementsDictionary at: 'rows' ifPresent: [:dataElement |
			self dataElementsValues at: 'rows' put: (self dataElementsDictionary removeKey: 'rows') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> rows: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rows' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rows.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'rows' put: dataElement.
			self dataElementsValues removeKey: 'rows' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rows' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> samplesPerPixel [

	^self dataElementsValues at: 'samplesPerPixel' ifAbsent: [
		self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplesPerPixel' put: (self dataElementsDictionary removeKey: 'samplesPerPixel') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> samplesPerPixel: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #samplesPerPixel.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'samplesPerPixel' put: dataElement.
			self dataElementsValues removeKey: 'samplesPerPixel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'samplesPerPixel' put: aUSValue
		]
	].

]

{ #category : #accessing }
IconImageSequenceItem >> smallestImagePixelValue [

	^self dataElementsValues at: 'smallestImagePixelValue' ifAbsent: [
		self dataElementsDictionary at: 'smallestImagePixelValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'smallestImagePixelValue' put: (self dataElementsDictionary removeKey: 'smallestImagePixelValue') value.
		]
	]

]

{ #category : #accessing }
IconImageSequenceItem >> smallestImagePixelValue: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'smallestImagePixelValue' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #smallestImagePixelValue.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'smallestImagePixelValue' put: dataElement.
			self dataElementsValues removeKey: 'smallestImagePixelValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'smallestImagePixelValue' put: aSSValue
		]
	].

]
