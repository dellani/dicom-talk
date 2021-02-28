Class {
	#name : #EncodedPixelDataEncapsulationTS,
	#superclass : #LittleEndianExplicitVRTS,
	#category : #'talkDICOM-Data'
}

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> dicomOBDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue:
			[ newDataElement := self dicomOBUnLenDataElementFrom: pdvStream definition: dataElementDefinition ]
		ifFalse: [ newDataElement := dataElementDefinition copy.
			newDataElement encoder: self.
			newDataElement length: length.
			"newDataElement dataElementLength: length + 12."
			newDataElement dataBytes: (pdvStream next: length) ].
	^ newDataElement
]

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> dicomOBUnLenDataElementFrom: dicomPDVStream definition: dataElementDefinition [
	"Create an instance of OBDataElement with undefined lenght
	from the PDV byte stream - PS 3.5-2000 Section 7.5
	
	 PRD - March 18, 2017"
	
	| itemLenght writeStream dicomOBDataElement tag |

	writeStream := WriteStream on: ByteArray new.
	"******* Repeatedly looks for the Item Tag *******"
	tag := self readDicomDataElementTag: dicomPDVStream.
	"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
	elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)."
	[tag isItemTag] whileTrue: [
		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		dicomPDVStream position: dicomPDVStream position - 8.
		writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8).

		tag := self  readDicomDataElementTag: dicomPDVStream.
		"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)"].
	"(groupNumber = 16rFFFE) & (elementNumber = 16rE0DD) ifTrue:  ["
	tag isSequenceDelimitationElementTag ifTrue: [ 
		"***** Sequence Delimitation Element Tag Found!!!!"
		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		itemLenght = 16r00000000 ifTrue: [
			dicomPDVStream position: dicomPDVStream position - 8.
			writeStream nextPutAll: (dicomPDVStream next: 8).
			dicomOBDataElement := dataElementDefinition copy.
			dicomOBDataElement encoder: self.
			dicomOBDataElement length: 16rFFFFFFFF.
			dicomOBDataElement dataBytes: writeStream contents.
			"dicomOBDataElement dataElementLength: dicomOBDataElement dataBytes size + 8."
		]
		ifFalse: [self halt]. 		"***** More Problems.... *****"
	]
	ifFalse: [self halt]. 		"***** More Problems.... *****"
	^dicomOBDataElement
]

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> dicomOWDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement byteArray byte1 |
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue: [ newDataElement := self dicomOWUnLenDataElementFrom: pdvStream definition: dataElementDefinition ]
		ifFalse: [ newDataElement := dataElementDefinition copy.
			newDataElement encoder: self.
			newDataElement length: length.
			"newDataElement dataElementLength: length + 12."

			byteArray := pdvStream next: newDataElement length.

			"Swap byte order"
			1 to: length by: 2 do: [ :index | 
				byte1 := byteArray at: index.
				byteArray at: index put: (byteArray at: index + 1).
				byteArray at: index + 1 put: byte1 ].
			newDataElement dataBytes: byteArray ].
	^ newDataElement
]

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> dicomOWUnLenDataElementFrom: dicomPDVStream definition: dataElementDefinition [
	"Create an instance of OWDataElement with undefined lenght
	from the PDV byte stream - PS 3.5-2000 Section 7.5
	
	 PRD 10-11.2001, 03-05.2002, 05.2003, 02.2016"

	| itemLenght writeStream dicomOWDataElement tag |

	writeStream := WriteStream on: ByteArray new.
	"******* Repeatedly looks for the Item Tag *******"
	
	"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
	elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
	[(groupNumber = 16rFFFE) & (elementNumber = 16rE000)] whileTrue: ["

	tag := self readDicomDataElementTag: dicomPDVStream.
	[tag isItemTag] whileTrue: [
		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		dicomPDVStream position: dicomPDVStream position - 8.
		writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8).
		tag := self  readDicomDataElementTag: dicomPDVStream.
		"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)."
	].
	"(groupNumber = 16rFFFE) & (elementNumber = 16rE0DD) ifTrue:  ["
	tag isSequenceDelimitationElementTag ifTrue: [ 
		"***** Sequence Delimitation Element Tag Found!!!!"
		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		itemLenght = 16r00000000 ifTrue: [
			dicomPDVStream position: dicomPDVStream position - 8.
			writeStream nextPutAll: (dicomPDVStream next: 8).
			dicomOWDataElement := dataElementDefinition copy.
			dicomOWDataElement encoder: self.
			dicomOWDataElement length: 16rFFFFFFFF.
			dicomOWDataElement dataBytes: writeStream contents.
			"dicomOWDataElement dataElementLength: dicomOWDataElement dataBytes size + 8."
		]
		ifFalse: [self halt]. 		"***** More Problems.... *****"
	]
	ifFalse: [self halt]. 		"***** More Problems.... *****"
	^dicomOWDataElement
]

