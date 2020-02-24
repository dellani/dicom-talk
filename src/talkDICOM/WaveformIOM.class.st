Class {
	#name : #WaveformIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
WaveformIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the 
	DICOM Waveform Information Object Module
	PS 3.3-2000 Annex C.10.-9 - PRD 10-10.2001"

	self resetDataElements.
	Name := 'DICOM Waveform Sequence Item'.
	moduleName := 'waveformIOM'.
	self
		addDataElement:
			(SQDataElement
				newWith: #waveformSequence
				tag: #(16r5400 16r0100)
				vm: '1'
				type: '1'
				sequenceItemClass: WaveformSequenceItem)
]

{ #category : #checking }
WaveformIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
WaveformIOM >> waveformSequence [

	^self dataElementsValues at: 'waveformSequence' ifAbsent: [
		self dataElementsDictionary at: 'waveformSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'waveformSequence' put: (self dataElementsDictionary removeKey: 'waveformSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformIOM >> waveformSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'waveformSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #waveformSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'waveformSequence' put: dataElement.
			self dataElementsValues removeKey: 'waveformSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'waveformSequence' put: aSQValue
		]
	].

]
