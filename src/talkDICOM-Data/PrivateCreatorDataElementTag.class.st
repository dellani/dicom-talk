Class {
	#name : #PrivateCreatorDataElementTag,
	#superclass : #DataElementTag,
	#instVars : [
		'creatorsGroup'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation' }
PrivateCreatorDataElementTag class >> decodeRange: rangeToken [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit representing a range. Comment from header of private.dic file:
	
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

	#
	(0009-o-ffff,0010-00ff)
	(0001-o-0007,0010-o-00ff)
	'(0000-o-ffff,0000)' includesAny: #($- $o)
					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	| step valueRange inputStream start end middle |

	step := 2.
	valueRange := OrderedCollection new.
	(rangeToken
		includes: $-)
		ifTrue: [ inputStream := rangeToken readStream.
			start := inputStream upTo: $-.
			middle := inputStream upTo: $-.
			end := inputStream upToEnd.
			start := Integer readFrom: start base: 16.
			end := Integer readFrom: end base: 16.
			start to: end by: step do: [ :index | valueRange add: index ] ].
	^ valueRange
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

{ #category : #'instance creation' }
PrivateCreatorDataElementTag class >> fromToken: token [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit. Comment from header of private.dic file:
	
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
	(0001-o-0007,0010-u-00ff)
	'(0000-u-ffff,0000)' includesAny: #($- $o $u)
					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	"Remove parenthesis"

	| tmpToken inputStream group element answer creator |
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
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: element base: 16) ].

	answer := OrderedCollection new.
	group do: [ :x |
		element do: [ :y |
			answer add: (self fromArray: (Array with: x with: y with: creator)).
		 ]].
	^answer
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
	"self groupNumber printOn: aStream base: 16."
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
