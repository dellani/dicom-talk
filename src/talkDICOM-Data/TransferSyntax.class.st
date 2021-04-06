"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

Abstract Smalltalk Class for DICOM Transfer Syntaxes Encoder

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
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
	^ DicomRegistry TransferSyntaxes at: anUID ifAbsent: [ nil ]
]

{ #category : #accessing }
TransferSyntax class >> UID [
	^ UID
]

{ #category : #'class variables' }
TransferSyntax class >> bitpolisher [
	^ self subclassResponsibility
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

{ #category : #'data elements' }
TransferSyntax class >> dicomSQDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement writeStream pdvBytes |
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF ifTrue: [
		newDataElement := dataElementDefinition copy.
		newDataElement length: 16rFFFFFFFF.

		writeStream := WriteStream on: ByteArray new.
		pdvBytes := self nextDataElementOfUndefinedLenght: pdvStream writeStream: writeStream.
		newDataElement dataBytes: pdvBytes.
		"pdvBytes := self dicomSQUnLenDataElementFrom: pdvStream writeStream: writeStream."
		"pdvBytes := self dicomSQUnLenDataElementFrom: pdvStream definition: dataElementDefinition."
		"newDataElement := self dicomSQUnLenDataElementFrom: pdvStream definition: dataElementDefinition"

	 ] ifFalse: [
		newDataElement := dataElementDefinition copy.
		newDataElement length: length.
		newDataElement dataBytes: (pdvStream next: length)
	].
	newDataElement encoder: self.
	^ newDataElement
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

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthAEDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM AE Data Element - PRD 03.2017"

	^ self subclassResponsibility
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthASDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM AS Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthATDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM AT Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthCSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM CS Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthDADataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM DA Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthDSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM DS Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthDTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM DT Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthFDDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM FD Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthFLDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM FL Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthISDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM IS Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthLODataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM LO Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthLTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM LT Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthOBDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM OB Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthOWDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM OW Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthPNDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM PN Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthSHDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SH Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthSLDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SL Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthSQDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SQ Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthSSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM SS Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthSTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM ST Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthTMDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM TM Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthUIDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UI Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthULDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UL Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthUNDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UN Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthUSDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM US Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #'data elements - header lenght' }
TransferSyntax class >> headerLengthUTDataElement [
	"Return the number of bytes used in the header (group number +
	 element number + vr + length) of a DICOM UT Data Element - PRD 03.2017"

	^ self subclassResponsibility 
]

{ #category : #initialize }
TransferSyntax class >> initialize [
	"Abstract Smalltalk Class for DICOM Transfer Syntaxes Encoder initialization - PRD 03.2001 - 04.2003
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

{ #category : #'next data element' }
TransferSyntax class >> nextDataElement: dicomPDVStream [
	"Discover the position where the next data element begins in dicomPDVStream.
	PRD 03.2017, April 05, 2021"

	^ self subclassResponsibility
]

{ #category : #'next data element' }
TransferSyntax class >> nextDataElementOfDefinedLenght: dicomPDVStream length: length [
	"Length corresponds to the byte size of the complete data element, 
	 including the data element header, not the length of the encoded
	 value. PRD - April 05 2021"

	^ dicomPDVStream next: length
]

{ #category : #'next data element' }
TransferSyntax class >> nextDataElementOfUndefinedLenght: dicomPDVStream writeStream: writeStream [
	"Discover the position where the next data element begins in dicomPDVStream.
	 The current data element is of undefined lenght. PRD - 03.2017, 04.2021"
	| tag itemLenght |

	"**** Ok, we have an data element of undefined lenght. Let's search where
			the data element's end position begins *******"
	"******* Repeatedly looks for the Item Tag *******"
	tag := self readDicomDataElementTag: dicomPDVStream.
	[ tag isItemTag ] whileTrue: [
		dicomPDVStream position: dicomPDVStream position - 4.
		writeStream nextPutAll: (dicomPDVStream next: 4).

		itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
		itemLenght = 16rFFFFFFFF ifTrue: [	"**** Items with undefined lenght.... ****"
			dicomPDVStream position: dicomPDVStream position - 4.
			writeStream nextPutAll: (dicomPDVStream next: 4).

			"**** Searches for the Item Delimitation Element Tag *****"
			tag := self readDicomDataElementTag: dicomPDVStream.
			[ tag isItemDelimitationElementTag ] whileFalse: [
				dicomPDVStream position: dicomPDVStream position - 4.
				"****** recursive call 'nextDataElement: dicomPDVStream' ******"
				writeStream nextPutAll: (self nextDataElement: dicomPDVStream).
				tag := self readDicomDataElementTag: dicomPDVStream.
			].
			"**** We have found the Item Delimitation Element Tag. Now get its lenght ******"
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			"**** The lenght of an item delimitaion element tag shall
			      be equal to 0x00000000 ****"
			itemLenght = 16r00000000 ifFalse: [
				Error signal: 
					'Decoding error: Found Item Delimitation Element Tag with length different than 16r00000000!'
			] ifTrue: [
				dicomPDVStream position: dicomPDVStream position - 8.
				writeStream nextPutAll: (dicomPDVStream next: 8).
			]
		]
		ifFalse: [
			dicomPDVStream position: dicomPDVStream position - 4.
			writeStream nextPutAll: (dicomPDVStream next: itemLenght + 4)
		].
		tag := self readDicomDataElementTag: dicomPDVStream.
	].

	tag isSequenceDelimitationElementTag ifTrue: [ 
		"***** Sequence Delimitation Element Tag Found!!!! The lenght of
		       an sequence delimitaion element tag shall be equal to 0x00000000 ****"
		itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
		itemLenght = 16r00000000 ifFalse: [
			Error signal: 
				'Decoding error: Found Sequence Delimitation Element Tag with length different than 16r00000000!'
		] ifTrue: [
			dicomPDVStream position: dicomPDVStream position - 8.
			writeStream nextPutAll: (dicomPDVStream next: 8).
		]
	]
	ifFalse: [
		Error signal: 
			'Decoding error: Sequence Delimitation Element Tag not found!'
	].
	^ writeStream contents
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
