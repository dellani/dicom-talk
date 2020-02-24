"
---------------------------------------------------------------------------
                 NESTING OF DATA SETS - PS 3.5-2000 - Item 7.5 Text and some Comments
---------------------------------------------------------------------------

SQ Data Elements consists of a Sequence of zero or more items, where each item 
contains a set of Data Elements. SQ provides a flexible encoding scheme that may be
used for simple structures of repeating sets of Data Elements, or the encoding of more 
complex Information Object Definitions often called folders. SQ Data Elements can also
be used recursively to contain multi-level nested structures.

Items present in an SQ Data Element shall be an ordered (hummmm, it remembers 
OrderedCollection) set where each item may be referenced by its ordinal position 
(hummm, sounds like an OrderedCollection). Each item shall be implicitly assigned with 
an ordinal position starting with the value 1 for the first item in the Sequence, and incremented 
by 1 with each subsequent item. The last item in the Sequence shall have an ordinal position
equal to the number of items in the Sequence (yes, it can be an OrderedCollection >:-)

	Notes: 
		1. This clause implies that item ordering is preserved during transfer and storage.
		2. An IOD or Module Definition may choose to not use this ordering property of a 
		Data Element with VR of SQ. This is simply done by not specifying any specific 
		semantics to the ordering of items, or by not specyfing usage of the referencing of
		items by ordering position.

The definition of the Data Element encapsulated in each item is provided by the specification of
the Data Element (or associated Attribute) of Value Representation SQ. Items in a sequence of 
items may or may not contain the same set of Data Elements. Data Elements with a VR of SQ
may contain multiple items but shall always have a Value Multiplicity of one (ie. a single Sequence).

There are three special SQ related Data Elements that are not ruled by the VR encoding rules 
conveyed by the Transfer Syntax. They shall be encoded as Implicit VR. These special Data 
Elements are Item (FFFE,E000). Item Delimitation Item (FFFE, E00D), and Sequence Delimitation
Item (FFFE, E0DD). However, the Data Set within the Value Field of the Data Element Item (FFFE, E000)
shall be encoded according to the rules conveyed by the Transfer Syntax.

-----------------------------------------------------------------------------
                 ITEM ENCODING RULES - PS 3.5-2000 - Item 7.5.1 Text and some Comments
-----------------------------------------------------------------------------

Each Item of a Data Element of Value Representation SQ shall be encoded as a DICOM
Standard Data Element with a specific Data Element Tag of Value (FFFE, E000). The Item
Tag is followed by a4 byte Item Length field encoded in one of the following two ways:

	a) 	Explicit Length: the number of bytes (even) contained in the Sequence Item Value
		(following but not including the Item Length Field) is encoded as a 32-bit unsigned integer
		value (see Section 7.1). This length shall include the total length of all Data Elements 
		conveyed by this Item. This Item length shall be equal to 00000000H if the Item contains
		no Data Set.

	b)	Undefined Length: the Item Length Field shall contain the value FFFFFFFFH to indicate
		undefined Item length. It shall be used in conjunction with an Item Delimitation Data 
		Element. This Item Delimitation Data Element has a Data Element Tag of (FFFE,E00D) and
		shall follow the Data Elements encapsulated in the item. No Value shall be present in the
		Item Delimitation Data Element and its Length shall be 00000000H.

The encoder of a Data Set may choose either one of the who ways of encoding. Both ways of 
encoding shall be supported by decoders of Data Sets.Data Element Tags (FFFF,eeee) are 
reserved by this standard and shall not be used.

Each Item Value shall contain a DICOM Data Set composed of Data Elements. Within the context 
of each Item, these Data Elements shall be ordered by increasing Data Element Tag value and 
appear only once (as Data Set is defined in Section 7.1). There is no relationship between the
ordering of the Data Elements contained within an Item and the ordering of the Data Element Tag
of SQ Value Representation that contains that Item. One or more Data Elements in an Item may be 
Value Representation SQ, thus allowing for recursion.

-------------------------------------------------------------------------
 DELIMITATION OF THE SEQUENCE OF ITEMS - PS 3.5-2000 - Item 7.5.2 Text and some Comments
-------------------------------------------------------------------------

