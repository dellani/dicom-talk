Extension { #name : #'BasicVoiceAudioECGWaveform_IOD' }

{ #category : #'*talkDICOM-Files' }
BasicVoiceAudioECGWaveform_IOD >> asDICOMDIR_IE [

	| aDICOMDIR_IE |
	aDICOMDIR_IE := DICOMDIR_IE new.
	self sopCommonIOM copyTo: aDICOMDIR_IE sopCommonIOM.
	aDICOMDIR_IE referencedTransferSyntaxUIDInFile: (self encoder notNil
				ifTrue: [self encoder UID]
				ifFalse: [nil]).
	aDICOMDIR_IE imageType: ''.
	aDICOMDIR_IE referencedImageSequence: nil.
	^aDICOMDIR_IE
]
