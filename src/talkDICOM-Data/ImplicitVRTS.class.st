Class {
	#name : #ImplicitVRTS,
	#superclass : #TransferSyntax,
	#category : #'talkDICOM-Data'
}

{ #category : #'class variables' }
ImplicitVRTS class >> bitpolisher [
	^ self subclassResponsibility
]

{ #category : #'encoding requirements' }
ImplicitVRTS class >> checkEncodingRequirements: aDicomImageIOD [

	^self subclassResponsibility
]

{ #category : #'data elements' }
ImplicitVRTS class >> dataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"Parse the given DICOM presentation data value (PDV) stream in order to
	 decode a data element. Additional information about the data element 
	 being decoded is stored in the data elements definition dictionary.
	 If no additional information is found in the data elements dictionary
	 or in the dictionary of private creator groups of data elements, a element
	 with the 'UN' value representation will be used to store the data element
	 data bytes. The return value will be an instance of one of the subclasses
	 of DataElement according to the decoded value representation. 
	 See PS 3.5-2000 Section 7 for more details.

	  September 2017: Included a dictionary of private creator groups
	                  of data elements;
	     15 May 2021: Split data element definition from the data element
	                  class hierarchy used to store the data elements parsed
	                  from the DICOM PDV stream bytes - Paulo R. Dellani"

	| dataElementTag aDataElement |
	dataElementTag := self readDicomDataElementTag: pdvStream.
	aDataElement := self
		dataElementSubclassInstanceFrom: dataElementTag
		from: dataElementsDefinition
		valueRepresentation: 'UN'.
	^ aDataElement parseDataBytesFrom: pdvStream transferSyntax: self; yourself.
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthAEDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM AE Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthASDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM AS Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthATDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM AT Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthCSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM CS Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthDADataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM DA Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthDSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM DS Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthDTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM DT Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthFDDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM FD Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthFLDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM FL Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthISDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM IS Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthLODataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM LO Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthLTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM LT Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthOBDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM OB Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthOWDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM OW Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthPNDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM PN Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSHDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SH Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSLDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SL Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSQDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SQ Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SS Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM ST Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthTMDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM TM Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUIDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UI Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthULDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UL Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUNDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UN Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM US Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UT Data Element - PRD 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #initialize }
ImplicitVRTS class >> initialize [
	"Abstract Smalltalk class for DICOM Transfer Syntaxes with 
	 Implicit Value Representation. Since this is an abstract
	 class, that should not be directly used, it's UID is set
	 to a nil value.
	
	 April 2004: Initial implementation - Paulo R. Dellani"

	UID := nil
]

{ #category : #testing }
ImplicitVRTS class >> isBigEndian [
	^ self subclassResponsibility
]

{ #category : #testing }
ImplicitVRTS class >> isLittleEndian [
	^ self subclassResponsibility
]

{ #category : #testing }
ImplicitVRTS class >> isVRExplicit [
	^ false
]

{ #category : #testing }
ImplicitVRTS class >> isVRImplicit [
	^ true
]

{ #category : #'next data element' }
ImplicitVRTS class >> nextDataElement: dicomPDVStream [
	"Parses the given PDV byte stream, copying the complete byte
	 encoding of the next data element into a ByteArray, which is
	 used as return value for the message. dicomPDVStream will be
	 positioned at the begining of the next next data element.

	    March 2017: Pharo Smalltalk implemnentation;
	 05 April 2021: Refactored the whole family of nextDataElement:;
	   16 May 2021: Reviwed implementation comments - Paulo R. Dellani"

	| length writeStream |
	"Skip the group number and element number 4 bytes"
	dicomPDVStream next: 4.
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	"In the transfer syntaxes with implicit VR, the length of 
	 the data element header is the same for all data element types"
	dicomPDVStream position: dicomPDVStream position - self shortDataElementHeaderLength.

	^ length = 16rFFFFFFFF ifTrue: [
		writeStream := WriteStream on: ByteArray new.
		writeStream nextPutAll: (dicomPDVStream next: self shortDataElementHeaderLength).
		self nextDataElementOfUndefinedLenght: dicomPDVStream writeStream: writeStream.
	] ifFalse: [
		self nextDataElementOfDefinedLenght: dicomPDVStream length: self shortDataElementHeaderLength + length. ]
]

{ #category : #'data elements' }
ImplicitVRTS class >> parseDeterminedLengthDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a fixed size DICOM data
	 element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"

	| length |
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	aDataElement encoder: self.
	aDataElement length: length.
	aDataElement dataBytes: (pdvStream next: length).
	^ aDataElement
]

{ #category : #'data elements' }
ImplicitVRTS class >> parseDicomOBDataElementDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'OB' DICOM data element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"

	^ self
		parseDeterminedLengthDataBytesFrom: pdvStream
		for: aDataElement
]

{ #category : #'data elements' }
ImplicitVRTS class >> parseDicomUNDataElementDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'UN' DICOM data element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"

	| length |
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	aDataElement length: length.
	length = 16rFFFFFFFF
		ifTrue: [ pdvStream position: pdvStream position - 8.
			aDataElement dataBytes: (self nextDataElement: pdvStream) ]
		ifFalse: [ 
			"In the case of a complete unknown data-set being decoded, 
			 check if the read lenght is really valid"
			length + 8 > pdvStream size
				ifFalse: [ aDataElement dataBytes: (pdvStream next: length) ]
				ifTrue: [ aDataElement dataBytes: pdvStream upToEnd ] ].
	aDataElement encoder: self.
	^ aDataElement
]

{ #category : #'data elements' }
ImplicitVRTS class >> parseDicomUTDataElementDataBytesFrom: pdvStream for: aDataElement [
	"Parse the given presentation data value byte stream, 
	 extracting the data bytes of a 'UT' DICOM data element.
	
	 15 May 2021: Initial implementation - Paulo R. Dellani"

	^ self
		parseDeterminedLengthDataBytesFrom: pdvStream
		for: aDataElement
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromAEDataElement: dicomAEDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AE Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomAEDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomAEDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomAEDataElement length size: 4);
		nextPutAll: dicomAEDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromASDataElement: dicomASDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AS Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomASDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomASDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomASDataElement length size: 4);
		nextPutAll: dicomASDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromATDataElement: dicomATDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AT Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomATDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomATDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomATDataElement length size: 4);
		nextPutAll: dicomATDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromCSDataElement: dicomCSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM CS Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomCSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomCSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomCSDataElement length size: 4);
		nextPutAll: dicomCSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromDADataElement: dicomDADataElement on: aByteStream [
	"Put the byte-coding of a DICOM DA Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomDADataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDADataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDADataElement length size: 4);
		nextPutAll: dicomDADataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromDSDataElement: dicomDSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM DS Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomDSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDSDataElement length size: 4);
		nextPutAll: dicomDSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromDTDataElement: dicomDTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM DT Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomDTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDTDataElement length size: 4);
		nextPutAll: dicomDTDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromFDDataElement: dicomFDDataElement on: aByteStream [
	"Put the byte-coding of a DICOM FD Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomFDDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomFDDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomFDDataElement length size: 4);
		nextPutAll: dicomFDDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromFLDataElement: dicomFLDataElement on: aByteStream [
	"Put the byte-coding of a DICOM FL Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomFLDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomFLDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomFLDataElement length size: 4);
		nextPutAll: dicomFLDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromISDataElement: dicomISDataElement on: aByteStream [
	"Put the byte-coding of a DICOM IS Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomISDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomISDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomISDataElement length size: 4);
		nextPutAll: dicomISDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromLODataElement: dicomLODataElement on: aByteStream [
	"Put the byte-coding of a DICOM LO Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomLODataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomLODataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomLODataElement length size: 4);
		nextPutAll: dicomLODataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromLTDataElement: dicomLTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM LT Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomLTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomLTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomLTDataElement length size: 4);
		nextPutAll: dicomLTDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromOBDataElement: dicomOBDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OB Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomOBDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOBDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOBDataElement length size: 4);
		nextPutAll: dicomOBDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromOWDataElement: dicomOWDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OW Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	^self subclassResponsibility
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromPNDataElement: dicomPNDataElement on: aByteStream [
	"Put the byte-coding of a DICOM PN Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomPNDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomPNDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomPNDataElement length size: 4);
		nextPutAll: dicomPNDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromSHDataElement: dicomSHDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SH Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSHDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSHDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSHDataElement length size: 4);
		nextPutAll: dicomSHDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromSLDataElement: dicomSLDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SL Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSLDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSLDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSLDataElement length size: 4);
		nextPutAll: dicomSLDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromSQDataElement: dicomSQDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SQ Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSQDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSQDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSQDataElement length size: 4);
		nextPutAll: dicomSQDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromSSDataElement: dicomSSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSSDataElement length size: 4);
		nextPutAll: dicomSSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromSTDataElement: dicomSTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM ST Data Element in to a ByteStream

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSTDataElement length size: 4);
		nextPutAll: dicomSTDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromTMDataElement: dicomTMDataElement on: aByteStream [
	"Put the byte-coding of a DICOM TM Data Element in to a ByteStream

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomTMDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomTMDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomTMDataElement length size: 4);
		nextPutAll: dicomTMDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromUIDataElement: dicomUIDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UI Data Element in to a ByteStream.

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUIDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUIDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUIDataElement length size: 4);
		nextPutAll: dicomUIDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromULDataElement: dicomULDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UL Data Element in to a ByteStream

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomULDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomULDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomULDataElement length size: 4);
		nextPutAll: dicomULDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromUNDataElement: dicomUNDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UN Data Element in to a ByteStream

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUNDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUNDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUNDataElement length size: 4);
		nextPutAll: dicomUNDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromUSDataElement: dicomUSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM US Data Element in to a ByteStream

	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUSDataElement length size: 4);
		nextPutAll: dicomUSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ImplicitVRTS class >> pdvBytesFromUTDataElement: dicomUTDataElement on: aByteStream [
"
	Put the byte-coding of a DICOM UT Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUTDataElement length size: 4);
		nextPutAll: dicomUTDataElement dataBytes
]

{ #category : #'byte/value handling' }
ImplicitVRTS class >> readDicomDataElementTag: aStream [
	"Read data element tag from the given byte stream, which is enconded as 
	a pair of 16 bit integers.
	
	PRD 05.2003 - 02.2016"

	^ self subclassResponsibility
]