Delimitation of the last Item of a Sequence of Items, encapsulated in a Data Element of Value
Representation SQ, shall be in one of the two following ways:

	a)	Explicit Length: the number of bytes (even) contained in the Data Element Value 
		(following but not including the Data Element Length Field) is encoded as a 32-bit 
		unsigned integer value (see Section 7.1). This length shall include the total length 
		resulting from the sequence of zero or more items conveyed by this Data Element.
		This Data Element Length shall be equal to 00000000H if the sequence of items
		contains zero Items.

	b)	Undefined Length: the Data Element Length Field shall contain a Value FFFFFFFFH
		to indicate an Undefined Sequence length. It shall be used in conjunction with a
		Sequence Delimitation Item. A Sequence Delimitation Item shall be included after the
		last item in the sequence. Its Item Tag shall be (FFFE,E0DD) with an Item Length of 
		00000000H. No Value shall be present.

The encoder of a Sequence of Items may choose either on of the two ways of encoding. Both
ways of encoding shall be supported by decoders of the Sequence of Items.

	Note: 	The Sequence Delimitation Item Tag (FFFE,E0D0) is different from the Item 
			Delimitation Tag (FFFE, E00D) introduced above in that it indicates the end 
			of a Sequence of Items whose length was left undefined. If an undefined length 
			Item is the last Item of a Sequence of items of undefined length, then an Item 
			Delimitation Tag will be followed by a Sequence Delimitation Tag.

-------------------------------------------------------------------------
           SEQUENCE INHERITANCE - PS 3.5-2000 - Item 7.5.3 Text and some Comments
-------------------------------------------------------------------------

An encapsulated Data Set shall only include the Specific Character Set (0008,0005) data 
element if the Attribute Specific Character Set is defined in the IOD for that sequence of
items.

	Note:	An encapsulated Data Set does not include the Specific Character Set data 
			element if the Specific Character Set  Attribute is defined as part of the IOD
			for that sequence.

