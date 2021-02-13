Class {
	#name : #CompositeObjectReferenceMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
CompositeObjectReferenceMacroItem class >> initialize [
	"DICOM Composite Object Reference Macro Item - initialization method

	MKB - Jan 25th, 2002
	DICOM Structured Reporting
	PS 3.3 Table C.18.3-1 2001 specifies the Attributes that reference a Referenced SOP Sequence"

	self resetDataElements.
	Name := 'DICOM Composite Object Reference Macro Item'.
	SequenceName := 'compositeObjectReferenceMacro Item'.
	"****************** PS 3.3 Table C.18.3-1 *************************"
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
CompositeObjectReferenceMacroItem >> referencedSOPSequence [

	^self dataElementsValues at: 'referencedSOPSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPSequence' put: (self dataElementsDictionary removeKey: 'referencedSOPSequence') value.
		]
	]

]

{ #category : #accessing }
CompositeObjectReferenceMacroItem >> referencedSOPSequence: aSQValue [

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
