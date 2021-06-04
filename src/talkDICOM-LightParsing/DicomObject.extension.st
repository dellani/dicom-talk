Extension { #name : #DicomObject }

{ #category : #'*talkDICOM-LightParsing' }
DicomObject >> lightPDVBytesStream: dicomPDVStream encoder: aDicomTransferSyntaxEncoder [
	"Parse data elements stored in the DICOM presentation data value
	 byte stream according to Dicom Part 8 => 9.3.5.1 Presentation Data
	 Value Item Structure.

	 11 September 2017: Groups of private creator's data elements are dinamically
	                    loaded to the data elements definition of the DICOM object
	                    when a data element with a private creator's tag is found.
	                    This improves the parsing of private data elements stored
	                    in the PDV stream and handled by this method;
	      04 June 2021: Part of the method refactored into DicomObject>>
	                    handleParsedDataElement: - Paulo R. Dellani"

	| aDicomDataElement |

	self encoder: aDicomTransferSyntaxEncoder.
	self dataElementsDictionary: Dictionary new.

	[ dicomPDVStream atEnd ]
		whileFalse: [ aDicomDataElement := aDicomTransferSyntaxEncoder
				lightDataElementFrom: dicomPDVStream
				dataElementsDefinition: dataElementsDefinition.

			aDicomDataElement ifNotNil: [ 
				"group lenght data elements are not used and DICOM Data Set Trailing Padding is ignored"
				aDicomDataElement elementNumber = 16r0000 | (aDicomDataElement groupNumber = 16rFFFC)
					ifFalse: [ self handleParsedDataElement: aDicomDataElement ] ] ]



]
