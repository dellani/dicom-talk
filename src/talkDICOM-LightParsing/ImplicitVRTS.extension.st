Extension { #name : #ImplicitVRTS }

{ #category : #'*talkDICOM-LightParsing' }
ImplicitVRTS class >> lightDataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"Parse the given DICOM presentation data value (PDV) stream in order to
	 decode a data element, however data elements that normally store large
	 amounts of data (like pixelData) will be skiped. 
	 See dataElementFrom:dataElementsDefinition: comments for more information
	 about this implementation. 

	  September 2017: Included a dictionary of private creator groups
	                  of data elements;
      February 2021: Implemented version for 'light data element parsing
							/ deconding only'. It just checks is the data element
							tag is of a large data element or not, skiping it
							to save time when parsing the PDV stream for meta-data;
	     15 May 2021: Split data element definition from the data element
	                  class hierarchy used to store the data elements parsed
	                  from the DICOM PDV stream bytes - Paulo R. Dellani"

	| dataElementTag aDataElement |
	dataElementTag := self readDicomDataElementTag: pdvStream.
	^ dataElementTag isPixelData
		ifTrue: [ self skipNextDataElement: pdvStream. nil ]
		ifFalse: [ aDataElement := self
				dataElementSubclassInstanceFrom: dataElementTag
				from: dataElementsDefinition
				valueRepresentation: 'UN'.
			aDataElement parseDataBytesFrom: pdvStream transferSyntax: self; yourself ]
]

{ #category : #'*talkDICOM-LightParsing' }
ImplicitVRTS class >> skipNextDataElement: dicomPDVStream [
	"Don't do anything with the data, just move the current position
	 of the DICOM PDV stream to where the next data element begins.
	 Useful for light data parsing. 

	 28 February 28: Initial implementation - Paulo R. Dellani"

	| lenght |
	lenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	lenght = 16rFFFFFFFF
		ifFalse: [ ^ dicomPDVStream position: dicomPDVStream position + lenght ].

	"**** 	Ok, we have an data element of undefined lenght. Take a deep 
		   breath and let's search the position of the next data element *******"
	self skipNextDataElementOfUndefinedLenght: dicomPDVStream
]
