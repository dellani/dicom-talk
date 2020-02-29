"
This class represents sequence items whose data elements are unknown, allowing the implemetation to decode unknown sequences items.
"
Class {
	#name : #UnknownSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #initialization }
UnknownSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Generic Sequence Item'.
	SequenceName := 'genericSequenceItem'.
]
