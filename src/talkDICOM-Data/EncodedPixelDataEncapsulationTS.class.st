Class {
	#name : #EncodedPixelDataEncapsulationTS,
	#superclass : #LittleEndianExplicitVRTS,
	#category : #'talkDICOM-Data'
}

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
	
	March 2017: Initial implementation - Paulo R. Dellani"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
EncodedPixelDataEncapsulationTS class >> headerLengthOWDataElement [
	"Return the number of bytes used in the header (group number
	 + element number + vr + length) of a DICOM OW Data Element.
	
	 March 2017: Initial implementation - Paulo R. Dellani"

	^ self shortDataElementHeaderLength
]

{ #category : #initialize }
EncodedPixelDataEncapsulationTS class >> initialize [
	"Abstract Smalltalk class for DICOM Transfer Syntaxes with 
	 Pixel Data Encapsulation Encoder. Since this is an abstract
	 class, that should not be directly used, it's UID is set
	 to a nil value.
	
	 April 2004: Initial implementation - Paulo R. Dellani"

	UID := nil
]

{ #category : #'next data element' }
EncodedPixelDataEncapsulationTS class >> nextDataElementOB: dicomPDVStream [
	"Parses the given PDV byte stream, copying the complete byte
	 encoding of the next OB data element into a ByteArray, which
	 is used as return value for the message. dicomPDVStream will be
	 positioned at the begining of the next next data element.

  	    March 2017: Pharo Smalltalk implemnentation;
	 05 April 2021: Refactored the whole family of nextDataElement:;
 	   16 May 2021: Refactored the former implementation of this method
	                into nextDataElementOBOW:;
	   16 May 2021: Reviwed implementation comments  - Paulo R. Dellani"

	^ self nextDataElementOBOW: dicomPDVStream
]

{ #category : #'next data element - private' }
EncodedPixelDataEncapsulationTS class >> nextDataElementOBOW: dicomPDVStream [
	"Parses the given PDV byte stream, copying the complete byte
	 encoding of the next OB or OW data element into a ByteArray,
	 which is used as return value for the message. dicomPDVStream
	 will be positioned at the begining of the next next data element.

  	    March 2017: Pharo Smalltalk implemnentation;
	 05 April 2021: Refactored the whole family of nextDataElement:;
	 16 May 2021: Implemented this method as the result of refactoring 
	              former methods nextDataElementOB: and nextDataElementOW:
	              - Paulo R. Dellani"

	| writeStream length tag itemLenght |

	dicomPDVStream next: 2. 	"**** Skip 2 unused bytes ******"
	writeStream := WriteStream on: ByteArray new.

	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	length = 16rFFFFFFFF 
		ifFalse: [
			dicomPDVStream position: dicomPDVStream position - 12.
			writeStream nextPutAll: (dicomPDVStream next: 12 + length) ]
		ifTrue: [
			"******* Repeatedly looks for the Item Tag *******"
			[ tag := self readDicomDataElementTag: dicomPDVStream.
			 tag isItemTag ] whileTrue: [
				itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
				dicomPDVStream position: dicomPDVStream position - 8.
				writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8) ].

			tag isSequenceDelimitationElementTag 
				ifTrue: [
					"***** Sequence Delimitation Element Tag Found!!!!"
					itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
					itemLenght = 16r00000000 
						ifTrue: [
							dicomPDVStream position: dicomPDVStream position - 8.
							writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8) ]
						ifFalse: [ Error signal: 'Error decoding encapsulated OB data element of undefined length: ' ,
							                      'Sequence delimitation element tag with length different than zero found!' ] ]
				ifFalse: [ Error signal: 'Error decoding encapsulated OB data element of undefined length: ' ,
			                      		'Sequence delimitation element tag not found!' ] ].
	^ writeStream contents.
]

{ #category : #'next data element' }
EncodedPixelDataEncapsulationTS class >> nextDataElementOW: dicomPDVStream [
	"Parses the given PDV byte stream, copying the complete byte
	 encoding of the next OW data element into a ByteArray, which
	 is used as return value for the message. dicomPDVStream will be
	 positioned at the begining of the next next data element.

  	    March 2017: Pharo Smalltalk implemnentation;
	 05 April 2021: Refactored the whole family of nextDataElement:;
 	   16 May 2021: Refactored the former implementation of this method
	                into nextDataElementOBOW:;
	   16 May 2021: Reviwed implementation comments  - Paulo R. Dellani"

	^ self nextDataElementOBOW: dicomPDVStream
]

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> parseDicomOBDataElementDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'OB' DICOM data element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"
	
	| length newDataElement |
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue: [
			self parseDicomOBOWUnLenDataElementDataBytesFrom: pdvStream for: aDataElement ]
		ifFalse: [ 
			aDataElement encoder: self.
			aDataElement length: length.
			aDataElement dataBytes: (pdvStream next: length).
			newDataElement := aDataElement ].
	^ newDataElement
]

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> parseDicomOBOWUnLenDataElementDataBytesFrom: dicomPDVStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'OB' DICOM data element.
	 This will parse an 'OB' data element of undefined length.
	 More details in PS 3.5-2000 Section 7.5
	
	 18 March 2017: Initial implementation;
      16 May 2021: Split data element definition from the data element
	                class hierarchy used to store the data elements parsed
	                from the DICOM PDV stream bytes - Paulo R. Dellani"
	
	| itemLenght writeStream tag |

	writeStream := WriteStream on: ByteArray new.

	"******* Repeatedly looks for the Item Tag *******"
	[ tag := self readDicomDataElementTag: dicomPDVStream.
	  tag isItemTag ] whileTrue: [
		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		dicomPDVStream position: dicomPDVStream position - 8.
		writeStream nextPutAll: (dicomPDVStream next: itemLenght + 8) ].

	tag isSequenceDelimitationElementTag 
		ifTrue: [ "***** Sequence Delimitation Element Tag Found!!!!"
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			itemLenght = 16r00000000 
				ifTrue: [
					dicomPDVStream position: dicomPDVStream position - 8.
					writeStream nextPutAll: (dicomPDVStream next: 8).
					aDataElement encoder: self.
					aDataElement length: 16rFFFFFFFF.
					aDataElement dataBytes: writeStream contents ]
				ifFalse: [ Error signal: 'Error decoding encapsulated OB data element of undefined length: ' ,
							                      'Sequence delimitation element tag with length different than zero found!' ] 	]
		ifFalse: [ Error signal: 'Error decoding encapsulated OB data element of undefined length: ' ,
			                      		'Sequence delimitation element tag not found!' ]. 		"***** More Problems.... *****"
	^ aDataElement
]

{ #category : #'data elements' }
EncodedPixelDataEncapsulationTS class >> parseDicomOWDataElementDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'OW' DICOM data element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"

	| length byteArray byte1 |
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue: [ 
			self parseDicomOBOWUnLenDataElementDataBytesFrom: pdvStream for: aDataElement ]
		ifFalse: [ 
			aDataElement encoder: self.
			aDataElement length: length.

			byteArray := pdvStream next: aDataElement length.
			"Swap byte order"
			1 to: length by: 2 do: [ :index | 
				byte1 := byteArray at: index.
				byteArray at: index put: (byteArray at: index + 1).
				byteArray at: index + 1 put: byte1 ].

			aDataElement dataBytes: byteArray ].
	^ aDataElement
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
				[ self encapsulateOBPixelDataElement: dicomOBDataElement
					on: aByteStream ]
			ifFalse: "***** If not, proceed normally, as defined in the super class method *******"
				[ super pdvBytesFromOBDataElement: dicomOBDataElement on: aByteStream ]
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
