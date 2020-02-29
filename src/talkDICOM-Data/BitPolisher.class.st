Class {
	#name : #BitPolisher,
	#superclass : #Object,
	#category : #'talkDICOM-Data'
}

{ #category : #'byte handling - integer' }
BitPolisher class >> byteCollectionFromValue: aValue [
	"Splits a Value into it's binary representation (in byte = base 256).
	PRD 02.2001"

	| anOrderedCollection value rem quo |
	anOrderedCollection := OrderedCollection new.
	value := aValue.
	[value > 255] whileTrue: 
			["rem := value  - ((value quo: 256) * 256)"
			quo := value quo: 256.
			rem := value - (quo * 256).
			value := quo asInteger.

			"rem := value rem: 256.
		value := (value quo: 256) asInteger."
			anOrderedCollection add: rem].
	anOrderedCollection add: value.
	^anOrderedCollection
]

{ #category : #'byte handling - integer' }
BitPolisher class >> get16BitSignedValueFromByteStream: aStream [
	| result |
	result := self get16BitUnsignedValueFromByteStream: aStream.
	^ (result bitXor: 32768) - 32768
]

{ #category : #'byte handling - integer' }
BitPolisher class >> get32BitSignedValueFromByteStream: aStream [
	| result |
	result := self get32BitUnsignedValueFromByteStream: aStream.
	^ (result bitXor: 2147483648) - 2147483648
]

{ #category : #'byte handling - integer' }
BitPolisher class >> get64BitSignedValueFromByteStream: aStream [
	| result |
	result := self get64BitUnsignedValueFromByteStream: aStream.
	^ (result bitXor: 9223372036854775808) - 9223372036854775808
]

{ #category : #'byte handling - integer' }
BitPolisher class >> get8BitSignedValueFromByteStream: aStream [
	^ ((self get8BitUnsignedValueFromByteStream: aStream) bitXor: 128) - 128
]

{ #category : #'byte handling - integer' }
BitPolisher class >> get8BitUnsignedValueFromByteStream: aStream [
	^ aStream next
]

{ #category : #'byte handling - integer' }
BitPolisher class >> getSignedValueFromByteArray: byteArray [
	| value operand |
	value := self getValueFromByteArray: byteArray.
	operand := 1 bitShift: 8 * byteArray size - 1.
	^ (value bitXor: operand) - operand
]

{ #category : #'byte handling - integer' }
BitPolisher class >> getSignedValueFromByteArray: byteArray start: start stop: stop [
	| result subByteArray |
	subByteArray := byteArray copyFrom: start to: stop.
	result := self getSignedValueFromByteArray: subByteArray.
	^ result
]

{ #category : #'byte handling - integer' }
BitPolisher class >> getSignedValueFromByteStream: aStream bytes: byteNumber [
	| result byteArray |
	byteArray := aStream next: byteNumber.
	result := self getSignedValueFromByteArray: byteArray.
	^ result
]

{ #category : #'byte handling - integer' }
BitPolisher class >> getValueFromByteArray: byteArray start: start stop: stop [
	| subByteArray result |
	subByteArray := byteArray copyFrom: start to: stop.
	result := self getValueFromByteArray: subByteArray.
	^ result
]

{ #category : #'byte handling - integer' }
BitPolisher class >> getValueFromByteStream: aStream bytes: byteNumber [
	| result byteArray |
	byteArray := aStream next: byteNumber.
	result := self getValueFromByteArray: byteArray.
	^ result
]
