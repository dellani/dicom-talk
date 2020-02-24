"
Instance Variables:

PS 3.5-2000 Annex A (Normative) - Transfer Syntax Specifications

A.1 DICOM IMPLICIT VR LITTLE ENDIAN TRANSFER SYNTAX

This Transfer Syntax applies to the encoding of the entire DICOM Data Set. This implies that when a
DICOM Data Set is being encoded with the DICOM Implicit VR Little Endian Transfer Syntax the following
requirements shall be met:
	a) 	The Data Elements contained in the Data Set structure shall be encoded with Implicit VR
		(without a VR Field) as specified in Section 7.1.3.
	b) 	The encoding of the overall Data Set structure (Data Element Tags, Value Length, and Value)
		shall be in Little Endian as specified in Section 7.3.
	c) 	The encoding of the Data Elements of the Data Set shall be as follows according to their Value
		Representations:
		- 	For all Value Representations defined in this part, except for the Value Representations
			OB and OW, the encoding shall be in Little Endian as specified in Section 7.3.
		-	For the Value Representations OB and OW, the encoding shall meet the following
			specification depending on the Data Element Tag:
		-	Data Element (7FE0,0010) Pixel Data has the Value Representation OW and shall
			be encoded in Little Endian.
		-	Data Element (60xx,3000) Overlay Data has the Value Representation OW and shall
			be encoded in Little Endian.
		-	Data Element (50xx,3000) Curve Data has the Value Representation OB with its
			component points (n-tuples) having the Value Representation specified in Data
			Value Representation (50xx,0103). The component points shall be encoded in Little
			Endian.
		- 	Data Element (5400,1010) Waveform Data shall have Value Representation OW
			and shall be encoded in Little Endian.
		-	Data Element (50xx,200C) Audio Sample Data has the Value Representation OB
			when Audio Sample Format (50xx,2002) specifies 8-bit values, and OW encoded in
			Little Endian when 16 bit values are specified. See the specification of the Audio
			Module in PS 3.3.
		-	Data Elements (0028,1201), (0028,1202),(0028,1203) Red, Green, Blue Palette
			Lookup Table Data have the Value Representation OW and shall be encoded in
			Little Endian.
			Note: Previous versions of the Standard either did not specify the encoding of these Data
			Elements in this Part, but specified a VR of US or SS in PS 3.6 (1993), or specified
			OW in this Part but a VR of US, SS or OW in PS 3.6 (1996). The actual encoding
			of the values and their byte order would be identical in each case.
		-	Data Elements (0028,1101), (0028,1102),(0028,1103) Red, Green, Blue Palette
			Lookup Table Descriptor have the Value Representation SS or US (depending on
			rules specified in the IOD in PS 3.3), and shall be encoded in Little Endian. The first
			and third values are always interpreted as unsigned, regardless of the Value
			Representation.
		-	Data Elements (0028,1221),(0028,1222),(0028,1223) Segmented Red, Green, Blue
			Palette Color Lookup table Data have the Value Representation OW and shall be
			encoded in Little Endian.
		-	Data Element (0028,3006) Lookup Table Data has the Value Representation US, SS
			or OW and shall be encoded in Little Endian.
			Note: Previous versions of the Standard did not specify the encoding of these Data
			Elements in this Part, but specified a VR of US or SS in PS 3.6 (1998). A VR of
			OW has been added to support explicit VR transfer syntaxes. The actual encoding
			of the values and their byte order would be identical in each case.
		-	Data Element (0028,3002) Lookup Table Descriptor has the Value Representation
			SS or US (depending on rules specified in the IOD in PS 3.3), and shall be encoded
			in Little Endian. The first and third values are always interpreted as unsigned,
			regardless of the Value Representation.

This DICOM Implicit VR Little Endian Transfer Syntax shall be identified by a UID of Value ""1.2.840.10008.1.2.""
"
Class {
	#name : #LittleEndianImplicitVRTS,
	#superclass : #ImplicitVRTS,
	#category : #'talkDICOM-Data'
}

{ #category : #'class variables' }
LittleEndianImplicitVRTS class >> bitpolisher [
	^ LittleEndianBitPolisher
]

{ #category : #'encoding requirements' }
LittleEndianImplicitVRTS class >> checkEncodingRequirements: aDicomImageIOD [
]

{ #category : #'data elements' }
LittleEndianImplicitVRTS class >> dicomOWDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement byteArray byte1 |
	newDataElement := dataElementDefinition copy.
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 8."
	byteArray := pdvStream next: length.

	"Swap byte order"
	1 to: length by: 2 do: [ :index | 
		byte1 := byteArray at: index.
		byteArray at: index put: (byteArray at: index + 1).
		byteArray at: index + 1 put: byte1 ].
	newDataElement dataBytes: byteArray.
	^ newDataElement
]

{ #category : #initialize }
LittleEndianImplicitVRTS class >> initialize [

	UID := '1.2.840.10008.1.2'.		"DICOM Implicit VR Little Endian Transfer Syntax UID"
	self registerMyself.
]

{ #category : #testing }
LittleEndianImplicitVRTS class >> isBigEndian [

	^false
]

{ #category : #testing }
LittleEndianImplicitVRTS class >> isLittleEndian [

	^true
]

{ #category : #'PDV bytes' }
LittleEndianImplicitVRTS class >> pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OW Data Element in to a ByteStream

	PRD - February 07th, 2003"
	
	| dataBytes |

	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement length size: 4).
	dataBytes := dicomOWDataElement dataBytes.
	1 to: dicomOWDataElement length by: 2 do: [:index |
		aByteStream nextPut: (dataBytes at: index + 1).
		aByteStream nextPut: (dataBytes at: index)].
]

{ #category : #'byte/value handling' }
LittleEndianImplicitVRTS class >> readDicomDataElementTag: aStream [
	"Read data element tag from the given byte stream, which is enconded as 
	a pair of 16 bit integers.
	
	PRD 05.2003 - 02.2016, 03.2017"

	| tag |
	tag := DataElementTag new.
	tag groupNumber: aStream next + (aStream next * 256).
	tag elementNumber: aStream next + (aStream next * 256).
	^ tag
]
