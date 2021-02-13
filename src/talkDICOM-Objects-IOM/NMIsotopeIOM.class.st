Class {
	#name : #NMIsotopeIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
NMIsotopeIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Isotope IOM'.
	moduleName := 'nmIsotopeIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #interventionDrugInformationSequence
				tag: #(16r18 16r26)
				vm: '1'
				type: '3'
				sequenceItemClass: InterventionDrugInformationSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #energyWindowInformationSequence
				tag: #(16r54 16r12)
				vm: '1'
				type: '2'
				sequenceItemClass: EnergyWindowInformationSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #radiopharmaceuticalInformationSequence
				tag: #(16r54 16r16)
				vm: '1'
				type: '2'
				sequenceItemClass: RadiopharmaceuticalInformationSequenceItem)
]

{ #category : #accessing }
NMIsotopeIOM >> energyWindowInformationSequence [

	^self dataElementsValues at: 'energyWindowInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'energyWindowInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'energyWindowInformationSequence' put: (self dataElementsDictionary removeKey: 'energyWindowInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMIsotopeIOM >> energyWindowInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'energyWindowInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #energyWindowInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'energyWindowInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'energyWindowInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'energyWindowInformationSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
NMIsotopeIOM >> interventionDrugInformationSequence [

	^self dataElementsValues at: 'interventionDrugInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'interventionDrugInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'interventionDrugInformationSequence' put: (self dataElementsDictionary removeKey: 'interventionDrugInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMIsotopeIOM >> interventionDrugInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'interventionDrugInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #interventionDrugInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'interventionDrugInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'interventionDrugInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'interventionDrugInformationSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
NMIsotopeIOM >> radiopharmaceuticalInformationSequence [

	^self dataElementsValues at: 'radiopharmaceuticalInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceuticalInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceuticalInformationSequence' put: (self dataElementsDictionary removeKey: 'radiopharmaceuticalInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMIsotopeIOM >> radiopharmaceuticalInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceuticalInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceuticalInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'radiopharmaceuticalInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceuticalInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceuticalInformationSequence' put: aSQValue
		]
	].

]
