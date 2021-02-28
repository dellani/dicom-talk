Extension { #name : #DicomObject }

{ #category : #'*talkDICOM-LightParsing' }
DicomObject >> lightPDVBytesStream: dicomPDVStream encoder: aDicomTransferSyntaxEncoder [
	"Dicom Part 8 => 9.3.5.1 Presentation Data Value Item Structure
	PRD 04-10.2001, 05.2002

	Now the parsing doesn't ignore anymore the unknown data elements, 
	storing then in the data elements dictionary together with the known ones.
	PRD January 10th, 2003
	
	The parser will dinamically add groups of 'private creator' data elements
	to the data elements definition of the DICOM object in order to be able
	to parse these - PRD September 11, 2017"

	| dataElementsDefinition |
	self encoder: aDicomTransferSyntaxEncoder.
	self dataElementsDictionary: Dictionary new.
	dataElementsDefinition := Dictionary withAll: self dataElementsDefinition.
	self
		lightPDVBytesStream: dicomPDVStream
		encoder: aDicomTransferSyntaxEncoder
		dataElementsDefinition: dataElementsDefinition
]

{ #category : #'*talkDICOM-LightParsing' }
DicomObject >> lightPDVBytesStream: dicomPDVStream encoder: aDicomTransferSyntaxEncoder dataElementsDefinition: dataElementsDefinition [
	"Dicom Part 8 => 9.3.5.1 Presentation Data Value Item Structure
	PRD 04-10.2001, 05.2002

	Now the parsing doesn't ignore anymore the unknown data elements, 
	storing then in the data elements dictionary together with the known ones.
	PRD January 10th, 2003
	
	Implementation now includes a dictionary of private creator groups of 
	data elements - PRD Septebmer 2017"

	| aDicomDataElement |
	[ dicomPDVStream atEnd ]
		whileFalse: [ aDicomDataElement := aDicomTransferSyntaxEncoder
				lightDataElementFrom: dicomPDVStream
				dataElementsDefinition: dataElementsDefinition.

			aDicomDataElement ifNotNil: [ 
				"group lenght data elements are not used and DICOM Data Set Trailing Padding is ignored"
				aDicomDataElement elementNumber = 16r0000 | (aDicomDataElement groupNumber = 16rFFFC)
					ifFalse: [ "If the data element is private, check if the private creators group of it is known"
						aDicomDataElement tag isPrivate
							ifTrue: [ aDicomDataElement tag isPrivateCreator
									ifTrue: [ aDicomDataElement := LODataElement new "See DICOM Part 5 Section 7.8.1"
																				tag: aDicomDataElement tag;
																				name: aDicomDataElement name;
																				vm: 1;
																				description: aDicomDataElement description;
																				type: '1';
																				encoder: aDicomTransferSyntaxEncoder;
																				value: aDicomDataElement value; yourself.
										dataElementsDefinition
											at: aDicomDataElement tag
											ifAbsent: [ self loadPrivateCreatorsGroup: aDicomDataElement into: dataElementsDefinition ] ] ].
						self dataElementsDictionary
							at: aDicomDataElement name
							ifPresent: [ Transcript
									show: 'Warning: data element ' , aDicomDataElement name asString , ' already parsed, skipping';
									cr ]
							ifAbsentPut: [ aDicomDataElement ] ] ] ]
]
