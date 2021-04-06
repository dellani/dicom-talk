Class {
	#name : #SRDocumentSeriesIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SRDocumentSeriesIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM SR 
	Document Series Information Object Module
	Dicom Standard Supplement 23 (Structured Reporting)- Table C.17-1
	PRD, Charnovscki 14-12.2001"

	self resetDataElements.
	Name := 'DICOM SR Document Series Information Object Module'.
	moduleName := 'srDocumentSeriesIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #modality
				tag: #(16r0008 16r0060)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(UIDataElement
				newWith: #seriesInstanceUID
				tag: #(16r0020 16r000E)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ISDataElement
				newWith: #seriesNumber
				tag: #(16r0020 16r0011)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedStudyComponentSequence
				tag: #(16r0008 16r1111)
				vm: '1'
				type: '2'
				sequenceItemClass: ReferencedStudyComponentSequenceItem)
]

{ #category : #accessing }
SRDocumentSeriesIOM >> bodyPartExamined [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> largestPixelValueInSeries [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> laterality [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> modality [

	^self dataElementsValues at: 'modality' ifAbsent: [
		self dataElementsDictionary at: 'modality' ifPresent: [:dataElement |
			self dataElementsValues at: 'modality' put: (self dataElementsDictionary removeKey: 'modality') value.
		]
	]

]

{ #category : #accessing }
SRDocumentSeriesIOM >> modality: aCSValue [

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

{ #category : #accessing }
SRDocumentSeriesIOM >> numberOfSeriesRelatedInstances [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> operatorsName [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> patientPosition [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> performedActionItemSequence [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> performedProcedureStepDescription [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> performedProcedureStepID [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> performedProcedureStepStartDate [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> performedProcedureStepStartTime [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> performingPhysiciansName [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> protocolName [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> referencedPerformedProcedureStepSequence [

	^self dataElementsValues at: 'referencedPerformedProcedureStepSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: (self dataElementsDictionary removeKey: 'referencedPerformedProcedureStepSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentSeriesIOM >> referencedPerformedProcedureStepSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedPerformedProcedureStepSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedPerformedProcedureStepSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SRDocumentSeriesIOM >> referencedStudyComponentSequence [

	^self dataElementsValues at: 'referencedPerformedProcedureStepSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: (self dataElementsDictionary removeKey: 'referencedPerformedProcedureStepSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SRDocumentSeriesIOM >> referencedStudyComponentSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedPerformedProcedureStepSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedPerformedProcedureStepSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedPerformedProcedureStepSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedPerformedProcedureStepSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentSeriesIOM >> requestAttributesSequence [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> seriesDate [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> seriesDescription [
	^ 'SR document'
]

{ #category : #accessing }
SRDocumentSeriesIOM >> seriesInstanceUID [

	^self dataElementsValues at: 'seriesInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesInstanceUID' put: (self dataElementsDictionary removeKey: 'seriesInstanceUID') value.
		]
	]

]

{ #category : #accessing }
SRDocumentSeriesIOM >> seriesInstanceUID: aUIValue [

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
SRDocumentSeriesIOM >> seriesNumber [

	^self dataElementsValues at: 'seriesNumber' ifAbsent: [
		self dataElementsDictionary at: 'seriesNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesNumber' put: (self dataElementsDictionary removeKey: 'seriesNumber') value.
		]
	]

]

{ #category : #accessing }
SRDocumentSeriesIOM >> seriesNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'seriesNumber' put: dataElement.
			self dataElementsValues removeKey: 'seriesNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
SRDocumentSeriesIOM >> seriesTime [

	^nil
]

{ #category : #accessing }
SRDocumentSeriesIOM >> smallestPixelValueInSeries [

	^nil
]
