Class {
	#name : #SpecimenSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
SpecimenSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Specimen Sequence Item '.
	SequenceName := 'specimenSequenceItem'.
	self
		addDataElement:
			(LODataElement
				newWith: #specimenIdentifier
				tag: #(16r0040 16r0551)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(SQDataElement
				newWith: #specimenTypeCodeSequence
				tag: #(16r0040 16r059A)
				vm: '1'
				type: '2C'
				sequenceItemClass: SpecimenTypeCodeSequenceItem).
	self
		addDataElement:
			(LODataElement
				newWith: #slideIdentifier
				tag: #(16r0040 16r06FA)
				vm: '1'
				type: '2C')
]

{ #category : #accessing }
SpecimenSequenceItem >> rETIRED_SlideIdentifier [

	^self dataElementsValues at: 'rETIRED_SlideIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SlideIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SlideIdentifier' put: (self dataElementsDictionary removeKey: 'rETIRED_SlideIdentifier') value.
		]
	]

]

{ #category : #accessing }
SpecimenSequenceItem >> rETIRED_SlideIdentifier: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SlideIdentifier' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SlideIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_SlideIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SlideIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SlideIdentifier' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SpecimenSequenceItem >> slideIdentifier [

	^self dataElementsValues at: 'rETIRED_SlideIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SlideIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SlideIdentifier' put: (self dataElementsDictionary removeKey: 'rETIRED_SlideIdentifier') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SpecimenSequenceItem >> slideIdentifier: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SlideIdentifier' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SlideIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_SlideIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SlideIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SlideIdentifier' put: aLOValue
		]
	].

]

{ #category : #accessing }
SpecimenSequenceItem >> specimenIdentifier [

	^self dataElementsValues at: 'specimenIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'specimenIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'specimenIdentifier' put: (self dataElementsDictionary removeKey: 'specimenIdentifier') value.
		]
	]

]

{ #category : #accessing }
SpecimenSequenceItem >> specimenIdentifier: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'specimenIdentifier' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #specimenIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'specimenIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'specimenIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'specimenIdentifier' put: aLOValue
		]
	].

]

{ #category : #accessing }
SpecimenSequenceItem >> specimenTypeCodeSequence [

	^self dataElementsValues at: 'specimenTypeCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'specimenTypeCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'specimenTypeCodeSequence' put: (self dataElementsDictionary removeKey: 'specimenTypeCodeSequence') value.
		]
	]

]

{ #category : #accessing }
SpecimenSequenceItem >> specimenTypeCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'specimenTypeCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #specimenTypeCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'specimenTypeCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'specimenTypeCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'specimenTypeCodeSequence' put: aSQValue
		]
	].

]
