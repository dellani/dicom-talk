"
Implementation of an API for the communication between 
DIMSE protocol machines and applications running under it.

Local applications in the SCP role can handle command requests
and send command responses from/to remote DICOM application
entities shall implement the following message protocols:

Protocol C-STORE
	dicomC_STORE:  aDicomIOD
Protocol C-FIND
	dicomC_FIND:
	nextQueryAnswer
Protocol C-MOVE
	dicomC_MOVE:
Protocol C-DELETE
	deleteImage:
	deletePatient:
	deleteSeries:
	deleteStudiesOlderThan:
	deleteStudy:

Local applications in the SCU role can send DICOM command requests 
and handle DICOM command responses to/from remote DICOM SCP 
application entities shallimplement the following message protocols:

Protocol SCU storage
	cancelStorage
	storeIOD: aDicomIOD
Protocol SCU query
	cancelQuery
	loadImages:
	loadSeries:
	loadStudies:
	loadPatients:
Protol SCU retrieval
	cancelRetrieval
	retrievePatientTo: patientID: patientStudies:
	retrieveStudyTo: patientID:  studyInstanceUID: 
	retrieveSeriesTo: patientID:  studyInstanceUID:  listOfSeriesInstanceUID: 
	retrieveImagesTo: patientID: studyInstanceUID: seriesInstanceUID: listOfSOPInstanceUID: 

The API includes the following message protocols:

Protocol open-close
	abortAndClose
	close
	isOpen
	open
	openForQueryRetrieval
	openForStorage
	openForVerification
Protocol private
	logAPIString

The class method aeConfigurationClass holds the Smalltalk class
responsible for parsing the interface configuration parameters 
from its respective XML configuration entry. This class shall shall
be a subclass of DicomApplicationEntity.

Every non-abstract subclass shall implement a class initialization
method in order to add a reference to itself to the registry of application
interfaces classes. SCP classes shall add themselves to DicomRegistry>>
SCPInterfaces and SCU classes to  DicomRegistry>>SCPInterfaces, as 
shown in the example code:

initialize
	DicomRegistry SCPInterfaces at: self aeConfigurationClass interfaceClass put: self.

or

initialize
	DicomRegistry SCUInterfaces at: self aeConfigurationClass interfaceClass put: self.

PRD - 02.2001 - 08.2017
"
Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'dicomApplication',
		'logCollector',
		'queryRetrieveInformationModel',
		'localAEDescription',
		'remoteAEDescription',
		'studyStorageKeys',
		'seriesStorageKeys',
		'patientStorageKeys',
		'cancel'
	],
	#category : #'talkDICOM-Interfaces'
}

