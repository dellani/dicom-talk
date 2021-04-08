Class {
	#name : #PrivateCreatorDataElementTag,
	#superclass : #DataElementTag,
	#instVars : [
		'creatorsGroup'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #examples }
PrivateCreatorDataElementTag class >> example01 [
	(self fromToken: '(0019,"1.2.840.113681",10)') inspect
]

{ #category : #examples }
PrivateCreatorDataElementTag class >> example02 [
	(self fromToken: '(0009,"ACUSON",00)') inspect
]

{ #category : #examples }
PrivateCreatorDataElementTag class >> example03 [
	(self fromToken: '(0047,"GEMS_ADWSoft_3D1",D3)') inspect
]

{ #category : #examples }
PrivateCreatorDataElementTag class >> example04 [
	(self fromToken: '(2001-2005,"Philips Imaging DD 001",03-u-10)') inspect
]

{ #category : #'instance creation' }
PrivateCreatorDataElementTag class >> fromArray: aTagGroupElementValueArray [
	^ self new fromArray: aTagGroupElementValueArray
]

{ #category : #'instance creation' }
PrivateCreatorDataElementTag class >> fromGDCMToken: tokenArray [
	"					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	"Remove parenthesis"

	| groupNumber elementNumber creatorsGroup |
	groupNumber := Integer readFrom: ((tokenArray at: 1) reject: [ :character | character = $x ]) trimBoth base: 16.
	elementNumber := Integer readFrom: ((tokenArray at: 2) reject: [ :character | character = $x ]) trimBoth base: 16.
	creatorsGroup := (tokenArray at: 3) reject: [ :character | character = $" ].
	^ self new
		groupNumber: groupNumber;
		elementNumber: elementNumber;
		creatorsGroup: creatorsGroup;
		yourself
]

{ #category : #'instance creation - private' }
PrivateCreatorDataElementTag class >> parseOFFISToken: token [
	"Parse group and element numbers from private creators accoding to the notation
	 used in the private.dic  file distributed along with the OFFIS DICOM ToolKit.
	
	 August 22 2017: Initial implementation;
	  April 08 2021: Refactored fromToken: method into parseOFFISToken: fixed
	                 a bug decoding the element number range - PRD.
	
	 Comment from header of dicom.dic file:
	
	 # (...) The tag value may take one of two forms:
	 #   (gggg,""CREATOR"",ee)
	 #   (gggg,""CREATOR"",eeee) [eeee >= 1000]
	 # The first form describes a private tag that may be used with different
	 # element numbers as reserved by the private creator element.
	 # The second form describes a private tag that may only occur with a
	 # certain fixed element number.
	 # In both cases, the tag values must be in hexadecimal.
	 # Repeating groups are represented by indicating the range
	 # (gggg-o-gggg,""CREATOR"",ee) or (gggg-o-gggg,""CREATOR"",eeee)
	 # where ""-o-"" indicates that only odd group numbers match the definition.
	 # The element part of the tag can also be a range.
	 (0000,0000)
	 (6000-60FF,0040)
	 (0009-o-ffff,0010-u-00ff)
	 (0001-o-0007,0010-u-00ff)"

	| tmpToken inputStream group element creator tagCollection |

	tmpToken := token reject: [ :character | character = (Character value: 40) ].
	tmpToken := tmpToken reject: [ :character | character = (Character value: 41) ].
	inputStream := tmpToken readStream.
	group := inputStream upTo: $,.
	inputStream next. "Skip the double quotation mark"
	creator := inputStream upTo: $".
	inputStream next. "Skip the comma"
	element := inputStream upToEnd.
	group := (group includesAny: #($- $o))
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: group base: 16) ].
	creator  := creator reject: [ :character | character = $" ].
	element := (element includesAny: #($- $o))
		ifTrue: [ self decodeRange: element ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: element base: 16) ].

	tagCollection := OrderedCollection new.
	group do: [ :x |
			element do: [ :y | tagCollection add: (Array with: x with: y with: creator) ] ].

	^ tagCollection
]

{ #category : #accessing }
PrivateCreatorDataElementTag >> creatorsGroup [
	^ creatorsGroup
]

{ #category : #accessing }
PrivateCreatorDataElementTag >> creatorsGroup: anObject [
	creatorsGroup := anObject
]

{ #category : #'instance creation' }
PrivateCreatorDataElementTag >> fromArray: aTagGroupElementValueArray [

	self groupNumber: (aTagGroupElementValueArray at: 1)	.
	self elementNumber: (aTagGroupElementValueArray at: 2).
	self creatorsGroup: (aTagGroupElementValueArray at: 3).
]

{ #category : #printing }
PrivateCreatorDataElementTag >> printOn: aStream [
	aStream nextPut: $(.
	self groupNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream
		nextPutAll: ', "';
		nextPutAll: self creatorsGroup;
		nextPutAll: '", '.
	self elementNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream nextPut: $)
]
