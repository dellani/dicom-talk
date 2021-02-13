Class {
	#name : #NMImagePixelIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
NMImagePixelIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Image Pixel Information Object Module'.
	moduleName := 'nmImagePixelIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(USDataElement
				newWith: #samplesPerPixel
				tag: #(16r28 16r2)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #photometricInterpretation
				tag: #(16r28 16r4)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #pixelSpacing
				tag: #(16r28 16r30)
				vm: '2'
				type: '2').
	self
		addDataElement:
			(USDataElement
				newWith: #bitsAllocated
				tag: #(16r28 16r100)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #bitsStored
				tag: #(16r28 16r101)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #highBit
				tag: #(16r28 16r102)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
NMImagePixelIOM >> bitsAllocated [

	^self dataElementsValues at: 'bitsAllocated' ifAbsent: [
		self dataElementsDictionary at: 'bitsAllocated' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsAllocated' put: (self dataElementsDictionary removeKey: 'bitsAllocated') value.
		]
	]

]

{ #category : #accessing }
NMImagePixelIOM >> bitsAllocated: aUSValue [

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
NMImagePixelIOM >> bitsStored [

	^self dataElementsValues at: 'bitsStored' ifAbsent: [
		self dataElementsDictionary at: 'bitsStored' ifPresent: [:dataElement |
			self dataElementsValues at: 'bitsStored' put: (self dataElementsDictionary removeKey: 'bitsStored') value.
		]
	]

]

{ #category : #accessing }
NMImagePixelIOM >> bitsStored: aUSValue [

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
NMImagePixelIOM >> highBit [

	^self dataElementsValues at: 'highBit' ifAbsent: [
		self dataElementsDictionary at: 'highBit' ifPresent: [:dataElement |
			self dataElementsValues at: 'highBit' put: (self dataElementsDictionary removeKey: 'highBit') value.
		]
	]

]

{ #category : #accessing }
NMImagePixelIOM >> highBit: aUSValue [

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
NMImagePixelIOM >> photometricInterpretation [

	^self dataElementsValues at: 'photometricInterpretation' ifAbsent: [
		self dataElementsDictionary at: 'photometricInterpretation' ifPresent: [:dataElement |
			self dataElementsValues at: 'photometricInterpretation' put: (self dataElementsDictionary removeKey: 'photometricInterpretation') value.
		]
	]

]

{ #category : #accessing }
NMImagePixelIOM >> photometricInterpretation: aCSValue [

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
NMImagePixelIOM >> pixelSpacing [

	^self dataElementsValues at: 'pixelSpacing' ifAbsent: [
		self dataElementsDictionary at: 'pixelSpacing' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelSpacing' put: (self dataElementsDictionary removeKey: 'pixelSpacing') value.
		]
	]

]

{ #category : #accessing }
NMImagePixelIOM >> pixelSpacing: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelSpacing' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelSpacing.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'pixelSpacing' put: dataElement.
			self dataElementsValues removeKey: 'pixelSpacing' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelSpacing' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMImagePixelIOM >> samplesPerPixel [

	^self dataElementsValues at: 'samplesPerPixel' ifAbsent: [
		self dataElementsDictionary at: 'samplesPerPixel' ifPresent: [:dataElement |
			self dataElementsValues at: 'samplesPerPixel' put: (self dataElementsDictionary removeKey: 'samplesPerPixel') value.
		]
	]

]

{ #category : #accessing }
NMImagePixelIOM >> samplesPerPixel: aUSValue [

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
