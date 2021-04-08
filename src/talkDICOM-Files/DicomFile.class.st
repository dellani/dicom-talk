Class {
	#name : #DicomFile,
	#superclass : #DicomObject,
	#instVars : [
		'filePreamble',
		'dicomIOD',
		'dicomPrefix'
	],
	#category : #'talkDICOM-Files'
}

{ #category : #'instance creation' }
DicomFile class >> dicomIOD: aDicomIOD [
	"Create an instance of myself to store the given DICOM IOD.

	 November 2001 - January 2002: Initial implementation;
	 October 2017: Reimplementation - PRD"

	^ self new
		dicomIOD: aDicomIOD
		implementationClassUID: DicomRegistry ImplementationClassUID
		implementationVersionName: DicomRegistry ImplementationVersionName
		sourceAETitle: nil
]

{ #category : #testing }
DicomFile class >> example01 [
	| dicomFile1 dicomFile2 |
	dicomFile1 := self
		readFrom: '/home/dellani/tmp/_read_test/0CE1AF6B/1A0E091E/256FE631'.

	dicomFile2 := self dicomIOD: dicomFile1 dicomIOD.
	dicomFile2 writeTo: '/tmp/256FE631.talkDicom'
]

{ #category : #initialize }
DicomFile class >> initialize [
	"Initialize the dictionary of DICOM File Meta Elements
	PS 3.3-2000 Annex C.7.6.2

	PRD 11.2001"

	super initialize.
	self addDataElement: (OBDataElement
				newWith: #fileMetaInformationVersion
				tag: #(16r0002 16r0001)
				vm: '1'
				type: '1').
	self addDataElement: (UIDataElement
				newWith: #mediaStorageSOPClassUID
				tag: #(16r0002 16r0002)
				vm: '1'
				type: '1').
	self addDataElement: (UIDataElement
				newWith: #mediaStorageSOPInstanceUID
				tag: #(16r0002 16r0003)
				vm: '1'
				type: '1').
	self addDataElement: (UIDataElement
				newWith: #transferSyntaxUID
				tag: #(16r0002 16r0010)
				vm: '1'
				type: '1').
	self addDataElement: (UIDataElement
				newWith: #implementationClassUID
				tag: #(16r0002 16r0012)
				vm: '1'
				type: '1').
	self addDataElement: (SHDataElement
				newWith: #implementationVersionName
				tag: #(16r0002 16r0013)
				vm: '1'
				type: '3').
	self addDataElement: (AEDataElement
				newWith: #sourceApplicationEntityTitle
				tag: #(16r0002 16r0016)
				vm: '1'
				type: '3').
	self addDataElement: (UIDataElement
				newWith: #privateInformationCreatorUID
				tag: #(16r0002 16r0100)
				vm: '1'
				type: '3').
	self addDataElement: (OBDataElement
				newWith: #privateInformation
				tag: #(16r0002 16r0102)
				vm: '1'
				type: '1C')
]

{ #category : #'instance creation' }
DicomFile class >> readFrom: aFilename [
	"April 07, 2021: Create an instance of myself and read
	                 the contents of the given filename.
	                 Return the newly created instance - PRD"

	| newInstance |
	newInstance := self new.
	newInstance readFrom: aFilename.
	^ newInstance
]

{ #category : #accessing }
DicomFile >> contents [
	"Create an instance of ByteArray with the contents of the DICOM file
	PRD 12.2001 - 01.2002, 02.2020"

	^self readWriteStream contents

]

{ #category : #'private - reading / writing' }
DicomFile >> createDicomFileInstance: readStream [

	| transferSyntaxEncoder iodClass aDicomSOPCommonIOM position |

	(transferSyntaxEncoder := 
		DicomRegistry TransferSyntaxes at: self transferSyntaxUID ifAbsent: [nil]) ifNil: [
			Error signal:
				'Impossible to Open DICOM File: the file is encoded with an unsupported transfer syntax'.
	].
	"mediaStorageSOPClassUID data element not present, like with files written by GE CENTRICITY_3.0?"
	self mediaStorageSOPClassUID ifNil: [
		"If yes look for the the SOP Class UID data element in the dicom dataset"
		position := readStream position.
		aDicomSOPCommonIOM := SOPCommonIOM new pdvBytesStream: readStream encoder: transferSyntaxEncoder.
		self mediaStorageSOPClassUID: aDicomSOPCommonIOM sopClassUID.
		self mediaStorageSOPInstanceUID: aDicomSOPCommonIOM sopInstanceUID.
		readStream position: position.
		Error signal: 
			'Impossible to Open DICOM File: Media Storage SOP Class UID Data Element Not Present'
	] ifNotNil: [
		self mediaStorageSOPClassUID isEmpty ifTrue: [ 
			Error signal:
				'Impossible to Open DICOM File: Media Storage SOP Class UID Data Element Not Present'
		] ifFalse: [ 
			iodClass := DicomRegistry SOPClasses at: self mediaStorageSOPClassUID ifAbsent: [nil].
			iodClass ifNil: [
				Error signal:
				 	'Impossible to Open DICOM File: Unsupported Storage SOP Class ', self mediaStorageSOPClassUID.
			] ifNotNil: [
				self parseIOD: iodClass readStream: readStream encoder: transferSyntaxEncoder.
			]
		]
	]
]

{ #category : #accessing }
DicomFile >> dicomIOD [

	^dicomIOD
]

{ #category : #accessing }
DicomFile >> dicomIOD: aDicomIOD [

	dicomIOD := aDicomIOD
]

{ #category : #initialize }
DicomFile >> dicomIOD: aDicomIOD implementationClassUID: anImplementationClassUID implementationVersionName: anImplementationVersionName sourceAETitle: anAETitle [

	self dicomIOD: aDicomIOD.
	self implementationClassUID: anImplementationClassUID.
	self implementationVersionName: anImplementationVersionName.
	self sourceApplicationEntityTitle: anAETitle.
	self mediaStorageSOPClassUID: self dicomIOD sopClassUID.
	self mediaStorageSOPInstanceUID: self dicomIOD sopInstanceUID.
	self transferSyntaxUID: self dicomIOD encoder UID.
]

{ #category : #accessing }
DicomFile >> dicomPrefix [

	^dicomPrefix
]

{ #category : #accessing }
DicomFile >> dicomPrefix: aValue [

	dicomPrefix := aValue
]

{ #category : #accessing }
DicomFile >> fileMetaInformationVersion [

	^self dataElementsValues at: 'fileMetaInformationVersion' ifAbsent: [
		self dataElementsDictionary at: 'fileMetaInformationVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'fileMetaInformationVersion' put: (self dataElementsDictionary removeKey: 'fileMetaInformationVersion') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> fileMetaInformationVersion: aOBValue [

	| dataElement |

	(self dataElementsDictionary at: 'fileMetaInformationVersion' ifPresent: [:aDataElement | aDataElement value: aOBValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fileMetaInformationVersion.
			dataElement encoder: self encoder.
			dataElement value: aOBValue.
			self dataElementsDictionary at: 'fileMetaInformationVersion' put: dataElement.
			self dataElementsValues removeKey: 'fileMetaInformationVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fileMetaInformationVersion' put: aOBValue
		]
	].

]

{ #category : #accessing }
DicomFile >> filePreamble [

	^filePreamble
]

{ #category : #accessing }
DicomFile >> filePreamble: aValue [

	filePreamble := aValue
]

{ #category : #accessing }
DicomFile >> implementationClassUID [

	^self dataElementsValues at: 'implementationClassUID' ifAbsent: [
		self dataElementsDictionary at: 'implementationClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'implementationClassUID' put: (self dataElementsDictionary removeKey: 'implementationClassUID') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> implementationClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'implementationClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #implementationClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'implementationClassUID' put: dataElement.
			self dataElementsValues removeKey: 'implementationClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'implementationClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
DicomFile >> implementationVersionName [

	^self dataElementsValues at: 'implementationVersionName' ifAbsent: [
		self dataElementsDictionary at: 'implementationVersionName' ifPresent: [:dataElement |
			self dataElementsValues at: 'implementationVersionName' put: (self dataElementsDictionary removeKey: 'implementationVersionName') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> implementationVersionName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'implementationVersionName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #implementationVersionName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'implementationVersionName' put: dataElement.
			self dataElementsValues removeKey: 'implementationVersionName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'implementationVersionName' put: aSHValue
		]
	].

]

{ #category : #initialize }
DicomFile >> initialize [
	"Initialize the attribute fields as defined in the DICOM Standard 
	See PS 3.10-2000 Table 7.1-1

	PRD 11-12.2001, 05.2002"
	
	super initialize.
	self encoder: LittleEndianExplicitVRTS.							"... the File Meta Information shall be encoded 
														 using the Explicit VR Little Endian Transfer Syntax
														(UID = 1.2.840.10008.1.2.1 as defined in DICOM PS 3.5"

	self filePreamble: (ByteArray new: 128 withAll: 16r00).
	self dicomPrefix: 'DICM'.
	self fileMetaInformationVersion: (ByteArray with: 16r00 with: 16r01). 		"...(0001H) - version, as defined in PS 3.10-2000"
	self mediaStorageSOPClassUID: nil.
]

{ #category : #testing }
DicomFile >> isPart10Format: aByteArray [
	"Check if the contents of a DICOM file are encoded with the CTN enconding rules 
	or in the rules defined in the Part 10 of the DICOM Standard.

	PRD 01.2001 - 02.2021"

	^ self dicomPrefix = (aByteArray copyFrom: 129 to: 132) asString
]

{ #category : #accessing }
DicomFile >> mediaStorageSOPClassUID [

	^self dataElementsValues at: 'mediaStorageSOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'mediaStorageSOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'mediaStorageSOPClassUID' put: (self dataElementsDictionary removeKey: 'mediaStorageSOPClassUID') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> mediaStorageSOPClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'mediaStorageSOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #mediaStorageSOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'mediaStorageSOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'mediaStorageSOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'mediaStorageSOPClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
DicomFile >> mediaStorageSOPInstanceUID [

	^self dataElementsValues at: 'mediaStorageSOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'mediaStorageSOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'mediaStorageSOPInstanceUID' put: (self dataElementsDictionary removeKey: 'mediaStorageSOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> mediaStorageSOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'mediaStorageSOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #mediaStorageSOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'mediaStorageSOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'mediaStorageSOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'mediaStorageSOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #'private - reading / writing' }
DicomFile >> parseIOD: iodClass readStream: readStream encoder: transferSyntaxEncoder [
	self
		dicomIOD:
			(iodClass new
				pdvBytesStream: readStream
				encoder: transferSyntaxEncoder)
]

{ #category : #accessing }
DicomFile >> privateInformation [

	^self dataElementsValues at: 'privateInformation' ifAbsent: [
		self dataElementsDictionary at: 'privateInformation' ifPresent: [:dataElement |
			self dataElementsValues at: 'privateInformation' put: (self dataElementsDictionary removeKey: 'privateInformation') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> privateInformation: aOBValue [

	| dataElement |

	(self dataElementsDictionary at: 'privateInformation' ifPresent: [:aDataElement | aDataElement value: aOBValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #privateInformation.
			dataElement encoder: self encoder.
			dataElement value: aOBValue.
			self dataElementsDictionary at: 'privateInformation' put: dataElement.
			self dataElementsValues removeKey: 'privateInformation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'privateInformation' put: aOBValue
		]
	].

]

{ #category : #accessing }
DicomFile >> privateInformationCreatorUID [

	^self dataElementsValues at: 'privateInformationCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'privateInformationCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'privateInformationCreatorUID' put: (self dataElementsDictionary removeKey: 'privateInformationCreatorUID') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> privateInformationCreatorUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'privateInformationCreatorUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #privateInformationCreatorUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'privateInformationCreatorUID' put: dataElement.
			self dataElementsValues removeKey: 'privateInformationCreatorUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'privateInformationCreatorUID' put: aUIValue
		]
	].

]

{ #category : #'private - reading / writing' }
DicomFile >> readDicomMetaInformationHeader: dicomPDVStream [
	"Read DICOM File Meta Information from stream. For files with a wrong 
	group length of Meta Information Header  - LAR 02.2004"

	| aDicomDataElement |
	[dicomPDVStream atEnd] whileFalse: 
			[| oldPosition |
			oldPosition := dicomPDVStream position.
			
			[aDicomDataElement := LittleEndianExplicitVRTS
						dataElementFrom: dicomPDVStream
						dataElementsDefinition: self dataElementsDefinition]
					on: Error
					do: 
						[:anEx |
						"We probably reached the meta header's end and the 
						DICOM data set has an different transfer syntax"
						dicomPDVStream position: oldPosition.
						^self].
			aDicomDataElement groupNumber = 2
				ifFalse: 
					[dicomPDVStream position: oldPosition.
					^self].
			aDicomDataElement elementNumber = 0
				ifFalse: 
					["group lenght data elements are not used"
					self dataElementsDictionary at: aDicomDataElement name asString
						put: aDicomDataElement]]
]

{ #category : #reading }
DicomFile >> readFrom: aFilename [
	"Read a DICOM IOD from aFilename. 

	 December 2001 - January 2002: First implementation;
	 February 2020: FileStream and its subclasses were deprecated
	                in Pharo 7. Code updated in order to work with
	                the new expected behavior.
	 February 2021: Check if aFilename really points to a file - PRD"

	| readStream fileReference |
	(fileReference := aFilename asFileReference) isFile
		ifTrue: [ readStream := fileReference binaryReadStream.
			[ self readFromByteStream: readStream ]
				ensure: [ readStream close; release ] ]
		ifFalse: [ Error signal: aFilename , ' is not a file!' ].
	^ self dicomIOD
]

{ #category : #'reading - private' }
DicomFile >> readFromByteStream: readStream [
	"Read an DICOM IOD from the file represented by *aFileName'. 
	PRD 12.2001 - 02.2020"

	^ readStream size > 132 ifTrue: [
		(self isPart10Format: (readStream next: 132)) ifTrue: [
			self readFromPart10FormatedDicomFile: readStream
		]
		ifFalse: [
			self readFromCTNFormatedDicomFile: readStream 
		]
	]
	ifFalse: [
		self readFromCTNFormatedDicomFile: readStream
	]

]

{ #category : #'private - reading / writing' }
DicomFile >> readFromCTNFormatedDicomFile: readStream [
"
	Read an DICOM IOD from the file represented by *aFileName'. 
	PRD 12.2001, 01-05.2002
"

	| sopCommonIOM |

	readStream position: 0.
	sopCommonIOM := SOPCommonIOM new pdvBytesStream: readStream.
	self mediaStorageSOPClassUID: sopCommonIOM sopClassUID.
	self mediaStorageSOPInstanceUID: sopCommonIOM sopInstanceUID.
	self transferSyntaxUID: LittleEndianImplicitVRTS UID.

	readStream position: 0.
	^self createDicomFileInstance: readStream.
]

{ #category : #'private - reading / writing' }
DicomFile >> readFromPart10FormatedDicomFile: readStream [
	"Read an DICOM IOD from the file represented by *aFileName*.
	PRD 12.2001 - 01.2002

	Change by L.A.R - Handling for files with wrong group lenght of 
	the DICOM File Meta Information 27.02.04"
	"******* Read the length of the DICOM File Meta Information *************"

	| groupLength dataElement dataElementsDefinition groupLengthElementTag |
	dataElementsDefinition := Dictionary new.
	self dataElementsDefinition keysAndValuesDo: 
			[:key :value |
			dataElementsDefinition at: key put: value.
			groupLengthElementTag := value groupLengthTag.
			dataElementsDefinition at: groupLengthElementTag
				ifAbsentPut: 
					[(ULDataElement new
						name: #groupLength;
						tag: groupLengthElementTag;
						vm: 1;
						type: '3';
						description: 'Group Length Tag';
						yourself) 
							encoder: self encoder; 
							value: 16r0000]].
	dataElement := LittleEndianExplicitVRTS dataElementFrom: readStream
				dataElementsDefinition: dataElementsDefinition.
	groupLength := dataElement value.

	"******* Read the DICOM File Meta Information *************"
	
	[self pdvBytesStream: (readStream next: groupLength) readStream
		encoder: LittleEndianExplicitVRTS]
			on: FileException "Stream incompleteNextCountSignal"
			do: 
				[:anEx |
				Transcript
					cr;
					show: 'Group Length of Meta Information Header has incorrect Value!!'.
				self
					readDicomMetaInformationHeader: (readStream skip: groupLength negated)].
	^self createDicomFileInstance: readStream
]

{ #category : #'private - reading / writing' }
DicomFile >> readWriteStream [
	"Answer a ByteArray ReadWriteStream with the DICOM File contents
	PRD 12.2001 - 01.2002, March 26th, 2004, 02.2020"

	| readWriteStream |

	readWriteStream := ReadWriteStream on: (ByteArray new).
	self writeContentsOn: readWriteStream.
	readWriteStream reset.
	^readWriteStream.
]

{ #category : #accessing }
DicomFile >> sourceApplicationEntityTitle [

	^self dataElementsValues at: 'sourceApplicationEntityTitle' ifAbsent: [
		self dataElementsDictionary at: 'sourceApplicationEntityTitle' ifPresent: [:dataElement |
			self dataElementsValues at: 'sourceApplicationEntityTitle' put: (self dataElementsDictionary removeKey: 'sourceApplicationEntityTitle') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> sourceApplicationEntityTitle: aAEValue [

	| dataElement |

	(self dataElementsDictionary at: 'sourceApplicationEntityTitle' ifPresent: [:aDataElement | aDataElement value: aAEValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sourceApplicationEntityTitle.
			dataElement encoder: self encoder.
			dataElement value: aAEValue.
			self dataElementsDictionary at: 'sourceApplicationEntityTitle' put: dataElement.
			self dataElementsValues removeKey: 'sourceApplicationEntityTitle' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sourceApplicationEntityTitle' put: aAEValue
		]
	].

]

{ #category : #accessing }
DicomFile >> transferSyntaxUID [

	^self dataElementsValues at: 'transferSyntaxUID' ifAbsent: [
		self dataElementsDictionary at: 'transferSyntaxUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'transferSyntaxUID' put: (self dataElementsDictionary removeKey: 'transferSyntaxUID') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> transferSyntaxUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'transferSyntaxUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #transferSyntaxUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'transferSyntaxUID' put: dataElement.
			self dataElementsValues removeKey: 'transferSyntaxUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'transferSyntaxUID' put: aUIValue
		]
	].

]

{ #category : #'private - reading / writing' }
DicomFile >> writeContentsExcludePrivateOn: writeStream [
	"Write the byte representation of myself to the given writeable stream'. 
	PRD 12.2001 - 02.2020"

	writeStream nextPutAll: self filePreamble.
	writeStream nextPutAll: self dicomPrefix asByteArray.
	self writePDVBytesOn: writeStream.
	self dicomIOD writePDVBytesOnExcludePrivate: writeStream.

]

{ #category : #'private - reading / writing' }
DicomFile >> writeContentsOn: writeStream [
	"Write the byte representation of myself to the given writeable stream'. 
	PRD 12.2001 - 02.2020"

	writeStream nextPutAll: self filePreamble.
	writeStream nextPutAll: self dicomPrefix asByteArray.
	self writePDVBytesOn: writeStream.
	self dicomIOD writePDVBytesOn: writeStream.

]

{ #category : #writing }
DicomFile >> writeTo: aFilename [
	"Write an DICOM IOD to the file represented by *aFileName'. 
	PRD 12.2001 - 02.2020"

	| writeStream |

	writeStream := aFilename asFileReference binaryWriteStream.
	self writeContentsOn: writeStream.
	writeStream
		close;
		release.
	^ aFilename
]

{ #category : #writing }
DicomFile >> writeToExcludePrivate: aFilename [
	"Write an DICOM IOD to the file represented by *aFileName'. 
	PRD 12.2001 - 02.2020"

	| writeStream |

	writeStream := aFilename asFileReference binaryWriteStream.
	self writeContentsExcludePrivateOn: writeStream.
	writeStream
		close;
		release.
	^ aFilename
]
