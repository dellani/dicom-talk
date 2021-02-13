Class {
	#name : #CodeMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
CodeMacroItem class >> initialize [
	"DICOM Code Macro Item - initialization method

	MKB - Jan 25th, 2002
	DICOM Structured Reporting
	Table C.18.2-1 specifies the Attributes that reference a Code Macro"

	self resetDataElements.
	Name := 'DICOM Code Macro Item'.
	SequenceName := 'codeMacroItem'.
	"************************************   PS 3.3-2001 Table C.18.2-1 *************************************************************"
	self
		addDataElement:
			(SQDataElement
				newWith: #conceptCodeSequence
				tag: #(16r0040 16rA168)
				vm: '1'
				type: '1'
				sequenceItemClass: ConceptCodeSequenceItem)
]

{ #category : #accessing }
CodeMacroItem >> conceptCodeSequence [

	^self dataElementsValues at: 'conceptCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptCodeSequence') value.
		]
	]

]

{ #category : #accessing }
CodeMacroItem >> conceptCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptCodeSequence' put: aSQValue
		]
	].

]
