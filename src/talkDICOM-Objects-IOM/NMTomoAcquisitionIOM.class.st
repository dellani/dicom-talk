Class {
	#name : #NMTomoAcquisitionIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
NMTomoAcquisitionIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Tomo Acquisition Information Object Module'.
	moduleName := 'nmTomoAcquisitionIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #rotationInformationSequence
				tag: #(16r54 16r52)
				vm: '1'
				type: '2'
				sequenceItemClass: RotationInformationSequenceItem).
	self
		addDataElement:
			(CSDataElement
				newWith: #typeOfDetectorMotion
				tag: #(16r54 16r202)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
NMTomoAcquisitionIOM >> rotationInformationSequence [

	^self dataElementsValues at: 'rotationInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'rotationInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rotationInformationSequence' put: (self dataElementsDictionary removeKey: 'rotationInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMTomoAcquisitionIOM >> rotationInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rotationInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rotationInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rotationInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'rotationInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rotationInformationSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
NMTomoAcquisitionIOM >> typeOfDetectorMotion [

	^self dataElementsValues at: 'typeOfDetectorMotion' ifAbsent: [
		self dataElementsDictionary at: 'typeOfDetectorMotion' ifPresent: [:dataElement |
			self dataElementsValues at: 'typeOfDetectorMotion' put: (self dataElementsDictionary removeKey: 'typeOfDetectorMotion') value.
		]
	]

]

{ #category : #accessing }
NMTomoAcquisitionIOM >> typeOfDetectorMotion: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'typeOfDetectorMotion' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #typeOfDetectorMotion.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'typeOfDetectorMotion' put: dataElement.
			self dataElementsValues removeKey: 'typeOfDetectorMotion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'typeOfDetectorMotion' put: aCSValue
		]
	].

]
