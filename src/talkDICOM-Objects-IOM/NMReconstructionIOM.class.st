Class {
	#name : #NMReconstructionIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
NMReconstructionIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Reconstruction Information Object Module'.
	moduleName := 'nmReconstructionIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(DSDataElement
				newWith: #sliceThickness
				tag: #(16r18 16r50)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(DSDataElement
				newWith: #spacingBetweenSlices
				tag: #(16r18 16r88)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(DSDataElement
				newWith: #reconstructionDiameter
				tag: #(16r18 16r1100)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #convolutionKernel
				tag: #(16r18 16r1210)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #sliceLocation
				tag: #(16r20 16r1041)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #sliceProgressionDirection
				tag: #(16r54 16r500)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
NMReconstructionIOM >> convolutionKernel [

	^self dataElementsValues at: 'convolutionKernel' ifAbsent: [
		self dataElementsDictionary at: 'convolutionKernel' ifPresent: [:dataElement |
			self dataElementsValues at: 'convolutionKernel' put: (self dataElementsDictionary removeKey: 'convolutionKernel') value.
		]
	]

]

{ #category : #accessing }
NMReconstructionIOM >> convolutionKernel: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'convolutionKernel' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #convolutionKernel.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'convolutionKernel' put: dataElement.
			self dataElementsValues removeKey: 'convolutionKernel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'convolutionKernel' put: aSHValue
		]
	].

]

{ #category : #accessing }
NMReconstructionIOM >> reconstructionDiameter [

	^self dataElementsValues at: 'reconstructionDiameter' ifAbsent: [
		self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:dataElement |
			self dataElementsValues at: 'reconstructionDiameter' put: (self dataElementsDictionary removeKey: 'reconstructionDiameter') value.
		]
	]

]

{ #category : #accessing }
NMReconstructionIOM >> reconstructionDiameter: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'reconstructionDiameter' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #reconstructionDiameter.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'reconstructionDiameter' put: dataElement.
			self dataElementsValues removeKey: 'reconstructionDiameter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'reconstructionDiameter' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMReconstructionIOM >> sliceLocation [

	^self dataElementsValues at: 'sliceLocation' ifAbsent: [
		self dataElementsDictionary at: 'sliceLocation' ifPresent: [:dataElement |
			self dataElementsValues at: 'sliceLocation' put: (self dataElementsDictionary removeKey: 'sliceLocation') value.
		]
	]

]

{ #category : #accessing }
NMReconstructionIOM >> sliceLocation: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sliceLocation' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sliceLocation.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sliceLocation' put: dataElement.
			self dataElementsValues removeKey: 'sliceLocation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sliceLocation' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMReconstructionIOM >> sliceProgressionDirection [

	^self dataElementsValues at: 'sliceProgressionDirection' ifAbsent: [
		self dataElementsDictionary at: 'sliceProgressionDirection' ifPresent: [:dataElement |
			self dataElementsValues at: 'sliceProgressionDirection' put: (self dataElementsDictionary removeKey: 'sliceProgressionDirection') value.
		]
	]

]

{ #category : #accessing }
NMReconstructionIOM >> sliceProgressionDirection: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sliceProgressionDirection' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sliceProgressionDirection.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'sliceProgressionDirection' put: dataElement.
			self dataElementsValues removeKey: 'sliceProgressionDirection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sliceProgressionDirection' put: aCSValue
		]
	].

]

{ #category : #accessing }
NMReconstructionIOM >> sliceThickness [

	^self dataElementsValues at: 'sliceThickness' ifAbsent: [
		self dataElementsDictionary at: 'sliceThickness' ifPresent: [:dataElement |
			self dataElementsValues at: 'sliceThickness' put: (self dataElementsDictionary removeKey: 'sliceThickness') value.
		]
	]

]

{ #category : #accessing }
NMReconstructionIOM >> sliceThickness: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sliceThickness' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sliceThickness.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sliceThickness' put: dataElement.
			self dataElementsValues removeKey: 'sliceThickness' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sliceThickness' put: aDSValue
		]
	].

]

{ #category : #accessing }
NMReconstructionIOM >> spacingBetweenSlices [

	^self dataElementsValues at: 'spacingBetweenSlices' ifAbsent: [
		self dataElementsDictionary at: 'spacingBetweenSlices' ifPresent: [:dataElement |
			self dataElementsValues at: 'spacingBetweenSlices' put: (self dataElementsDictionary removeKey: 'spacingBetweenSlices') value.
		]
	]

]

{ #category : #accessing }
NMReconstructionIOM >> spacingBetweenSlices: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'spacingBetweenSlices' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #spacingBetweenSlices.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'spacingBetweenSlices' put: dataElement.
			self dataElementsValues removeKey: 'spacingBetweenSlices' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'spacingBetweenSlices' put: aDSValue
		]
	].

]
