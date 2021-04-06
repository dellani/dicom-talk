Extension { #name : #ExplicitVRTS }

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> lightDataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"See comments on the super class method implementation

	PRD February 28, 2021"

	| elementTag |
	elementTag := self readDicomDataElementTag: pdvStream.
	elementTag isPixelData ifTrue: [
		self skipNextDataElement: pdvStream.
		^ nil
	].

	^ self 
		parseDataElement: elementTag
		from: pdvStream
		dataElementsDefinition: dataElementsDefinition
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextAEDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the AE data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |
	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextASDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the AS data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |
	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextATDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the AT data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextCSDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the CS data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextDADataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the DA data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextDSDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the DS data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextDTDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the DT data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextDataElement: dicomPDVStream [
	"Skip the next data element.
	
	Don't do anything with the data, just move the current position
	of the DICOM PDV stream to where the next data element begins.
	PRD February 28, 2021"
	
	| valueRepresentation |

	valueRepresentation := self decodeValueRepresentation: dicomPDVStream.

	^ [ self 
			perform: ('skipNext' , valueRepresentation , 'DataElement:') asSymbol
			with: dicomPDVStream
	] on: Error do: 
		[ :error |
			DataElementEncodingErrorVRNotFound signal: 
				'Value Representation encoding is invalid, error looking for next data element in the PDV stream.'
		]
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextFDDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the FD data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextFLDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the FL data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextISDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the FL data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextLODataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the LO data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextLTDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the LT data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextOBDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the OB data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextOWDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the OW data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextPNDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the PN data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextSHDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the SH data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextSLDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the SL data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextSQDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the SQ data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD 03.2017; February 28, 2021"

	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	
	length = 16rFFFFFFFF ifFalse: [
		^ dicomPDVStream position: dicomPDVStream position + length ].

	"**** 	Ok, we have an data element of undefined lenght. Take a breath and
		   let's search the position of the next data element *******"

	self skipNextDataElementOfUndefinedLenght: dicomPDVStream
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextSSDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the SS data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextSTDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the ST data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextTMDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the TM data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextUIDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the UI data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextULDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the UL data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextUNDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the UN data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.

	length = 16rFFFFFFFF
		ifFalse: [ ^ dicomPDVStream position: dicomPDVStream position + length ].

	"**** Ok, we have an data element of undefined lenght. 
	An UN data element of undefined length can only be the result
	of the encoding of a sequence of undefined length with of an
	implicit VR syntax, where the only information about the unknown
	data element, the VR, is lost, posteriorly producing this exception
	here when the data is encoded using an explicit VR syntax again.
	PRD September 11, 2017"

	"Set the DICOM PDV stream pointer to the position where this method started"
	dicomPDVStream position: dicomPDVStream position - 6.

	^ self skipNextSQDataElement: dicomPDVStream
]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextUSDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the US data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	length := self get16BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.

]

{ #category : #'*talkDICOM-LightParsing' }
ExplicitVRTS class >> skipNextUTDataElement: dicomPDVStream [
	"This method is called from skipNextDataElement, it decodes the UT data 
	 element's length from the DICOM PDV stream and moves the stream position
	 pointer to where the next data element begins.
	 PRD February 28, 2021"

	| length |

	dicomPDVStream next: 2. "**** Skip 2 unused bytes ******"
	length := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	dicomPDVStream position: dicomPDVStream position + length.
]
