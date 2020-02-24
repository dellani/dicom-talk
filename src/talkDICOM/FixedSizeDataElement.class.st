Class {
	#name : #FixedSizeDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation' }
FixedSizeDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				fixedSizeDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> dataBytesByteSpliter [
	"Split the DICOM multi-byte values (for VM > 1) that are coded in dataBytes 
	instance variable into an OrderedCollection and then answer the 
	OrderedCollection with the splited strings 
	'byteValueSize' contains the size of an individual multi-byte value - PRD 06-07.2002"

	^self dataBytesByteSpliter: self byteSize
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> dataBytesByteSpliter: byteValueSize [
	"Split the DICOM multi-byte values (for VM > 1) that are coded in dataBytes 
	instance variable into an OrderedCollection and then answer the 
	OrderedCollection with the splited strings 
	'byteValueSize' contains the size of an individual multi-byte value - PRD 06-07.2002"

	| anOrderedCollection |
	anOrderedCollection := OrderedCollection new.
	1 to: self dataBytes size
				by: byteValueSize
				do: 
					[:index |
					anOrderedCollection
						add: (self dataBytes copyFrom: index to: index + byteValueSize - 1)].
	^anOrderedCollection
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> decodeElementDataBytes: valueDataBytes [

	^self subclassResponsibility
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> decodeValue [
	"Decode value from DICOM data element with fixed size - PRD 04.2001
	
	Refactoring - PRD June 28, 2017, August 29, 2017"

	^ self dataBytesByteSpliter collect: [ :item | self decodeElementDataBytes: item ]
]

{ #category : #printing }
FixedSizeDataElement >> printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream' 

	PRD January 10th, 2003 - August 20th, 2015, August 29, 2017"

	| valueCollection |
	self dataBytes notEmpty
		ifTrue: [ self dataBytes size >= self byteSize
				ifTrue: [ (valueCollection := self decodeValue) notEmpty
						ifTrue: [ aStream nextPutAll: valueCollection first printString.
							2 to: valueCollection size do: [ :index | 
								aStream nextPutAll: ' \\ '.
								aStream nextPutAll: (valueCollection at: index) printString ] ] ] ]
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> raiseElementSizeError [
	| errorMessage |
	errorMessage := WriteStream on: String new.
	errorMessage nextPutAll: 'Type ', self type, ' Data element ', (self name notNil ifTrue: [self name] ifFalse: ['unknown']), ' #['.
	self groupNumber notNil ifTrue: [self groupNumber printOn: errorMessage base: 16] ifFalse: [errorMessage nextPutAll: 'unknown'].
	errorMessage nextPutAll: ', '.
	self elementNumber notNil ifTrue: [self elementNumber printOn: errorMessage base: 16] ifFalse: [errorMessage nextPutAll: 'unknown'].
	errorMessage nextPutAll: '] has less data bytes then its element byte size and could not be decoded'.

	^self type ~= '3' ifTrue: [
		DataElementEncodingError signalWithDataElement: self.
		"Error raiseSignal: errorMessage contents"
	] ifFalse: [
		Transcript show: errorMessage contents; cr.
		nil
	].
]

{ #category : #'field value retrieving' }
FixedSizeDataElement >> value [
	"Decode value from DICOM data element with fixed size - PRD 04.2001
	
	Refactoring - PRD June 28, 2017"

	| orderedCollection |
	^ self dataBytes notEmpty
		ifTrue: [ self dataBytes size >= self byteSize
				ifTrue: [ orderedCollection := self decodeValue.
					orderedCollection size = 1
						ifTrue: [ orderedCollection at: 1 ]
						ifFalse: [ orderedCollection ] ]
				ifFalse: [ self type = '3'
						ifTrue: [ nil ]
						ifFalse: [ self raiseElementSizeError ] ] ]
		ifFalse: [ nil ]
]
