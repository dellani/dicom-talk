Extension { #name : #DicomIOD }

{ #category : #'*talkDICOM-LightParsing' }
DicomIOD >> lightPDVBytesStream: dicomPDVStream encoder: aDicomTransferSyntax [
	super
		lightPDVBytesStream: dicomPDVStream
		encoder: aDicomTransferSyntax.
	self populateIOMDictionaries: aDicomTransferSyntax.
]
