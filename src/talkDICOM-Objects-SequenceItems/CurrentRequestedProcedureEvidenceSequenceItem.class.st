Class {
	#name : #CurrentRequestedProcedureEvidenceSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
CurrentRequestedProcedureEvidenceSequenceItem class >> initialize [
	Name := 'DICOM Current Requested Procedure Evidence Sequence Item'.
	SequenceName := 'currentRequestedProcedureEvidenceSequenceItem'.
	self resetDataElements.
	"****************** SOP Instance Reference Macro - Supplement 23, 2000 - Table C.17-3 *************************"
	
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ]
]

{ #category : #'class initialization' }
CurrentRequestedProcedureEvidenceSequenceItem class >> macroItemClass [
	
	"****************** SOP Instance Reference Macro - Supplement 23 Table C.17-3 *************************"
	 ^SOPInstanceReferenceMacroItem
]

{ #category : #'class initialization' }
CurrentRequestedProcedureEvidenceSequenceItem class >> macroItemClassDataElements [
	
	"****************** SOP Instance Reference Macro - Supplement 23 Table C.17-3 *************************"
	 ^self macroItemClass initialize; DataElements
]

{ #category : #accessing }
CurrentRequestedProcedureEvidenceSequenceItem >> referencedSeriesSequence [

	^self dataElementsValues at: 'referencedSeriesSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSeriesSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSeriesSequence' put: (self dataElementsDictionary removeKey: 'referencedSeriesSequence') value.
		]
	]

]

{ #category : #accessing }
CurrentRequestedProcedureEvidenceSequenceItem >> referencedSeriesSequence: aSQValue [

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
CurrentRequestedProcedureEvidenceSequenceItem >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
CurrentRequestedProcedureEvidenceSequenceItem >> studyInstanceUID: aUIValue [

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
