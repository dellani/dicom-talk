Extension { #name : #ImplicitVRTS }

{ #category : #'*talkDICOM-LightParsing' }
ImplicitVRTS class >> lightDataElementFrom: pdvStream dataElementsDefinition: dataElementsDefinition [
	"See comments on the super class method implementation

	PRD 10-11.2001, 05.2002, 05.2003, 04.2004, 02.2016, 03.2017, 09.2017, 02.2021"

	| elementTag dataElementDefinition |
	elementTag := self readDicomDataElementTag: pdvStream.

	elementTag isPixelData ifTrue: [
		self skipNextDataElement: pdvStream.
		^ nil
	].

	dataElementDefinition := self
		dataElementDefinion: elementTag
		from: dataElementsDefinition
		valueRepresentation: 'UN'.
	^ dataElementDefinition
		createInstanceFrom: pdvStream
		transferSyntax: self
]

{ #category : #'*talkDICOM-LightParsing' }
ImplicitVRTS class >> skipNextDataElement: dicomPDVStream [
	"Skip the next data element.
	
	Don't do anything with the data, just move the current position
	of the DICOM PDV stream to where the next data element begins.
	PRD February 28, 2021"

	| lenght |
	lenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
	lenght = 16rFFFFFFFF
		ifFalse: [ ^ dicomPDVStream position: dicomPDVStream position + lenght ].

	"**** 	Ok, we have an data element of undefined lenght. Take a breath and
		   let's search the position of the next data element *******"

	self skipNextDataElementOfUndefinedLenght: dicomPDVStream
]
