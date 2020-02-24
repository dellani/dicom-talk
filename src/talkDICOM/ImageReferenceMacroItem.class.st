"
DICOM Image Reference Macro Item.
DICOM Structured Reporting.
"
Class {
	#name : #ImageReferenceMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
ImageReferenceMacroItem class >> initialize [
	"DICOM Image Reference Macro Item - initialization method

	MKB - Jan 25th, 2002
	DICOM Structured Reporting"

	Name := 'DICOM Image Reference Macro Item'.
	SequenceName := 'imageReferenceMacroItem'.
	self resetDataElements.
	"****************** Composite Object Reference Macro - Table C.18.4-1 *************************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ]
]

{ #category : #'class initialization' }
ImageReferenceMacroItem class >> macroItemClass [
	"****************** Composite Object Reference Macro - Table C.18.4-1 *************************"

	^ CompositeObjectReferenceMacroItem
]

{ #category : #'class initialization' }
ImageReferenceMacroItem class >> macroItemClassDataElements [
	"****************** Composite Object Reference Macro - Table C.18.4-1 *************************"

	^ self macroItemClass DataElements
]

{ #category : #accessing }
ImageReferenceMacroItem >> referencedSOPSequence [

	^self dataElementsValues at: 'referencedSOPSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPSequence' put: (self dataElementsDictionary removeKey: 'referencedSOPSequence') value.
		]
	]

]

{ #category : #accessing }
ImageReferenceMacroItem >> referencedSOPSequence: aSQValue [

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
