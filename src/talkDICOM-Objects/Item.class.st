Class {
	#name : #Item,
	#superclass : #DicomObject,
	#classInstVars : [
		'description'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
Item class >> Name [
	^ description
]

{ #category : #accessing }
Item class >> Name: aString [
	description := aString
]

{ #category : #'class initialization - private' }
Item class >> attributes [
	^ OrderedCollection new
]

{ #category : #accessing }
Item class >> description [
	^ description
]

{ #category : #accessing }
Item class >> description: aString [
	description := aString
]

{ #category : #utilities }
Item class >> listDataElementDefinition [
	"List my data element definition using character (tab) separated values.
	
  	 April 11 2021: Initial implementation;
	 April 18 2021: Modified from 'listDataElementDefinition_full' to not 
	                 include the expanded sequence attributes;
	 April 25 2021: SequenceItem specific implementation;
	   May 09 2021: Refactoring (pushed up) from SequenceItem to Item;
	                - Paulo R. Dellani."

	| definition macroDefinition |

	^ String
		new: 10
		streamContents: [ :aStream | 
			definition := SortedCollection withAll: self attributes.
			definition isNotEmpty ifTrue: [ 
				"(definition at: 1) csvPrintOn: aStream separator: Character tab level: 0."
				definition do: [ :item |
					aStream cr.
					item csvPrintOn: aStream separator: Character tab level: 0 ] ].
			self macroItemClass do: [ :aMacroItemClass |
				macroDefinition := SortedCollection withAll: aMacroItemClass attributes.
				macroDefinition isNotEmpty ifTrue: [ 
					"definition isNotEmpty ifTrue: [ aStream cr ]."
					aStream cr.
					aStream nextPutAll: '# '; nextPutAll: aMacroItemClass description.
					"(macroDefinition at: 1) csvPrintOn: aStream separator: Character tab level: 0."
					macroDefinition do: [ :item | 
						aStream cr.
						item csvPrintOn: aStream separator: Character tab level: 0 ] ] ] ]
]

{ #category : #utilities }
Item class >> listDataElementDefinition_Reflexive [
	"List my data element definition using character (tab) separated values.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - Modified from 'listDataElementDefinition_full' to not 
	                include the expanded sequence attributes;
	April 25 2021 - SequenceItem specific implementation;
	  May 09 2021 - Refactoring (pushed up) from SequenceItem to Item;
	                Version for computer reflection - PRD."

	| definition |

	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll:'; cr; nextPutAll: '''# ';
					                 nextPutAll: self description.

			definition := SortedCollection withAll: self attributes.
			definition isNotEmpty ifTrue: [ 
				definition do: [ :item |
					aStream cr.
					item csvPrintOn: aStream separator: Character tab level: 0 ] ].

			aStream
				nextPut: $'; nextPut: $.; cr; cr.

			self macroItemClass do: [ :aMacroItemClass |
				aStream
					tab; tab; tab; nextPutAll: '"'; nextPutAll: aMacroItemClass description; nextPutAll: '"'; cr;
					tab; tab; tab; nextPutAll: 'aStream'; cr;
					tab; tab; tab; tab; nextPutAll: 'nextPutAll: MacroItem ';
					nextPutAll: aMacroItemClass macroName; 
					nextPutAll: 'TextualDataElementsDefinition'; nextPut: $.; cr. ].

			aStream
				nextPutAll: ' ]'; cr. ].


		
	



]

{ #category : #'class initialization - private' }
Item class >> macroItemClass [
	^ OrderedCollection new
]

{ #category : #'class initialization - private' }
Item class >> macroItemClassDataElements [
	| dic |
	dic := Dictionary new.
	self macroItemClass
		do: [ :aSequenceItemMacroClass | 
			aSequenceItemMacroClass initialize.
			dic addAll: aSequenceItemMacroClass DataElements ].
	^ dic
]
