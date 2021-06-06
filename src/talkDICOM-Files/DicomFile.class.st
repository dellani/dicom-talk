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

{ #category : #'computer reflection 2021' }
DicomFile class >> addTextualDescriptionMethod [
	"Add a method that returns the textual attributes definition of myself.
	 The method is coded by computerReflection_TextualDataElementDefinitionMethod:
	 and added to protocol 'textual attributes definition'.
	
	 (Computer reflection is way cool!)

	 16 May 2021: Initial implementation - Paulo R. Dellani"

	| method |
	method := self computerReflection_TextualDataElementDefinitionMethod.
	MethodAddition new
		compile: method contents
		classified: 'textual attributes definition'
		withStamp: DateAndTime now printString
		notifying: nil 
		logSource: true
		"This is a class method, so refer to my metaclass"
		inClass: self class;
	compile. 
]

{ #category : #initialize }
DicomFile class >> attributes [
	^ OrderedCollection new
		add:  (OBDataElement
					newWith: #fileMetaInformationVersion
					tag: #(16r0002 16r0001)
					vm: '1'
					type: '1');
		add: (UIDataElement
					newWith: #mediaStorageSOPClassUID
					tag: #(16r0002 16r0002)
					vm: '1'
					type: '1');
		add: (UIDataElement
					newWith: #mediaStorageSOPInstanceUID
					tag: #(16r0002 16r0003)
					vm: '1'
					type: '1');
		add: (UIDataElement
					newWith: #transferSyntaxUID
					tag: #(16r0002 16r0010)
					vm: '1'
					type: '1');
		add: (UIDataElement
					newWith: #implementationClassUID
					tag: #(16r0002 16r0012)
					vm: '1'
					type: '1');
		add: (SHDataElement
					newWith: #implementationVersionName
					tag: #(16r0002 16r0013)
					vm: '1'
					type: '3');
		add: (AEDataElement
					newWith: #sourceApplicationEntityTitle
					tag: #(16r0002 16r0016)
					vm: '1'
					type: '3');
		add: (UIDataElement
					newWith: #privateInformationCreatorUID
					tag: #(16r0002 16r0100)
					vm: '1'
					type: '3');
		add: (OBDataElement
					newWith: #privateInformation
					tag: #(16r0002 16r0102)
					vm: '1'
					type: '1C');
		yourself
]

{ #category : #'computer reflection 2021' }
DicomFile class >> computerReflection_TextualDataElementDefinitionMethod [
	"Code textual data element definition method for aSequenceItemSubclass according
	 to the contents of class variables. 
	
	 April 25 2021 - This is an adaptation of DicomIOM>
	                 ComputerReflection_IOMTextualDataElementsDefinitionMethod: - PRD."

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'dicomFileTextualDataElementsDefinition'; cr;
				tab; nextPut: $"; 	nextPutAll: 'Textual data element definition for DICOM File'; cr; cr;
				tab; nextPutAll: ' Coder: DicomFile>computerReflection_TextualDataElementDefinitionMethod:'; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;

				nextPutAll: self listDataElementDefinition_Reflexive ].
]

{ #category : #'textual attributes definition' }
DicomFile class >> dicomFileTextualDataElementsDefinition [
	"Textual data element definition for DICOM File

	 Coder: DicomFile>computerReflection_TextualDataElementDefinitionMethod:

	 2021-05-16T10:52:35.335277+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll:
'# DICOM File
0002	0001	FileMetaInformationVersion                                      	OB	1	1
0002	0002	MediaStorageSOPClassUID                                         	UI	1	1
0002	0003	MediaStorageSOPInstanceUID                                      	UI	1	1
0002	0010	TransferSyntaxUID                                               	UI	1	1
0002	0012	ImplementationClassUID                                          	UI	1	1
0002	0013	ImplementationVersionName                                       	SH	1	3
0002	0016	SourceApplicationEntityTitle                                    	AE	1	3
0002	0100	PrivateInformationCreatorUID                                    	UI	1	3
0002	0102	PrivateInformation                                              	OB	1	1C'. ]

]

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
		readFrom: '/usr/data/Projetos/talkDICOM/TEST-DATA/_read_test/0CE1AF6B/1A0E091E/256FE631'.

	dicomFile2 := self dicomIOD: dicomFile1 dicomIOD.
	dicomFile2 writeTo: '/tmp/256FE631.talkDicom'
]

{ #category : #initialize }
DicomFile class >> initialize [
	"Initialize the dictionary of DICOM File Meta Elements
	PS 3.3-2000 Annex C.7.6.2

	16 May 2021: New implementation - Paulo R. Dellani"

	"self attributes
		do: [ :dataElement | self addDataElement: dataElement ]"

	self initializeDataElementsDefinition
]

{ #category : #'computer reflection 2021' }
DicomFile class >> listDataElementDefinition_Reflexive [
	"List my data element definition using character (tab) separated values.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - Modified from 'listDataElementDefinition_full' to not 
	                include the expanded sequence attributes;
	April 25 2021 - SequenceItem specific implementation;
	  May 09 2021 - Refactoring (pushed up) from SequenceItem to Item;
	                Version for computer reflection - PRD."

	| definition |

	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll:'; cr; nextPutAll: '''# DICOM File'.

			definition := SortedCollection withAll: self attributes.
			definition isNotEmpty ifTrue: [ 
				definition do: [ :item |
					aStream cr.
					item csvPrintOn: aStream separator: Character tab level: 0 ] ].

			aStream
				nextPut: $'; nextPut: $..

			aStream nextPutAll: ' ]'; cr. ].


		
	



]

{ #category : #'instance creation' }
DicomFile class >> readFrom: aFilename [
	"07 April 2021: Create an instance of myself and read the contents of
	                the given filename. Return the newly created instance;
	  03 June 2021: Updated the code to because the parser expects to find 
	                the data elements definitions as instance variables
	                - Paulo R. Dellani"

	^ self new
		dataElementsDefinition: self dataElementsDefinition;
		dataElementsDefinitionByName: self dataElementsDefinitionByName;
		readFrom: aFilename;
		yourself
]

{ #category : #'textual attributes definition' }
DicomFile class >> textualAttributesDefinition [
	^ self dicomFileTextualDataElementsDefinition
]

{ #category : #accessing }
DicomFile >> _transferSyntaxUID [

	^self dataElementsValues at: 'transferSyntaxUID' ifAbsent: [
		self dataElementsDictionary at: 'transferSyntaxUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'transferSyntaxUID' put: (self dataElementsDictionary removeKey: 'transferSyntaxUID') value.
		]
	]

]

{ #category : #accessing }
DicomFile >> _transferSyntaxUID: aUIValue [

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

{ #category : #accessing }
DicomFile >> contents [
	"Create an instance of ByteArray with the contents of the DICOM file
	PRD 12.2001 - 01.2002, 02.2020"

	^self readWriteStream contents

]

{ #category : #'private - reading / writing' }
DicomFile >> createDicomFileInstance: readStream [
	| transferSyntaxEncoder aDicomSOPCommonIOM position iodDef |
	DicomRegistry TransferSyntaxes
		at: self transferSyntaxUID
		ifPresent: [ :value | transferSyntaxEncoder := value ]
		ifAbsent: [ Error
				signal:
					'Impossible to Open DICOM File: the file is encoded with an unsupported transfer syntax' ].

	"In the case that mediaStorageSOPClassUID data element is not present, like
	 with files written by GE CENTRICITY_3.0, look for the the SOP Class UID data
	 element in the dicom dataset."
	self mediaStorageSOPClassUID
		ifNil: [ position := readStream position.
			aDicomSOPCommonIOM := SOPCommonIOM new
				pdvBytesStream: readStream
				encoder: transferSyntaxEncoder.
			self mediaStorageSOPClassUID: aDicomSOPCommonIOM sopClassUID.
			self mediaStorageSOPInstanceUID: aDicomSOPCommonIOM sopInstanceUID.
			readStream position: position.
			Error
				signal:
					'Impossible to Open DICOM File: Media Storage SOP Class UID Data Element Not Present' ]
		ifNotNil: [ self mediaStorageSOPClassUID isEmpty
				ifTrue: [ Error
						signal:
							'Impossible to Open DICOM File: Media Storage SOP Class UID Data Element Not Present' ]
				ifFalse: [ self dicomIOD: DicomIOD new.
					iodDef := DicomRegistry dicomIODDataElementDefinitions
						at: self mediaStorageSOPClassUID
						ifAbsent: nil.
					iodDef
						ifNotNil: [ self dicomIOD
								name: iodDef name;
								sopClassUID: iodDef sopClassUID;
								dataElementsDefinition: (Dictionary withAll: iodDef dataElementsDefinition);
								dataElementsDefinitionByName: (Dictionary withAll: iodDef dataElementsDefinitionByName) ].
					self
						parseIODFrom: readStream
						transferSyntax: transferSyntaxEncoder ] ]
]

{ #category : #accessing }
DicomFile >> dicomIOD [
	^ dicomIOD
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
DicomFile >> filePreamble [

	^filePreamble
]

{ #category : #accessing }
DicomFile >> filePreamble: aValue [

	filePreamble := aValue
]

{ #category : #initialize }
DicomFile >> initialize [
	"Initialize the attribute fields as defined in the DICOM Standard 
	See PS 3.10-2000 Table 7.1-1

	PRD 11-12.2001, 05.2002"
	
	super initialize.

	self dataElementsDefinition: self class dataElementsDefinition.
	self dataElementsDefinitionByName: self class dataElementsDefinitionByName.

	self encoder: LittleEndianExplicitVRTS.	"... the File Meta Information shall be encoded 
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

{ #category : #'private - reading / writing' }
DicomFile >> parseIODFrom: readStream transferSyntax: transferSyntaxEncoder [
	^ self dicomIOD
		pdvBytesStream: readStream
		encoder: transferSyntaxEncoder
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
	self dataElementsDefinition 
		keysAndValuesDo: [ :key :value |
			dataElementsDefinition at: key put: value.
			groupLengthElementTag := value tag groupLengthTag.
			dataElementsDefinition at: groupLengthElementTag
				ifAbsentPut: 
					[ (DataElementDefinition new
						vr: 'UL';
						name: #groupLength;
						tag: groupLengthElementTag;
						vm: '1';
						type: '3';
						description: 'Group Length Tag';
						yourself) 
							"encoder: self encoder; 
							value: 16r0000" ] ].
	dataElement := LittleEndianExplicitVRTS dataElementFrom: readStream
				dataElementsDefinition: dataElementsDefinition.
	groupLength := dataElement value.

	"******* Read the DICOM File Meta Information *************"
	[ self pdvBytesStream: (readStream next: groupLength) readStream
		encoder: LittleEndianExplicitVRTS ]
			on: FileException "Stream incompleteNextCountSignal"
			do: 
				[:anEx |
				Transcript
					cr;
					show: 'Group Length of Meta Information Header has incorrect Value!!'.
				self
					readDicomMetaInformationHeader: (readStream skip: groupLength negated)].
	^ self createDicomFileInstance: readStream
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
