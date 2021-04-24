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

{ #category : #'instance creation - private' }
DataElementTag class >> decodeRange: rangeToken [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	 of OFFIS DICOM ToolKit representing a range.

	 August 22 2017: First implementation;
	  April 08 2021: Modified the parser in order to interpret the meaning of 
	                 the 'o' or 'u' range modifiers - PRD
	
	 Comment from header of dicom.dic file:
	
	 # Repeating groups are represented by indicating the range (gggg-gggg,eeee).
	 # By default the repeating notation only represents even numbers.  A range 
	 # where only odd numbers are valid is represented using the notation (gggg-o-gggg,eeee).
	 # A range can represent both even and odd numbers using the notation (gggg-u-gggg,eeee).
	 # The element part of the tag can also be a range.
	 #
	 (0000,0000)
	 (6000-60FF,0040)
	 (0009-o-ffff,0010-u-00ff)
	 (0001-o-0007,0010-u-00ff)"

	| valueRange inputStream start middle end step |
	
	valueRange := OrderedCollection new.
	(rangeToken includes: $-)
		ifTrue: [ step := 2.
			inputStream := rangeToken readStream.
			start := inputStream upTo: $-.
			(rangeToken includesAny: #($o $u))
				ifTrue: [ middle := inputStream upTo: $-.
					(middle includes: $u) "range does not include only odd or even numbers"
						ifTrue: [ step := 1 ] ].
			end := inputStream upToEnd.
			start := Integer readFrom: start base: 16.
			end := Integer readFrom: end base: 16.
			start to: end by: step do: [ :index | valueRange add: index ] ].
	^ valueRange
]

{ #category : #examples }
DataElementTag class >> example01 [
	(self fromToken: '(0000,0000)') inspect
]

{ #category : #examples }
DataElementTag class >> example02 [
	(self fromToken: '(6000-60FF,0040)') inspect
]

{ #category : #examples }
DataElementTag class >> example03 [
	(self fromToken: '(0001-o-0007,0010-u-00ff)') inspect
]

{ #category : #examples }
DataElementTag class >> example04 [
	(self fromToken: '(0009-o-ffff,0010-u-00ff)') inspect
]

{ #category : #examples }
DataElementTag class >> example05 [
	(self fromTextualDefinition: '0000	0000') inspect
]

{ #category : #examples }
DataElementTag class >> example06 [
	(self fromTextualDefinition: '6000-60FF	0040') inspect
]

{ #category : #examples }
DataElementTag class >> example07 [
	(self fromTextualDefinition: '0001-o-0007	0010-u-00ff') inspect
]

{ #category : #examples }
DataElementTag class >> example08 [
	(self fromTextualDefinition: '0009-o-ffff	0010-u-00ff') inspect
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
DataElementTag class >> fromTextualDefinition: token [
	"Create one or more instances of myself according to the textual definition
	 stored in 'token'
					
	 April 20 2021 - PRD"

	| tagCollection |

	"If the token defines a range of group and/or element numbers, this creates an
	 instance of myself for every group and element number defined by the range."
	tagCollection := self parseToken: token.
	^ tagCollection
		collect: [ :array | self fromArray: array ]
		as: OrderedCollection
]

{ #category : #'instance creation' }
DataElementTag class >> fromToken: token [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	of OFFIS DICOM ToolKit. 
					
	August 22 2017: Initial implementation;
	 April 08 2021: Token parsing code moved to method parseOFFISToken: - PRD"

	| tagCollection |

	"If the token defines a range of group or element numbers, this creates an
	 instance of myself for every group and element number defined by the range."
	tagCollection := self parseOFFISToken: token.
	^ tagCollection
		collect: [ :array | self fromArray: array ]
		as: OrderedCollection
]

{ #category : #'instance creation' }
DataElementTag class >> new [
	^ super new initialize
]

{ #category : #'instance creation - private' }
DataElementTag class >> parseOFFISToken: token [
	"Parse tag values from an entry in the dicom.dic file from the dcmdata module
	 of OFFIS DICOM ToolKit.
	
	 August 22 2017: Initial implementation;
	  April 08 2021: Refactored fromToken: method into parseOFFISToken: fixed
	                 a bug decoding the element number range - PRD.
	
	 Comment from header of dicom.dic file:
	
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
	 (0001-o-0007,0010-u-00ff)"

	| tmpToken inputStream group element tagCollection |

	"Remove Parentheses"
	tmpToken := token
		reject: [ :character | character = (Character value: 40) ].
	tmpToken := tmpToken
		reject: [ :character | character = (Character value: 41) ].

	"Do the actual parsing"
	inputStream := tmpToken readStream.
	group := inputStream upTo: $,.
	element := inputStream upToEnd.
	group := (group includesAny: #($- $o $u))
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: group base: 16) ].
	element := (element includesAny: #($- $o $u))
		ifTrue: [ self decodeRange: element ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: element base: 16) ].

	tagCollection := OrderedCollection new.
	group do: [ :x |
			element do: [ :y | tagCollection add: (Array with: x with: y) ] ].

	^ tagCollection
]

{ #category : #'instance creation - private' }
DataElementTag class >> parseToken: token [
	"Create an instance of and initialize myself eafter parsing the DICOM data
	 element tag textual representation stored in the token. 
	
	 The tag values folow the format 'GGGG <tab> EEEE'. GGGG and EEEE are hexadecimal
	 number as conventionally used in the DICOM standard. The notation to represent
	 repeating ranges of groups and elements values is compatible to the one used in 
	 the data dictionary of the OFFIS toolkit: 'NNNN-nnnn' is interpreted as a sequence
	 of repeating even values in the range from 'NNNN' to 'nnnn'.
	
	 A sequence of odd numbers is represented as 'NNNN-o-nnnn'. The representation of
	 a sequence of odd and even numbers uses the notation 'NNNN-u-nnnn'. Here are some
	 examples:
	
	 0010<tab>0010
	 8000-8080<tab>0080
	 0011-o-FFFF<tab>0000-u-00FF
	 0005-o-0009<tab>0020-u-0030
	
	 April 20 2021 - PRD"

	| inputStream group element tagCollection |

	inputStream := token readStream.
	group := inputStream upTo: Character tab.
	element := inputStream upToEnd.

	group := (group includesAny: '-ou')
		ifTrue: [ self decodeRange: group ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: group base: 16) ].

	element := (element includesAny: '-ou')
		ifTrue: [ self decodeRange: element ]
		ifFalse: [ OrderedCollection with: (Integer readFrom: element base: 16) ].

	tagCollection := OrderedCollection new.
	group do: [ :x |
			element do: [ :y | tagCollection add: (Array with: x with: y) ] ].

	^ tagCollection
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

{ #category : #printing }
DataElementTag >> csvPrintOn: aStream separator: aCharacter [
	self groupNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true.
	aStream nextPut: aCharacter.
	self elementNumber
		printOn: aStream
		base: 16
		length: 4
		padded: true
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
