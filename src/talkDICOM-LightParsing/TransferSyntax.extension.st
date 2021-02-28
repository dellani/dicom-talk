Extension { #name : #TransferSyntax }

{ #category : #'*talkDICOM-LightParsing' }
TransferSyntax class >> lightDataElementFrom: dicomPDVStream dataElementsDefinition: dataElementsDefinition [
	"Parse the given byte stream and decode a DICOM data element from.
	 If the data element to be decoded is not present in the data elements
	 definition dictionary, then decode it as of the unknown type. 
	 Return an instance of one of the DataElement subclasses corresponding
	 to the decoded DICOM data element. 
	 PS 3.5-2000 Section 7

	PRD February 28, 2021"

	^ self subclassResponsibility
]

{ #category : #'*talkDICOM-LightParsing' }
TransferSyntax class >> skipNextDataElement: dicomPDVStream [
	"Skip the next data element.
	
	Don't do anything with the data, just move the current position
	of the DICOM PDV stream to where the next data element begins.
	PRD February 28, 2021"

	^ self subclassResponsibility 
]

{ #category : #'*talkDICOM-LightParsing' }
TransferSyntax class >> skipNextDataElementOfUndefinedLenght: dicomPDVStream [
	"This is sent by ImplicitVRTS>skipNextDataElement and
	 by ExplicitVRTS>skipNextSQDataElement: to deal with the
	 decoding of a data element of undefined lenght.
	
	This doesn't do anything with the data, just move the current position
	of the DICOM PDV stream to where the next data element begins.
	PRD February 28, 2021"

	| itemLenght tag |

	"******* Repeatedly looks for the Item Tag *******"
	tag := self readDicomDataElementTag: dicomPDVStream.
	[ tag isItemTag ] whileTrue: [
		itemLenght := self get32BitUnsignedValueFromByteStream: dicomPDVStream.
		itemLenght = 16rFFFFFFFF ifTrue: [
			"**** We got an item with undefined lenght. Let's
			      search for the Item Delimitation Element Tag  *****"
			tag := self readDicomDataElementTag: dicomPDVStream.
			[ tag isItemDelimitationElementTag ] whileFalse: [
				dicomPDVStream position: dicomPDVStream position - 4.
				"****** recursive call 'skipNextDataElement: dicomPDVStream' ******"
				self skipNextDataElement: dicomPDVStream.
				tag := self readDicomDataElementTag: dicomPDVStream.
			].
			"**** We have found the Item Delimitation Element Tag. 
			      Now let's get its lenght ******"
			itemLenght := self
				get32BitUnsignedValueFromByteStream: dicomPDVStream.
			"**** The lenght of an item delimitaion element tag shall
			      be equal to 0x00000000 ****"
			itemLenght = 16r00000000 ifFalse: [
				Error signal: 
					'Decoding error: Found Item Delimitation Element Tag with length different than 16r00000000!'
			]
		]
		ifFalse: [
			dicomPDVStream position: dicomPDVStream position + itemLenght.
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
		]
	]
	ifFalse: [
		Error signal: 
			'Decoding error: Sequence Delimitation Element Tag not found!'
	].
]
