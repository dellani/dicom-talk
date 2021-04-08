Class {
	#name : #PrivateCreatorDataElementDefinition,
	#superclass : #DataElementDefinition,
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation - private' }
PrivateCreatorDataElementDefinition class >> dataElementTagClass [
	^ PrivateCreatorDataElementTag
]

{ #category : #examples }
PrivateCreatorDataElementDefinition class >> example01 [
	"Import DCMTK dicom.dic registry of DICOM data elements"

	| inputStream collection line |
	
	collection := OrderedCollection new.
	inputStream := '/home/dellani/git/dcmtk/dcmdata/data/private.dic'
		asFileReference readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#) | line isEmpty
				ifFalse: [ collection
						addAll: (PrivateCreatorDataElementDefinition fromTextLine: line) ] ].
	inputStream
		close;
		release.
	collection inspect
]

{ #category : #examples }
PrivateCreatorDataElementDefinition class >> example02 [
	(self
		fromGDCMTextLine:
			'{0x0011,0x0003,"PMTF INFORMATION DATA^10",VR::US,VM::VM1,"?",false },')
		inspect
]

{ #category : #'instance creation' }
PrivateCreatorDataElementDefinition class >> fromGDCMTextLine: textLine [
	"Parses a GDCM private creator's data element definition and create 
	 an instance of myself from the tokens. 
	
	 September 13 2017: Initial implementation;
	     April 08 2021: Refactoring from PrivateCreatorDataElement class into
	                    PrivateCreatorDataElementDefinition class - PRD.

	 Example entries:
 	 {0x0009,0x0002,""PMTF INFORMATION DATA^10"",VR::SH,VM::VM1,""?"",false },
    {0x0011,0x0003,""PMTF INFORMATION DATA^10"",VR::US,VM::VM1,""?"",false },"

	| tokens line inputStream token dataElementName newInstance |
	
	newInstance := self new.
	tokens := OrderedCollection new.

	line := textLine reject: [ :character | character = ${ ].
	line := line reject: [ :character | character = $} ].
	inputStream := line readStream.

	token := inputStream upTo: $,.
	tokens add: token.
	token := inputStream upTo: $,.	
	tokens add: token.
	"Skip double quotatioin mark"
	inputStream next.
	token := inputStream upTo: $".	
	tokens add: token.
	"Skip double quotatioin mark"
	inputStream next.

	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: $,.
			tokens add: token ].

	"First and second tokens are group and element number, third token is the private creator name"
	newInstance tag: (PrivateCreatorDataElementTag fromGDCMToken: tokens).

	"Fourth token is the VR"
	newInstance vr: ((tokens at: 4) copyFrom: 5 to: 6).

	"Fifth Token is the VM"
	newInstance vm: ((tokens at: 5) copyFrom: 7 to: (tokens at: 5) size).

	"Sixth token is the data element name "
	dataElementName := (tokens at: 6) reject: [ :character | character = $" ].
	"dataElementName = '?' ifTrue: [ dataElementName := 'unknownPrivateDataElement(', tag groupNumber printString, ',', tag elementNumber printString, ')' ]."
	dataElementName = '?'
		ifTrue: [ dataElementName := 'UnknownPrivateDataElement' ].
	newInstance name: dataElementName.

	^ newInstance
]

{ #category : #initialization }
PrivateCreatorDataElementDefinition >> initializeFromTokens: tokens [
	self
		tag: (tokens at: 1);
		"Second Token is the data element value representation"
		vr: (tokens at: 2);
		"Third Token is the data element name"
		name: (tokens at: 3);
		"Fourth Token is the data element value multiplycity"
		vm: (tokens at: 4).
]
