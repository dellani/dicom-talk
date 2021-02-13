Class {
	#name : #SourceWaveformSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
SourceWaveformSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Channel Source Waveform Item'.
	SequenceName := 'sourceWaveformSequenceItem'.
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
			(USDataElement
				newWith: #referencedWaveformChannels
				tag: #(16r0040 16rA0B0)
				vm: '2-2n'
				type: '1C')
]

{ #category : #accessing }
SourceWaveformSequenceItem >> referencedSOPClassUID [

	^self dataElementsValues at: 'referencedSOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPClassUID' put: (self dataElementsDictionary removeKey: 'referencedSOPClassUID') value.
		]
	]

]

{ #category : #accessing }
SourceWaveformSequenceItem >> referencedSOPClassUID: aUIValue [

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
SourceWaveformSequenceItem >> referencedSOPInstanceUID [

	^self dataElementsValues at: 'referencedSOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPInstanceUID' put: (self dataElementsDictionary removeKey: 'referencedSOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
SourceWaveformSequenceItem >> referencedSOPInstanceUID: aUIValue [

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
SourceWaveformSequenceItem >> referencedWaveformChannels [

	^self dataElementsValues at: 'referencedWaveformChannels' ifAbsent: [
		self dataElementsDictionary at: 'referencedWaveformChannels' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedWaveformChannels' put: (self dataElementsDictionary removeKey: 'referencedWaveformChannels') value.
		]
	]

]

{ #category : #accessing }
SourceWaveformSequenceItem >> referencedWaveformChannels: aUSValue [

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
