"
I read DICOM files but skip big data elements like PixelData completely.

I override the method that parses IOD's from DICOM files, 
parseIOD: iodClass readStream: readStream encoder: transferSyntaxEncoder,
in order to send a message to the IOD class instance to parse all data elements
that do not store pixel data or other large data elements.

I collaborate with DICOMIOD subclass corresponding to the Media Storage SOP Class UID stored in the DICOM file
and the TransferSyntax subclass corresponding to the transfer syntax UID in which the DICOM file was encoded.

Public API and Key Messages:

- readFrom: aFilename
- writeTo: aFilename

How to read the DICOM Information Object Definition instance stored in a given DICOM file, create an instance instances

   LightDicomFile readIODFromDICOMFile: 'path-to-my-DICOM-File'

"
Class {
	#name : #LightDicomFile,
	#superclass : #DicomFile,
	#category : #'talkDICOM-LightParsing'
}

{ #category : #initalize }
LightDicomFile class >> initialize [
	"Initialize the dictionary of DICOM File Meta Elements
	PS 3.3-2000 Annex C.7.6.2

	PRD 11.2001 - 02.2021"

	super initialize.
]
