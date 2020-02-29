Class {
	#name : #LittleEndianBitPolisher,
	#superclass : #BitPolisher,
	#category : #'talkDICOM-Data'
}

{ #category : #'byte handling - integer' }
LittleEndianBitPolisher class >> byteArrayFromValue: aValue size: nBytes [

	| byteArray anOrderedCollection collectionSize |

	byteArray := ByteArray new: nBytes.
	anOrderedCollection := self byteCollectionFromValue: aValue.
	collectionSize := anOrderedCollection size.
	(nBytes <= collectionSize) ifTrue: [
		1 to: nBytes do: [ :index |
			byteArray  at: index 
						put: (anOrderedCollection at: index ).
		].
	]
	ifFalse: [
		1 to: collectionSize do: [ :index |
			byteArray  at: index 
						put: (anOrderedCollection at: index).
		].
		collectionSize + 1 to: nBytes do: [ :index |
			byteArray at: index put: 0.
		].
	].
	^byteArray.
]

{ #category : #'byte handling - floating point' }
LittleEndianBitPolisher class >> bytesToDoublePrecisionFloat: byteArray [
	| floatValue doubleWord |
	doubleWord := self
		getValueFromByteArray:
			(EndianDetector isLittleEndian 
				ifTrue: [ byteArray ]
				ifFalse: [ byteArray reverse ]).
	floatValue := Float fromIEEE64Bit: doubleWord.
	^ floatValue

	"Float fromIEEE64Bit: doubleWord

	floatValue basicAt: 1 put: aStream nextUInt32.  ]"

	"readDoubleFrom: aStream
	| result |
	result := Float new: 2.
	result basicAt: 2 put: aStream nextUInt32.
	result basicAt: 1 put: aStream nextUInt32.
	^result"

	"| writer lowWord highWord |
	writer := LittleEndianStream on: (ByteArray new: 8) writeStream.
	lowWord := aFloat basicAt: 2.
	writer nextInt32Put: lowWord.
	highWord := aFloat basicAt: 1.
	writer nextInt32Put: highWord.
	^writer contents"

	"aByteArray size <= (start + Float basicNew basicSize) ifTrue: [
		aFloat := Float basicNew.
		1 to: aFloat basicSize do: [:index |
			aFloat basicAt: index put: (aByteArray at: start + index - 1)].
		EndianDetector isBigEndian ifTrue: [aFloat reverseByteOrder].
	].
	^aFloat"
]

{ #category : #'byte handling - floating point' }
LittleEndianBitPolisher class >> bytesToSinglePrecisionFloat: byteArray [
	| floatValue doubleWord |
	doubleWord := self
		getValueFromByteArray:
			(EndianDetector isLittleEndian 
				ifTrue: [ byteArray ]
				ifFalse: [ byteArray reverse ]).
	floatValue := Float fromIEEE32Bit: doubleWord.
	^ floatValue

	"Float fromIEEE64Bit: doubleWord

	floatValue basicAt: 1 put: aStream nextUInt32.  ]"

	"readDoubleFrom: aStream
	| result |
	result := Float new: 2.
	result basicAt: 2 put: aStream nextUInt32.
	result basicAt: 1 put: aStream nextUInt32.
	^result"

	"| writer lowWord highWord |
	writer := LittleEndianStream on: (ByteArray new: 8) writeStream.
	lowWord := aFloat basicAt: 2.
	writer nextInt32Put: lowWord.
	highWord := aFloat basicAt: 1.
	writer nextInt32Put: highWord.
	^writer contents"

	"aByteArray size <= (start + Float basicNew basicSize) ifTrue: [
		aFloat := Float basicNew.
		1 to: aFloat basicSize do: [:index |
			aFloat basicAt: index put: (aByteArray at: start + index - 1)].
		EndianDetector isBigEndian ifTrue: [aFloat reverseByteOrder].
	].
	^aFloat"
]

{ #category : #'byte handling - floating point' }
LittleEndianBitPolisher class >> doublePrecisionFloatToBytes: floatValue [
	| lowWord highWord lowWordBytes highWordBytes byteArray |
	lowWord := floatValue basicAt: 2.
	highWord := floatValue basicAt: 1.
	lowWordBytes := self byteArrayFromValue: lowWord size: 4.
	highWordBytes := self byteArrayFromValue: highWord size: 4.
	byteArray := EndianDetector isLittleEndian
		ifTrue: [ lowWordBytes , highWordBytes ]
		ifFalse: [ lowWordBytes reverse , highWordBytes reverse ].
	^ byteArray

	"fromIEEE64Bit: doubleWord

    ^ (self new: 2) basicAt: 1 put: (doubleWord bitShift: -32); basicAt: 2 put: (doubleWord bitAnd: 16rFFFFFFFF); yourself"

	"| writer lowWord highWord |
	writer := LittleEndianStream on: (ByteArray new: 8) writeStream.
	lowWord := aFloat basicAt: 2.
	writer nextInt32Put: lowWord.
	highWord := aFloat basicAt: 1.
	writer nextInt32Put: highWord.
	^writer contents"
]

{ #category : #'byte handling - integer' }
LittleEndianBitPolisher class >> get16BitUnsignedValueFromByteStream: aStream [
	^ aStream next + (aStream next bitShift: 8)
]

{ #category : #'byte handling - integer' }
LittleEndianBitPolisher class >> get32BitUnsignedValueFromByteStream: readStream [
	| byteArray |
	byteArray := readStream next: 4.
	^ (byteArray at: 1) + ((byteArray at: 2) bitShift: 8) + ((byteArray at: 3) bitShift: 16)
		+ ((byteArray at: 4) bitShift: 24)

	"^aStream next + (aStream next bitShift: 8) + (aStream next bitShift: 16) + (aStream next bitShift: 24)."
]

{ #category : #'byte handling - integer' }
LittleEndianBitPolisher class >> get64BitUnsignedValueFromByteStream: aStream [
	^ aStream next +
		(aStream next bitShift: 8) +
		(aStream next bitShift: 16) +
		(aStream next bitShift: 24) +
		(aStream next bitShift: 32) +
		(aStream next bitShift: 40) +
		(aStream next bitShift: 48) +
		(aStream next bitShift: 56)
]

{ #category : #'byte handling - integer' }
LittleEndianBitPolisher class >> getValueFromByteArray: anByteArray [
	| result index |
	result := 0.
	index := 0.
	anByteArray
		do: [ :each | 
			result := result + (each bitShift: 8 * index).
			index := index + 1 ].
	^ result
]

{ #category : #'byte handling - floating point' }
LittleEndianBitPolisher class >> singlePrecisionFloatToBytes: floatValue [
	| word byteArray |
	word := floatValue asIEEE32BitWord.
	byteArray := self byteArrayFromValue: word size: 4.
	byteArray := EndianDetector isLittleEndian
		ifTrue: [ byteArray ]
		ifFalse: [ byteArray reverse ].
	^ byteArray

	"doubleWord := self
		getValueFromByteArray:
			(EndianDetector isBigEndian
				ifTrue: [ byteArray ]
				ifFalse: [ byteArray reverse ]).
	floatValue := Float fromIEEE32Bit: doubleWord.
	^ floatValue"


	"| writer lowWord highWord |
	writer := LittleEndianStream on: (ByteArray new: 8) writeStream.
	lowWord := aFloat basicAt: 2.
	writer nextInt32Put: lowWord.
	highWord := aFloat basicAt: 1.
	writer nextInt32Put: highWord.
	^writer contents"
]