If an encapsulated Data Set includes the Specific Character Set Attribute, it shall apply
only to the encapsulated Data Set. If the Attribute Specific Character Set is not explicitly
included in an encapsulated Data Set, then the Specific Character Set value of the
encapsulating Data Set applies.
"
Class {
	#name : #SQDataElement,
	#superclass : #DataElement,
	#instVars : [
		'sequenceItemClass',
		'valueCache'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
SQDataElement class >> initialize [
	
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #'Instance creation' }
SQDataElement class >> newWith: aDicomTagNameSymbol tag: aTagGroupElementValueArray vm: aValueMultiplicityNumber type: dataElementType sequenceItemClass: aSequenceItemClass [
	"This 'contructor message' can be sent in the following way:

	dataElement := SQDataElement 
				newWith: #groupElement 
				tag: #(16r0000,16r0001)
				vm: 1
				type: '1C'
				sequenceItemClass: SequenceItemClass

	PRD 05.2001, 02.2016"
	
	| newInstance |

	newInstance := self  
		newWith: aDicomTagNameSymbol 
		tag: aTagGroupElementValueArray 
		vm: aValueMultiplicityNumber
		description:  'No description was given to this DICOM tag'
		type: dataElementType.
		
	newInstance sequenceItemClass: aSequenceItemClass.
	^newInstance.
]

{ #category : #accessing }
SQDataElement class >> valueRepresentationString [

	^'SQ'
]

{ #category : #'as yet unclassified' }
SQDataElement >> bsonTypeCode [
	"BSON type 4 = Array; BSON type 5 = Binary; 6 = nil"

	| value bsonType | 

	bsonType := 6. "Default is nil"

	value := self bsonValue.

	(value isKindOf: Array) ifTrue: [bsonType := 4].
	(value isKindOf: ByteArray) ifTrue: [bsonType := 5].

	"^(self value isKindOf: OrderedCollection)
		ifTrue: [4]
		ifFalse: [3]"

	^bsonType
]

{ #category : #'as yet unclassified' }
SQDataElement >> bsonValue [

	^self encoder 
		bsonRepresentationFromSQDataElement: self
]

{ #category : #'instance creation' }
SQDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomSQDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
SQDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthSQDataElement + self dataBytes size
]

{ #category : #'as yet unclassified' }
SQDataElement >> dataElementValueFrom: bsonSQDataElementValue [

	^self encoder 
		dicomSQDataElementValueFrom: bsonSQDataElementValue
		sequenceItemClass: self sequenceItemClass
]

{ #category : #'sequence decoding' }
SQDataElement >> decodeDefinedLengthSequence: readStream sequenceItemClass: classOfSequenceItem [
	"See PS 3.5-2000 7.5 (NESTING OF DATA SETS)
	Decoding of Defined Length DICOM Item Sequences

	PRD 04-10.2001, August 29, 2017"

	| dataElementTag itemLength |
	[ readStream atEnd ]
		whileFalse: [ "Check for the Dicom Sequence Item Tag"
			"(self hasItemTag: readStream) ifTrue: ["
			dataElementTag := encoder readDicomDataElementTag: readStream.
			dataElementTag isItemTag
				ifTrue: [ "Ok, we have an Item Tag. Let's decode it."
					itemLength := encoder get32BitUnsignedValueFromByteStream: readStream.
					itemLength = 16rFFFFFFFF
						ifTrue: [ self decodeUndefinedLengthSequenceItem: readStream sequenceItemClass: classOfSequenceItem ]
						ifFalse: [ self decodeDefinedLengthSequenceItem: readStream length: itemLength sequenceItemClass: classOfSequenceItem ] ] ]
]

{ #category : #'sequence decoding' }
SQDataElement >> decodeDefinedLengthSequenceItem: readStream length: itemLength sequenceItemClass: classOfSequenceItem [
	"See PS 3.5-2000 7.5 (NESTING OF DATA SETS)
	Decode a Defined Length Item in a DICOM Sequence.
	Answer back with the position of the next Item in the DICOM Sequence

	PRD 04-10.2001, 05.2002"
	
	| sequenceItem |

	sequenceItem := classOfSequenceItem new.
	sequenceItem encoder: self encoder.
	sequenceItem 
		pdvBytesStream: (readStream next: itemLength) readStream
		encoder: self encoder
		dataElementsDefinition: sequenceItem dataElementsDefinition.
	self value add: sequenceItem.
]

{ #category : #'sequence decoding' }
SQDataElement >> decodeSequenceItems: classOfSequenceItem [
	"See PS 3.5-2000 7.5 (NESTING OF DATA SETS)
	Dicom Sequence Item decoding from the Data Element Value, using a specific
	Dicom Transfer Syntax Encoder/Decoder (aDicomTransferSyntaxEncoder).
	*dataBytes* is a ByteArray containing all bytes of the Data Element Value
	PRD 04-10.2001
	
	August 29, 2017: Now unknown sequence item are decoded too. PRD"

	self length = 16rFFFFFFFF
		ifTrue: [ self
				decodeUndefinedLengthSequence: self dataBytes readStream
				sequenceItemClass: classOfSequenceItem ]
		ifFalse: [ self
				decodeDefinedLengthSequence: self dataBytes readStream
				sequenceItemClass: classOfSequenceItem ]
]

{ #category : #'sequence decoding' }
SQDataElement >> decodeUndefinedLengthSequence: readStream sequenceItemClass: classOfSequenceItem [
	"See PS 3.5-2000 7.5 (NESTING OF DATA SETS)
	Decoding of Undefined Length DICOM Item Sequences

	PRD 03.2017, August 29, 2017"

	| dataElementTag itemLength |
	"Check for the Dicom Sequence Item Tag"
	[ dataElementTag := encoder readDicomDataElementTag: readStream.
	dataElementTag isItemTag ]
		whileTrue: [ "Ok, we have an Item Tag. Let's decode it."
			(itemLength := encoder get32BitUnsignedValueFromByteStream: readStream) = 16rFFFFFFFF
				ifTrue: [ self decodeUndefinedLengthSequenceItem: readStream sequenceItemClass: classOfSequenceItem ]
				ifFalse: [ self decodeDefinedLengthSequenceItem: readStream length: itemLength sequenceItemClass: classOfSequenceItem ] ]
]

{ #category : #'sequence decoding' }
SQDataElement >> decodeUndefinedLengthSequenceItem: readStream sequenceItemClass: classOfSequenceItem [
	"See PS 3.5-2000 7.5 (NESTING OF DATA SETS)
	Decode a Undefined Length Item in a DICOM Sequence
	Answer back with the position of the next Item in the DICOM Sequence

	PRD 04-10.2001, 06.2002, 03.2017, August 29, 2017"

	| sequenceItem readWriteStream itemLength itemEncoder |
	itemEncoder := self encoder.
	readWriteStream := ReadWriteStream on: ByteArray new.


	"**** Searches for the Item Delimitation Element Tag *****"
	[ [ (itemEncoder readDicomDataElementTag: readStream) isItemDelimitationElementTag ]
		whileFalse: [ readStream position: readStream position - 4.
			readWriteStream nextPutAll: (itemEncoder nextDataElement: readStream) ] ]
		on: DataElementEncodingErrorVRNotFound
		do: [ :error | 
			"This encoding error can be caused by an application entity that did not known that the
			data element was a sequence, which can happen if the PDV was encoded using an implicit VR syntax and
			the AE did not have an entry for the data element in its own data dictionary, causing the sequence items
			to 	remain in the original syntax while storing the data on an unknown data element. So check if this is 
			the case by trying to decode the data using the implicit VR transfer syntax - PRD August 31, 2017"
			readStream position: readStream position - 6.
			itemEncoder := LittleEndianImplicitVRTS.
			[ [ (itemEncoder readDicomDataElementTag: readStream) isItemDelimitationElementTag ]
				whileFalse: [ readStream position: readStream position - 4.
					readWriteStream nextPutAll: (itemEncoder nextDataElement: readStream) ] ]
				on: Error
				do: [ :anotherError | self halt ] ].

	"**** Found one Item Delimitation Element Tag ******"
	readWriteStream reset.
	itemLength := itemEncoder get32BitUnsignedValueFromByteStream: readStream.
	itemLength = 16r00000000
		ifTrue: [ sequenceItem := classOfSequenceItem new.
			sequenceItem pdvBytesStream: readWriteStream encoder: itemEncoder dataElementsDefinition: sequenceItem dataElementsDefinition.
			valueCache add: sequenceItem ]
		ifFalse: [ Error signal: 'Error decoding a sequence item of undefined length: ' , 'the legth of the item delimitation data element is not zero' ]
]

{ #category : #accessing }
SQDataElement >> encoder: aDicomTransferSyntaxClass [
	| sequenceItems |
	self encoder notNil
		ifTrue: [ self encoder = aDicomTransferSyntaxClass
				ifFalse: [ super encoder: aDicomTransferSyntaxClass.
					(sequenceItems := self value)
						do: [ :sequenceItem | 
							sequenceItem encoder = aDicomTransferSyntaxClass
								ifFalse: [ sequenceItem encoder: aDicomTransferSyntaxClass ] ] ] ]
		ifFalse: [ super encoder: aDicomTransferSyntaxClass ]
]

{ #category : #'sequence decoding' }
SQDataElement >> getItemLength: readStream [
	"Return the length of the item located in dataBytes at *itemPosition*. Note that Item Tag 
	doesn't follow the rules ruled by the Transfer Syntax in use and the length bytes are
	located after the Data Element Tag bytes - PRD 10.2001"

	^ encoder get32BitUnsignedValueFromByteStream: readStream
]

{ #category : #'field bytes' }
SQDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromSQDataElement: self on: aByteStream
]

{ #category : #printing }
SQDataElement >> printSequenceItemDataElementsTableEntries: aStream level: level [

	(SortedCollection withAll: self sequenceItemClass DataElements) do: [:dataElement |
		aStream cr; nextPutAll: (dataElement printTableEntry: level).
	].
	^aStream contents.
]

{ #category : #printing }
SQDataElement >> printSequenceItemDataElementsTableEntriesWithValues: aStream level: level [

	self value do: 
			[:sequenceItem |
			aStream cr.
			"sequenceItemNameString := String new."
			level timesRepeat: [aStream nextPutAll: '> '].
			aStream nextPutAll: sequenceItem printString.
			"sequenceItemNameString printOn: aStream paddedWith: Character space 	to: 64."
			(SortedCollection withAll: sequenceItem dataElementsCollection) do: 
					[:dataElement |
					aStream
						cr;
						nextPutAll: (dataElement printTableEntryWithValues: level + 1)]].
	^aStream contents
]

{ #category : #printing }
SQDataElement >> printTableEntry: level [
"
	Return a string of characters describing myself in unique row.
	Then print an indented line for every data element that composes 
	the sequence. PRD - July 15th, 2004
"
	| aStream |

	aStream := WriteStream on: String new.
	aStream nextPutAll: (super printTableEntry: level).
	self printSequenceItemDataElementsTableEntries: aStream level: level + 1.
	^aStream contents
]

{ #category : #printing }
SQDataElement >> printTableEntryWithValues: level [
"
	Return a string of characters describing myself in unique row.
	PRD - July 15th, 2004

	Version that prints the value store on the data element
	PRD - August 20th, 2015
"
	| aStream |

	aStream := WriteStream on: String new.
	aStream nextPutAll: (super printTableEntry: level).
	self printSequenceItemDataElementsTableEntriesWithValues: aStream level: level + 1.
	^aStream contents
]

{ #category : #printing }
SQDataElement >> printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	aStream nextPutAll: 'Sequence of items'
]

{ #category : #accessing }
SQDataElement >> sequenceItemClass [

	^sequenceItemClass.
]

{ #category : #accessing }
SQDataElement >> sequenceItemClass: aSequenceItemClass [

	sequenceItemClass := aSequenceItemClass.
]

{ #category : #'field value retrieving' }
SQDataElement >> value [
	"See class comments and PS 3.5-2000 Item 7.5 - PRD 10.2001

	This Data Element type (SQ) always has a Value Multiplicity
	equal to one - 	PRD 06.2002
	
	August 29, 2017: Method changed in order to decode unknown sequence items. PRD"

	^ valueCache isNil
		ifTrue: [ valueCache := OrderedCollection new.
			self sequenceItemClass notNil
				ifTrue: [ self decodeSequenceItems: self sequenceItemClass ]
				ifFalse: [ self decodeSequenceItems: UnknownSequenceItem ].
			valueCache ]
		ifFalse: [ valueCache ]
]

{ #category : #'field value storing' }
SQDataElement >> value: aSequenceItemCollection [
	" SQ (Sequence of Items)
	Value is a Sequence of zero or more Items, as defined in Section 7.5. 
	Character Repertoire: not applicable (see Section 7.5) 
	Value Length: not applicable (see Section 7.5)
	PS 3.5-2000 7.5.2 (Table 7.5-1) - PRD 05.2001, 02.2002"

	| streamBytes sequenceItemPDV |
	streamBytes := WriteStream on: ByteArray new.
	(aSequenceItemCollection isKindOf: OrderedCollection)
		ifTrue: 
			[aSequenceItemCollection do: 
					[:aSequenceItem |
					aSequenceItem encoder: self encoder.
					sequenceItemPDV := aSequenceItem presentationDataValueBytesArray.
					"*** Item delimitation 	tag: group number ***"
					streamBytes nextPutAll: (self encoder byteArrayFromValue: 16rFFFE size: 2).
					"*** Item delimitation tag: element number ***"
					streamBytes nextPutAll: (self encoder byteArrayFromValue: 16rE000 size: 2).
					"*** Item length ***"
					streamBytes
						nextPutAll: (self encoder byteArrayFromValue: sequenceItemPDV size size: 4).
					"*** Item Value ****"
					streamBytes nextPutAll: sequenceItemPDV]].
	self dataBytes: streamBytes contents.
	self length: self dataBytes size.
]

{ #category : #'as yet unclassified' }
SQDataElement >> writeBSONOn: aBSON [

	| size array |
	size := self value size.
	array := Array new: size.
	1 to: size
		do: 
			[:index |
			array at: index
				put: (self value at: size)
						dataElementsValuesDictionaryOhneGroupLengthDataElements
			"self value size do: [:sqItem |"].
	^aBSON nextArrayPut: array
]
