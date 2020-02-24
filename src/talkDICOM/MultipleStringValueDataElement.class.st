Class {
	#name : #MultipleStringValueDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'as yet unclassified' }
MultipleStringValueDataElement >> bsonTypeCode [
	"BSON type 2 = String; 4 = Array"

	| value bsonType |

	bsonType := 6. "Default is nil"

	value := self bsonValue.

	(value isKindOf: Array) ifTrue: [bsonType := 4].
	(value isKindOf: String) ifTrue: [bsonType := 2].

	"^(self value isKindOf: OrderedCollection)
		ifTrue: [4]
		ifFalse: [2]"

	^bsonType
]

{ #category : #'as yet unclassified' }
MultipleStringValueDataElement >> bsonValue [
	
	^self encoder 
		bsonRepresentationFromMultipleStringValueDataElement: self
]

{ #category : #'as yet unclassified' }
MultipleStringValueDataElement >> dataElementValueFrom: bsonMultipleStringDataElementValue [

	^self encoder 
		multipleStringDicomDataElementValueFrom: bsonMultipleStringDataElementValue
]

{ #category : #printing }
MultipleStringValueDataElement >> printValueOn: aStream [
	"Print the Dicom Data Element Value to 'aStream'.
	PRD January 10th, 2003 - August 20th, 2015, August 29th, 2017"

	| valueCollection |
	(valueCollection := self dataBytesStringSpliter) size >= 1
		ifTrue: [ aStream nextPutAll: valueCollection first.
			2 to: valueCollection size do: [ :index | 
				aStream
					nextPutAll: ' // ';
					nextPutAll: (valueCollection at: index) ] ]
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
