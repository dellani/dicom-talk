"
Instance Variables:

PS 3.5-2000 Annex A (Normative) - Transfer Syntax Specifications

A.3 - DICOM BIG ENDIAN TRANSFER SYNTAX (EXPLICIT VR)

This Transfer Syntax applies to the encoding of the entire DICOM Data Set. This implies that when a
DICOM Data Set is being encoded with the DICOM Big Endian Transfer Syntax the following requirements
shall be met:
	a) 	The Data Elements contained in the Data Set structure shall be encoded with Explicit VR (with
		a VR Field) as specified in Section 7.1.2.
	b) 	The encoding of the overall Data Set structure (Data Element Tags, Value Length, and Value)
		shall be in Big Endian as specified in Section 7.3.
	c) 	The encoding of the Data Elements of the Data Set shall be as follows according to their Value
		Representations:
		-	For all Value Representations defined in this part, except for the Value Representations OB
			and OW, the encoding shall be in Big Endian as specified in Section 7.3.
		-	For the Value Representations OB and OW, the encoding shall meet the following specification
			depending on the Data Element Tag:
			- 	Data Element (7FE0,0010) Pixel Data
				- 	where Bits Allocated (0028,0100) has a value greater than 8 shall have Value
				Representation OW and shall be encoded in Big Endian;
				-	where Bits Allocated (0028,0100) has a value less than or equal to 8 shall have the
				Value Representation OB or OW and shall be encoded in Big Endian.
			-	Data Element (60xx,3000) Overlay Data
				-	shall have the Value Representation OB or OW and shall be encoded in Big Endian.
					Note: Previous versions of the Standard specified that the choice of OB or OW VR was
					based on whether or not Overlay Bits Allocated (60xx,0100) was greater than, or
					less than or equal to, 8. However, since only one bit plane can be encoded in
					each Overlay Data Element (60xx,3000), no value of Overlay Bits Allocated other
					than 1 makes sense. Such a restriction is now present in PS 3.3.
			-	Data Element (50xx,3000) Curve Data has the Value Representation specified in its
				Explicit VR Field. See the specification of the Curve Data Module in PS 3.3 for the
				enumerated list of allowable VRs. The component points shall be encoded in Big Endian.
			-	Data Element (5400,1010) Waveform Data has the Value Representation specified in its
				Explicit VR Field. The component points shall be encoded in Big Endian.
			-	Data Element (50xx,200C) Audio Sample Data has the Value Representation OB when
				Audio Sample Format (50xx,2002) specifies 8-bit values, and OW encoded in Big Endian
				when 16 bit values are specified. See the specification of the Audio Module in PS 3.3.
			-	Data Elements (0028,1201), (0028,1202), (0028,1203) Red, Green, Blue Palette Lookup
				Table Data have the Value Representation OW and shall be encoded in Big Endian.
				Note: Previous versions of the Standard either did not specify the encoding of these
				Data Elements in this Part, but specified a VR of US or SS in PS 3.6 (1993), or
				specified OW in this Part but a VR of US, SS or OW in PS 3.6 (1996). The actual
				encoding of the values and their byte order would be identical in each case,
				though the explicitly encoded VR field would be different. However, an explicit
				VR of US or SS cannot be used to encode a table of 2 16 elements, since the
				Value Length is restricted to 16 bits.
			-	Data Elements (0028,1101), (0028,1102),(0028,1103) Red, Green, Blue Palette Lookup
				Table Descriptor have the Value Representation SS or US (depending on rules specified
				in the IOD in PS 3.3), and shall be encoded in Big Endian. The first and third values are
				always interpreted as unsigned, regardless of the Value Representation.
			-	Data Elements (0028,1221), (0028,1222), (0028,1223) Segmented Red, Green, Blue
				Palette Color Lookup table Data have the Value Representation OW and shall be
				encoded in Big Endian.
			-	Data Element (0028,3006) Lookup Table Data has the Value Representation US, SS or
				OW and shall be encoded in Big Endian.
				Note: Previous versions of the Standard did not specify the encoding of these Data
				Elements in this Part, but specified a VR of US or SS in PS 3.6 (1998). However,
				an explicit VR of US or SS cannot be used to encode a table of 2 16 elements,
				since the Value Length is restricted to 16 bits. Hence a VR of OW has been
				added. The actual encoding of the values and their byte order would be identical
				in each case, though the explicitly encoded VR field would be different.
			-	Data Element (0028,3002) Lookup Table Descriptor has the Value Representation SS or
				US (depending on rules specified in the IOD in PS 3.3), and shall be encoded in Big
				Endian. The first and third values are always interpreted as unsigned, regardless of the
				Value Representation.
		Note: For Data encoded with the Value Representation OB, the Data encoding is unaffected by Little Endian
		or Big Endian byte ordering.

	This DICOM Explicit VR Big Endian Transfer Syntax shall be identified by a UID of Value ""1.2.840.10008.1.2.2.""
"
Class {
	#name : #BigEndianExplicitVRTS,
	#superclass : #ExplicitVRTS,
	#category : #'talkDICOM-Data'
}

{ #category : #'class constants' }
BigEndianExplicitVRTS class >> bitpolisher [
	^ BigEndianBitPolisher
]

{ #category : #'encoding requirements' }
BigEndianExplicitVRTS class >> checkEncodingRequirements: aDicomImageIOD [
]

{ #category : #initialize }
BigEndianExplicitVRTS class >> initialize [

	UID := '1.2.840.10008.1.2.2'.		"DICOM Explicit VR Big Endian Transfer Syntax UID"
	self registerMyself.
]

{ #category : #testing }
BigEndianExplicitVRTS class >> isBigEndian [
	^ true
]

{ #category : #testing }
BigEndianExplicitVRTS class >> isLittleEndian [
	^ false
]

{ #category : #'data elements' }
BigEndianExplicitVRTS class >> parseDicomOWDataElementDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'OW' DICOM data element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"

	| length |
	
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	aDataElement encoder: self.
	aDataElement length: length.
	aDataElement dataBytes: (pdvStream next: length).
	^ aDataElement
]

{ #category : #'PDV bytes' }
BigEndianExplicitVRTS class >> pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OW Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomOWDataElement vr);
		nextPut: 16r00;
		nextPut: 16r00;
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement length size: 4);
		nextPutAll: dicomOWDataElement dataBytes.
]

{ #category : #'byte/value handling' }
BigEndianExplicitVRTS class >> readDicomDataElementTag: aStream [
	"Read data element tag from the given byte stream, which is enconded as 
	a pair of 16 bit integers.
	
	PRD 05.2003 - 02.2016, 03.2017"

	| tag |
	tag := DataElementTag new.
	tag groupNumber: aStream next * 256 + aStream next.
	tag elementNumber: aStream next * 256 + aStream next.
	^ tag
]
