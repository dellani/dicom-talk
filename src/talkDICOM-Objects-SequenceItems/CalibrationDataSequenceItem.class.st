Class {
	#name : #CalibrationDataSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
CalibrationDataSequenceItem class >> initialize [
	"DICOM Calibration Data Sequence Item

	April 11 2021 - PRD."

	Name := 'DICOM Calibration Data Sequence Item'.
	SequenceName := 'anatomicRegionSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0054 16r0306).

	self resetDataElements.
				
]
