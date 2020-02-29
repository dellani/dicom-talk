Class {
	#name : #BigEndianBitPolisher,
	#superclass : #BitPolisher,
	#category : #'talkDICOM-Data'
}

{ #category : #'byte handling - integer' }
BigEndianBitPolisher class >> byteArrayFromValue: aValue size: nBytes [

	| byteArray anOrderedCollection collectionSize |

	byteArray := ByteArray new: nBytes.
	anOrderedCollection := self byteCollectionFromValue: aValue.
	collectionSize := anOrderedCollection size.
	(nBytes < collectionSize) ifTrue: [
		0 to: nBytes -1  do: [ :index |
			byteArray  at: nBytes - index 
						put: (anOrderedCollection at: index + 1).
		].
	]
	ifFalse: [
		0 to: collectionSize -1  do: [ :index |
			byteArray  at: nBytes - index 
						put: (anOrderedCollection at: index + 1).
		].
		collectionSize to: nBytes -1 do: [ :index |
			byteArray  at: nBytes - index put: 0.
		].
	].
	^byteArray.
]

{ #category : #'byte handling - floating point' }
BigEndianBitPolisher class >> bytesToDoublePrecisionFloat: byteArray [
	| floatValue doubleWord |
	doubleWord := self
		getValueFromByteArray:
			(EndianDetector isBigEndian
				ifTrue: [ byteArray ]
				ifFalse: [ byteArray reverse ]).
	floatValue := Float fromIEEE64Bit: doubleWord.
	^ floatValue
]

{ #category : #'byte handling - floating point' }
BigEndianBitPolisher class >> bytesToSinglePrecisionFloat: byteArray [
	| floatValue doubleWord |
	doubleWord := self
		getValueFromByteArray:
			(EndianDetector isBigEndian
				ifTrue: [ byteArray ]
				ifFalse: [ byteArray reverse ]).
	floatValue := Float fromIEEE32Bit: doubleWord.
	^ floatValue
]

{ #category : #'byte handling - floating point' }
BigEndianBitPolisher class >> doublePrecisionFloatToBytes: floatValue [
	| lowWord highWord lowWordBytes highWordBytes byteArray |
		
	lowWord := floatValue basicAt: 2.
	highWord := floatValue basicAt: 1.
	
	lowWordBytes := self byteArrayFromValue: lowWord size: 4.
	highWordBytes := self byteArrayFromValue: highWord size: 4.
	
	byteArray := (EndianDetector isBigEndian 
		ifTrue: [ lowWordBytes , highWordBytes ]
		ifFalse: [ lowWordBytes reverse , highWordBytes reverse ]).

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
BigEndianBitPolisher class >> get16BitUnsignedValueFromByteStream: aStream [
	^ (aStream next bitShift: 8) + aStream next
]

{ #category : #'byte handling - integer' }
BigEndianBitPolisher class >> get32BitUnsignedValueFromByteStream: aStream [
	^ (aStream next bitShift: 24) + (aStream next bitShift: 16) + (aStream next bitShift: 8) + aStream next
]

{ #category : #'byte handling - integer' }
BigEndianBitPolisher class >> get64BitUnsignedValueFromByteStream: aStream [
	^ (aStream next bitShift: 56) +
		(aStream next bitShift: 48) +
		(aStream next bitShift: 40) +
		(aStream next bitShift: 32) +
		(aStream next bitShift: 24) +
		(aStream next bitShift: 16) +
		(aStream next bitShift: 8) +
		aStream next.
]

{ #category : #'byte handling - integer' }
BigEndianBitPolisher class >> getValueFromByteArray: aByteArray [
	| result index |
	result := 0.
	index := aByteArray size.
	aByteArray
		do: [ :each | 
			index := index - 1.
			result := result + (each bitShift: 8 * index) ].
	^ result
]

{ #category : #'byte handling - floating point' }
BigEndianBitPolisher class >> singlePrecisionFloatToBytes: floatValue [
	| word byteArray |
	word := floatValue asIEEE32BitWord.
	byteArray := self byteArrayFromValue: word size: 4.
	byteArray := EndianDetector isBigEndian
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
