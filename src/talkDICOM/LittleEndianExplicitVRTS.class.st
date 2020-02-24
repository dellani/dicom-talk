"
Instance Variables:

PS 3.5-2000 Annex A (Normative) - Transfer Syntax Specifications

A.2 DICOM LITTLE ENDIAN TRANSFER SYNTAX (EXPLICIT VR)

This Transfer Syntax applies to the encoding of the entire DICOM Data Set. This implies that when a
DICOM Data Set is being encoded with the DICOM Little Endian Transfer Syntax the following
requirements shall be met:
	a)	The Data Elements contained in the Data Set structure shall be encoded with Explicit VR (with
		a VR Field) as specified in Section 7.1.2.
	b)	The encoding of the overall Data Set structure (Data Element Tags, Value Length, and Value)
		shall be in Little Endian as specified in Section 7.3.
	c)	The encoding of the Data Elements of the Data Set shall be as follows according to their Value
		Representations:
		-	For all Value Representations defined in this part, except for the Value Representations OB
			and OW, the encoding shall be in Little Endian as specified in Section 7.3.
		-	For the Value Representations OB and OW, the encoding shall meet the following specification
			depending on the Data Element Tag:
		-	Data Element (7FE0,0010) Pixel Data
			-	where Bits Allocated (0028,0100) has a value greater than 8 shall have Value
				Representation OW and shall be encoded in Little Endian;
			-	where Bits Allocated (0028,0100) has a value less than or equal to 8 shall have the
				Value Representation OB or OW and shall be encoded in Little Endian.
			-	Data Element (60xx,3000) Overlay Data
				-	shall have the Value Representation OB or OW and shall be encoded in Little Endian.
					
					Note: Previous versions of the Standard specified that the choice of OB or OW VR was
					based on whether or not Overlay Bits Allocated (60xx,0100) was greater than, or
					less than or equal to, 8. However, since only one bit plane can be encoded in
					each Overlay Data Element (60xx,3000), no value of Overlay Bits Allocated other
					than 1 makes sense. Such a restriction is now present in PS 3.3.
			-	Data Element (50xx,3000) Curve Data has the Value Representation specified in its
				Explicit VR Field. See the specification of the Curve Data Module in PS 3.3 for the
				enumerated list of allowable VRs. The component points shall be encoded in Little
				Endian.
			-	Data Element (5400,1010) Waveform Data has the Value Representation specified in its
				Explicit VR Field. The component points shall be encoded in Little Endian.
			-	Data Element (50xx,200C) Audio Sample Data has the Value Representation OB when
				Audio Sample Format (50xx,2002) specifies 8-bit values, and OW encoded in Little
				Endian when 16 bit values are specified. See the specification of the Audio Module in PS 3.3.
			-	Data Elements (0028,1201), (0028,1202), (0028,1203) Red, Green, Blue Palette Lookup
				Table Data have the Value Representation OW and shall be encoded in Little Endian.

				Note: Previous versions of the Standard either did not specify the encoding of these
				Data Elements in this Part, but specified a VR of US or SS in PS 3.6 (1993), or
				specified OW in this Part but a VR of US, SS or OW in PS 3.6 (1996). The actual
				encoding of the values and their byte order would be identical in each case,
				though the explicitly encoded VR field would be different. However, an explicit
				VR of US or SS cannot be used to encode a table of 2 16 elements, since the
				Value Length is restricted to 16 bits.

			-	Data Elements (0028,1101), (0028,1102),(0028,1103) Red, Green, Blue Palette Lookup
				Table Descriptor have the Value Representation SS or US (depending on rules specified
				in the IOD in PS 3.3), and shall be encoded in Little Endian. The first and third values are
				always interpreted as unsigned, regardless of the Value Representation.
			-	Data Elements (0028,1221), (0028,1222), (0028,1223) Segmented Red, Green, Blue
				Palette Color Lookup table Data have the Value Representation OW and shall be
				encoded in Little Endian.
			-	Data Element (0028,3006) Lookup Table Data has the Value Representation US, SS or
				OW and shall be encoded in Little Endian.

				Note: Previous versions of the Standard did not specify the encoding of these Data
				Elements in this Part, but specified a VR of US or SS in PS 3.6 (1998). However,
				an explicit VR of US or SS cannot be used to encode a table of 2 16 elements,
				since the Value Length is restricted to 16 bits. Hence a VR of OW has been
				added. The actual encoding of the values and their byte order would be identical
				in each case, though the explicitly encoded VR field would be different.
			-	Data Element (0028,3002) Lookup Table Descriptor has the Value Representation SS or
				US (depending on rules specified in the IOD in PS 3.3), and shall be encoded in Little
				Endian. The first and third values are always interpreted as unsigned, regardless of the
				Value Representation.

		Note: For Data encoded with the Value Representation OB, the Data encoding is unaffected by Little Endian
		or Big Endian byte ordering.

	This DICOM Explicit VR Little Endian Transfer Syntax shall be identified by a UID of Value ""1.2.840.10008.1.2.1.""
"
Class {
	#name : #LittleEndianExplicitVRTS,
	#superclass : #ExplicitVRTS,
	#category : #'talkDICOM-Data'
}

