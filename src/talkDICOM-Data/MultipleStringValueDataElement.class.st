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

{ #category : #accessing }
MultipleStringValueDataElement >> dataElementLength [
	"Lenght of the message field in bytes (see subclass implementations)

	 13 May 2021: New implementation - PRD"

	^ self subclassResponsibility
]

{ #category : #parsing }
MultipleStringValueDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxEncoder [
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
	"Print the value that I store to aStream.
	
	 20 August 2015: Initial implementation;
	 29 August 2017: Improvements in the output formatting;
	  06 April 2021: Replace test 'size >= 1' with 'isEmpty';
	   06 June 2021: New implementation - Paulo R. Dellani"

	self dataBytesStringSpliter
		ifNotEmpty: [ :arg | 
			aStream nextPutAll: arg first.
			2 to: arg size do: [ :index | 
				aStream
					nextPutAll: ' // ';
					nextPutAll: (arg at: index) ] ]
		ifEmpty: [ aStream nextPutAll: '#EMPTYVALUE' ]
]

{ #category : #'field value storing' }
MultipleStringValueDataElement >> validateValue: aValue [
	"Validate 'aValue' according to the rules for my DICOM Data Element subclasses.
    See subclasses implementations for details.

	 06 June 2021: New implementation - Paulo R. Dellani"

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