{ #category : #'PDV bytes' }
EncodedPixelDataEncapsulationTS class >> encapsulateOBPixelDataElement: dataElement on: aByteStream [ 
	"This method assumes that the Pixel Data Data Element being encoded in a DICOM Stream
	is a pixel data DICOM data element that contains only a single frame, according to
	the table A.4-1 in PS 3.5-2000
	EAF, PRD November 14th, 2002

	Adapted to the new Stream manipulation scheme for speed improvements in the
	byte encoding/decoding of DICOM objects
	EAF, PRD April 20th 2003"

	aByteStream
		nextPutAll: (self byteArrayFromValue: dataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dataElement vr);
		nextPut: 16r00;												"************* Reserved Bytes ***************"
		nextPut: 16r00;												"************* Reserved Bytes ***************"
		nextPutAll: (self byteArrayFromValue: 16rFFFFFFFF size: 4).				"***** Data Element lenght will be 16rFFFFFFFF *****"

	"***** Basic Offset Table with NO Item Value ******"
	aByteStream 
		nextPutAll: (self byteArrayFromValue: 16rFFFE size: 2);					"**** Item Tag (Group Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16rE000 size: 2);					"**** Item Tag (Element Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16r0000 size: 4).					"**** Zero Lenght ******"

	"***** First Fragment (Single Frame) of Pixel Data ******"
	aByteStream 
		nextPutAll: (self byteArrayFromValue: 16rFFFE size: 2); 					"**** Item Tag (Group Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16rE000 size: 2);					"**** Item Tag (Element Element Number) ******"
		nextPutAll: (self byteArrayFromValue: dataElement length size: 4);			"**** Lenght of the fragment ******"
		nextPutAll: dataElement dataBytes;
		nextPutAll: (self byteArrayFromValue: 16rFFFE size: 2);					"**** Sequence Delimiter Item Tag (Group Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16rE0DD size: 2);					"**** Sequence Delimiter Item Tag (Element Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16r0000 size: 4).					"**** Zero Lenght ******"
]

{ #category : #'PDV bytes' }
EncodedPixelDataEncapsulationTS class >> encapsulateOWPixelDataElement: dataElement on: aByteStream [ 
	"This method assumes that the Pixel Data Data Element being encoded in a DICOM Stream
	is a pixel data DICOM data element that contains only a single frame, according to
	the table A.4-1 in PS 3.5-2000
	EAF, PRD November 14th, 2002

	Adapted to the new Stream manipulation scheme for speed improvements in the
	byte encoding/decoding of DICOM objects
	EAF, PRD April 20th 2003"

	aByteStream
		nextPutAll: (self byteArrayFromValue: dataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dataElement vr);
		nextPut: 16r00;												"************* Reserved Bytes ***************"
		nextPut: 16r00;												"************* Reserved Bytes ***************"
		nextPutAll: (self byteArrayFromValue: 16rFFFFFFFF size: 4).				"***** Data Element lenght will be 16rFFFFFFFF *****"

	"***** Basic Offset Table with NO Item Value ******"
	aByteStream 
		nextPutAll: (self byteArrayFromValue: 16rFFFE size: 2);					"**** Item Tag (Group Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16rE000 size: 2);					"**** Item Tag (Element Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16r0000 size: 4).					"**** Zero Lenght ******"

	"***** First Fragment (Single Frame) of Pixel Data ******"
	aByteStream 
		nextPutAll: (self byteArrayFromValue: 16rFFFE size: 2); 					"**** Item Tag (Group Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16rE000 size: 2);					"**** Item Tag (Element Element Number) ******"
		nextPutAll: (self byteArrayFromValue: dataElement dataElementLength size: 4).	"**** Lenght of the fragment *****"
		"nextPutAll: (self byteArrayFromValue: dataElement length size: 4)."			"**** Lenght of the fragment *****"

	"Since the byte order in this transfer syntax is Little Endian, 
	revert the byte order of the OW values in the data element (assumed to be in Big Endian)"
       "1 to: dataElement lenght by: 2 do: [:index |"
	1 to: dataElement dataBytes size - 1 by: 2 do: [:index |
		aByteStream nextPut: (dataElement dataBytes at: index + 1).
		aByteStream nextPut: (dataElement dataBytes at: index).
	].

	aByteStream 
		nextPutAll: (self byteArrayFromValue: 16rFFFE size: 2);		"**** Sequence Delimiter Item Tag (Group Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16rE0DD size: 2);		"**** Sequence Delimiter Item Tag (Element Element Number) ******"
		nextPutAll: (self byteArrayFromValue: 16r0000 size: 4).		"**** Zero Lenght ******"
]

{ #category : #'data elements - header lenght' }
EncodedPixelDataEncapsulationTS class >> headerLengthOBDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM OB Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
EncodedPixelDataEncapsulationTS class >> headerLengthOWDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM OW Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #initialize }
EncodedPixelDataEncapsulationTS class >> initialize [
"
	Abstract Smalltalk Class for DICOM Transfer Syntaxes with 
	Pixel Data Encapsulation Encoder initialization - 
	Since this is an abstract class, that should not be directly used, it's 
	UID is set to a nil value - PRD 03.2001 - 04.2003
"
	UID := nil.
]

{ #category : #'next data element' }
EncodedPixelDataEncapsulationTS class >> nextDataElementOB: dicomPDVStream [
"
	Return the position in the dicomPDV byte array where starts the next data Element.
	tagPosition corresponds to the first byte of the 'current' data element.
	PRD 05-11.2001
"

	| writeStream length tag itemLenght |

	dicomPDVStream next: 2. 	"**** Skip 2 unused bytes ******"
	writeStream := WriteStream on: ByteArray new.
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	length = 16rFFFFFFFF ifFalse: [
		dicomPDVStream position: dicomPDVStream position - 12.
		writeStream nextPutAll: (dicomPDVStream next: 12 + length)
	]
	ifTrue: [
		"******* Repeatedly looks for the Item Tag *******"
		"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		[(groupNumber = 16rFFFE) & (elementNumber = 16rE000)] whileTrue: ["

		tag := self readDicomDataElementTag: dicomPDVStream.
		[tag isItemTag] whileTrue: [
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			dicomPDVStream position: dicomPDVStream position - 8.
			writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8).

			"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
			elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)."
			tag := self readDicomDataElementTag: dicomPDVStream.
		].

		tag isSequenceDelimitationElementTag ifTrue: [ 
		"(groupNumber = 16rFFFE) & (elementNumber = 16rE0DD) ifTrue:  ["
			"***** Sequence Delimitation Element Tag Found!!!!"
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			itemLenght = 16r00000000 ifTrue: [
				dicomPDVStream position: dicomPDVStream position - 8.
				writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8).
			]
			ifFalse: [self halt]. 		"***** More Problems.... *****"
		]
		ifFalse: [self halt]. 		"***** More Problems.... *****"
	].

	^writeStream contents.
]

{ #category : #'next data element' }
EncodedPixelDataEncapsulationTS class >> nextDataElementOW: dicomPDVStream [
"
	Return the position in the dicomPDV byte array where starts the next data Element.
	tagPosition corresponds to the first byte of the 'current' data element.
	PRD 05-11.2001
"

	| writeStream length groupNumber elementNumber tag itemLenght |

	dicomPDVStream next: 2. 	"**** Skip 2 unused bytes ******"
	writeStream := WriteStream on: ByteArray new.
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	length = 16rFFFFFFFF ifFalse: [
		dicomPDVStream position: dicomPDVStream position - 12.
		writeStream nextPutAll: (dicomPDVStream next: 12 + length)
	]
	ifTrue: [
		"******* Repeatedly looks for the Item Tag *******"
		"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		[(groupNumber = 16rFFFE) & (elementNumber = 16rE000)] whileTrue: ["
		tag := self readDicomDataElementTag: dicomPDVStream.
		[tag isItemTag] whileTrue: [
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			dicomPDVStream position: dicomPDVStream position - 8.
			writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8).

			"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
			elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)."
			tag := self readDicomDataElementTag: dicomPDVStream.
		].
		"(groupNumber = 16rFFFE) & (elementNumber = 16rE0DD) ifTrue:  ["
		tag isSequenceDelimitationElementTag ifTrue: [ 
			"***** Sequence Delimitation Element Tag Found!!!!"
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			itemLenght = 16r00000000 ifTrue: [
				dicomPDVStream position: dicomPDVStream position - 8.
				writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8).
			]
			ifFalse: [self halt]. 		"***** More Problems.... *****"
		]
		ifFalse: [self halt]. 		"***** More Problems.... *****"
	].

	^writeStream contents.
]