{ #category : #'as yet unclassified' }
LittleEndianExplicitVRTS class >> _dicomOWDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement byteArray |
	newDataElement := dataElementDefinition copy.
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 12."
	byteArray := pdvStream next: newDataElement length.

	"Swap byte order"
	1 to: length by: 2 do: [ :index | 
		byteArray swapByteAt: index with: index + 1
		"byte1 := byteArray at: index.
		byteArray at: index put: (byteArray at: index + 1).
		byteArray at: index + 1 put: byte1" ].
	newDataElement dataBytes: byteArray.
	^ newDataElement
]

{ #category : #'PDV bytes' }
LittleEndianExplicitVRTS class >> _pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OW Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	| dataBytes |

	aByteStream nextPutAll: (self byteArrayFromValue: dicomOWDataElement groupNumber size: 2).
	aByteStream nextPutAll: (self byteArrayFromValue: dicomOWDataElement elementNumber size: 2).
	aByteStream nextPutAll: (self byteArrayFromString: dicomOWDataElement vr).
	aByteStream nextPut: 16r00.
	aByteStream nextPut: 16r00.
	aByteStream nextPutAll: (self byteArrayFromValue: dicomOWDataElement length size: 4).

	dataBytes := dicomOWDataElement dataBytes.
	dicomOWDataElement length odd ifTrue: [
		1 to: dicomOWDataElement length - 1 by: 2 do: [:index |
			aByteStream nextPut: (dataBytes at: index + 1).
			aByteStream nextPut: (dataBytes at: index).
		].
	] ifFalse: [ 
		1 to: dicomOWDataElement length by: 2 do: [:index |
			aByteStream nextPut: (dataBytes at: index + 1).
			aByteStream nextPut: (dataBytes at: index).
		].
	].
]

{ #category : #'class variables' }
LittleEndianExplicitVRTS class >> bitpolisher [
	^ LittleEndianBitPolisher
]

{ #category : #'encoding requirements' }
LittleEndianExplicitVRTS class >> checkEncodingRequirements: aDicomImageIOD [
]

{ #category : #'data elements' }
LittleEndianExplicitVRTS class >> dicomOWDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement byteArray byte1 index2 |
	newDataElement := dataElementDefinition copy.
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 12."
	byteArray := pdvStream next: newDataElement length.

	"Swap byte order"
	1 to: length by: 2 do: [ :index | 
		index2 := index + 1.
		byte1 := byteArray byteAt: index.
		byteArray byteAt: index put: (byteArray byteAt: index2).
		byteArray byteAt: index2 put: byte1

		"byteArray swapByteAt: index with: index + 1"
		"byte1 := byteArray at: index.
		byteArray at: index put: (byteArray at: index + 1).
		byteArray at: index + 1 put: byte1" ].
	newDataElement dataBytes: byteArray.
	^ newDataElement
]

{ #category : #initialize }
LittleEndianExplicitVRTS class >> initialize [

	UID := '1.2.840.10008.1.2.1'.		"DICOM Explicit VR Little Endian Transfer Syntax UID"
	self registerMyself.
]

{ #category : #testing }
LittleEndianExplicitVRTS class >> isBigEndian [

	^false
]

{ #category : #testing }
LittleEndianExplicitVRTS class >> isLittleEndian [

	^true
]

{ #category : #'PDV bytes' }
LittleEndianExplicitVRTS class >> pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OW Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	| dataBytes byteArray |
	aByteStream
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomOWDataElement vr);
		nextPut: 16r00;
		nextPut: 16r00;
		nextPutAll: (self byteArrayFromValue: dicomOWDataElement length size: 4).

	byteArray := ByteArray new: dicomOWDataElement dataBytes size.
	dataBytes := dicomOWDataElement dataBytes.

	dicomOWDataElement length odd
		ifTrue: [ byteArray := ByteArray new: dicomOWDataElement length + 1.
			1 to: dicomOWDataElement length - 1 by: 2 do: [ :index | 
				byteArray at: index put: (dataBytes at: index + 1).
				byteArray at: index + 1 put: (dataBytes at: index) ].
			byteArray at: dicomOWDataElement length put: 16r00.
			byteArray at: dicomOWDataElement length + 1 put: (dataBytes at: dicomOWDataElement length) ]
		ifFalse: [ byteArray := ByteArray new: dicomOWDataElement dataBytes size.
			1 to: dicomOWDataElement length by: 2 do: [ :index | 
				byteArray at: index put: (dataBytes at: index + 1).
				byteArray at: index + 1 put: (dataBytes at: index) ] ].

	aByteStream nextPutAll: byteArray
]

{ #category : #'byte/value handling' }
LittleEndianExplicitVRTS class >> readDicomDataElementTag: aStream [
	"Read data element tag from the given byte stream, which is enconded as 
	a pair of 16 bit integers.
	
	PRD 03.2017"

	| tag |
	tag := DataElementTag new.
	tag groupNumber: aStream next + (aStream next bitShift: 8).
	tag elementNumber: aStream next + (aStream next bitShift: 8).
	^ tag
]
