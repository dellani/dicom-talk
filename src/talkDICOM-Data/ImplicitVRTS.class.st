Class {
	#name : #ImplicitVRTS,
	#superclass : #TransferSyntax,
	#category : #'talkDICOM-Data'
}

{ #category : #deprecated }
ImplicitVRTS class >> _dataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"See comments on the super class method implementation

	PRD 10-11.2001, 05.2002, 05.2003, 04.2004, 02.2016, 03.2017"

	| elementTag dataElementDefinition |
	elementTag := self readDicomDataElementTag: pdvStream.

	"dataElementDefinition := self dataElementDefinion: elementTag from: dataElementsDefinition valueRepresentation: 'UN'."
	dataElementDefinition := dataElementsDefinition
		at: elementTag
		ifAbsent: [ "Item delimitation data element for an unknown group?"
			elementTag isGroupLengthDataElement
				ifTrue: [ ULDataElement new
						tag: elementTag;
						name: (self privateGroupLengthDataElementNameFrom: elementTag) asSymbol;
						vm: '1';
						description: 'Private Group Length Data Element with tag equal to: ' , elementTag printString;
						type: '3';
						yourself ]
				ifFalse: [ "Check if the data element tag is otherwise known, if not, create one instance based on the known VR"
					"elementTag = (DataElementTag new groupNumber: 16r400; elementNumber: 16r561; yourself) ifTrue: [self halt]."
					DicomRegistry DataDictionary
						at: elementTag
						ifAbsent: [ UNDataElement new
								tag: elementTag;
								name: (self privateDataElementNameFrom: elementTag) asSymbol;
								vm: '1';
								description: 'Private Data Element with tag equal to: ' , elementTag printString;
								type: '3';
								yourself ] ] ].
	^ dataElementDefinition createInstanceFrom: pdvStream transferSyntax: self
]

