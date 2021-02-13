Class {
	#name : #SpecimenIdentificationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SpecimenIdentificationIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Specimen Identification Information Object Module.
	PS 3.3-2001 Annex C.7.1.2 - PRD 04-06.2001, 03.2002"

	self resetDataElements.
	Name := 'DICOM Specimen Identification Information Object Module'.
	moduleName := 'specimenIdentificationIOM'.
	self
		addDataElement:
			(LODataElement
				newWith: #specimenAccessionNumber
				tag: #(16r0040 16r050A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #specimenSequence
				tag: #(16r0040 16r0550)
				vm: '1'
				type: '2'
				sequenceItemClass: SpecimenSequenceItem)
]

{ #category : #checking }
SpecimenIdentificationIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
SpecimenIdentificationIOM >> rETIRED_SpecimenAccessionNumber [

	^self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenAccessionNumber') value.
		]
	]

]

{ #category : #accessing }
SpecimenIdentificationIOM >> rETIRED_SpecimenAccessionNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenAccessionNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: aLOValue
		]
	].

]

{ #category : #accessing }
SpecimenIdentificationIOM >> rETIRED_SpecimenSequence [

	^self dataElementsValues at: 'rETIRED_SpecimenSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenSequence') value.
		]
	]

]

{ #category : #accessing }
SpecimenIdentificationIOM >> rETIRED_SpecimenSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SpecimenIdentificationIOM >> specimenAccessionNumber [

	^self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenAccessionNumber') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SpecimenIdentificationIOM >> specimenAccessionNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenAccessionNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenAccessionNumber' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenAccessionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenAccessionNumber' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SpecimenIdentificationIOM >> specimenSequence [

	^self dataElementsValues at: 'rETIRED_SpecimenSequence' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: (self dataElementsDictionary removeKey: 'rETIRED_SpecimenSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SpecimenIdentificationIOM >> specimenSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_SpecimenSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_SpecimenSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'rETIRED_SpecimenSequence' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_SpecimenSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_SpecimenSequence' put: aSQValue
		]
	].

]
