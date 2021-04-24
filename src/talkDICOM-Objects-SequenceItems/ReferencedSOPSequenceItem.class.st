Class {
	#name : #ReferencedSOPSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ReferencedSOPSequenceItem class >> initialize [
	"DICOM Referenced SOP Sequence Item - initialization method

	RC - Dec 14th, 2001
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Referenced SOP Sequence Item'.
	SequenceName := 'referencedSOPSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0008 16r1199).

	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPClassUID
				tag: #(16r0008 16r1150)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPInstanceUID
				tag: #(16r0008 16r1155)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #referencedFrameNumber
				tag: #(16r0008 16r1160)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedSOPSequence
				tag: #(16r0008 16r1199)
				vm: '1'
				type: '1'
				sequenceItemClass: ReferencedSOPSequenceItem).
	self
		addDataElement:
			(USDataElement
				newWith: #referencedWaveformChannels
				tag: #(16r0040 16rA0B0)
				vm: '2-2n'
				type: '1C')
]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedFrameNumber [

	^self dataElementsValues at: 'referencedFrameNumber' ifAbsent: [
		self dataElementsDictionary at: 'referencedFrameNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedFrameNumber' put: (self dataElementsDictionary removeKey: 'referencedFrameNumber') value.
		]
	]

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedFrameNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedFrameNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedFrameNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'referencedFrameNumber' put: dataElement.
			self dataElementsValues removeKey: 'referencedFrameNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedFrameNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedSOPClassUID [

	^self dataElementsValues at: 'referencedSOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPClassUID' put: (self dataElementsDictionary removeKey: 'referencedSOPClassUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedSOPClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedSOPInstanceUID [

	^self dataElementsValues at: 'referencedSOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPInstanceUID' put: (self dataElementsDictionary removeKey: 'referencedSOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedSOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedSOPSequence [

	^self dataElementsValues at: 'referencedSOPSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPSequence' put: (self dataElementsDictionary removeKey: 'referencedSOPSequence') value.
		]
	]

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedSOPSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedSOPSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedWaveformChannels [

	^self dataElementsValues at: 'referencedWaveformChannels' ifAbsent: [
		self dataElementsDictionary at: 'referencedWaveformChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedWaveformChannels' put: (self dataElementsDictionary removeKey: 'referencedWaveformChannels') value.
		]
	]

]

{ #category : #accessing }
ReferencedSOPSequenceItem >> referencedWaveformChannels: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedWaveformChannels' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedWaveformChannels.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'referencedWaveformChannels' put: dataElement.
			self dataElementsValues removeKey: 'referencedWaveformChannels' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedWaveformChannels' put: aUSValue
		]
	].

]