{ #category : #'class variables' }
ImplicitVRTS class >> bitpolisher [
	^ self subclassResponsibility
]

{ #category : #'blitz!' }
ImplicitVRTS class >> blitzDataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"See comments on the super class method implementation

	PRD 10-11.2001, 05.2002, 05.2003, 04.2004, 02.2016, 03.2017, 09.2017"

	| elementTag dataElementDefinition |
	elementTag := self readDicomDataElementTag: pdvStream.
	"elementTag groupNumber = 16r0019 & (elementTag elementNumber = 16r0010)
		ifTrue: [ self halt ]."
	dataElementDefinition := self dataElementDefinion: elementTag from: dataElementsDefinition valueRepresentation: 'UN'.
	^ dataElementDefinition createInstanceFrom: pdvStream transferSyntax: self
]

{ #category : #'encoding requirements' }
ImplicitVRTS class >> checkEncodingRequirements: aDicomImageIOD [

	^self subclassResponsibility
]

{ #category : #'data elements' }
ImplicitVRTS class >> dataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"See comments on the super class method implementation

	PRD 10-11.2001, 05.2002, 05.2003, 04.2004, 02.2016, 03.2017, 09.2017"

	| elementTag dataElementDefinition |
	elementTag := self readDicomDataElementTag: pdvStream.
	"elementTag groupNumber = 16r0019 & (elementTag elementNumber = 16r0010)
		ifTrue: [ self halt ]."
	dataElementDefinition := self dataElementDefinion: elementTag from: dataElementsDefinition valueRepresentation: 'UN'.
	^ dataElementDefinition createInstanceFrom: pdvStream transferSyntax: self
]

{ #category : #deprecated }
ImplicitVRTS class >> dataElementHeaderLenght: aDataElement [
	"Return the number of bytes used in the header (group number + 
	element number + length) of a DICOM Data Element - PRD 05-11.2001"

	^ 8
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomAEDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomASDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomCSDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomDSDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomDTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomISDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomLODataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomLTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomOBDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomPNDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomSHDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomSTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomTMDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomUIDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomUNDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement := dataElementDefinition copy.
	newDataElement length: length.
	length = 16rFFFFFFFF
		ifTrue: [ pdvStream position: pdvStream position - 8.
			newDataElement dataBytes: (self nextDataElement: pdvStream) ]
		ifFalse: [ length + 8 > pdvStream size
				ifFalse: [ newDataElement dataBytes: (pdvStream next: length) ]
				ifTrue: [ newDataElement dataBytes: pdvStream upToEnd ] ].
	"In the case of a complete unknown data-set being decoded, check if the read lenght is really valid"
	newDataElement encoder: self.
	^ newDataElement
]

{ #category : #'data elements' }
ImplicitVRTS class >> dicomUTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ImplicitVRTS class >> fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	newDataElement := dataElementDefinition copy.
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 8."
	newDataElement dataBytes: (pdvStream next: length).
	^ newDataElement
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthAEDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM AE Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthASDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM AS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthATDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM AT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthCSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM CS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthDADataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM DA Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthDSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM DS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthDTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM DT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthFDDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM FD Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthFLDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM FL Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthISDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM IS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthLODataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM LO Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthLTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM LT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthOBDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM OB Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthOWDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM OW Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthPNDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM PN Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSHDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SH Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSLDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SL Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSQDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SQ Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthSTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM ST Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthTMDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM TM Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUIDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UI Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthULDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UL Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUNDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UN Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM US Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ImplicitVRTS class >> headerLengthUTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #initialize }
ImplicitVRTS class >> initialize [
"
	Abstract Smalltalk Class for DICOM Transfer Syntaxes with Implicit Value 
	Representation Encoder initialization  - PRD 03.2001 - 04.2003
	
	Since this is an abstract class, that should not be directly used, it's UID is set to a nil value
"
	UID := nil.
]

{ #category : #testing }
ImplicitVRTS class >> isBigEndian [

	^self subclassResponsibility.
]

{ #category : #testing }
ImplicitVRTS class >> isLittleEndian [

	^self subclassResponsibility.
]

{ #category : #testing }
ImplicitVRTS class >> isVRExplicit [

	^false
]

{ #category : #testing }
ImplicitVRTS class >> isVRImplicit [

	^true
]

{ #category : #'next data element' }
ImplicitVRTS class >> nextDataElement: dicomPDVStream [
"
	Return the position in the dicomPDV byte array where starts the next data Element.
	tagPosition corresponds to the first byte of the 'current' data element. - PRD 05-12.2001
	Added support for undefined lenght DICOM Data Elements - PRD 06.2002
"
	| itemLenght writeStream lenght tag |

	"Skip the group number and element number 4 bytes"
	dicomPDVStream next: 4.
	lenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	lenght = 16rFFFFFFFF ifFalse: [^dicomPDVStream next: 8 + lenght].

	"**** 	Ok, we have an data element of undefined lenght. Let's search where 
			the data element's end position begins *******"
	writeStream := WriteStream on: ByteArray new.
	writeStream nextPutAll: (dicomPDVStream next: 8).
	"******* Repeatedly looks for the Item Tag *******"
	"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
	elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
	[(groupNumber = 16rFFFE) & (elementNumber = 16rE000)] whileTrue: ["
	tag := self readDicomDataElementTag: dicomPDVStream.
	[tag isItemTag] whileTrue: [
		dicomPDVStream position: dicomPDVStream position - 4.
		writeStream nextPutAll: (dicomPDVStream next: 4).

		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		itemLenght  = 16rFFFFFFFF ifTrue: [		"**** Items with undefined lenght.... ****"
			dicomPDVStream position: dicomPDVStream position - 4.
			writeStream nextPutAll: (dicomPDVStream next: 4).
			"**** Searches for the Item Delimitation Element Tag *****"
			"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
			elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
			[(groupNumber = 16rFFFE) & (elementNumber = 16rE00D)] whileFalse: ["
			tag := self readDicomDataElementTag: dicomPDVStream.
			[tag isItemDelimitationElementTag] whileFalse: [
				dicomPDVStream position: dicomPDVStream position - 4.
				"****** recursive call 'nextDataElement: dicomPDVStream' ******"
				writeStream nextPutAll: (self nextDataElement: dicomPDVStream).
				"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
				elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)."
				tag := self readDicomDataElementTag: dicomPDVStream.
			].
			"**** We have found the Item Delimitation Element Tag. Now get its lenght ******"
			itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
			itemLenght = 16r00000000			"**** The lenght value shall be equal to 16r00000000 ****"
				ifFalse: [self halt] 				"**** Problems? ****"
				ifTrue: [
					dicomPDVStream position: dicomPDVStream position - 8.
					writeStream nextPutAll: (dicomPDVStream next: 8).
				]
		]
		ifFalse: [
			dicomPDVStream position: dicomPDVStream position - 4.
			writeStream nextPutAll: (dicomPDVStream next: itemLenght + 4)
		].
		"groupNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2).
		elementNumber := (self getValueFromByteStream: dicomPDVStream bytes: 2)."
		tag := self readDicomDataElementTag: dicomPDVStream.
	].
	"(groupNumber = 16rFFFE) & (elementNumber = 16rE0DD) ifTrue:  ["
	tag isSequenceDelimitaionElementTag ifTrue: [ 
		"***** Sequence Delimitation Element Tag Found!!!!"
		itemLenght := (self get32BitUnsignedValueFromByteStream: dicomPDVStream).
		itemLenght = 16r00000000			"**** The lenght value shall be equal to 16r00000000 ****"
			ifFalse: [self halt] 				"**** Problems? ****"
			ifTrue: [
				dicomPDVStream position: dicomPDVStream position - 8.
				writeStream nextPutAll: (dicomPDVStream next: 8).
			]
	]
	ifFalse: [self halt]. 		"***** More Problems.... *****"
	^writeStream contents
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