{ #category : #'PDV bytes' }
EncodedPixelDataEncapsulationTS class >> pdvBytesFromOBDataElement: dicomOBDataElement on: aByteStream [ 
	"This method assumes that the OB Data Element being encoded in
	a DICOM Stream contains only a single frame. See PS 3.5-2000 Item A.4.
	Answer a ByteArray with the byte-coding of a DICOM OB Data Element, 
	using the Dicom Big Endian with explicit VR Transfer Syntax Data
	Elements Encoding Rules.

	PRD 05-12.2001

	Speed optimization
	PRD 17.06.2002"

	" ****** 	Test if the data element is the pixel data data element *******"
	(dicomOBDataElement groupNumber = 16r7FE0)
		& (dicomOBDataElement elementNumber = 16r0010) 
			ifTrue: "***** If true then assume that it is already encoded and encapsulate it ******"
				[self encapsulateOBPixelDataElement: dicomOBDataElement
					on: aByteStream]
			ifFalse: "***** If not, proceed normally, as defined in the super class method *******"
				[super pdvBytesFromOBDataElement: dicomOBDataElement on: aByteStream]
]

{ #category : #'PDV bytes' }
EncodedPixelDataEncapsulationTS class >> pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"See PS 3.5-2000 Item A.4. Answer a ByteArray with the byte-coding
	of a DICOM OB Data Element, using the Dicom Big Endian with explicit
	VR Transfer Syntax Data Elements Encoding Rules.

	PRD 05-12.2001

	Speed optimization
	PRD 17.06.2002"

	" ****** 	Test if the data element is the pixel data data element *******
	***** If true then assume that it is already encoded and encapsulate it ******
	***** If not, proceed normally, as defined in the super class method *******"

	dicomOWDataElement groupNumber = 16r7FE0 & (dicomOWDataElement elementNumber = 16r0010)
		ifTrue: [ self encapsulateOWPixelDataElement: dicomOWDataElement on: aByteStream ]
		ifFalse: [ super pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream ]
]
