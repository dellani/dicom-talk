"
Pixel Data Explanation:
	This data element value (Pixel Data) contains the Image Pixel Data of one Dicom Image.
	The order in which Pixel Data for an image plane is encoded is from left to right and top to
	bottom, a row at a time.

	An individual pixel consists of one or more Pixel Sample Values. This can be change according to the Planar configuration of the image pixel data. 
	Each pixel sample value can be expressed as either a binary 2's complement integer or a binary unsigned integer, according to the Pixel Representation
	Data Element (0028, 0103) specification. 
	The number of bits in each Pixel Sample Value is specified by Bits Stored (0028, 0101). 
	For 2's complement integer Pixel Samples the sign bit is the most significant bit of the Pixel Sample Value, 
	The most significant bit of a Pixel Sample Value is specified by the High Bit (0028, 0102) Data Element.
	One Pixel Sample Value is contained in a Pixel Cell. 
	A Pixel Cell is the container for a Pixel Sample Value and optionally additional bits. These additional bits
	can be used for overlay planes, or to place Pixel on certain boundaries (byte, word, etc.)
	A Pixel Cell exists for every individual Pixel Sample Value in the Pixel Data. 
	The size of the Pixel Cells is specified by Bits Allocated (0028, 0100) and can be greater than or equal to the Bits Stored (0028, 0101).
	The placement of the Pixel Sample Values within the Pixel Cells is specified by High Bit (0028, 0102).


This class has not yet been commented.  The comment should state the purpose of the class, what messages are subclassResponsibility, and the type and purpose of each instance and class variable.  The comment should also explain any unobvious aspects of the implementation.

Instance Variables:

	bitsAllocated	<ClassOfVariable>	description of variable's function
	bitsStored	<ClassOfVariable>	description of variable's function
	bluePaletteColorLookupTableData	<ClassOfVariable>	description of variable's function
	bluePaletteColorLookupTableDescriptor	<ClassOfVariable>	description of variable's function
	columns	<ClassOfVariable>	description of variable's function
	greenPaletteColorLookupTableData	<ClassOfVariable>	description of variable's function
	greenPaletteColorLookupTableDescriptor	<ClassOfVariable>	description of variable's function
	highBit	<ClassOfVariable>	description of variable's function
	largestImagePixelValue	<ClassOfVariable>	description of variable's function
	photometricInterpretation	<ClassOfVariable>	description of variable's function
	pixelAspectRatio	<ClassOfVariable>	description of variable's function
	pixelData	<ClassOfVariable>	description of variable's function
	pixelRepresentation	<ClassOfVariable>	description of variable's function
	planarConfiguration	<ClassOfVariable>	description of variable's function
	redPaletteColorLookupTableData	<ClassOfVariable>	description of variable's function
	redPaletteColorLookupTableDescriptor	<ClassOfVariable>	description of variable's function
	rows	<ClassOfVariable>	description of variable's function
	samplesPerPixel	<ClassOfVariable>	description of variable's function
	smallestImagePixelValue	<ClassOfVariable>	description of variable's function
