Class {
	#name : #EnergyWindowRangeSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
EnergyWindowRangeSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Energy Window Range Sequence Item'.
	SequenceName := 'energyWindowRangeSequenceItem'

	"***** Begin of data elements definition *******"
]
