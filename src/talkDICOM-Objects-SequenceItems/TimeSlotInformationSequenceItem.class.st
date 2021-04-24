Class {
	#name : #TimeSlotInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
TimeSlotInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Time Slot Information Sequence Item'.
	SequenceName := 'timeSlotInformationSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0054 16r0072).

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(DSDataElement
				newWith: #timeSlotTime
				tag: #(16r54 16r73)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
TimeSlotInformationSequenceItem >> timeSlotTime [

	^self dataElementsValues at: 'timeSlotTime' ifAbsent: [
		self dataElementsDictionary at: 'timeSlotTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeSlotTime' put: (self dataElementsDictionary removeKey: 'timeSlotTime') value.
		]
	]

]

{ #category : #accessing }
TimeSlotInformationSequenceItem >> timeSlotTime: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeSlotTime' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeSlotTime.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'timeSlotTime' put: dataElement.
			self dataElementsValues removeKey: 'timeSlotTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeSlotTime' put: aDSValue
		]
	].

]
