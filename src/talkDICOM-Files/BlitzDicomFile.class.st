Class {
	#name : #BlitzDicomFile,
	#superclass : #DicomFile,
	#category : #'talkDICOM-Files'
}

{ #category : #'private - reading / writing' }
BlitzDicomFile >> parseIOD: iodClass readStream: readStream encoder: transferSyntaxEncoder [
	self
		dicomIOD:
			(iodClass new
				blitzPDVBytesStream: readStream
				encoder: transferSyntaxEncoder)
]
