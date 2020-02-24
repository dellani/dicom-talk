Class {
	#name : #DocumentRelationshipMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
DocumentRelationshipMacroItem class >> initialize [
	self resetDataElements.
	Name := 'Dicom Document Relationship Macro Item'.
	SequenceName := 'documentRelationshipMacroItem'.
	"**************   Supplement 23 Table C.17.3-4: Document Relationship Macro **********************"
	self
		addDataElement:
			(DTDataElement
				newWith: #observationDateTime
				tag: #(16r0040 16rA032)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(SQDataElement
				newWith: #contentTemplateSequence
				tag: #(16r0040 16rA504)
				vm: '1'
				type: '1C'
				sequenceItemClass: ContentTemplateSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #contentSequence
				tag: #(16r0040 16rA730)
				vm: '1'
				type: '1C'
				sequenceItemClass: ContentSequenceItem)
]

{ #category : #accessing }
DocumentRelationshipMacroItem >> contentSequence [

	^self dataElementsValues at: 'contentSequence' ifAbsent: [
		self dataElementsDictionary at: 'contentSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentSequence' put: (self dataElementsDictionary removeKey: 'contentSequence') value.
		]
	]

]

{ #category : #accessing }
DocumentRelationshipMacroItem >> contentSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contentSequence' put: dataElement.
			self dataElementsValues removeKey: 'contentSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
DocumentRelationshipMacroItem >> contentTemplateSequence [

	^self dataElementsValues at: 'contentTemplateSequence' ifAbsent: [
		self dataElementsDictionary at: 'contentTemplateSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentTemplateSequence' put: (self dataElementsDictionary removeKey: 'contentTemplateSequence') value.
		]
	]

]

{ #category : #accessing }
DocumentRelationshipMacroItem >> contentTemplateSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentTemplateSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentTemplateSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contentTemplateSequence' put: dataElement.
			self dataElementsValues removeKey: 'contentTemplateSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentTemplateSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
DocumentRelationshipMacroItem >> observationDateTime [

	^self dataElementsValues at: 'observationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'observationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'observationDateTime' put: (self dataElementsDictionary removeKey: 'observationDateTime') value.
		]
	]

]

{ #category : #accessing }
DocumentRelationshipMacroItem >> observationDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'observationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #observationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'observationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'observationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'observationDateTime' put: aDTValue
		]
	].

]
