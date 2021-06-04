Class {
	#name : #PatientIDMacroAttributes,
	#superclass : #DicomIOMacros,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
PatientIDMacroAttributes class >> initialize [
	self resetDataElements.
	description := 'DICOM PatientID IOM Macro'.
	macroName := 'patientIDMacro'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #issuerOfPatientID
				tag: #(16r0010 16r0021)
				vm: ''
				type: '3').

]

{ #category : #accessing }
PatientIDMacroAttributes >> issuerOfPatientID [

	^self dataElementsValues at: 'issuerOfPatientID' ifAbsent: [
		self dataElementsDictionary at: 'issuerOfPatientID' ifPresent: [:dataElement |
			self dataElementsValues at: 'issuerOfPatientID' put: (self dataElementsDictionary removeKey: 'issuerOfPatientID') value.
		]
	]

]

{ #category : #accessing }
PatientIDMacroAttributes >> issuerOfPatientID: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'issuerOfPatientID' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #issuerOfPatientID.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'issuerOfPatientID' put: dataElement.
			self dataElementsValues removeKey: 'issuerOfPatientID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'issuerOfPatientID' put: aCSValue
		]
	].

]
