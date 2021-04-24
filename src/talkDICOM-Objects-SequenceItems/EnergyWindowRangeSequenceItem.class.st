Class {
	#name : #EnergyWindowRangeSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
EnergyWindowRangeSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Energy Window Range Sequence Item'.
	SequenceName := 'energyWindowRangeSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0054 16r0013).

	"***** Begin of data elements definition *******"
]
