Class {
	#name : #SOPInstanceReferenceMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
SOPInstanceReferenceMacroItem class >> initialize [
	"DICOM SOP Instance Reference Macro Sequence Item - initialization method

	RC - Dec 14th, 2001
	DICOM Structured Reporting
	Table C.17-3 specifies the Attributes that reference a SOP Instance"

	self resetDataElements.
	Name := 'DICOM SOP Instance Reference Macro Item'.
	SequenceName := 'sopInstanceReferenceMacroItem'.
	"****************** SOP Instance Reference Macro - Supplement 23 Table C.17-3 *************************"
	self addDataElement: (UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: '1'
				type: '1').
	self addDataElement: (SQDataElement
				newWith: #referencedSeriesSequence
				tag: #(16r0008 16r1115)
				vm: '1'
				type: '1'
				sequenceItemClass: ReferencedSeriesSequenceItem)
]

{ #category : #accessing }
SOPInstanceReferenceMacroItem >> referencedSeriesSequence [

	^self dataElementsValues at: 'referencedSeriesSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSeriesSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSeriesSequence' put: (self dataElementsDictionary removeKey: 'referencedSeriesSequence') value.
		]
	]

]

{ #category : #accessing }
SOPInstanceReferenceMacroItem >> referencedSeriesSequence: aSQValue [

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
SOPInstanceReferenceMacroItem >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
SOPInstanceReferenceMacroItem >> studyInstanceUID: aUIValue [

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
