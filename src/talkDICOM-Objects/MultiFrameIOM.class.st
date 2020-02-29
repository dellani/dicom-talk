Class {
	#name : #MultiFrameIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
MultiFrameIOM class >> initialize [
	self resetDataElements.
	Name := 'Multi Frame IOM'.
	moduleName := 'multiFrameIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(ISDataElement
				newWith: #numberOfFrames
				tag: #(16r28 16r8)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ATDataElement
				newWith: #frameIncrementPointer
				tag: #(16r28 16r9)
				vm: '1-n'
				type: '1')
]

{ #category : #accessing }
MultiFrameIOM >> frameIncrementPointer [

	^self dataElementsValues at: 'frameIncrementPointer' ifAbsent: [
		self dataElementsDictionary at: 'frameIncrementPointer' ifPresent: [:dataElement |
			self dataElementsValues at: 'frameIncrementPointer' put: (self dataElementsDictionary removeKey: 'frameIncrementPointer') value.
		]
	]

]

{ #category : #accessing }
MultiFrameIOM >> frameIncrementPointer: aATValue [

	| dataElement |

	(self dataElementsDictionary at: 'frameIncrementPointer' ifPresent: [:aDataElement | aDataElement value: aATValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #frameIncrementPointer.
			dataElement encoder: self encoder.
			dataElement value: aATValue.
			self dataElementsDictionary at: 'frameIncrementPointer' put: dataElement.
			self dataElementsValues removeKey: 'frameIncrementPointer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'frameIncrementPointer' put: aATValue
		]
	].

]

{ #category : #accessing }
MultiFrameIOM >> numberOfFrames [

	^self dataElementsValues at: 'numberOfFrames' ifAbsent: [
		self dataElementsDictionary at: 'numberOfFrames' ifPresent: [:dataElement |
			self dataElementsValues at: 'numberOfFrames' put: (self dataElementsDictionary removeKey: 'numberOfFrames') value.
		]
	]

]

{ #category : #accessing }
MultiFrameIOM >> numberOfFrames: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'numberOfFrames' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #numberOfFrames.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'numberOfFrames' put: dataElement.
			self dataElementsValues removeKey: 'numberOfFrames' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'numberOfFrames' put: aISValue
		]
	].

]
