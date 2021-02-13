Class {
	#name : #ReferencedWaveformSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ReferencedWaveformSequenceItem class >> initialize [
	Name := 'DICOM Referenced Waveform Sequence Item'.
	SequenceName := 'referencedWaveformSequenceItem'.
	self resetDataElements.
	"****************** SOP Instance Reference Macro - Supplement 23, 2000 - Table C.17-3 *************************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ].
	self
		addDataElement:
			(SQDataElement
				newWith: #purposeOfReferenceCodeSequence
				tag: #(16r0040 16rA170)
				vm: '1'
				type: '1'
				sequenceItemClass: PurposeOfReferenceCodeSequenceItem)
]

{ #category : #'class initialization' }
ReferencedWaveformSequenceItem class >> macroItemClass [
	
	"****************** SOP Instance Reference Macro - Supplement 23 Table C.17-3 *************************"
	 ^SOPInstanceReferenceMacroItem
]

{ #category : #'class initialization' }
ReferencedWaveformSequenceItem class >> macroItemClassDataElements [
	
	"****************** SOP Instance Reference Macro - Supplement 23 Table C.17-3 *************************"
	 ^self macroItemClass DataElements
]

{ #category : #accessing }
ReferencedWaveformSequenceItem >> purposeOfReferenceCodeSequence [

	^self dataElementsValues at: 'purposeOfReferenceCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'purposeOfReferenceCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'purposeOfReferenceCodeSequence' put: (self dataElementsDictionary removeKey: 'purposeOfReferenceCodeSequence') value.
		]
	]

]

{ #category : #accessing }
ReferencedWaveformSequenceItem >> purposeOfReferenceCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'purposeOfReferenceCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #purposeOfReferenceCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'purposeOfReferenceCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'purposeOfReferenceCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'purposeOfReferenceCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ReferencedWaveformSequenceItem >> referencedSeriesSequence [

	^self dataElementsValues at: 'referencedSeriesSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSeriesSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSeriesSequence' put: (self dataElementsDictionary removeKey: 'referencedSeriesSequence') value.
		]
	]

]

{ #category : #accessing }
ReferencedWaveformSequenceItem >> referencedSeriesSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSeriesSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSeriesSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedSeriesSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedSeriesSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSeriesSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ReferencedWaveformSequenceItem >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedWaveformSequenceItem >> studyInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'studyInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'studyInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyInstanceUID' put: aUIValue
		]
	].

]
