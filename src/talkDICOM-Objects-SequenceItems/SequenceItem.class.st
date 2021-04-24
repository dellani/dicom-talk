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

{ #category : #utilities }
SequenceItem class >> csvPrintOn: aStream separator: aCharacter level: level [
	"List my data element definition using character (tab) separated values.
	
	 April 11 2021 - PRD."

	| definition attribute |

	definition := SortedCollection withAll: DataElements values.
	definition isNotEmpty ifTrue: [ 
		"level timesRepeat: [ aStream nextPutAll: '> ' ]."
		(definition at: 1) csvPrintOn: aStream separator: Character tab level: level.
		2 to: definition size do: [ :index | 
			aStream cr.
			"level timesRepeat: [ aStream nextPutAll: '> ' ]."
			attribute := definition at: index.
			attribute isSequence ifTrue: [
				"Some sequence items are potentially recursive, so let's avoid going down the rabbit hole"
				attribute sequenceItemClass = self ifTrue: [
					attribute csvPrintOn: aStream separator: aCharacter level: level listItemAttributes: false.
					aStream cr.
					level timesRepeat: [ aStream nextPutAll: '< ' ].
					aStream nextPutAll: ' Potentially recursive sequence attribute detected, refer my parent for my attributes.'.
				] ifFalse: [
					attribute csvPrintOn: aStream separator: aCharacter level: level listItemAttributes: true ] 
			] ifFalse: [
				attribute csvPrintOn: aStream separator: aCharacter level: level ] ] ]
		
	

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