"
Class {
	#name : #ImagePixelIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
ImagePixelIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for
	the DICOM Image Pixel Information Object Module.

	PS 3.3-2000 Annex C.7.6.3 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM Image Pixel Information Object Module'.
	moduleName := 'imagePixelIOM'.
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
ImagePixelIOM >> bitsAllocated [

	^self dataElementsValues at: 'bitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsAllocated' put: (self dataElementsDictionary removeKey: 'bitsAllocated') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> bitsAllocated: aUSValue [

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
ImagePixelIOM >> bitsStored [

	^self dataElementsValues at: 'bitsStored' ifAbsent: [
		self dataElementsDictionary at: 'bitsStored' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsStored' put: (self dataElementsDictionary removeKey: 'bitsStored') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> bitsStored: aUSValue [

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
ImagePixelIOM >> bluePaletteColorLookupTableData [

	^self dataElementsValues at: 'bluePaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'bluePaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'bluePaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'bluePaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> bluePaletteColorLookupTableData: aOWValue [

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
ImagePixelIOM >> bluePaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'bluePaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'bluePaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'bluePaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> bluePaletteColorLookupTableDescriptor: aSSValue [

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

{ #category : #checking }
ImagePixelIOM >> checkIOM [

	^true.
]

{ #category : #accessing }
ImagePixelIOM >> columns [

	^self dataElementsValues at: 'columns' ifAbsent: [
		self dataElementsDictionary at: 'columns' ifPresent: [:dataElement |
			self dataElementsValues at: 'columns' put: (self dataElementsDictionary removeKey: 'columns') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> columns: aUSValue [

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
ImagePixelIOM >> greenPaletteColorLookupTableData [

	^self dataElementsValues at: 'greenPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'greenPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'greenPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'greenPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> greenPaletteColorLookupTableData: aOWValue [

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
ImagePixelIOM >> greenPaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'greenPaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'greenPaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'greenPaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> greenPaletteColorLookupTableDescriptor: aSSValue [

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
ImagePixelIOM >> highBit [

	^self dataElementsValues at: 'highBit' ifAbsent: [
		self dataElementsDictionary at: 'highBit' ifPresent: [:dataElement |
			self dataElementsValues at: 'highBit' put: (self dataElementsDictionary removeKey: 'highBit') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> highBit: aUSValue [

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
ImagePixelIOM >> largestImagePixelValue [

	^self dataElementsValues at: 'largestImagePixelValue' ifAbsent: [
		self dataElementsDictionary at: 'largestImagePixelValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'largestImagePixelValue' put: (self dataElementsDictionary removeKey: 'largestImagePixelValue') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> largestImagePixelValue: aSSValue [

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
ImagePixelIOM >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> photometricInterpretation: aCSValue [

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
ImagePixelIOM >> pixelAspectRatio [

	^self dataElementsValues at: 'pixelAspectRatio' ifAbsent: [
		self dataElementsDictionary at: 'pixelAspectRatio' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelAspectRatio' put: (self dataElementsDictionary removeKey: 'pixelAspectRatio') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> pixelAspectRatio: aISValue [

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
ImagePixelIOM >> pixelData [

	^self dataElementsValues at: 'rETIRED_VariablePixelData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_VariablePixelData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_VariablePixelData' put: (self dataElementsDictionary removeKey: 'rETIRED_VariablePixelData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ImagePixelIOM >> pixelData: aOWValue [

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
ImagePixelIOM >> pixelRepresentation [

	^self dataElementsValues at: 'pixelRepresentation' ifAbsent: [
		self dataElementsDictionary at: 'pixelRepresentation' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelRepresentation' put: (self dataElementsDictionary removeKey: 'pixelRepresentation') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> pixelRepresentation: aUSValue [

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
ImagePixelIOM >> planarConfiguration [

	^self dataElementsValues at: 'planarConfiguration' ifAbsent: [
		self dataElementsDictionary at: 'planarConfiguration' ifPresent: [:dataElement |
			self dataElementsValues at: 'planarConfiguration' put: (self dataElementsDictionary removeKey: 'planarConfiguration') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> planarConfiguration: aUSValue [

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
ImagePixelIOM >> rETIRED_VariablePixelData [

	^self dataElementsValues at: 'rETIRED_VariablePixelData' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_VariablePixelData' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_VariablePixelData' put: (self dataElementsDictionary removeKey: 'rETIRED_VariablePixelData') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> rETIRED_VariablePixelData: aUNValue [

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
ImagePixelIOM >> redPaletteColorLookupTableData [

	^self dataElementsValues at: 'redPaletteColorLookupTableData' ifAbsent: [
		self dataElementsDictionary at: 'redPaletteColorLookupTableData' ifPresent: [:dataElement |
			self dataElementsValues at: 'redPaletteColorLookupTableData' put: (self dataElementsDictionary removeKey: 'redPaletteColorLookupTableData') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> redPaletteColorLookupTableData: aOWValue [

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
ImagePixelIOM >> redPaletteColorLookupTableDescriptor [

	^self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'redPaletteColorLookupTableDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'redPaletteColorLookupTableDescriptor' put: (self dataElementsDictionary removeKey: 'redPaletteColorLookupTableDescriptor') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> redPaletteColorLookupTableDescriptor: aSSValue [

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
ImagePixelIOM >> rows [

	^self dataElementsValues at: 'rows' ifAbsent: [
		self dataElementsDictionary at: 'rows' ifPresent: [:dataElement |
			self dataElementsValues at: 'rows' put: (self dataElementsDictionary removeKey: 'rows') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> rows: aUSValue [

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
ImagePixelIOM >> samplesPerPixel [

	^self dataElementsValues at: 'samplesPerPixel' ifAbsent: [
		self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplesPerPixel' put: (self dataElementsDictionary removeKey: 'samplesPerPixel') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> samplesPerPixel: aUSValue [

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
ImagePixelIOM >> smallestImagePixelValue [

	^self dataElementsValues at: 'smallestImagePixelValue' ifAbsent: [
		self dataElementsDictionary at: 'smallestImagePixelValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'smallestImagePixelValue' put: (self dataElementsDictionary removeKey: 'smallestImagePixelValue') value.
		]
	]

]

{ #category : #accessing }
ImagePixelIOM >> smallestImagePixelValue: aSSValue [

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
