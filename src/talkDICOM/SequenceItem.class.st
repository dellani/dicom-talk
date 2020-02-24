Class {
	#name : #SequenceItem,
	#superclass : #DicomObject,
	#instVars : [
		'length'
	],
	#classInstVars : [
		'Name',
		'SequenceName'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
SequenceItem class >> Name [
	^ Name
]

{ #category : #accessing }
SequenceItem class >> SequenceName [
	^ SequenceName
]

{ #category : #printing }
SequenceItem class >> asText [
	^ self name
]

{ #category : #printing }
SequenceItem >> asText [

	self halt.
	^self printString asText
]

{ #category : #accessing }
SequenceItem >> length [

	^length.
]

{ #category : #printing }
SequenceItem >> printOn: aStream [

	aStream nextPutAll: self class Name
]
