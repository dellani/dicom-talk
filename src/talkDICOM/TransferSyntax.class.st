Class {
	#name : #TransferSyntax,
	#superclass : #Object,
	#classInstVars : [
		'UID'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #accessing }
TransferSyntax class >> TransferSyntaxEncoderForUID: anUID [

	^DicomRegistry TransferSyntaxes at: anUID ifAbsent: [nil]
]

{ #category : #accessing }
TransferSyntax class >> UID [

	^UID.
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> _dicomSQDataElementValueFrom: bsonSQDataElementValue sequenceItemClass: sequenceItemClass [
	"Decode bsonSQDataElementValue to the Smalltalk 
	representation of the original DICOM value.
	
	PRD - March 07, 2016, February 23, 2017"

	| value sequenceItem |
	

	"In the case of an unknown SQ data element, 
	we have no information about the sequence item..."
	(bsonSQDataElementValue isKindOf: ByteArray) ifTrue: [
		value :=bsonSQDataElementValue
	].

	(bsonSQDataElementValue isKindOf: Array) ifTrue: [
		value := OrderedCollection new.
		bsonSQDataElementValue do: [:item |
			(item isKindOf: Dictionary) ifTrue: [
				sequenceItem := sequenceItemClass new.
				"aDictionary removeKey: '_id'."
				sequenceItem encoder: self.
				sequenceItem bsonDictionary: item.
				value add: sequenceItem.
			].
		].
	].
	^value
]

{ #category : #'class variables' }
TransferSyntax class >> bitpolisher [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromATDataElement: dicomDTDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016, August 29, 2017"

	| value |
	value := dicomDTDataElement value.
	^ (value isKindOf: DataElementTag) not
		ifTrue: [ Array withAll: value ]
		ifFalse: [ value asBSONObject ]
		
	"^ self bsonRepresentationSingleValueOrArray: value"
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromDADataElement: dicomDADataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomDADataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromDTDataElement: dicomDTDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	^dicomDTDataElement value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromFDDataElement: dicomFDDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomFDDataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromFLDataElement: dicomFLDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomFLDataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromLTDataElement: dicomLTDataElement [
	"Return the BSON representation for the given data element value.
	PRD - March 10, 2016
	
	Changed to return an instance of ByteArray insted of MongoBinary		
	PRD - February 23, 2017"

	^dicomLTDataElement dataBytes
	"^MongoBinary bytes: dicomLTDataElement dataBytes"
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromMultipleStringValueDataElement: multipleStringValueDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := multipleStringValueDataElement value.
	^ value isCollection & value isString not
		ifTrue: [ value collect: [ :item | item trimBoth ] as: Array ]
		ifFalse: [ value trimBoth ]

	"^ (value isKindOf: OrderedCollection)
		ifFalse: [ value trimBoth ]
		ifTrue: [ newArray := Array new: value size.
			1 to: value size do: [ :index | newArray at: index put: (value at: index) trimBoth ].
			newArray ]"
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromOBDataElement: dicomOBDataElement [
	"Return the BSON representation for the given data element value.
	PRD - March 10, 2016

	Changed to return an instance of ByteArray insted of MongoBinary		
	PRD - February 23, 2017"

	^ dicomOBDataElement dataBytes
	"^MongoBinary bytes: dicomOBDataElement value"
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromOWDataElement: dicomOWDataElement [
	"Return the BSON representation for the given data element value.
	PRD - March 10, 2016
	
	Changed to return an instance of ByteArray insted of MongoBinary		
	PRD - February 23, 2017"

	^ dicomOWDataElement value
	"^MongoBinary bytes: dicomOWDataElement value"
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromPNDataElement: dicomPNDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomPNDataElement value.
	^ (value isKindOf: PersonName) "isCollection & value isString" not
		ifTrue: [ Array withAll: value ]
		ifFalse: [ value asBSONObject ]	

	"answer := value.
	(value isKindOf: OrderedCollection) ifTrue: [
		newArray := Array new: value size.
		1 to: value size do: [:index | newArray at: index put: (value at: index)].
		answer := newArray.
	].
	(value isKindOf: PersonName) ifTrue: [
		answer := value asBSONObject
	].
	^answer"
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromSLDataElement: dicomSSDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomSSDataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromSQDataElement: dicomSQDataElement [
	"Return the BSON representation for the given data element value.
	PRD - March 10, 2016
	
	Changed to return an instance of ByteArray insted of MongoBinary		
	PRD - February 23, 2017"

	| value |
	value := dicomSQDataElement value.
	^ value isLiteral & value isCollection 
		ifTrue: [ dicomSQDataElement pdvBytes
			"Unknown SQ data elements have unknown 
		 sequence itens, so lets just store the data bytes of the element" ]
		ifFalse: [ value collect: [ :item | item dataElementsValuesDictionaryOhneGroupLengthDataElements ] as: Array
			"size := value size.
		array := Array new: size.
		1 to: size
			do: 
				[:index |
				array at: index
					put: (value at: size)
							dataElementsValuesDictionaryOhneGroupLengthDataElements].
		answer := array." ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromSSDataElement: dicomSSDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomSSDataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromTMDataElement: dicomTMDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomTMDataElement value.
	^ value isCollection
		ifTrue: [ value
				collect: [ :item | 
					DateAndTime
						year: 1970
						month: 1
						day: 1
						hour: item hour
						minute: item minute
						second: item second
						nanoSecond: item nanoSecond
						offset: 0 asDuration ]
				as: Array ]
		ifFalse: [ value isNotNil
				ifTrue: [ DateAndTime
						year: 1970
						month: 1
						day: 1
						hour: value hour
						minute: value minute
						second: value second
						nanoSecond: value nanoSecond
						offset: 0 asDuration ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromULDataElement: dicomULDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomULDataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromUNDataElement: dicomUNDataElement [
	"Return the BSON representation for the given data element value.
	PRD - March 10, 2016
	
	Changed to return an instance of ByteArray insted of MongoBinary		
	PRD - February 23, 2017"

	^ dicomUNDataElement dataBytes
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromUSDataElement: dicomUSDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016"

	| value |
	value := dicomUSDataElement value.
	^ self bsonRepresentationSingleValueOrArray: value
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationFromUTDataElement: dicomUTDataElement [
	"Return the BSON representation for the given data element value.
	
	PRD - March 10, 2016
	
	Changed to return an instance of ByteArray insted of MongoBinary		
	PRD - February 23, 2017"

	^ dicomUTDataElement dataBytes
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> bsonRepresentationSingleValueOrArray: value [
	"If value is an instance of a subclass of collection, 
	 copy its items to a new instance of Array
	
	PRD - June 27, 2017"

	^ value isCollection & value isString not
		ifTrue: [ Array withAll: value ]
		ifFalse: [ value ]
]

{ #category : #'byte/value handling' }
TransferSyntax class >> byteArrayFromString: aString [
	"Return a ByteArray containing the aString byte representation - PRD 02-11.2001
	
	Changed the code to work in Pharo 5.0 as well - February 23, 2017"

	^aString asByteArray.
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> byteArrayFromValue: aValue size: nBytes [
	^ self bitpolisher byteArrayFromValue: aValue size: nBytes
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> byteCollectionFromValue: aValue [
	"Splits a Value into it's binary representation (in byte = base 256).
	PRD 02.2001"

	^self bitpolisher byteCollectionFromValue: aValue
]

{ #category : #'byte handling - floating point' }
TransferSyntax class >> bytesToDoublePrecisionFloat: byteArray [
	^ self bitpolisher bytesToDoublePrecisionFloat: byteArray
]

{ #category : #'byte handling - floating point' }
TransferSyntax class >> bytesToSinglePrecisionFloat: byteArray [
	^ self bitpolisher bytesToSinglePrecisionFloat: byteArray
]

{ #category : #'encoding requirements' }
TransferSyntax class >> checkEncodingRequirements: aDicomImageIOD [

	^self subclassResponsibility
]

{ #category : #'data elements' }
TransferSyntax class >> dataElementDefinion: dataElementTag from: dataElementsDefinition valueRepresentation: valueRepresentation [
	| definition |
	definition := dataElementsDefinition
		at: dataElementTag
		ifAbsent: [ "Item delimitation data element for an unknown group?"
			definition := dataElementTag isGroupLengthDataElement
				ifTrue: [ ULDataElement new
						tag: dataElementTag;
						name: (self privateGroupLengthDataElementNameFrom: dataElementTag) asSymbol;
						vm: '1';
						description: 'Private Group Length Data Element with tag equal to: ' , dataElementTag printString;
						type: '3';
						yourself ]
				ifFalse: [ "Check if the data element tag is otherwise known, if not, create one instance based on the known VR"
					DicomRegistry DataDictionary
						at: dataElementTag
						ifAbsent: [ (DataElement newVR: valueRepresentation)
								tag: dataElementTag;
								name: (self privateDataElementNameFrom: dataElementTag vr: valueRepresentation) asSymbol;
								vm: '1';
								description: 'Private Data Element with tag equal to: ' , dataElementTag printString;
								type: '3';
								yourself ] ] ].
	^ definition
]

{ #category : #'data elements' }
TransferSyntax class >> dataElementFrom: dicomPDVStream dataElementsDefinition: dataElementsDefinition [
	"Parse the given byte stream and decode an DICOM data element from. If the 
	data element to be decoded is not present in the data elements definition dictionary, 
	then decode it as of the unknown type. Return an instance of one of the 
	DataElement subclasses corresponding to the decoded DICOM data element. 
	PS 3.5-2000 Section 7

	PRD 10-11.2001, 05.2002, 05.2003, 04.2004, 02.2016"

	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dataElementHeaderLenght: aDataElement [
	"Return the number of bytes used in the header 	(group number
	+ element number + vr + length) of a DICOM Data Element

	 PRD 05-11.2001"

	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomAEDataElementValueFrom: bsonAEDataElementValue [
	"Decode bsonAEDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonAEDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomASDataElementValueFrom: bsonASDataElementValue [
	"Decode bsonASDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonASDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomATDataElementValueFrom: bsonATDataElementValue [
	"Decode bsonATDataElementValue to the Smalltalk representation
	of the original DICOM value.
	PRD March 07, 2016, August 29, 2017"

	^ bsonATDataElementValue isCollection | bsonATDataElementValue isArray
		ifTrue: [ bsonATDataElementValue
				select: [ :item | item isDictionary ]
				thenCollect: [ :item | DataElementTag fromDictionary: item ] ]
		ifFalse: [ bsonATDataElementValue isDictionary
				ifTrue: [ DataElementTag fromDictionary: bsonATDataElementValue ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomCSDataElementValueFrom: bsonCSDataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonCSDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomDADataElementValueFrom: bsonDADataElementValue [
	"Decode bsonDADataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016.
	
	Since 	bsonDADataElementValue is either an instance of DateAndTime,
	Array or OrderedCollection, no conversion is necessary  - PRD June 27, 2017."

	"^ bsonDADataElementValue isCollection | bsonDADataElementValue isArray
		ifTrue: [ OrderedCollection withAll: bsonDADataElementValue ]
		ifFalse: [ bsonDADataElementValue ]"

	^ bsonDADataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomDSDataElementValueFrom: bsonDSDataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonDSDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomDTDataElementValueFrom: bsonDTDataElementValue [
	"Decode bsonDTDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016.
	
	Since bsonDTDataElementValue is either an instance of DateAndTime
	or nil, no conversion is necessary - PRD June 27, 2017."

	"^ (bsonDTDataElementValue isKindOf: DateAndTime)
		ifTrue: [ bsonDTDataElementValue ]
		ifFalse: [ nil ]"

	^ bsonDTDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomFDDataElementValueFrom: bsonFDDataElementValue [
	"Decode bsonFDDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ bsonFDDataElementValue isCollection | bsonFDDataElementValue isArray
		ifTrue: [ bsonFDDataElementValue collect: [ :item | item asFloat ] ]
		ifFalse: [ bsonFDDataElementValue isNumber
				ifTrue: [ bsonFDDataElementValue asFloat ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomFLDataElementValueFrom: bsonFLDataElementValue [
	"Decode bsonFLDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ bsonFLDataElementValue isCollection | bsonFLDataElementValue isArray
		ifTrue: [ bsonFLDataElementValue collect: [ :item | item asFloat ] ]
		ifFalse: [ bsonFLDataElementValue isNumber
				ifTrue: [ bsonFLDataElementValue asFloat ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomISDataElementValueFrom: bsonISDataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonISDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomLODataElementValueFrom: bsonLODataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonLODataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomLTDataElementValueFrom: bsonLTDataElementValue [
	"Decode bsonLTDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD - March 07, 2016; February 23, 2017"

	^ bsonLTDataElementValue asByteString
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomOBDataElementValueFrom: bsonOBDataElementValue [
	"Decode bsonOBDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016, February 23, 2017"

	^ bsonOBDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomOWDataElementValueFrom: bsonOWDataElementValue [
	"Decode bsonOWDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016; February 23, 2017"

	^ bsonOWDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomPNDataElementValueFrom: bsonPNDataElementValue [
	"Decode bsonPNDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ bsonPNDataElementValue isCollection | bsonPNDataElementValue isArray
		ifTrue: [ bsonPNDataElementValue
				select: [ :item | item isDictionary ]
				thenCollect: [ :item | PersonName fromDictionary: item ] ]
		ifFalse: [ bsonPNDataElementValue isDictionary
				ifTrue: [ PersonName fromDictionary: bsonPNDataElementValue ]
				ifFalse: [ PersonName new: 5 ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomSHDataElementValueFrom: bsonSHDataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonSHDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomSLDataElementValueFrom: bsonSLDataElementValue [
	"Decode bsonSLDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ bsonSLDataElementValue isCollection | bsonSLDataElementValue isArray
		ifTrue: [ bsonSLDataElementValue collect: [ :item | item asInteger ] ]
		ifFalse: [ bsonSLDataElementValue isNumber
				ifTrue: [ bsonSLDataElementValue asInteger ]
				ifFalse: [ nil ] ]
]

{ #category : #'data elements' }
TransferSyntax class >> dicomSQDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue: [ newDataElement := self dicomSQUnLenDataElementFrom: pdvStream definition: dataElementDefinition ]
		ifFalse: [ newDataElement := dataElementDefinition copy.
			newDataElement length: length.
			newDataElement dataBytes: (pdvStream next: length) ].
	newDataElement encoder: self.
	^ newDataElement
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomSQDataElementValueFrom: bsonSQDataElementValue sequenceItemClass: sequenceItemClass [
	"Decode bsonSQDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD - March 07, 2016
	
	Bug fixes - PRD February 23, 2017
	Refactoring, improvements - PRD June 27, 2017"

	"bsonSQDataElementValue is an instance of Array or ByteArray?
	In the case of an unknown SQ data element, 	we have no information
	about the sequence item, so just keep the byte array"

	^ bsonSQDataElementValue isLiteral & bsonSQDataElementValue isCollection
		ifTrue: [ bsonSQDataElementValue ]
		ifFalse: [ bsonSQDataElementValue isCollection 
				ifTrue: [ bsonSQDataElementValue
						select: [ :item | item isDictionary ]
						thenCollect: [ :item | 
							| sequenceItem |
							sequenceItem := sequenceItemClass new.
							sequenceItem encoder: self.
							sequenceItem bsonDictionary: item.
							sequenceItem ] ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomSQUnLenDataElementFrom: dicomPDVStream [
	"Answer back an instance of SQDataElement from the Presentation Data Value
	byte stream with undefined lenght. PS 3.5-2000 Section 7.5.

	PRD 10-11.2001, 03-05.2002, 05.2003"

	| tag itemLenght writeStream itemStream aDicomSQDataElement |
	writeStream := WriteStream on: ByteArray new.

	"******* Repeatedly looks for the Item Tag *******"
	"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
	elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
	[groupNumber = 16rFFFE & (elementNumber = 16rE000)] whileTrue: ["
	tag := self readDicomDataElementTag: dicomPDVStream.
	[tag isItemTag] whileTrue: [
			dicomPDVStream position: dicomPDVStream position - 4.
			writeStream nextPutAll: (dicomPDVStream next: 4).
			itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
			itemLenght = 16rFFFFFFFF
				ifTrue: 
					["**** Items with undefined lenght.... ****"
					"**** Here we convert the undefined length sequence items to defined length sequence items ****"
					itemStream := WriteStream on: ByteArray new.

					"**** Searches for the Item Delimitation Element Tag *****"
					"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
					elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
					[groupNumber = 16rFFFE & (elementNumber = 16rE00D)] whileFalse: [ "
					tag := self readDicomDataElementTag: dicomPDVStream.
					[tag isItemDelimitationElementTag] whileFalse: [
							dicomPDVStream position: dicomPDVStream position - 4.
							"****** recursive call 'undefinedNextDataElement: dicomPDVStream' ******"
							itemStream nextPutAll: (self nextDataElement: dicomPDVStream).
							"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
							elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2"
							tag := self readDicomDataElementTag: dicomPDVStream].

					"**** We have found the Item Delimitation Element Tag. Now get its lenght ******"
					itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
					itemLenght = 16r00000000
						ifFalse: [self halt]
						ifTrue: 
							[writeStream nextPutAll: (self byteArrayFromValue: itemStream size size: 4).
							writeStream nextPutAll: itemStream contents]	"**** The lenght value shall be equal to 16r00000000 ****"	"**** Problems? ****"]
				ifFalse: 
					[dicomPDVStream position: dicomPDVStream position - 4.
					writeStream nextPutAll: (dicomPDVStream next: itemLenght + 4)].


			"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
			elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2]."
			tag := self readDicomDataElementTag: dicomPDVStream].

		"groupNumber = 16rFFFE & (elementNumber = 16rE0DD) ifTrue: [ "
		tag isSequenceDelimitaionElementTag ifTrue: [ 
			"***** Sequence Delimitation Element Tag Found!!!!"
			itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
			itemLenght = 16r00000000
				ifTrue: 
					[aDicomSQDataElement := SQDataElement new.
					aDicomSQDataElement length: writeStream size.
					aDicomSQDataElement dataBytes: writeStream contents.
					"aDicomSQDataElement dataElementLength: aDicomSQDataElement length + 12"]
				ifFalse: [self halt]	"***** More Problems.... *****"]
		ifFalse: [self halt].	"***** More Problems.... *****"
	^aDicomSQDataElement
]

{ #category : #'data elements' }
TransferSyntax class >> dicomSQUnLenDataElementFrom: dicomPDVStream definition: dataElementDefinition [
	"Answer back an instance of SQDataElement from the Presentation Data
	Value byte stream with undefined lenght. PS 3.5-2000 Section 7.5.

	PRD 10-11.2001, 03-05.2002, 05.2003"

	| tag itemLenght writeStream itemStream dicomSQDataElement |
	writeStream := WriteStream on: ByteArray new.

	"******* Repeatedly looks for the Item Tag *******"
	"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
	elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
	[groupNumber = 16rFFFE & (elementNumber = 16rE000)] whileTrue: ["
	tag := self readDicomDataElementTag: dicomPDVStream.
	[tag isItemTag] whileTrue: [
			dicomPDVStream position: dicomPDVStream position - 4.
			writeStream nextPutAll: (dicomPDVStream next: 4).
			itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
			itemLenght = 16rFFFFFFFF
				ifTrue: 
					["**** Items with undefined lenght.... ****"
					"**** Here we convert the undefined length sequence items to defined length sequence items ****"
					itemStream := WriteStream on: ByteArray new.

					"**** Searches for the Item Delimitation Element Tag *****"
					"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
					elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
					[groupNumber = 16rFFFE & (elementNumber = 16rE00D)] whileFalse: ["
					tag := self readDicomDataElementTag: dicomPDVStream.
					[ tag isItemDelimitationElementTag ] whileFalse: [
							dicomPDVStream position: dicomPDVStream position - 4.
							"****** recursive call 'undefinedNextDataElement: dicomPDVStream' ******"
							itemStream nextPutAll: (self nextDataElement: dicomPDVStream).
							"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
							elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2"
							tag := self readDicomDataElementTag: dicomPDVStream].

					"**** We have found the Item Delimitation Element Tag. Now get its lenght ******"
					itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
					itemLenght = 16r00000000
						ifFalse: [self halt]
						ifTrue: 
							[writeStream nextPutAll: (self byteArrayFromValue: itemStream size size: 4).
							writeStream nextPutAll: itemStream contents]	"**** The lenght value shall be equal to 16r00000000 ****"	"**** Problems? ****"]
				ifFalse: 
					[dicomPDVStream position: dicomPDVStream position - 4.
					writeStream nextPutAll: (dicomPDVStream next: itemLenght + 4)].

			"groupNumber := self getValueFromByteStream: dicomPDVStream bytes: 2.
			elementNumber := self getValueFromByteStream: dicomPDVStream bytes: 2"
			tag := self readDicomDataElementTag: dicomPDVStream].
	"groupNumber = 16rFFFE & (elementNumber = 16rE0DD) ifTrue: ["
	tag isSequenceDelimitaionElementTag ifTrue: [ 
		"***** Sequence Delimitation Element Tag Found!!!!"
			itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
			itemLenght = 16r00000000
				ifTrue: 
					[dicomSQDataElement := dataElementDefinition copy.
					dicomSQDataElement length: writeStream size.
					dicomSQDataElement dataBytes: writeStream contents.
					"dicomSQDataElement
						dataElementLength: dicomSQDataElement length + 12"]
				ifFalse: [self halt]	"***** More Problems.... *****"]
		ifFalse: [self halt].	"***** More Problems.... *****"
	^dicomSQDataElement
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomSSDataElementValueFrom: bsonSSDataElementValue [
	"Decode bsonSSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ bsonSSDataElementValue isCollection | bsonSSDataElementValue isArray
		ifTrue: [ bsonSSDataElementValue collect: [ :item | item asInteger ] ]
		ifFalse: [ bsonSSDataElementValue isNumber
				ifTrue: [ bsonSSDataElementValue asInteger ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomSTDataElementValueFrom: bsonSTDataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonSTDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomTMDataElementValueFrom: bsonTMDataElementValue [
	"Decode bsonTMDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD - March 07, 2016.
	
	Since 	bsonTMDataElementValue is either an instance of 
	DateAndTime, Array or OrderedCollection, no conversion
	is necessary - PRD June 27, 2017."

	"^ bsonTMDataElementValue isCollection | bsonTMDataElementValue isArray
		ifTrue: [ OrderedCollection withAll: bsonTMDataElementValue ]
		ifFalse: [ bsonTMDataElementValue ]"

	^ bsonTMDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomUIDataElementValueFrom: bsonUIDataElementValue [
	"Decode bsonCSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ self multipleStringDicomDataElementValueFrom: bsonUIDataElementValue
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomULDataElementValueFrom: bsonULDataElementValue [
	"Decode bsonULDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD - March 07, 2016"

	^ bsonULDataElementValue isCollection | bsonULDataElementValue isArray
		ifTrue: [ bsonULDataElementValue collect: [ :item | item asInteger ] ]
		ifFalse: [ bsonULDataElementValue isNumber
				ifTrue: [ bsonULDataElementValue asInteger ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomUNDataElementValueFrom: bsonUNDataElementValue [
	"Decode bsonUNDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016, Febrary 23, 2017"

	^ bsonUNDataElementValue asByteString
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomUSDataElementValueFrom: bsonUSDataElementValue [
	"Decode bsonUSDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016"

	^ bsonUSDataElementValue isCollection | bsonUSDataElementValue isArray
		ifTrue: [ bsonUSDataElementValue collect: [ :item | item asInteger ] ]
		ifFalse: [ bsonUSDataElementValue isNumber
				ifTrue: [ bsonUSDataElementValue asInteger ]
				ifFalse: [ nil ] ]
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> dicomUTDataElementValueFrom: bsonUTDataElementValue [
	"Decode bsonUTDataElementValue to the Smalltalk representation
	of the original DICOM value - PRD March 07, 2016, February 23, 2017"

	^ bsonUTDataElementValue asByteString
]

{ #category : #'byte handling - floating point' }
TransferSyntax class >> doublePrecisionFloatToBytes: floatValue [
	^ self bitpolisher doublePrecisionFloatToBytes: floatValue
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get16BitSignedValueFromByteStream: aStream [
	^ self bitpolisher get16BitSignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get16BitUnsignedValueFromByteStream: aStream [
	^ self bitpolisher get16BitUnsignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get32BitSignedValueFromByteStream: aStream [
	^ self bitpolisher get32BitSignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get32BitUnsignedValueFromByteStream: aStream [
	^ self bitpolisher get32BitUnsignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get4BytesWordFromByteStream: aStream [
	^ self bitpolisher get32BitUnsignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get64BitSignedValueFromByteStream: aStream [
	^ self bitpolisher get64BitSignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get64BitUnsignedValueFromByteStream: aStream [
	^ self bitpolisher get64BitUnsignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get8BitSignedValueFromByteStream: aStream [
	^ self bitpolisher get8BitSignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> get8BitUnsignedValueFromByteStream: aStream [
	^ self bitpolisher get8BitUnsignedValueFromByteStream: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> getSignedValueFromByteArray: byteArray [
	^ self bitpolisher getSignedValueFromByteArray: byteArray
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> getSignedValueFromByteArray: byteArray start: start stop: stop [
	^ self bitpolisher getSignedValueFromByteArray: byteArray start: start stop: stop
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> getSignedValueFromByteStream: aStream bytes: byteNumber [
	^ self bitpolisher getSignedValueFromByteStream: aStream bytes: byteNumber
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> getValueFromByteArray: aStream [
	^ self bitpolisher getValueFromByteArray: aStream
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> getValueFromByteArray: byteArray start: start stop: stop [
	^ self bitpolisher getValueFromByteArray: byteArray start: start stop: stop
]

{ #category : #'byte handling - integer' }
TransferSyntax class >> getValueFromByteStream: aStream bytes: byteNumber [
	^ self bitpolisher getValueFromByteStream: aStream bytes: byteNumber
]

{ #category : #initialize }
TransferSyntax class >> initialize [
"
	Abstract Smalltalk Class for DICOM Transfer Syntaxes Encoder initialization - PRD 03.2001 - 04.2003
	Since this is an abstract class, that should not be directly used, it's UID is set to a nil value
"
	UID := nil.
]

{ #category : #testing }
TransferSyntax class >> isBigEndian [

	^self subclassResponsibility.
]

{ #category : #testing }
TransferSyntax class >> isLittleEndian [

	^self subclassResponsibility.
]

{ #category : #testing }
TransferSyntax class >> isVRExplicit [

	^self subclassResponsibility.
]

{ #category : #testing }
TransferSyntax class >> isVRImplicit [

	^self subclassResponsibility.
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> longDataElementHeaderLength [
	^ 12
]

{ #category : #'as yet unclassified' }
TransferSyntax class >> multipleStringDicomDataElementValueFrom: bsonElementValue [
	"Decode bsonMultipleStringDataElementValue to the Smalltalk 
	representation of the original DICOM value - PRD March 07, 2016"

	^ bsonElementValue isString
		ifTrue: [ bsonElementValue trimBoth ]
		ifFalse: [ bsonElementValue isCollection
				ifTrue: [ bsonElementValue collect: [ :item | item trimBoth ] ]
				ifFalse: [ String new ] ]
]

{ #category : #'data elements' }
TransferSyntax class >> nextDataElement: dicomPDVStream [
	"	Return the position in the dicomPDV byte array where starts the next data Element.
	tagPosition corresponds to the first byte of the 'current' data element. - PRD 05-12.2001
	Added support for undefined lenght DICOM Data Elements - PRD 06.2002"

	^ self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromAEDataElement: dicomAEDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AE Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromASDataElement: dicomASDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromATDataElement: dicomATDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromCSDataElement: dicomCSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM CS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromDADataElement: dicomDADataElement on: aByteStream [
	"Put the byte-coding of a DICOM DA Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromDSDataElement: dicomDSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM DS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromDTDataElement: dicomDTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM DT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromFDDataElement: dicomFDDataElement on: aByteStream [
	"Put the byte-coding of a DICOM FD Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromFLDataElement: dicomFLDataElement on: aByteStream [
	"Put the byte-coding of a DICOM FL Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromISDataElement: dicomISDataElement on: aByteStream [
	"Put the byte-coding of a DICOM IS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromLODataElement: dicomLODataElement on: aByteStream [
	"Put the byte-coding of a DICOM LO Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromLTDataElement: dicomLTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM LT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromOBDataElement: dicomOBDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OB Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OW Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromPNDataElement: dicomPNDataElement on: aByteStream [
	"Put the byte-coding of a DICOM PN Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromSHDataElement: dicomSHDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SH Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromSLDataElement: dicomSLDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SL Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromSQDataElement: dicomSQDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SQ Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromSSDataElement: dicomSSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromSTDataElement: dicomSTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM ST Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromTMDataElement: dicomTMDataElement on: aByteStream [
	"Put the byte-coding of a DICOM TM Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromUIDataElement: dicomUIDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UI Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromULDataElement: dicomULDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UL Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromUNDataElement: dicomUNDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UN Data Element in to a ByteStream.]
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromUSDataElement: dicomUSDataElement on: aByteStream [
	" Put the byte-coding of a DICOM US Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
TransferSyntax class >> pdvBytesFromUTDataElement: dicomUTDataElement on: aByteStream [
" Put the byte-coding of a DICOM UT Data Element in to a ByteStream - PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'data elements' }
TransferSyntax class >> privateCreatorDataElementNameFrom: dataElementTag [

	| elementName |
	elementName := String
		new: 10
		streamContents: [ :aStream | 
			aStream
				nextPutAll: 'privateCreatorDataElement';
				nextPutAll: dataElementTag printString ].
	^ elementName
]

{ #category : #'data elements' }
TransferSyntax class >> privateDataElementNameFrom: dataElementTag [
	| elementName |
	elementName := String
		new: 10
		streamContents: [ :aStream | 
			aStream
				nextPutAll: 'privateDataElement';
				nextPutAll: dataElementTag printString ].
	^ elementName
]

{ #category : #'data elements' }
TransferSyntax class >> privateDataElementNameFrom: dataElementTag vr: valueRepresentation [
	| elementName |
	elementName := WriteStream on: String new.
	elementName nextPutAll: 'private' , valueRepresentation , 'DataElement['.
	(dataElementTag groupNumber ) printOn: elementName base: 16.
	elementName nextPutAll: ','.
	(dataElementTag elementNumber) printOn: elementName base: 16.
	elementName nextPutAll: ']'.
	^ elementName contents
]

{ #category : #'data elements' }
TransferSyntax class >> privateGroupLengthDataElementNameFrom: dataElementTag [
	| elementName |
	elementName := String
		new: 10
		streamContents: [ :aStream | 
			aStream
				nextPutAll: 'privateGroupLengthDataElement';
				nextPutAll: dataElementTag printString ].
	^ elementName
]

{ #category : #'byte/value handling' }
TransferSyntax class >> readDicomDataElementTag: aStream [
	"Read data element tag from the given byte stream, which is enconded as 
	a pair of 16 bit integers.
	
	PRD 05.2003 - 02.2016"

	^ self subclassResponsibility
]

{ #category : #initialize }
TransferSyntax class >> registerMyself [
	"The shared variable DicomRegistry class>>TransferSyntaxes
	is a Dictionary containinig references to all the supported
	transfer syntaxes object classes by the Dicom 	coding/decoding
	system. - PRD March 29th, 2004"

	self UID notNil
		ifTrue: [ DicomRegistry TransferSyntaxes at: self UID put: self ]
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> shortDataElementHeaderLength [
	^ 8
]

{ #category : #'byte handling - floating point' }
TransferSyntax class >> singlePrecisionFloatToBytes: floatValue [
	^ self bitpolisher singlePrecisionFloatToBytes: floatValue
]
