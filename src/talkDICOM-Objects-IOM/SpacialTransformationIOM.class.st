Class {
	#name : #SpacialTransformationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SpacialTransformationIOM class >> initialize [
	self resetDataElements.
	Name := 'Spacial Transformation Information Object Module'.
	moduleName := 'spacialTransformationIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #imageHorizontalFlip
				tag: #(16r70 16r41)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #imageRotation
				tag: #(16r70 16r42)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
SpacialTransformationIOM >> imageHorizontalFlip [

	^self dataElementsValues at: 'imageHorizontalFlip' ifAbsent: [
		self dataElementsDictionary at: 'imageHorizontalFlip' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageHorizontalFlip' put: (self dataElementsDictionary removeKey: 'imageHorizontalFlip') value.
		]
	]

]

{ #category : #accessing }
SpacialTransformationIOM >> imageHorizontalFlip: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageHorizontalFlip' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageHorizontalFlip.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'imageHorizontalFlip' put: dataElement.
			self dataElementsValues removeKey: 'imageHorizontalFlip' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageHorizontalFlip' put: aCSValue
		]
	].

]

{ #category : #accessing }
SpacialTransformationIOM >> imageRotation [

	^self dataElementsValues at: 'imageRotation' ifAbsent: [
		self dataElementsDictionary at: 'imageRotation' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageRotation' put: (self dataElementsDictionary removeKey: 'imageRotation') value.
		]
	]

]

{ #category : #accessing }
SpacialTransformationIOM >> imageRotation: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageRotation' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageRotation.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'imageRotation' put: dataElement.
			self dataElementsValues removeKey: 'imageRotation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageRotation' put: aUSValue
		]
	].

]
