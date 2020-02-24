Class {
	#name : #ExplicitVRTS,
	#superclass : #TransferSyntax,
	#category : #'talkDICOM-Data'
}

{ #category : #'as yet unclassified' }
ExplicitVRTS class >> _dicomSQDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue: [ newDataElement := self dicomSQUnLenDataElementFrom: pdvStream definition: dataElementDefinition ]
		ifFalse: [ newDataElement := dataElementDefinition copy.
			newDataElement length: length.
			newDataElement dataBytes: (pdvStream next: length) ].
	newDataElement encoder: self.
	^ newDataElement
]

{ #category : #'data elements' }
ExplicitVRTS class >> dataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"See comments on the super class method implementation

	PRD 10-11.2001, 05.2002, 05.2003, 04.2004, 02.2016, 03.2017"

	| elementTag dataElementDefinition valueRepresentation |
	elementTag := self readDicomDataElementTag: pdvStream.

	"Store the VR encoded in pdvStream to decode data elements unknown to this implementation"
	valueRepresentation := (pdvStream next: 2) asString asByteString.
	dataElementDefinition := self dataElementDefinion: elementTag from: dataElementsDefinition valueRepresentation: valueRepresentation.
	"This should not happen, but just in case, use the VR encoded in the pdv stream if it is other than UN.
	If the VR encoded in the PDV stream is UN, first try to decode the data element using the information
	from the data elements directory."
	^ dataElementDefinition vr = valueRepresentation
		ifFalse: [ valueRepresentation = 'UN'
				ifTrue: [ [ self decodeKnownTagFromUnknownDataElementDefinition: dataElementDefinition pdvstream: pdvStream transferSyntax: self ]
						on: DataElementEncodingError
						do: [ dataElementDefinition := (DataElement newVR: valueRepresentation)
								tag: elementTag;
								name: dataElementDefinition name;
								vm: '1';
								description:
									'Data Element encoded in the PDV stream with a VR (' , valueRepresentation
										, ' other than the one defined in the data dictionary (' , dataElementDefinition vr , '): ';
								yourself.
							dataElementDefinition createInstanceFrom: pdvStream transferSyntax: self ] ]
				ifFalse: [ dataElementDefinition := (DataElement newVR: valueRepresentation)
						tag: elementTag;
						name: dataElementDefinition name;
						vm: '1';
						description:
							'Data Element encoded in the PDV stream with a VR (' , valueRepresentation
								, ' other than the one defined in the data dictionary (' , dataElementDefinition vr , '): ';
						yourself.
					dataElementDefinition createInstanceFrom: pdvStream transferSyntax: self ] ]
		ifTrue: [ dataElementDefinition createInstanceFrom: pdvStream transferSyntax: self ]
]

{ #category : #'as yet unclassified' }
ExplicitVRTS class >> dataElementHeaderLenght: dataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM Data Element.
	
	PRD 05-11.2001"

	| valueRepresentation |
	valueRepresentation := dataElement vr.
	valueRepresentation = 'OW' | (valueRepresentation = 'OB') | (valueRepresentation = 'SQ')
		| (valueRepresentation = 'UN') | (valueRepresentation = 'UT')
		ifFalse: [ ^ 8 ]
		ifTrue: [ ^ 12 ]
]