{ #category : #accessing }
Interface class >> aeConfigurationClass [
"
	Answer a reference to the class that reads from XML data the parameters for the 
	interface and keep them for interface creation in the Upper Layer Configuration
	PRD - April 18th, 2004
"
	^nil
]

{ #category : #'instance creation' }
Interface class >> createDicomSCPInterfaceFor: aDicomApplicationEntity remoteAEDescription: aRemoteAEDescription dicomApplication: aDicomApplication logCollector: aLogCollector [
	| dicomInterfaceClass |
	dicomInterfaceClass := DicomRegistry SCPInterfaces
		at: aDicomApplicationEntity interfaceClass
		ifAbsent: Interface.
	^ dicomInterfaceClass new
		localAEDescription: aDicomApplicationEntity
		remoteAEDescription: aRemoteAEDescription
		dicomApplication: aDicomApplication
		dicomUpperLayer: nil
		logCollector: aLogCollector
]

{ #category : #'instance creation' }
Interface class >> createDicomSCUInterfaceFor: aLocalAEDescription remoteAEDescription: aRemoteAEDescription dicomApplication: aDicomApplication dicomUpperLayer: dicomUpperLayer logCollector: logCollector [

	| dicomInterfaceClass |

	dicomInterfaceClass := (DicomRegistry SCUInterfaces at: aRemoteAEDescription interfaceClass ifAbsent: Interface).
	^dicomInterfaceClass new localAEDescription: aLocalAEDescription 
						remoteAEDescription: aRemoteAEDescription 
						dicomApplication: aDicomApplication
						dicomUpperLayer: dicomUpperLayer
						logCollector: logCollector
]

{ #category : #'instance creation' }
Interface class >> new [

	^super new initializeStorageKeys.
]

{ #category : #'application storage' }
Interface >> _loadFilesFromDirectory: directoryReference deepness: anInteger [
	"Load all the file names in all subdirectories of aFilename

	PRD - May 03th, 2003 - February 10th, 2015, February 21th, 2017"

	| readIOD microseconds |

	"anInteger > 6 ifTrue: [^nil]."

	directoryReference children do: 
		[:fileReference |
			
		fileReference isDirectory 
			ifTrue: 
				[self loadFilesFromDirectory: fileReference deepness: anInteger + 1]
			ifFalse:
				[microseconds := Time microsecondsToRun: 
					[[readIOD := DicomFile readIODFromDICOMFile: fileReference] on: Error do: 
						[:anError | | errorMessage |
						errorMessage := String new: 10 streamContents: 
							[ :aStream |	 aStream 
								nextPutAll: 'Failed to load file ';
								nextPutAll: fileReference asString;
								nextPutAll: ':\';
								nextPutAll: anError description].
						self logCollector logMessage: errorMessage.
						readIOD := nil]].

				readIOD notNil 
					ifTrue: 
						["logfile := '/tmp/mongointerface.log' asFilename appendStream.
						logfile 
							nextPutAll: DateAndTime now printString; tab; 
							nextPutAll: completeDirContent asString; tab; 
							nextPutAll: completeDirContent fileSize printString; tab; 
							nextPutAll: microseconds printString;
							flush; close; release."

						microseconds := Time microsecondsToRun: 
							[self open; storeIOD: readIOD; close].

						"logfile := '/tmp/mongointerface.log' asFilename appendStream.
						logfile 
							tab; nextPutAll: microseconds printString; cr;
							flush; close; release."
						]
				]
	]
]

{ #category : #'open-close' }
Interface >> abortAndClose [
	"Abort operations and close the Interface
	
	PRD - 19. Februar 2003"

	^ self subclassResponsibility
]

{ #category : #accessing }
Interface >> cancel [
	^ cancel isNil
		ifTrue: [ cancel := false ]
		ifFalse: [ cancel ]
]

{ #category : #accessing }
Interface >> cancel: anObject [
	cancel := anObject
]

{ #category : #'SCU query' }
Interface >> cancelQuery [
	^ self subclassResponsibility
]

{ #category : #'SCU retrieval' }
Interface >> cancelRetrieval [
	^ self subclassResponsibility
]

{ #category : #'SCU storage' }
Interface >> cancelStorage [
	^ self subclassResponsibility
]

{ #category : #'application query' }
Interface >> checkImagePresenceInDB: sopInstanceUID [
	| aC_FIND_IdentifierCollection aC_FIND_RQ_Identifier |
	aC_FIND_RQ_Identifier := StudyRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: ''.
	aC_FIND_RQ_Identifier studyInstanceUID: ''.
	aC_FIND_RQ_Identifier seriesInstanceUID: ''.
	aC_FIND_RQ_Identifier sopInstanceUID: sopInstanceUID trimBoth.
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadImages_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #'application query' }
Interface >> checkPatientPresenceInDB: patientID [
	| aC_FIND_RQ_Identifier aC_FIND_IdentifierCollection |
	aC_FIND_RQ_Identifier := PatientRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: patientID trimBoth.
	aC_FIND_RQ_Identifier studyInstanceUID: ''.
	aC_FIND_RQ_Identifier seriesInstanceUID: ''.
	aC_FIND_RQ_Identifier sopInstanceUID: ''.
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadPatients_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #'application query' }
Interface >> checkPresenceInDB: anObject [
	anObject patientLevel
		ifTrue: [ ^ self checkPatientPresenceInDB: anObject patient patientID ].
	anObject studyLevel
		ifTrue: [ ^ self checkStudyPresenceInDB: anObject study studyInstanceUID ].
	anObject seriesLevel
		ifTrue: [ ^ self checkSeriesPresenceInDB: anObject series seriesInstanceUID ].
	anObject imageLevel
		ifTrue: [ ^ self checkImagePresenceInDB: anObject images sopInstanceUID ].
	^ OrderedCollection new
]

{ #category : #'application query' }
Interface >> checkSeriesPresenceInDB: seriesInstanceUID [
	| aC_FIND_RQ_Identifier aC_FIND_IdentifierCollection |
	aC_FIND_RQ_Identifier := StudyRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: ''.
	aC_FIND_RQ_Identifier studyInstanceUID: ''.
	aC_FIND_RQ_Identifier seriesInstanceUID: seriesInstanceUID trimBoth.
	aC_FIND_RQ_Identifier sopInstanceUID: ''.
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadSeries_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #'application query' }
Interface >> checkStudyPresenceInDB: studyInstanceUID [
	| aC_FIND_RQ_Identifier aC_FIND_IdentifierCollection |
	aC_FIND_RQ_Identifier := StudyRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: ''.
	aC_FIND_RQ_Identifier studyInstanceUID: studyInstanceUID trimBoth.
	aC_FIND_RQ_Identifier seriesInstanceUID: ''.
	aC_FIND_RQ_Identifier sopInstanceUID: ''.
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadStudies_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #'open-close' }
Interface >> close [
	"Close the Interface - PRD 08-09.2001"

	^ self subclassResponsibility
]

{ #category : #'private (SCU query)' }
Interface >> createQueryFromC_FIND_RQ_Identifier: dicomC_FIND_RQ_Identifier [
	| newDictionary1 newDictionary2 |
	newDictionary1 := Dictionary new.
	newDictionary2 := Dictionary new.
	dicomC_FIND_RQ_Identifier dataElementsValues
		keysAndValuesDo: [ :key :value | 
			key ~= 'queryRetrieveLevel'
				ifTrue: [ newDictionary2 at: key put: true.
					value notEmpty
						ifTrue: [ newDictionary1 at: key put: value trimBoth ] ] ].
	^ Array with: newDictionary1 with: newDictionary2
]

{ #category : #'private (C-MOVE)' }
Interface >> createQueryFromC_MOVE_RQ_Identifier: dicomC_MOVE_RQ_Identifier [
	| newDictionary1 array |
	newDictionary1 := Dictionary new.
	"newDictionary2 := Dictionary new."
	dicomC_MOVE_RQ_Identifier dataElementsValues
		keysAndValuesDo: [ :key :value | 
			key ~= 'queryRetrieveLevel'
				ifTrue: [ "newDictionary2 at: key put: true."
					(value isKindOf: OrderedCollection)
						ifTrue: [ value size = 1
								ifTrue: [ newDictionary1 at: key put: value first trimBoth ]
								ifFalse: [ array := Array new: value size.
									1 to: value size do: [ :index | array at: index put: [ Dictionary new at: key put: (value at: index) ] ].
									newDictionary1 at: '$or:' put: array ] ].
					(value isKindOf: String)
						ifTrue: [ value notEmpty
								ifTrue: [ newDictionary1 at: key put: value trimBoth ] ] ] ].
	"^Array with: newDictionary1 with: newDictionary2"
	^ newDictionary1
]

{ #category : #'C-DELETE' }
Interface >> deleteImage: sopInstanceUID [
	^ self subclassResponsibility
]

{ #category : #'C-DELETE' }
Interface >> deletePatient: patientID [
	^ self subclassResponsibility
]

{ #category : #'C-DELETE' }
Interface >> deleteSeries: seriesInstanceUID [
	^ self subclassResponsibility
]

{ #category : #'C-DELETE' }
Interface >> deleteStudiesOlderThan: numberOfDays [
	"This method will delete all the studies from a data base data repository 
	older than a certain number of days - PRD - July 31th, 2003"

	^ self subclassResponsibility
]

{ #category : #'C-DELETE' }
Interface >> deleteStudy: studyInstanceUID [
	^ self subclassResponsibility
]

{ #category : #accessing }
Interface >> dicomApplication [
	^ dicomApplication
]

{ #category : #accessing }
Interface >> dicomApplication: anObject [
	dicomApplication := anObject
]

{ #category : #'C-FIND' }
Interface >> dicomC_FIND: aC_FIND_RQ_Identifier [
	^ self subclassResponsibility
]

{ #category : #'C-MOVE' }
Interface >> dicomC_MOVE: aC_MOVE_RQ_Identifier [
	^ self subclassResponsibility
]

{ #category : #'C-STORE' }
Interface >> dicomC_STORE: dicomIOD [
	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
Interface >> initializeStorageKeys [
	studyStorageKeys := OrderedCollection new.
	GeneralStudyIOM DataElements , PatientStudyIOM DataElements
		do: [ :dataElement | studyStorageKeys add: dataElement name asString ].
	seriesStorageKeys := OrderedCollection new.
	GeneralSeriesIOM DataElements do: [ :dataElement | seriesStorageKeys add: dataElement name asString ].
	patientStorageKeys := OrderedCollection new.
	PatientIOM DataElements , PatientStudyIOM DataElements , SpecimenIdentificationIOM DataElements
		do: [ :dataElement | patientStorageKeys add: dataElement name asString ]
]

{ #category : #'open-close' }
Interface >> isOpen [
	"Use the DIMSE Verify service class (C-ECHO) to check the status
	of the association. Answer true if an association between the local
	service user and the remote service provider is open.
	
	PRD 08-09.2001"

	^ self subclassResponsibility
]

{ #category : #'application storage' }
Interface >> loadFilesFromDirectory: directoryReference deepness: anInteger [
	"Load all the file names in all subdirectories of aFilename

	PRD - May 03th, 2003 - February 10th, 2015, February 21th, 2017"

	^ self loadFilesFromDirectory: directoryReference deepness: anInteger verbosity: false
]

{ #category : #'application storage' }
Interface >> loadFilesFromDirectory: directoryReference deepness: anInteger verbosity: verbose [
	"Load all the file names in all subdirectories of aFilename

	PRD - May 03th, 2003 - February 10th, 2015, February 21th, 2017"

	| readIOD |
	"anInteger > 6 ifTrue: [^nil]."
	directoryReference children
		do: [ :fileReference | 
			fileReference isDirectory
				ifTrue: [ self loadFilesFromDirectory: fileReference deepness: anInteger + 1 verbosity: verbose]
				ifFalse: [ verbose
						ifTrue: [ self logCollector logMessage: 'Reading file ' , fileReference printString, ' '].
					[ readIOD := DicomFile readIODFromDICOMFile: fileReference ]
						on: Error
						do: [ :anError | 
							| errorMessage |
							errorMessage := String
								new: 10
								streamContents: [ :aStream | 
									aStream
										nextPutAll: 'Failed to load file ';
										nextPutAll: fileReference asString;
										nextPutAll: ':\';
										nextPutAll: anError description ].
							self logCollector logMessage: errorMessage.
							readIOD := nil ].
					readIOD notNil
						ifTrue: [ self
								open;
								storeIOD: readIOD;
								close ] ] ]
]

{ #category : #'SCU query' }
Interface >> loadImages: aSeries [
	"Query image information from remote DICOM Application Entity for the supplied series

	PRD 09.2001 - 01.2016"

	^ self subclassResponsibility
]

{ #category : #'application storage' }
Interface >> loadImagesFrom: sourceInterface [
	"Store all matching Patient/Study/Series/Image SOP Instances in the data repository 
	to which this interface in a second data repository throught destinationInterface. 

	PRD - June 12th, 2003 - March 17th, 2004, Febrary 21th, 2017"

	| directoryReference errorMessage |
	directoryReference := sourceInterface remoteAEDescription baseDirectory asFileReference.
	directoryReference exists
		ifTrue: [ self loadFilesFromDirectory: directoryReference deepness: 1 ]
		ifFalse: [ errorMessage := String
				new: 10
				streamContents: [ :aStream | 
					aStream
						nextPutAll: 'Directory ';
						nextPutAll: directoryReference asString;
						nextPutAll: ' not found!' ].
			Error signal: errorMessage ]
]

{ #category : #'private (SCU query)' }
Interface >> loadImages_C_FIND_Identifier: aC_FIND_RQ_Identifier [
	"Query series information from the database using the 
	supplied C-FIND-RQ-Identifier - PRD 09.2001 - 01.2016"

	| answer |
	answer := nil.
	self openForQueryRetrieval.
	answer := self loadImages_C_FIND_RQ: aC_FIND_RQ_Identifier.
	self close.	"Close database interface"
	^ answer
]

{ #category : #'private (SCU query)' }
Interface >> loadImages_C_FIND_RQ: aC_FIND_RQ_Identifier [
	^ self subclassResponsibility
]

{ #category : #'SCU query' }
Interface >> loadPatients: aC_FIND_RQ_Identifier [
	"Query the remote DICOM Application Entity about 
	patient Information using the supplied DICOM C-FIND Identifier.
	
	PRD 09.2001 - 01.2002"

	^ self subclassResponsibility
]

{ #category : #'private (SCU query)' }
Interface >> loadPatients_C_FIND_Identifier: aC_FIND_RQ_Identifier [
	"Query study information from the database using the supplied C-FIND-RQ-Identifier
	
	PRD 09.2001 - 02.2017"

	| answer |
	answer := nil.
	self openForQueryRetrieval.
	answer := self loadPatients_C_FIND_RQ: aC_FIND_RQ_Identifier.
	self close.	"Close connection to database"
	^ answer
]

{ #category : #'private (SCU query)' }
Interface >> loadPatients_C_FIND_RQ: aC_FIND_RQ_Identifier [
	^ self subclassResponsibility
]

{ #category : #'SCU query' }
Interface >> loadSeries: aStudy [
	"Query series information from remote DICOM Application Entity
	for the supplied study.
	
	PRD 09.2001 - 01.2016"

	^ self subclassResponsibility
]

{ #category : #'private (SCU query)' }
Interface >> loadSeries_C_FIND_Identifier: aC_FIND_RQ_Identifier [
	"Query the remote DICOM Application Entity about series Information for the supplied study.
	
	PRD 09.2001 - 02.2017"

	| answer |
	answer := nil.
	self openForQueryRetrieval.
	answer := self loadSeries_C_FIND_RQ: aC_FIND_RQ_Identifier.
	self close.	"Close interface to the remote DICOM SCP AE"
	^ answer
]

{ #category : #'private (SCU query)' }
Interface >> loadSeries_C_FIND_RQ: aC_FIND_RQ_Identifier [
	^ self subclassResponsibility
]

{ #category : #'SCU query' }
Interface >> loadStudies: aPatient [
	"Query study information from the database for the supplied patient.

	PRD 09.2001 - 01.2016"

	^ self subclassResponsibility
]

{ #category : #'private (SCU query)' }
Interface >> loadStudies_C_FIND_Identifier: aC_FIND_RQ_Identifier [
	"Query study information from the database using the supplied C-FIND-RQ-Identifier
	
	PRD 09.2001 - 01.2017"

	| answer |
	answer := nil.
	self openForQueryRetrieval.
	answer := self loadStudies_C_FIND_RQ: aC_FIND_RQ_Identifier.
	self close.	"Close connection to database"
	^ answer
]

{ #category : #'private (SCU query)' }
Interface >> loadStudies_C_FIND_RQ: aC_FIND_RQ_Identifier [
	^ self subclassResponsibility
]

{ #category : #accessing }
Interface >> localAEDescription [
	^ localAEDescription
]

{ #category : #accessing }
Interface >> localAEDescription: anObject [
	localAEDescription := anObject
]

{ #category : #'initialize-release' }
Interface >> localAEDescription: aLocalAEDescription remoteAEDescription: aRemoteAEDescription dicomApplication: aDicomApplication dicomUpperLayer: aDicomUpperLayer logCollector: aDicomLogCollector [
	self localAEDescription: aLocalAEDescription.
	self remoteAEDescription: aRemoteAEDescription.
	self dicomApplication: aDicomApplication.
	self logCollector: aDicomLogCollector
]

{ #category : #private }
Interface >> logAPIString [
	"Returns the interface name for log use. Benoit FOULETIER (benblo@free.fr) 06-2003"

	^ self subclassResponsibility
]

{ #category : #accessing }
Interface >> logCollector [
	^ logCollector
]

{ #category : #accessing }
Interface >> logCollector: anObject [
	logCollector := anObject
]

{ #category : #private }
Interface >> logMessage: aString [
	"Log a aString. Debug leve is five.

	PRD - 02.2001 - 04.2004"

	self logCollector logMessage: self logAPIString , aString debugLevel: 5
]

{ #category : #'private (C-MOVE)' }
Interface >> matchSOPInstancesFor: aC_MOVE_RQ_Identifier [
	"Performs a query in the local database, answering an OrderedCollection
	with all SOP Instance UIDs matches to the given C-MOVE-RQ Identifier

	PRD - 02-06.2002"

	^ self subclassResponsibility
]

{ #category : #'C-FIND' }
Interface >> nextQueryAnswer [
	^ self subclassResponsibility
]

{ #category : #'application utilities' }
Interface >> nextSeriesInstanceUIDFor: studyInstanceUID [
	"Answer the next available series instance UID in a Study.

	PRD - August 29th, 2003 - March 18th, 2004"

	| nextSeriesNumber answer |
	"Get the next series number"
	nextSeriesNumber := self nextSeriesNumberFor: studyInstanceUID.
	"Append the next series number to the given studyInstanceUID"
	answer := studyInstanceUID , nextSeriesNumber.
	"creating in this way a new valid series instance UID for the given study"
	^ answer
]

{ #category : #'application utilities' }
Interface >> nextSeriesNumberFor: studyInstanceUID [
	"Answer the next series number available in a DICOM Study.

	PRD - August 29th, 2003 - March 18th, 2004"

	| lastSeriesNumber answer study seriesNumberSortedCollection |
	"Series query message protocol conversion"
	study := Study new.
	study generalStudyIOM studyInstanceUID: studyInstanceUID.
	answer := self perform: ('loadSeries' , self queryRetrieveInformationModel , ':') asSymbol with: study.
	"Sort the already in use series numbers"
	seriesNumberSortedCollection := SortedCollection new.
	answer do: [ :aC_FINDIdentifier | seriesNumberSortedCollection add: aC_FINDIdentifier seriesNumber asNumber ].
	"Take the last series number in use"
	lastSeriesNumber := seriesNumberSortedCollection last.
	"The next series number...."
	answer := (lastSeriesNumber asNumber + 1) printString.
	"will be the answer"
	^ answer
]

{ #category : #'application utilities' }
Interface >> nextSeriesNumberFor: studyInstanceUID after: number [
	"Answer the next series number available in a DICOM Study

	PRD - August 29th, 2003 - March 18th, 2004"

	| nextSeriesNumber answer study seriesNumberSortedCollection |
	"Series query message protocol conversion"
	study := Study new.
	study generalStudyIOM studyInstanceUID: studyInstanceUID.
	answer := self perform: ('loadSeries' , self queryRetrieveInformationModel , ':') asSymbol with: study.
	"Sort the already in use series numbers"
	seriesNumberSortedCollection := SortedCollection new.
	answer
		do: [ :aC_FINDIdentifier | seriesNumberSortedCollection add: aC_FINDIdentifier seriesNumber asNumber ].
	nextSeriesNumber := number.
	"Look for the series number next after the one given as parameter in 'number'"
	seriesNumberSortedCollection
		do: [ :seriesNumber | 
			seriesNumber > number
				ifTrue: [ nextSeriesNumber > number
						ifFalse: [ nextSeriesNumber := seriesNumber ] ] ].
	^ nextSeriesNumber
]

{ #category : #'open-close' }
Interface >> open [
	"Open the Interface - PRD 08-09.2001"

	^ self subclassResponsibility
]

{ #category : #'open-close' }
Interface >> openForQueryRetrieval [
	"The subclass must implement differente code to open an Association
	with a remote DICOM Application Entity with negotiation of presentation
	contexts only for DICOM query (C-FIND) and retrieval (C-MOVE) services.
	
	PRD 08-09.2001, 01-07.2002"

	^ self open
]

{ #category : #'open-close' }
Interface >> openForStorage [
	"The subclass must implement differente code to open an Association
	with a remote DICOM Application Entity with negotiation of presentation
	contexts only for storage (C-STORE) services.
	
	PRD 08-09.2001, 01-07.2002"

	^ self open
]

{ #category : #'open-close' }
Interface >> openForVerification [
	"The subclass must implement differente code to open an Association
	with a remote DICOM Application Entity with negotiation of presentation
	contexts only for DICOM Verification (C-ECHO) services.

	PRD 08-09.2001, 01-07.2002"

	^ self open
]

{ #category : #accessing }
Interface >> patientStorageKeys [
	^ patientStorageKeys
]

{ #category : #accessing }
Interface >> patientStorageKeys: anObject [
	patientStorageKeys := anObject
]

{ #category : #'private (application retrieval)' }
Interface >> query: aC_MOVE_RQ_Identifier do: aBlock [
	^ self subclassResponsibility
]

{ #category : #deprecation }
Interface >> queryImage: sopInstanceUID [
	| aC_FIND_IdentifierCollection aC_FIND_RQ_Identifier |
	aC_FIND_RQ_Identifier := StudyRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: ''.
	aC_FIND_RQ_Identifier studyInstanceUID: ''.
	aC_FIND_RQ_Identifier seriesInstanceUID: ''.
	aC_FIND_RQ_Identifier sopInstanceUID: (OrderedCollection with: sopInstanceUID).
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadImages_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #accessing }
Interface >> queryRetrieveInformationModel [
	^ queryRetrieveInformationModel
]

{ #category : #accessing }
Interface >> queryRetrieveInformationModel: anObject [
	queryRetrieveInformationModel := anObject
]

{ #category : #'query/retrieve information model' }
Interface >> queryRetrieveInformationModelIsPatientRoot [
	"True if the Query/Retrieve Information Model
	is set to patient root. See PS 3.4 2000 C.6.
	
	PRD 09.2001"

	^ self queryRetrieveInformationModel = #PATIENT_ROOT
]

{ #category : #'query/retrieve information model' }
Interface >> queryRetrieveInformationModelIsStudyRoot [
	"True if the Query/Retrieve Information Model
	is set to patient root. See PS 3.4 2000 C.6
	
	PRD 09.2001"

	^ self queryRetrieveInformationModel = #STUDY_ROOT
]

{ #category : #deprecation }
Interface >> querySeries: seriesInstanceUID [
	| aC_FIND_IdentifierCollection aC_FIND_RQ_Identifier |
	self halt.
	aC_FIND_RQ_Identifier := StudyRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: ''.
	aC_FIND_RQ_Identifier studyInstanceUID: ''.
	aC_FIND_RQ_Identifier seriesInstanceUID: seriesInstanceUID trimBoth.
	aC_FIND_RQ_Identifier sopInstanceUID: ''.
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadImages_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #deprecation }
Interface >> queryStudy: studyInstanceUID [
	| aC_FIND_IdentifierCollection aC_FIND_RQ_Identifier |
	aC_FIND_RQ_Identifier := StudyRoot_Query_RQ_Identifier new.
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RQ_Identifier patientID: ''.
	aC_FIND_RQ_Identifier studyInstanceUID: studyInstanceUID trimBoth.
	aC_FIND_RQ_Identifier seriesInstanceUID: ''.
	aC_FIND_RQ_Identifier sopInstanceUID: ''.
	aC_FIND_RQ_Identifier instanceNumber: ''.
	aC_FIND_RQ_Identifier overlayNumber: ''.
	aC_FIND_RQ_Identifier curveNumber: ''.
	aC_FIND_RQ_Identifier lutNumber: ''.
	aC_FIND_IdentifierCollection := self loadImages_C_FIND_RQ: aC_FIND_RQ_Identifier.
	^ aC_FIND_IdentifierCollection
]

{ #category : #'initialize-release' }
Interface >> release [
	self dicomApplication: nil
]

{ #category : #accessing }
Interface >> remoteAEDescription [
	^ remoteAEDescription
]

{ #category : #accessing }
Interface >> remoteAEDescription: anObject [
	remoteAEDescription := anObject
]

{ #category : #'application retrieval' }
Interface >> retrieve: anObject [
	anObject patientLevel
		ifTrue: [ ^ self retrievePatient: anObject patient ].
	anObject studyLevel
		ifTrue: [ ^ self retrieveStudy: anObject study ].
	anObject seriesLevel
		ifTrue: [ ^ self retrieveSeries: anObject series ].
	anObject imageLevel
		ifTrue: [ ^ self retrieveDicomImage: anObject images ]
]

{ #category : #'application retrieval' }
Interface >> retrieveDicomImage: anIE [
	| patientsDictionary |
	patientsDictionary := PatientDictionary new.
	self
		retrieveDicomImage: anIE
		block: [ :databaseMatch | self store: databaseMatch patientsDictionary: patientsDictionary ].
	^ patientsDictionary imagesDictionary at: anIE sopInstanceUID trimBoth ifAbsent: [ nil ]
]

{ #category : #'private (application retrieval)' }
Interface >> retrieveDicomImage: anIE block: aBlock [
	| aC_MOVE_RQ_Identifier |
	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [ StudyRoot_Retrieval_RQ_Identifier new ]
		ifFalse: [ PatientRoot_Retrieval_RQ_Identifier new ].
	aC_MOVE_RQ_Identifier compositeObjectInstanceInformation.
	aC_MOVE_RQ_Identifier patientID: anIE series study patient patientID trimBoth.
	aC_MOVE_RQ_Identifier studyInstanceUID: anIE series study studyInstanceUID trimBoth.
	aC_MOVE_RQ_Identifier seriesInstanceUID: anIE series seriesInstanceUID trimBoth.
	aC_MOVE_RQ_Identifier sopInstanceUID: (OrderedCollection with: anIE sopInstanceUID trimBoth).
	self query: aC_MOVE_RQ_Identifier do: aBlock
]

{ #category : #'application retrieval' }
Interface >> retrieveImage: aSOPInstanceUID [
	^ self retrieveSOPInstanceUID: aSOPInstanceUID trimBoth
]

{ #category : #'SCU retrieval' }
Interface >> retrieveImagesTo: moveDestinationAE patientID: patientID studyInstanceUID: studyInstanceUID seriesInstanceUID: seriesInstanceUID listOfSOPInstanceUID: sopInstanceUIDList [
	^ self subclassResponsibility
]

{ #category : #'application retrieval' }
Interface >> retrievePatient: aPatient [
	| patientsDictionary |
	patientsDictionary := PatientDictionary new.
	self retrievePatient: aPatient block: [ :match | self store: match patientsDictionary: patientsDictionary ].
	^ patientsDictionary patientsDictionary at: aPatient patientID trimBoth ifAbsent: [ nil ]
]

{ #category : #'private (application retrieval)' }
Interface >> retrievePatient: aPatient block: aBlock [
	| aC_MOVE_RQ_Identifier |
	self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [ aC_MOVE_RQ_Identifier := StudyRoot_Retrieval_RQ_Identifier new
				studyInformation;
				yourself ]
		ifFalse: [ aC_MOVE_RQ_Identifier := PatientRoot_Retrieval_RQ_Identifier new
				patientInformation;
				yourself ].
	aC_MOVE_RQ_Identifier patientID: aPatient patientID trimBoth.
	self query: aC_MOVE_RQ_Identifier do: aBlock
]

{ #category : #'SCU retrieval' }
Interface >> retrievePatientTo: moveDestinationAE patientID: patientID patientStudies: listOfStudyInstanceUID [
	^ self subclassResponsibility
]

{ #category : #'private (application retrieval)' }
Interface >> retrieveSOPInstanceUID: sopInstanceUID [
	^ self subclassResponsibility
]

{ #category : #'application retrieval' }
Interface >> retrieveSeries: aSeries [
	| patientsDictionary |
	patientsDictionary := PatientDictionary new.
	self retrieveSeries: aSeries block: [ :match | self store: match patientsDictionary: patientsDictionary ].
	^ patientsDictionary seriesDictionary at: aSeries seriesInstanceUID trimBoth ifAbsent: [ nil ]
]

{ #category : #'private (application retrieval)' }
Interface >> retrieveSeries: aSeries block: aBlock [
	| aC_MOVE_RQ_Identifier |
	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [ StudyRoot_Retrieval_RQ_Identifier new ]
		ifFalse: [ PatientRoot_Retrieval_RQ_Identifier new ].
	aC_MOVE_RQ_Identifier seriesInformation.
	aC_MOVE_RQ_Identifier patientID: aSeries study patient patientID trimBoth.
	aC_MOVE_RQ_Identifier studyInstanceUID: aSeries study studyInstanceUID trimBoth.
	aC_MOVE_RQ_Identifier seriesInstanceUID: (OrderedCollection with: aSeries seriesInstanceUID trimBoth).
	self query: aC_MOVE_RQ_Identifier do: aBlock
]

{ #category : #'SCU retrieval' }
Interface >> retrieveSeriesTo: moveDestinationAE patientID: patientID studyInstanceUID: studyInstanceUID listOfSeriesInstanceUID: seriesInstanceUIDCollection [
	^ self subclassResponsibility
]

{ #category : #'application retrieval' }
Interface >> retrieveStudy: aStudy [
	| patientsDictionary |
	patientsDictionary := PatientDictionary new.
	self retrieveStudy: aStudy block: [ :match | self store: match patientsDictionary: patientsDictionary ].
	^ patientsDictionary studiesDictionary at: aStudy studyInstanceUID trimBoth ifAbsent: [ nil ]
]

{ #category : #'private (application retrieval)' }
Interface >> retrieveStudy: aStudy block: aBlock [
	| aC_MOVE_RQ_Identifier |
	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [ StudyRoot_Retrieval_RQ_Identifier new ]
		ifFalse: [ PatientRoot_Retrieval_RQ_Identifier new ].
	aC_MOVE_RQ_Identifier studyInformation.
	aC_MOVE_RQ_Identifier patientID: aStudy patient patientID trimBoth.
	aC_MOVE_RQ_Identifier studyInstanceUID: (OrderedCollection with: aStudy studyInstanceUID trimBoth).
	self query: aC_MOVE_RQ_Identifier do: aBlock
]

{ #category : #'SCU retrieval' }
Interface >> retrieveStudyTo: moveDestinationAE patientID: patientID studyInstanceUID: studyInstanceUID [
	^ self subclassResponsibility
]

{ #category : #accessing }
Interface >> seriesStorageKeys [
	^ seriesStorageKeys
]

{ #category : #accessing }
Interface >> seriesStorageKeys: anObject [
	seriesStorageKeys := anObject
]

{ #category : #'query/retrieve information model' }
Interface >> setPatientRootQueryRetrieveInformationModel [
	"Set the Query/Retrieve Information Model to be used
	by the Interface as #PATIENT_ROOT. See PS 3.4 2000 C.6.
	
	PRD 09.2001"

	self queryRetrieveInformationModel: #PATIENT_ROOT
]

{ #category : #'query/retrieve information model' }
Interface >> setStudyRootQueryRetrieveInformationModel [
	"Set the Query/Retrieve Information Model to be used
	by the Interface as #STUDY_ROOT. See PS 3.4 2000 C.6.
	
	PRD 09.2001"

	self queryRetrieveInformationModel: #STUDY_ROOT
]

{ #category : #'private (application retrieval)' }
Interface >> store: databaseMatch interface: destinationInterface [
	^ self subclassResponsibility
]

{ #category : #'private (application retrieval)' }
Interface >> store: databaseMatch patientsDictionary: patientsDictionary [
	^ self subclassResponsibility
]

{ #category : #'SCU storage' }
Interface >> storeIOD: aDicomIOD [
	^ self subclassResponsibility
]

{ #category : #'application storage' }
Interface >> storeImages: anObjectCollection into: destinationInterface [
	"Store all matching Patient/Study/Series/Image SOP Instances in the data repository 
	to which this interface in a second data repository throught destinationInterface. 

	PRD - June 12, 2003 - March 17, 2004, March 30, 2016"

	| aBlock |
	destinationInterface notNil
		ifTrue: [ aBlock := [ :databaseMatch | self store: databaseMatch interface: destinationInterface ].
			anObjectCollection
				do: [ :anObject | 
					anObject patientLevel
						ifTrue: [ self retrievePatient: anObject patient block: aBlock ].
					anObject studyLevel
						ifTrue: [ self retrieveStudy: anObject study block: aBlock ].
					anObject seriesLevel
						ifTrue: [ self retrieveSeries: anObject series block: aBlock ].
					anObject imageLevel
						ifTrue: [ self retrieveDicomImage: anObject images block: aBlock ] ] ]
]

{ #category : #accessing }
Interface >> studyStorageKeys [
	^ studyStorageKeys
]

{ #category : #accessing }
Interface >> studyStorageKeys: anObject [
	studyStorageKeys := anObject
]
