Class {
	#name : #DataElementTag,
	#superclass : #Object,
	#instVars : [
		'tag',
		'elementNumber',
		'groupNumber'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation' }
DataElementTag class >> decodeRange: rangeToken [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit representing a range. Comment from header of dicom.dic file:
	
	# Repeating groups are represented by indicating the range (gggg-gggg,eeee).
	# By default the repeating notation only represents even numbers.  A range 
	# where only odd numbers are valid is represented using the notation (gggg-o-gggg,eeee).
	# A range can represent both even and odd numbers using the notation (gggg-u-gggg,eeee).
	# The element part of the tag can also be a range.
	#
	(0000,0000)
	(6000-60FF,0040)
	(0009-o-ffff,0010-u-00ff)
	(0001-o-0007,0010-u-00ff)
	'(0000-u-ffff,0000)' includesAny: #($- $o $u)
					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	| valueRange inputStream start end |
	valueRange := OrderedCollection new.
	(rangeToken
		includes: $-)
		ifTrue: [ inputStream := rangeToken readStream.
			start := inputStream upTo: $-.
			end := inputStream upToEnd.
			start := Integer readFrom: start base: 16.
			end := Integer readFrom: end base: 16.
			start to: end by: 2 do: [ :index | valueRange add: index ] ].
	^ valueRange
]

{ #category : #'instance creation' }
DataElementTag class >> fromArray: aTagGroupElementValueArray [
	^ self new fromArray: aTagGroupElementValueArray
]

{ #category : #'instance creation' }
DataElementTag class >> fromBigEndianByteStream: bigEndianByteStream [
	^ self new fromBigEndianByteStream: bigEndianByteStream
]

{ #category : #'instance creation' }
DataElementTag class >> fromDictionary: aDictionary [
	^ self new fromArray: aDictionary
]

{ #category : #'instance creation' }
DataElementTag class >> fromLittleEndianByteStream: bigEndianByteStream [
	^ self new fromLittleEndianByteStream: bigEndianByteStream
]

{ #category : #'instance creation' }
DataElementTag class >> fromToken: token [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit. Comment from header of dicom.dic file:
	
	# (...) The tag values (gggg,eeee) must be in hexedecimal and must be 
	# surrounded by parentheses.  Repeating groups are represented by indicating
	# the range (gggg-gggg,eeee).  By default the repeating notation only represents
	# even numbers.  A range where only odd numbers are valid is represented using
	# the notation (gggg-o-gggg,eeee). A range can represent both even and odd numbers
	# using the notation (gggg-u-gggg,eeee).  The element part of the tag can also be
	# a range.
	#
	(0000,0000)
	(6000-60FF,0040)
	(0009-o-ffff,0010-u-00ff)
	(0001-o-0007,0010-u-00ff)
	'(0000-u-ffff,0000)' includesAny: #($- $o $u)
					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	"Remove parenthesis"

	| tmpToken inputStream group element answer |
	tmpToken := token reject: [ :character | character = (Character value: 40) ].
	tmpToken := tmpToken reject: [ :character | character = (Character value: 41) ].
	inputStream := tmpToken readStream.
	group := inputStream upTo: $,.
	element := inputStream upToEnd.
	group := (group includesAny: #($- $o $u))
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: group base: 16) ].
	element := (element includesAny: #($- $o $u))
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: element base: 16) ].

	answer := OrderedCollection new.	
	group do: [ :x |
		element do: [ :y | 
			answer add: (self fromArray: (Array with: x with: y)).
		 ]].
	^answer
]

{ #category : #'instance creation' }
DataElementTag class >> new [

	^super new initialize
]

{ #category : #comparing }
DataElementTag >> < anObject [

	^ self hash < anObject hash
]

{ #category : #comparing }
DataElementTag >> <= anObject [

	^ self hash <= anObject hash
]

{ #category : #comparing }
DataElementTag >> = anObject [

	^ self hash = anObject hash
]

{ #category : #comparing }
DataElementTag >> > anObject [

	^ self hash > anObject hash
]

{ #category : #comparing }
DataElementTag >> >= anObject [

	^ self hash >= anObject hash
]

{ #category : #'instance creation' }
DataElementTag >> decodeRange: rangeToken [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit representing a range. Comment from header of dicom.dic file:
	
	# Repeating groups are represented by indicating the range (gggg-gggg,eeee).
	# By default the repeating notation only represents even numbers.  A range 
	# where only odd numbers are valid is represented using the notation (gggg-o-gggg,eeee).
	# A range can represent both even and odd numbers using the notation (gggg-u-gggg,eeee).
	# The element part of the tag can also be a range.
	#
	(0000,0000)
	(6000-60FF,0040)
	(0009-o-ffff,0010-u-00ff)
	(0001-o-0007,0010-u-00ff)
	'(0000-u-ffff,0000)' includesAny: #($- $o $u)
					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	| valueRange inputStream start middle end step |
	valueRange := OrderedCollection new.
	rangeToken
		includes: $-
		ifTrue: [ step := 2. inputStream := rangeToken readStream.
			start := inputStream upTo: $-.
			rangeToken includesAny: #($o $u) ifTrue: [ self halt. middle := inputStream upTo: $- ].
			
			end := inputStream upToEnd.
			start := Integer readFrom: start base: 16.
			end := Integer readFrom: end base: 16.
			start to: end by: step to: [ :index | valueRange add: index ] ].
	^ valueRange
]

{ #category : #accessing }
DataElementTag >> elementNumber [
	"^ tag bitAnd: 16rFFFF"

	^ elementNumber
]

{ #category : #accessing }
DataElementTag >> elementNumber: anInteger [
	elementNumber := anInteger.
	tag := (tag bitAnd: 16rFFFF0000) bitXor: (anInteger bitAnd: 16rFFFF)
]

{ #category : #'instance creation' }
DataElementTag >> fromArray: aTagGroupElementValueArray [

	self groupNumber: (aTagGroupElementValueArray at: 1)	.
	self elementNumber: (aTagGroupElementValueArray at: 2)
]

{ #category : #'instance creation' }
DataElementTag >> fromDictionary: aDictionary [
	self groupNumber: (aDictionary at: #groupNumber).
	self elementNumber: (aDictionary at: #elementNumber)
]

{ #category : #'instance creation' }
DataElementTag >> fromToken: token [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit. Comment from header of dicom.dic file:
	
	# (...) The tag values (gggg,eeee) must be in hexedecimal and must be 
	# surrounded by parentheses.  Repeating groups are represented by indicating
	# the range (gggg-gggg,eeee).  By default the repeating notation only represents
	# even numbers.  A range where only odd numbers are valid is represented using
	# the notation (gggg-o-gggg,eeee). A range can represent both even and odd numbers
	# using the notation (gggg-u-gggg,eeee).  The element part of the tag can also be
	# a range.
	#
	(0000,0000)
	(6000-60FF,0040)
	(0009-o-ffff,0010-u-00ff)
	(0001-o-0007,0010-u-00ff)
	'(0000-u-ffff,0000)' includesAny: #($- $o $u)
					
	Integer readFrom: 'ffff' base: 16
					
	PRD August 22, 2017"

	"Remove parenthesis"

	| tmpToken inputStream group element |
	tmpToken := token reject: [ :character | character = (Character value: 40) ].
	tmpToken := tmpToken reject: [ :character | character = (Character value: 41) ].
	inputStream := tmpToken readStream.
	group := inputStream upTo: $,.
	element := inputStream upToEnd.
	group := (group includesAny: #($- $o $u))
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ Integer readFrom: group base: 16 ].
	element := (element includesAny: #($- $o $u))
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ Integer readFrom: element base: 16 ].
	group inspect.
	element inspect
]

{ #category : #tags }
DataElementTag >> groupLengthTag [
	"Group Length Tag Number corresponding to self 

	PRD 03.2017"

	| dataElementTag |
	dataElementTag := self class new.
	dataElementTag tag: (self tag bitAnd: 16rFFFF0000).
	^ dataElementTag
]

{ #category : #accessing }
DataElementTag >> groupNumber [
	"^ (tag bitShift: -16) bitAnd: 16rFFFF"

	^ groupNumber
]

{ #category : #accessing }
DataElementTag >> groupNumber: anInteger [
	groupNumber := anInteger.
	tag := (tag bitAnd: 16r0000FFFF) bitXor: ((anInteger bitAnd: 16rFFFF) bitShift: 16)
]

{ #category : #comparing }
DataElementTag >> hash [
	^ tag
]

{ #category : #'initailize-release' }
DataElementTag >> initialize [
	tag := 16r00000000
]

{ #category : #testing }
DataElementTag >> isGroupLengthDataElement [
	"Check if the tag is from a group length data element"

	^ self elementNumber = 16r0000
]

{ #category : #testing }
DataElementTag >> isItemDelimitationElementTag [
	"Am I an Item Delimitation Element Tag?"

	^ self tag = 16rFFFEE00D
]

{ #category : #testing }
DataElementTag >> isItemTag [
	"Am I an Item Tag?"

	^ self tag = 16rFFFEE000
]

{ #category : #testing }
DataElementTag >> isPixelData [
	"Am I a PixelData (0x7FE0 0x0010), DoubleFloatPixelData (0x7FE0 0x0009) or FloatPixelData (0x7FE0 0x0009)?"

	^ self tag = 16r7FE00010 | (self tag = 16r7FE00009) | (self tag = 16r7FE00008)
]

{ #category : #testing }
DataElementTag >> isPrivate [
	"Am I a Private Data Element Tag?"

	^ self groupNumber odd
]

{ #category : #testing }
DataElementTag >> isPrivateCreator [
	"Am I a Private Creator Data Element Tag?"

	^ self groupNumber >= 16r0009 & (self groupNumber <= 16rFFFF) & (self elementNumber >= 16r0010)
		& (self elementNumber <= 16r00FF)
]

{ #category : #testing }
DataElementTag >> isSequenceDelimitationElementTag [
	"Am I a Sequence Delimitation Element Tag?"

	^ self tag = 16rFFFEE0DD
]

{ #category : #printing }
DataElementTag >> printOn: aStream [
	aStream nextPut: $(.
	self groupNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream nextPutAll: ', '.
	self elementNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream nextPut: $)
]

{ #category : #printing }
DataElementTag >> printOnWithDoisPontos: aStream [
	aStream nextPut: $(.
	self groupNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream nextPutAll: ':'.
	self elementNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream nextPut: $)
]

{ #category : #accessing }
DataElementTag >> tag [

	^ tag
]

{ #category : #accessing }
DataElementTag >> tag: anInteger [
	tag := anInteger bitAnd: 16rFFFFFFFF.
	groupNumber := (tag bitShift: -16) bitAnd: 16rFFFF.
	elementNumber := tag bitAnd: 16rFFFF
]
