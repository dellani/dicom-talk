Class {
	#name : #MeasuredValueSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
MeasuredValueSequenceItem class >> initialize [
	"DICOM Measured Value Sequence Item - initialization method

	MKB - Jan 25th, 2002
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Measured Value Sequence Item'.
	SequenceName := 'measuredValueSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0040 16rA300).

	self
		addDataElement:
			(DSDataElement
				newWith: #numericValue
				tag: #(16r0040 16rA30A)
				vm: '1-n'
				type: '1').	"VM = 1-n"
	self
		addDataElement:
			(SQDataElement
				newWith: #measurementUnitsCodeSequence
				tag: #(16r0040 16r08EA)
				vm: '1'
				type: '1'
				sequenceItemClass: MeasurementUnitsCodeSequenceItem)
]

{ #category : #accessing }
MeasuredValueSequenceItem >> measurementUnitsCodeSequence [

	^self dataElementsValues at: 'measurementUnitsCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: (self dataElementsDictionary removeKey: 'measurementUnitsCodeSequence') value.
		]
	]

]

{ #category : #accessing }
MeasuredValueSequenceItem >> measurementUnitsCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'measurementUnitsCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #measurementUnitsCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'measurementUnitsCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'measurementUnitsCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'measurementUnitsCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
MeasuredValueSequenceItem >> numericValue [

	^self dataElementsValues at: 'numericValue' ifAbsent: [
		self dataElementsDictionary at: 'numericValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'numericValue' put: (self dataElementsDictionary removeKey: 'numericValue') value.
		]
	]

]

{ #category : #accessing }
MeasuredValueSequenceItem >> numericValue: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'numericValue' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numericValue.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'numericValue' put: dataElement.
			self dataElementsValues removeKey: 'numericValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numericValue' put: aDSValue
		]
	].

]
