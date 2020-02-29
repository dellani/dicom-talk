Class {
	#name : #SoftcopyPresentationLUTIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
SoftcopyPresentationLUTIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Presentation LUT IOM'.
	moduleName := 'softcopyPresentationLUTIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #presentationLUTSequence
				tag: #(16r2050 16r10)
				vm: '1'
				type: '1C'
				sequenceItemClass: PresentationLUTSequenceItem).
	self
		addDataElement:
			(CSDataElement
				newWith: #presentationLUTShape
				tag: #(16r2050 16r20)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
SoftcopyPresentationLUTIOM >> presentationLUTSequence [

	^self dataElementsValues at: 'presentationLUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'presentationLUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationLUTSequence' put: (self dataElementsDictionary removeKey: 'presentationLUTSequence') value.
		]
	]

]

{ #category : #accessing }
SoftcopyPresentationLUTIOM >> presentationLUTSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationLUTSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationLUTSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'presentationLUTSequence' put: dataElement.
			self dataElementsValues removeKey: 'presentationLUTSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationLUTSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SoftcopyPresentationLUTIOM >> presentationLUTShape [

	^self dataElementsValues at: 'presentationLUTShape' ifAbsent: [
		self dataElementsDictionary at: 'presentationLUTShape' ifPresent: [:dataElement |
			self dataElementsValues at: 'presentationLUTShape' put: (self dataElementsDictionary removeKey: 'presentationLUTShape') value.
		]
	]

]

{ #category : #accessing }
SoftcopyPresentationLUTIOM >> presentationLUTShape: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'presentationLUTShape' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #presentationLUTShape.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'presentationLUTShape' put: dataElement.
			self dataElementsValues removeKey: 'presentationLUTShape' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'presentationLUTShape' put: aCSValue
		]
	].

]
