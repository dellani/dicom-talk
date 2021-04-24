Class {
	#name : #SequenceItem,
	#superclass : #DicomObject,
	#instVars : [
		'length'
	],
	#classInstVars : [
		'Name',
		'SequenceName',
		'SequenceDataElementTag'
	],
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #accessing }
SequenceItem class >> Name [
	^ Name
]

{ #category : #accessing }
SequenceItem class >> Name: aString [
	Name := aString
]

{ #category : #accessing }
SequenceItem class >> SequenceDataElementTag [
	^ SequenceDataElementTag
]

{ #category : #accessing }
SequenceItem class >> SequenceDataElementTag: aDicomDataElementTag [
	SequenceDataElementTag := aDicomDataElementTag
]

{ #category : #accessing }
SequenceItem class >> SequenceName [
	^ SequenceName
]

{ #category : #accessing }
SequenceItem class >> SequenceName: aString [
	SequenceName := aString
]

{ #category : #printing }
SequenceItem class >> asText [
	^ self name
]

{ #category : #'class initialization' }
SequenceItem class >> initialize [
	^ self subclassResponsibility
]

{ #category : #'class initialization - private' }
SequenceItem class >> initializeSequenceDataElementTag: anArray [
	"Create an instance of DataElementTag from the given array 
	 (i.e. #(16r0040 16r0555)) and store it in class variable 
	 SequenceDataElementTag.
	
	 April 24 2021 - PRD"

	self SequenceDataElementTag: (DataElementTag fromArray: anArray)
]

{ #category : #'class initialization - private' }
SequenceItem class >> macroItemClass [
	^ self subclassResponsibility
]

{ #category : #'class initialization - private' }
SequenceItem class >> macroItemClassDataElements [
	| dic |
	dic := Dictionary new.
	self macroItemClass
		do: [ :aSequenceItemMacroClass | 
			aSequenceItemMacroClass initialize.
			dic addAll: aSequenceItemMacroClass DataElements ].
	^ dic
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
