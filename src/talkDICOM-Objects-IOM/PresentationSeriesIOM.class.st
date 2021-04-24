Class {
	#name : #PresentationSeriesIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
PresentationSeriesIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Presentation Series Information Object Module
	PS 3.3 - 2003 Annex C.11.9.2 - PRD March 30th, 2004"

	self resetDataElements.
	Name := 'Presentation Series Information Object Module'.
	moduleName := 'presentationSeriesIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #modality
				tag: #(16r0008 16r0060)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
PresentationSeriesIOM >> modality [

	^self dataElementsValues at: 'modality' ifAbsent: [
		self dataElementsDictionary at: 'modality' ifPresent: [:dataElement |
			self dataElementsValues at: 'modality' put: (self dataElementsDictionary removeKey: 'modality') value.
		]
	]

]

{ #category : #accessing }
PresentationSeriesIOM >> modality: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'modality' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #modality.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'modality' put: dataElement.
			self dataElementsValues removeKey: 'modality' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'modality' put: aCSValue
		]
	].

]
