Class {
	#name : #PersonName,
	#superclass : #Array,
	#type : #variable,
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation' }
PersonName class >> fromDictionary: aDictionary [

	^(super new: 5) fromDictionary: aDictionary
]

{ #category : #'instance creation' }
PersonName class >> new [

	^super new: 5
]

{ #category : #printing }
PersonName >> asDicomPNString [

	| dicomPNString subString anInteger |

	dicomPNString := ''.
	(anInteger := self size) < 5
		ifFalse: [anInteger := 5].

	1 to: anInteger do: [:pos | 
		(subString := self at: pos) isNil 
			ifFalse: [dicomPNString := dicomPNString, (dicomPNString isEmpty ifTrue: [''] ifFalse: ['^']), subString]
	].
	^dicomPNString
]

{ #category : #converting }
PersonName >> asText [

	^self printString asText
]

{ #category : #accessing }
PersonName >> familyNameComplex [

	^self at: 1
]

{ #category : #accessing }
PersonName >> familyNameComplex: aString [

	^self at: 1 put: aString
]

{ #category : #'initialize-release' }
PersonName >> fromDictionary: aDictionary [

	aDictionary at: 'familyNameComplex' ifPresent: [:value | self at: 1 put: value trimBoth].
	aDictionary at: 'givenNameComplex' ifPresent: [:value | self at: 2 put: value trimBoth].
	aDictionary at: 'middleNameComplex' ifPresent: [:value | self at: 3 put: value trimBoth].
	aDictionary at: 'namePrefix' ifPresent: [:value | self at: 4 put: value trimBoth].
	aDictionary at: 'nameSuffix' ifPresent: [:value | self at: 5 put: value trimBoth].
]

{ #category : #accessing }
PersonName >> givenNameComplex [

	^self at: 2
]

{ #category : #accessing }
PersonName >> givenNameComplex: aString [

	^self at: 2 put: aString
]

{ #category : #testing }
PersonName >> isEmpty [

	| aString |
	aString := self printString.
	
	^aString isEmpty
]

{ #category : #testing }
PersonName >> matches: text [

"regexString asRegex matches: self"

	^true
]

{ #category : #testing }
PersonName >> matchesRegex: regex [
	"| (regex matches: self patientID)"

	^ (self givenNameComplex notNil
		ifTrue: [ regex matches: self givenNameComplex ]
		ifFalse: [ false ])
		|
			(self familyNameComplex notNil
				ifTrue: [ regex matches: self familyNameComplex ]
				ifFalse: [ false ])
		|
			(self middleNameComplex notNil
				ifTrue: [ regex matches: self middleNameComplex ]
				ifFalse: [ false ])
]

{ #category : #accessing }
PersonName >> middleNameComplex [

	^self at: 3
]

{ #category : #accessing }
PersonName >> middleNameComplex: aString [

	^self at: 3 put: aString
]

{ #category : #accessing }
PersonName >> namePrefix [

	^self at: 4
]

{ #category : #accessing }
PersonName >> namePrefix: aString [

	^self at: 4 put: aString
]

{ #category : #accessing }
PersonName >> nameSuffix [

	^self at: 5
]

{ #category : #accessing }
PersonName >> nameSuffix: aString [

	^self at: 5 put: aString
]

{ #category : #testing }
PersonName >> notEmpty [

	^self isEmpty not
]

{ #category : #printing }
PersonName >> printOn: aStream [

	| aString subString |

	aString := ''.
	#(4 2 3 1 5) do: [:pos | 
		(subString := self at: pos) isNil ifFalse: [
			subString isEmpty ifFalse: [
				aString := aString, (aString isEmpty ifTrue: [''] ifFalse: [' ']), subString trimBoth
			]
		]
	].

	aStream nextPutAll: aString
]
