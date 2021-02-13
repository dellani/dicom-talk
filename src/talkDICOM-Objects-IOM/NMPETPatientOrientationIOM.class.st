Class {
	#name : #NMPETPatientOrientationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
NMPETPatientOrientationIOM class >> initialize [
	self resetDataElements.
	Name := 'NM/PET Patient Orientation Information Object Module'.
	moduleName := 'nmPETPatientOrientationIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #patientOrientationCodeSequence
				tag: #(16r54 16r410)
				vm: '1'
				type: '2'
				sequenceItemClass: PatientOrientationCodeSequenceItem)
]

{ #category : #accessing }
NMPETPatientOrientationIOM >> patientOrientationCodeSequence [

	^self dataElementsValues at: 'patientOrientationCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'patientOrientationCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientOrientationCodeSequence' put: (self dataElementsDictionary removeKey: 'patientOrientationCodeSequence') value.
		]
	]

]

{ #category : #accessing }
NMPETPatientOrientationIOM >> patientOrientationCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientOrientationCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientOrientationCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'patientOrientationCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'patientOrientationCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientOrientationCodeSequence' put: aSQValue
		]
	].

]
