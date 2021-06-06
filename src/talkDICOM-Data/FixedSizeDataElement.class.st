Class {
	#name : #FixedSizeDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #accessing }
FixedSizeDataElement class >> valueRepresentationString [
	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> byteSize [
	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> dataBytesByteSpliter [
	"If value multiplicity (vm) is equal or larger than one, split 
	 multiple values into vm byte representations of a single value 
	 and store them in an instance of OrderedCollection.
	
	 06 June 2021: New implementation - Paulo R. Dellani"

	^ self dataBytesByteSpliter: self byteSize
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> dataBytesByteSpliter: byteValueSize [
	"If value multiplicity (vm) is equal or larger than one, split 
	 multiple values into vm byte representations of a single value 
	 and store them in an instance of OrderedCollection.
	
	 06 June 2021: New implementation - Paulo R. Dellani"

	| collection |
	collection := OrderedCollection new.
	self dataBytes
		groupsOf: byteValueSize
		atATimeCollect: [ :x | collection add: x ].
	^ collection
]

{ #category : #accessing }
FixedSizeDataElement >> dataElementLength [
	"Lenght of the message field in bytes (see subclass implementations)

	 13 May 2021: New implementation - PRD"

	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> decodeElementDataBytes: valueDataBytes [
	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> decodeValue [
	"Decode value from DICOM data element with fixed size - PRD 04.2001
	
	Refactoring - PRD June 28, 2017, August 29, 2017"

	^ self dataBytesByteSpliter collect: [ :item | self decodeElementDataBytes: item ]
]

{ #category : #parsing }
FixedSizeDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	^ self subclassResponsibility
]

{ #category : #'field bytes' }
FixedSizeDataElement >> pdvBytes: aByteStream [
	"Put the byte-coding of this DICOM Data Element in to a ByteStream

	PRD - February 07th, 2003"

	^ self subclassResponsibility
]

{ #category : #printing }
FixedSizeDataElement >> printValueOn: aStream [
	"Print the value that I store to aStream.
	
	 20 August 2015: Initial implementation;
	 29 August 2017: Improvements in the output formatting;
	   06 June 2021: New implementation - Paulo R. Dellani"

	self decodeValue
		ifNotEmpty: [ :arg | 
			aStream nextPutAll: arg first printString.
			2 to: arg size do: [ :index | 
				aStream nextPutAll: ' \\ '.
				aStream nextPutAll: (arg at: index) printString ] ]
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> raiseElementSizeError [
	| errorMessage |

	errorMessage	 := String new: 10 streamContents: [ :writeStream |
		writeStream 
			nextPutAll: 'Fixed size, type ';
			nextPutAll: self type;
			nextPutAll: ' data element ''';
			nextPutAll: (self name notNil ifTrue: [self name] ifFalse: ['unknown']), ''' ';
			nextPutAll: self tag printString;
			nextPutAll: ' has less data bytes than its single value byte size. It will not be decoded'.
	].

	^self type ~= '3' ifTrue: [
		DataElementEncodingError signalWithDataElement: self message: errorMessage]
	ifFalse: [
		Transcript show: errorMessage contents; cr.
		nil	]
]

{ #category : #'field value storing' }
FixedSizeDataElement >> validateValue: aValue [
	"Validate 'aValue' according to the rules for my DICOM Data Element subclasses.
    See subclasses implementations for details.

	 06 June 2021: New implementation - Paulo R. Dellani"

	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> value [
	"Decode value from DICOM data element with fixed length.
	
	 28 June 2017: Refactoring - Paulo R. Dellani"

	| orderedCollection |
	^ self dataBytes notEmpty
		ifTrue: [
			"Transcript show: self name printString, ', data bytes size = ', self dataBytes size printString."
			self dataBytes size >= self byteSize
				ifTrue: [ orderedCollection := self decodeValue.
					orderedCollection size = 1
						ifTrue: [ orderedCollection at: 1 ]
						ifFalse: [ orderedCollection ] ]
				ifFalse: [ self type = '3'
						ifTrue: [ nil ]
						ifFalse: [ self raiseElementSizeError ] ] ]
		ifFalse: [ nil ]
]

{ #category : #'field value storing' }
FixedSizeDataElement >> value: aValue [
	"Calculate the bytes corresponding to aValue for a message field value representation from the 'Smalltalk representation'

	PRD 05.2001"

	self subclassResponsibility
]
