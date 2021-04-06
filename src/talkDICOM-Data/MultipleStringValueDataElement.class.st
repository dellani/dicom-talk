Class {
	#name : #MultipleStringValueDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #accessing }
MultipleStringValueDataElement class >> valueRepresentationString [
	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
MultipleStringValueDataElement >> byteSize [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
MultipleStringValueDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [

	^self subclassResponsibility
]

{ #category : #'field value retrieving' }
MultipleStringValueDataElement >> dataBytesByteSpliter: byteValueSize [
	^ self subclassResponsibility
]

{ #category : #accessing }
MultipleStringValueDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self subclassResponsibility
]

{ #category : #'field bytes' }
MultipleStringValueDataElement >> pdvBytes: aByteStream [
	"Put the byte-coding of this DICOM Data Element in to a ByteStream

	PRD - February 07th, 2003"

	^ self subclassResponsibility
]

{ #category : #printing }
MultipleStringValueDataElement >> printValueOn: aStream [
	"August 20, 2015: Print the string or collection of strings that I store to aStream;
	 August 29, 2017: Output improvements;
	 April 6, 2021: Replace test 'size >= 1' with 'isEmpty' - PRD"

	| valueCollection |
	(valueCollection := self dataBytesStringSpliter) notEmpty
		ifTrue: [ aStream nextPutAll: valueCollection first.
			2 to: valueCollection size do: [ :index | 
				aStream
					nextPutAll: ' // ';
					nextPutAll: (valueCollection at: index) ] ]
		ifFalse: [ '#EMPTYVALUE' ]
]

{ #category : #'field value storing' }
MultipleStringValueDataElement >> validateValue: aValue [
	"Perform the validation of the value to be stored in a DICOM Data Element

	PRD 04.2001 - 06.2002"

	^ self subclassResponsibility
]

{ #category : #'field value retrieving' }
MultipleStringValueDataElement >> value [
	"VR = Code String.
	
	PRD 04.2001 - 01.2002"

	| anOrderedCollection |

	^(anOrderedCollection := self dataBytesStringSpliter) size = 1 
		ifTrue: [anOrderedCollection at: 1]
		ifFalse: [anOrderedCollection].
]

{ #category : #'field value storing' }
MultipleStringValueDataElement >> value: aValue [
	"Calculate the bytes corresponding to aValue for a message field value representation from the 'Smalltalk representation'

	PRD 05.2001"

	self subclassResponsibility
]