{ #category : #'data elements' }
ExplicitVRTS class >> decodeKnownTagFromUnknownDataElementDefinition: dataElementDefinition pdvstream: pdvStream transferSyntax: transferSyntax [
	"Handling of CP 246: pdvStream is positioned just after the bytes storing the VR
	of an data element of type UN. However, the data element tag is present in the
	data dictionary of the implementation and the value can be decoded from the pdvstream.
	As it is the case with CP 246, the value is always implicit VR. PRD - September 12, 2017 "

	| newDataElement length writeStream value |
	"Transcript
		show:
			(String
				new: 10
				streamContents: [ :message | 
					message
						nextPutAll: 'CP 246 detected! Data element ';
						nextPutAll: dataElementDefinition tag printString;
						nextPutAll: ' is encoded with UN VR but its original VR is defined as ';
						nextPutAll: dataElementDefinition vr;
						nextPutAll: ', decoding it using implicit VR';
						nextPut: Character cr ])."
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	length = 16rFFFFFFFF
		ifTrue: [ "This may be an unknown SQ data element that got its VR lost
			while the PDV was transmitted using an implicit VR transfer syntax = CP 246"
			Transcript
				show:
					'CP 246 detected! UN VR Data element ' , dataElementDefinition tag printString , ' has undefined length = SQ element with implicit VR';
				cr.
			newDataElement := SQDataElement new
				tag: dataElementDefinition tag;
				name: (self privateDataElementNameFrom: dataElementDefinition tag vr: 'SQ') asSymbol;
				vm: dataElementDefinition vm;
				description: dataElementDefinition description;
				type: dataElementDefinition type;
				yourself.
			pdvStream position: pdvStream position - 4.
			newDataElement := LittleEndianImplicitVRTS dicomSQDataElementFrom: pdvStream definition: newDataElement.
			"newDataElement encoder: LittleEndianImplicitVRTS."

			value := newDataElement value.
			newDataElement := SQDataElement new
				tag: dataElementDefinition tag;
				name: (self privateDataElementNameFrom: dataElementDefinition tag vr: 'SQ') asSymbol;
				vm: dataElementDefinition vm;
				description: dataElementDefinition description;
				type: dataElementDefinition type;
				yourself.
			newDataElement encoder: self.
			newDataElement value: value ]
		ifFalse: [ newDataElement := dataElementDefinition copy.
			writeStream := ByteArray new writeStream.
			writeStream
				nextPutAll: (LittleEndianBitPolisher byteArrayFromValue: length size: 4);
				nextPutAll: (pdvStream next: length).
			newDataElement := newDataElement createInstanceFrom: writeStream contents readStream transferSyntax: LittleEndianImplicitVRTS.

			value := newDataElement value.
			newDataElement := dataElementDefinition copy.
			newDataElement encoder: self.
			newDataElement value: value ].
	^ newDataElement
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomAEDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomASDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomCSDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomDSDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomDTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomISDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomLODataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomLTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomOBDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	newDataElement := dataElementDefinition copy.
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 12."
	newDataElement dataBytes: (pdvStream next: length).
	^ newDataElement
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomPNDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomSHDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomSQDataElementFrom: pdvStream definition: dataElementDefinition [
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	^ super dicomSQDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomSTDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomTMDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomUIDataElementFrom: pdvStream definition: dataElementDefinition [
	^ self fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomUNDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement sqDataElementDefinition |
	newDataElement := dataElementDefinition copy.
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement length: length.
	length = 16rFFFFFFFF
		ifTrue: [ "This may be an unknown SQ data element that got its VR lost
			while the PDV was transmitted using an implicit VR transfer syntax = CP 246"
			Transcript
				show:
					'CP 246 detected! UN VR Data element ' , dataElementDefinition tag printString
						, ' has undefined length = SQ element with implicit VR';
				cr.
			sqDataElementDefinition := SQDataElement new
				tag: dataElementDefinition tag;
				name: (self privateDataElementNameFrom: dataElementDefinition tag vr: 'SQ') asSymbol;
				vm: dataElementDefinition vm;
				description: dataElementDefinition description;
				type: dataElementDefinition type;
				yourself.
			pdvStream position: pdvStream position - 4.
			newDataElement := LittleEndianImplicitVRTS dicomSQDataElementFrom: pdvStream definition: sqDataElementDefinition.
			newDataElement encoder: LittleEndianImplicitVRTS]
		ifFalse: [ "In the case of a complete unknown data-set being decoded, 
			check if the read lenght is really valid"
			length + 12 > pdvStream size
				ifFalse: [ newDataElement length: length.
					"newDataElement dataElementLength: length + 12."
					newDataElement dataBytes: (pdvStream next: length) ]
				ifTrue: [ newDataElement length: pdvStream size - pdvStream position.
					newDataElement dataBytes: pdvStream upToEnd ].
			newDataElement encoder: self ].
	^ newDataElement
]

{ #category : #'data elements' }
ExplicitVRTS class >> dicomUTDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	newDataElement := dataElementDefinition copy.
	pdvStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 12."
	newDataElement dataBytes: (pdvStream next: length).
	^ newDataElement
]

{ #category : #'data elements' }
ExplicitVRTS class >> fixedSizeDataElementFrom: pdvStream definition: dataElementDefinition [
	| length newDataElement |
	newDataElement := dataElementDefinition copy.
	length := self get16BitUnsignedValueFromByteStream: pdvStream.
	newDataElement encoder: self.
	newDataElement length: length.
	"newDataElement dataElementLength: length + 8."
	newDataElement dataBytes: (pdvStream next: length).
	^ newDataElement
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthAEDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM AE Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthASDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM AS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthATDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM AT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthCSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM CS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthDADataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM DA Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthDSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM DS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthDTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM DT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthFDDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM FD Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthFLDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM FL Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthISDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM IS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthLODataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM LO Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthLTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM LT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthOBDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM OB Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self longDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthOWDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM OW Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self longDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthPNDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM PN Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthSHDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SH Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthSLDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SL Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthSQDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SQ Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self longDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthSSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM SS Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthSTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM ST Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthTMDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM TM Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthUIDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UI Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthULDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UL Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthUNDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UN Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self longDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthUSDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM US Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self shortDataElementHeaderLength
]

{ #category : #'data elements - header lenght' }
ExplicitVRTS class >> headerLengthUTDataElement [
	"Return the number of bytes used in the header (group number
	+ element number + vr + length) of a DICOM UT Data Element.
	
	PRD 05-11.2001, 03.2017"

	^ self longDataElementHeaderLength
]

{ #category : #initialize }
ExplicitVRTS class >> initialize [
"
	Abstract Smalltalk Class for DICOM Transfer Syntaxes with Explicit Value 
	Representation Encoder initialization  - PRD 03.2001 - 04.2004

	Since this is an abstract class, that should not be directly used, it's UID is set to a nil value
"
	UID := nil.
]

{ #category : #testing }
ExplicitVRTS class >> isVRExplicit [

	^true
]

{ #category : #testing }
ExplicitVRTS class >> isVRImplicit [

	^false
]

{ #category : #'data elements' }
ExplicitVRTS class >> nextDataElement: dicomPDVStream [
	"Return the position in the dicomPDV byte array where the next data Element starts.
	tagPosition corresponds to the first byte of the 'current' data element.

	PRD 05-11.2001"

	| valueRepresentation |
	"Skip the group number and element number 4 bytes"
	dicomPDVStream next: 4.
	"valueRepresentation := (dicomPDVStream next: 2) asString asByteString."
	valueRepresentation := String
		new: 2
		streamContents: [ :aStream | 
			aStream
				nextPut: (Character value: dicomPDVStream next);
				nextPut: (Character value: dicomPDVStream next) ].
	"This method is called from nextDataElement:, it reads the data element length from the
	byte stream and returns a ByteArray with all the data element bytes. 
	Return the position in the dicomPDV byte array where starts the next data Element.
	tagPosition corresponds to the first byte of the 'current' data element.
	PRD 05-11.2001"
	^ [ self perform: ('nextDataElement' , valueRepresentation , ':') asSymbol with: dicomPDVStream ]
		on: Error
		do: [ :error | DataElementEncodingErrorVRNotFound signal: 'Value Representation encoding is invalid, error looking for next data lement in the PDV stream.' ]
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementAE: dicomPDVStream [
	"PRD - 05.2001 - 04.2004"

	| length |
	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^ dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementAS: dicomPDVStream [ 
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementAT: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementCS: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementDA: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementDS: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementDT: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementFD: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementFL: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	|  length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementIS: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementLO: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementLT: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementOB: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 12.
	^dicomPDVStream next: 12 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementOW: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 12.
	^dicomPDVStream next: 12 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementPN: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementSH: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementSL: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementSQ: dicomPDVStream [
	"PRD - 03.2017"

	| tag itemLenght writeStream length |

	dicomPDVStream next: 2.		"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 12.
	length = 16rFFFFFFFF ifFalse: [^dicomPDVStream next: 12 + length].

	"**** Ok, we have an data element of undefined lenght. 
	Let's search where the data element's end position begins *******"
	writeStream := WriteStream on: ByteArray new.
	writeStream nextPutAll: (dicomPDVStream next: 12).

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
			[ tag isItemDelimitationElementTag ] whileFalse: [
				dicomPDVStream position: dicomPDVStream position - 4.
				"****** recursive call 'undefinedNextDataElement: dicomPDVStream' ******"
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
		itemLenght = 16r00000000 ifTrue: [
			dicomPDVStream position: dicomPDVStream position - 8.
			writeStream nextPutAll: (dicomPDVStream next: 8).
		]
		ifFalse: [self halt]. 		"***** More Problems.... *****"
	]
	ifFalse: [self halt]. 		"***** More Problems.... *****"

	^writeStream contents
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementSS: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementST: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementTM: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementUI: dicomPDVStream [
	"PRD - 05.2001 - 04.2004"

	| length |
	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^ dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementUL: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementUN: dicomPDVStream [
	"PRD - 05.2001 - 09.2017"

	| length |
	dicomPDVStream next: 2.	"**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 12.
	"^dicomPDVStream next: 12 + length."
	length = 16rFFFFFFFF
		ifFalse: [ ^ dicomPDVStream next: 12 + length ].

	"**** Ok, we have an data element of undefined lenght. 
	An UN data element of undefined length can only be the result
	of the encoding of a sequence of undefined length with of an
	implicit VR syntax, where the only information about the unknown
	data element, the VR, is lost, posteriorly producing this exception
	here when the data is encoded using an explicit VR syntax again.
	PRD - September 11, 2017"

	"Skip data element tag and VR bytes"
	dicomPDVStream position: dicomPDVStream position + 6.

	^ self nextDataElementSQ: dicomPDVStream
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementUS: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 8.
	^dicomPDVStream next: 8 + length
]

{ #category : #'next data element' }
ExplicitVRTS class >> nextDataElementUT: dicomPDVStream [
"PRD - 05.2001 - 04.2004"
	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position - 12.
	^dicomPDVStream next: 12 + length
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromAEDataElement: dicomAEDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AE Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomAEDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomAEDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomAEDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomAEDataElement length size: 2);
		nextPutAll: dicomAEDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromASDataElement: dicomASDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomASDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomASDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomASDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomASDataElement length size: 2);
		nextPutAll: dicomASDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromATDataElement: dicomATDataElement on: aByteStream [
	"Put the byte-coding of a DICOM AT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomATDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomATDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomATDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomATDataElement length size: 2);
		nextPutAll: dicomATDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromCSDataElement: dicomCSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM CS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	aByteStream
		nextPutAll: (self byteArrayFromValue: dicomCSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomCSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomCSDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomCSDataElement length size: 2);
		nextPutAll: dicomCSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromDADataElement: dicomDADataElement on: aByteStream [
	"Put the byte-coding of a DICOM DA Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomDADataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDADataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomDADataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomDADataElement length size: 2);
		nextPutAll: dicomDADataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromDSDataElement: dicomDSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM DS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"

	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomDSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomDSDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomDSDataElement length size: 2);
		nextPutAll: dicomDSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromDTDataElement: dicomDTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM DT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomDTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomDTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomDTDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomDTDataElement length size: 2);
		nextPutAll: dicomDTDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromFDDataElement: dicomFDDataElement on: aByteStream [
	"Put the byte-coding of a DICOM FD Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomFDDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomFDDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomFDDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomFDDataElement length size: 2);
		nextPutAll: dicomFDDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromFLDataElement: dicomFLDataElement on: aByteStream [
	"Put the byte-coding of a DICOM FL Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomFLDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomFLDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomFLDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomFLDataElement length size: 2);
		nextPutAll: dicomFLDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromISDataElement: dicomISDataElement on: aByteStream [
	"Put the byte-coding of a DICOM IS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomISDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomISDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomISDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomISDataElement length size: 2);
		nextPutAll: dicomISDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromLODataElement: dicomLODataElement on: aByteStream [
	"Put the byte-coding of a DICOM LO Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomLODataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomLODataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomLODataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomLODataElement length size: 2);
		nextPutAll: dicomLODataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromLTDataElement: dicomLTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM LT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomLTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomLTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomLTDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomLTDataElement length size: 2);
		nextPutAll: dicomLTDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromOBDataElement: dicomOBDataElement on: aByteStream [
	"Put the byte-coding of a DICOM OB Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomOBDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomOBDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomOBDataElement vr);
		nextPut: 16r00;						"************* Reserved BYtes ***************"
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPutAll: (self byteArrayFromValue: dicomOBDataElement length size: 4);
		nextPutAll: dicomOBDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromPNDataElement: dicomPNDataElement on: aByteStream [
	"Put the byte-coding of a DICOM PN Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomPNDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomPNDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomPNDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomPNDataElement length size: 2);
		nextPutAll: dicomPNDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromSHDataElement: dicomSHDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SH Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSHDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSHDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomSHDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomSHDataElement length size: 2);
		nextPutAll: dicomSHDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromSLDataElement: dicomSLDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SL Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSLDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSLDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomSLDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomSLDataElement length size: 2);
		nextPutAll: dicomSLDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromSQDataElement: dicomSQDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SQ Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSQDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSQDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomSQDataElement vr);
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPutAll: (self byteArrayFromValue: dicomSQDataElement length size: 4);
		nextPutAll: dicomSQDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromSSDataElement: dicomSSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM SS Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomSSDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomSSDataElement length size: 2);
		nextPutAll: dicomSSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromSTDataElement: dicomSTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM ST Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomSTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomSTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomSTDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomSTDataElement length size: 2);
		nextPutAll: dicomSTDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromTMDataElement: dicomTMDataElement on: aByteStream [
	"Put the byte-coding of a DICOM TM Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomTMDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomTMDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomTMDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomTMDataElement length size: 2);
		nextPutAll: dicomTMDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromUIDataElement: dicomUIDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UI Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUIDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUIDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomUIDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomUIDataElement length size: 2);
		nextPutAll: dicomUIDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromULDataElement: dicomULDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UL Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomULDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomULDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomULDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomULDataElement length size: 2);
		nextPutAll: dicomULDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromUNDataElement: dicomUNDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UN Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUNDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUNDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomUNDataElement vr);
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPutAll: (self byteArrayFromValue: dicomUNDataElement length size: 4);
		nextPutAll: dicomUNDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromUSDataElement: dicomUSDataElement on: aByteStream [
	"Put the byte-coding of a DICOM US Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUSDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUSDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomUSDataElement vr);
		nextPutAll: (self byteArrayFromValue: dicomUSDataElement length size: 2);
		nextPutAll: dicomUSDataElement dataBytes
]

{ #category : #'PDV bytes' }
ExplicitVRTS class >> pdvBytesFromUTDataElement: dicomUTDataElement on: aByteStream [
	"Put the byte-coding of a DICOM UT Data Element in to a ByteStream.
	
	PRD - February 07th, 2003"
	
	aByteStream 
		nextPutAll: (self byteArrayFromValue: dicomUTDataElement groupNumber size: 2);
		nextPutAll: (self byteArrayFromValue: dicomUTDataElement elementNumber size: 2);
		nextPutAll: (self byteArrayFromString: dicomUTDataElement vr);
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPut: 16r00;						"************* Reserved Bytes ***************"
		nextPutAll: (self byteArrayFromValue: dicomUTDataElement length size: 4);
		nextPutAll: dicomUTDataElement dataBytes
]

{ #category : #'data elements' }
ExplicitVRTS class >> privateCreatorDataElementNameFrom: dataElementTag vr: valueRepresentation [
	| elementName |
	elementName := WriteStream on: String new.
	elementName nextPutAll: 'privateCreatorDataElement' , valueRepresentation , '['.
	(dataElementTag groupNumber ) printOn: elementName base: 16.
	elementName nextPutAll: ','.
	(dataElementTag elementNumber) printOn: elementName base: 16.
	elementName nextPutAll: ']'.
	^ elementName contents
]

{ #category : #'byte/value handling' }
ExplicitVRTS class >> readDicomDataElementTag: aStream [
	"Read data element tag from the given byte stream, which is enconded as 
	a pair of 16 bit integers.
	
	PRD 05.2003 - 02.2016"

	^ self subclassResponsibility
]
