Class {
	#name : #WaveformAnnotationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
WaveformAnnotationIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Waveform Annotation Information Object Module
	PS 3.3-2000 Annex C.10-11 (Page 481) - GA 10-10.2001"

	self resetDataElements.
	Name := 'DICOM Waveform Annotation Image Information Object Module'.
	moduleName := 'waveformAnotationIOM'.
	self
		addDataElement:
			(SQDataElement
				newWith: #waveformAnnotationSequence
				tag: #(16r0040 16rB020)
				vm: '1'
				type: '1'
				sequenceItemClass: WaveformAnnotationSequenceItem)
]

{ #category : #checking }
WaveformAnnotationIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
WaveformAnnotationIOM >> waveformAnnotationSequence [

	^self dataElementsValues at: 'waveformAnnotationSequence' ifAbsent: [
		self dataElementsDictionary at: 'waveformAnnotationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformAnnotationSequence' put: (self dataElementsDictionary removeKey: 'waveformAnnotationSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformAnnotationIOM >> waveformAnnotationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformAnnotationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformAnnotationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'waveformAnnotationSequence' put: dataElement.
			self dataElementsValues removeKey: 'waveformAnnotationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformAnnotationSequence' put: aSQValue
		]
	].

]
