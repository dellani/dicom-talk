Class {
	#name : #AcquisitionContextIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
AcquisitionContextIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM
	Waveform Acquisition Context Information Object Module
	
	PS 3.3-2000 Annex C.7.6.14.1 (Page 208) - GA,PRD 10-10.2001"

	self resetDataElements.
	Name := 'Waveform Acquisition Context Image Information Object Module'.
	moduleName := 'acquisitionContextIOM'.
	self
		addDataElement:
			(SQDataElement
				newWith: #acquisitionContextSequence
				tag: #(16r0040 16r0555)
				vm: '1'
				type: '2'
				sequenceItemClass: AcquisitionContextSequenceItem).
	self
		addDataElement:
			(LTDataElement
				newWith: #acquisitionContextDescription
				tag: #(16r0040 16r0556)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
AcquisitionContextIOM >> acquisitionContextDescription [

	^self dataElementsValues at: 'acquisitionContextDescription' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionContextDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionContextDescription' put: (self dataElementsDictionary removeKey: 'acquisitionContextDescription') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextIOM >> acquisitionContextDescription: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionContextDescription' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionContextDescription.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'acquisitionContextDescription' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionContextDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionContextDescription' put: aLTValue
		]
	].

]

{ #category : #accessing }
AcquisitionContextIOM >> acquisitionContextSequence [

	^self dataElementsValues at: 'acquisitionContextSequence' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionContextSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionContextSequence' put: (self dataElementsDictionary removeKey: 'acquisitionContextSequence') value.
		]
	]

]

{ #category : #accessing }
AcquisitionContextIOM >> acquisitionContextSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionContextSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionContextSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'acquisitionContextSequence' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionContextSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionContextSequence' put: aSQValue
		]
	].

]
