Class {
	#name : #ReferencedSeriesSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ReferencedSeriesSequenceItem class >> initialize [
	"DICOM Referenced Series Sequence Item - initialization method

	RC - Dec 14th, 2001
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Referenced Series Sequence Item'.
	SequenceName := 'referencedSeriesSequenceItem'.
	self
		addDataElement:
			(UIDataElement
				newWith: #seriesInstanceUID
				tag: #(16r0020 16r000E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(AEDataElement
				newWith: #retrieveAETitle
				tag: #(16r0008 16r0054)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #storageMediaFileSetID
				tag: #(16r0088 16r0130)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(UIDataElement
				newWith: #storageMediaFileSetUID
				tag: #(16r0088 16r0140)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedSOPSequence
				tag: #(16r0008 16r1199)
				vm: '1'
				type: '1'
				sequenceItemClass: ReferencedSOPSequenceItem)
]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> referencedSOPSequence [

	^self dataElementsValues at: 'referencedSOPSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPSequence' put: (self dataElementsDictionary removeKey: 'referencedSOPSequence') value.
		]
	]

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> referencedSOPSequence: aSQValue [

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
ReferencedSeriesSequenceItem >> retrieveAETitle [

	^self dataElementsValues at: 'retrieveAETitle' ifAbsent: [
		self dataElementsDictionary at: 'retrieveAETitle' ifPresent: [:dataElement |
			self dataElementsValues at: 'retrieveAETitle' put: (self dataElementsDictionary removeKey: 'retrieveAETitle') value.
		]
	]

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> retrieveAETitle: aAEValue [

	| dataElement |

	(self dataElementsDictionary at: 'retrieveAETitle' ifPresent: [:aDataElement | aDataElement value: aAEValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #retrieveAETitle.
			dataElement encoder: self encoder.
			dataElement value: aAEValue.
			self dataElementsDictionary at: 'retrieveAETitle' put: dataElement.
			self dataElementsValues removeKey: 'retrieveAETitle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'retrieveAETitle' put: aAEValue
		]
	].

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> seriesInstanceUID [

	^self dataElementsValues at: 'seriesInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesInstanceUID' put: (self dataElementsDictionary removeKey: 'seriesInstanceUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> seriesInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'seriesInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'seriesInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> storageMediaFileSetID [

	^self dataElementsValues at: 'storageMediaFileSetID' ifAbsent: [
		self dataElementsDictionary at: 'storageMediaFileSetID' ifPresent: [:dataElement |
			self dataElementsValues at: 'storageMediaFileSetID' put: (self dataElementsDictionary removeKey: 'storageMediaFileSetID') value.
		]
	]

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> storageMediaFileSetID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'storageMediaFileSetID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #storageMediaFileSetID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'storageMediaFileSetID' put: dataElement.
			self dataElementsValues removeKey: 'storageMediaFileSetID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'storageMediaFileSetID' put: aSHValue
		]
	].

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> storageMediaFileSetUID [

	^self dataElementsValues at: 'storageMediaFileSetUID' ifAbsent: [
		self dataElementsDictionary at: 'storageMediaFileSetUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'storageMediaFileSetUID' put: (self dataElementsDictionary removeKey: 'storageMediaFileSetUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedSeriesSequenceItem >> storageMediaFileSetUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'storageMediaFileSetUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #storageMediaFileSetUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'storageMediaFileSetUID' put: dataElement.
			self dataElementsValues removeKey: 'storageMediaFileSetUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'storageMediaFileSetUID' put: aUIValue
		]
	].

]
