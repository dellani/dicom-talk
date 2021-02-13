Class {
	#name : #MaskIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
MaskIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Mask IOM'.
	moduleName := 'maskIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #recommendedViewingMode
				tag: #(16r28 16r1090)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #maskSubtractionSequence
				tag: #(16r28 16r6100)
				vm: '1'
				type: '1'
				sequenceItemClass: MaskSubtractionSequenceItem)
]

{ #category : #accessing }
MaskIOM >> maskSubtractionSequence [

	^self dataElementsValues at: 'maskSubtractionSequence' ifAbsent: [
		self dataElementsDictionary at: 'maskSubtractionSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'maskSubtractionSequence' put: (self dataElementsDictionary removeKey: 'maskSubtractionSequence') value.
		]
	]

]

{ #category : #accessing }
MaskIOM >> maskSubtractionSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'maskSubtractionSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #maskSubtractionSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'maskSubtractionSequence' put: dataElement.
			self dataElementsValues removeKey: 'maskSubtractionSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'maskSubtractionSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
MaskIOM >> recommendedViewingMode [

	^self dataElementsValues at: 'recommendedViewingMode' ifAbsent: [
		self dataElementsDictionary at: 'recommendedViewingMode' ifPresent: [:dataElement |
			self dataElementsValues at: 'recommendedViewingMode' put: (self dataElementsDictionary removeKey: 'recommendedViewingMode') value.
		]
	]

]

{ #category : #accessing }
MaskIOM >> recommendedViewingMode: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'recommendedViewingMode' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #recommendedViewingMode.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'recommendedViewingMode' put: dataElement.
			self dataElementsValues removeKey: 'recommendedViewingMode' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'recommendedViewingMode' put: aCSValue
		]
	].

]
