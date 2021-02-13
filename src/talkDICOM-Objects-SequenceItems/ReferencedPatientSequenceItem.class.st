Class {
	#name : #ReferencedPatientSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ReferencedPatientSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Referenced Patient Sequence Item'.
	SequenceName := 'referencedPatientSequenceItem'.
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPClassUID
				tag: #(16r0008 16r1150)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPInstanceUID
				tag: #(16r0008 16r1155)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
ReferencedPatientSequenceItem >> referencedSOPClassUID [

	^self dataElementsValues at: 'referencedSOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPClassUID' put: (self dataElementsDictionary removeKey: 'referencedSOPClassUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedPatientSequenceItem >> referencedSOPClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ReferencedPatientSequenceItem >> referencedSOPInstanceUID [

	^self dataElementsValues at: 'referencedSOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPInstanceUID' put: (self dataElementsDictionary removeKey: 'referencedSOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedPatientSequenceItem >> referencedSOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPInstanceUID' put: aUIValue
		]
	].

]
