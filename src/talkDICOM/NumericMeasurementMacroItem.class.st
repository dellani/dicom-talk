Class {
	#name : #NumericMeasurementMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
NumericMeasurementMacroItem class >> initialize [
	"Dicom Numeric Measurement Macro Item - initialization method

	MKB - Jan 25th, 2002
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Numeric Measurement Macro Item'.
	SequenceName := 'numericMeasurementMacroItem'.
	self
		addDataElement:
			(SQDataElement
				newWith: #measuredValueSequence
				tag: #(16r0040 16rA300)
				vm: '1'
				type: '2'
				sequenceItemClass: MeasuredValueSequenceItem)
]

{ #category : #accessing }
NumericMeasurementMacroItem >> measuredValueSequence [

	^self dataElementsValues at: 'measuredValueSequence' ifAbsent: [
		self dataElementsDictionary at: 'measuredValueSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'measuredValueSequence' put: (self dataElementsDictionary removeKey: 'measuredValueSequence') value.
		]
	]

]

{ #category : #accessing }
NumericMeasurementMacroItem >> measuredValueSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'measuredValueSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #measuredValueSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'measuredValueSequence' put: dataElement.
			self dataElementsValues removeKey: 'measuredValueSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'measuredValueSequence' put: aSQValue
		]
	].

]
