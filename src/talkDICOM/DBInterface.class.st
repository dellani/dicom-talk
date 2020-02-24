Class {
	#name : #DBInterface,
	#superclass : #Interface,
	#category : #'talkDICOM-Interfaces'
}

{ #category : #'private (SCU retrieval)' }
DBInterface >> cancelRetrieval [

	self cancel: true
]

{ #category : #'SCU query' }
DBInterface >> loadImages: aSeries [
	"Query image information from remote DICOM Application Entity for the supplied series
	PRD 09.2001 - 01.2016"

	| aC_FIND_RSP_IdentifierCollection aC_FIND_RQ_Identifier |

	aC_FIND_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
				ifTrue: [aSeries asStudyRoot_Query_RQ_Identifier]
				ifFalse: [aSeries asPatientRoot_Query_RQ_Identifier].
	aC_FIND_RQ_Identifier compositeObjectInstanceInformation.
	aC_FIND_RSP_IdentifierCollection := self
				loadImages_C_FIND_Identifier: aC_FIND_RQ_Identifier.

	"(aC_FIND_RSP_IdentifierCollection := self
				loadImages_C_FIND_Identifier: aC_FIND_RQ_Identifier) notNil
		ifTrue: 
			[aC_FIND_RSP_IdentifierCollection do: 
					[:each |
					each patientID: aSeries study patient patientID.
					each studyInstanceUID: aSeries study studyInstanceUID.
					each seriesInstanceUID: aSeries seriesInstanceUID]]."

	^aC_FIND_RSP_IdentifierCollection
]

{ #category : #'SCU query' }
DBInterface >> loadPatients: aC_FIND_RQ_Identifier [
	"Query the remote DICOM Application Entity about 
	patient Information using the supplied DICOM C-FIND Identifier.
	
	PRD 09.2001 - 01.2002"

	| aC_FIND_RSP_IdentifierCollection |
	
	aC_FIND_RSP_IdentifierCollection := self
				loadPatients_C_FIND_Identifier: aC_FIND_RQ_Identifier.
	^aC_FIND_RSP_IdentifierCollection
]

{ #category : #'SCU query' }
DBInterface >> loadPatientsList: aC_FIND_RQ_Identifier [
	"Query the remote DICOM Application Entity about 	patient information
	using the supplied DICOM C-FIND Identifier, returning an SortedCollection
	with intances of Patient.
	
	PRD 09.2001 - 01.2002, 02.2017"

	"| aC_FIND_RSP_IdentifierCollection |
	
	aC_FIND_RSP_IdentifierCollection := self
				loadPatients_C_FIND_Identifier: aC_FIND_RQ_Identifier.
	^aC_FIND_RSP_IdentifierCollection"
	
	| query answer aPatient |

	self open.
	query := self createQueryFromC_FIND_RQ_Identifier: aC_FIND_RQ_Identifier.
	answer := SortedCollection new.
	self loadPatients_C_FIND_RQDictionary: query do: 
		[:aDictionary |
			aPatient := Patient new.
			aPatient patientID: (aDictionary at: 'patientID' ifAbsent: [ 'Patient ID unknown' ]).
			aPatient patientsName: (PersonName fromDictionary: (aDictionary at: 'patientsName' ifAbsent: [ Dictionary new ])).
			answer add: aPatient].
	self close.
	^answer
]

{ #category : #'SCU query' }
DBInterface >> loadSeries: aStudy [
	"Query series information from remote 
	DICOM Application Entity for the supplied study.
	
	PRD 09.2001 - 01.2016"

	| aC_FIND_RSP_IdentifierCollection aC_FIND_RQ_Identifier |
	aC_FIND_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
				ifTrue: [aStudy asStudyRoot_Query_RQ_Identifier]
				ifFalse: [aStudy asPatientRoot_Query_RQ_Identifier].
	aC_FIND_RQ_Identifier seriesInformation.
	(aC_FIND_RSP_IdentifierCollection := self
				loadSeries_C_FIND_Identifier: aC_FIND_RQ_Identifier) notNil
		ifTrue: 
			[aC_FIND_RSP_IdentifierCollection do: 
					[:each |
					each patientID: aStudy patient patientID.
					each studyInstanceUID: aStudy studyInstanceUID]].
	^aC_FIND_RSP_IdentifierCollection
]

{ #category : #'SCU query' }
DBInterface >> loadSeriesList: arg1 [
	| tmp1 tmp2 tmp4 |
	self open.
	tmp1 := self createQueryFromC_FIND_RQ_Identifier: arg1.
	tmp2 := SortedCollection new.
	self
		loadSeries_C_FIND_RQDictionary: tmp1
			do: [ :arg2 | 
			(arg2 at: 'modality' ifAbsent: [ '' ]) asUppercase = 'SR'
				ifTrue: [ tmp4 := SRSeries new.
					tmp4 srDocumentSeriesIOM dataElementsValues: arg2 ]
				ifFalse: [ tmp4 := Series new.
					tmp4 generalSeriesIOM dataElementsValues: arg2 ].
			tmp2 add: tmp4 ];
		close.
	^ tmp2
]

{ #category : #'SCU query' }
DBInterface >> loadStudies: aPatient [
	"Query study information from the database for the supplied patient.

	PRD 09.2001 - 01.2016"
	
	| answer aC_FIND_RQ_Identifier |

	aC_FIND_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
				ifTrue: [aPatient asStudyRoot_Query_RQ_Identifier]
				ifFalse: [aPatient asPatientRoot_Query_RQ_Identifier].
	aC_FIND_RQ_Identifier studyInformation.
	answer := self loadStudies_C_FIND_Identifier: aC_FIND_RQ_Identifier.
	answer notNil ifTrue: [
		answer do: [:each | each patientID: aPatient patientID]
	].
	^answer
]

{ #category : #'SCU query' }
DBInterface >> loadStudiesList: arg1 [
	| tmp1 tmp2 tmp4 |
	self open.
	tmp1 := self createQueryFromC_FIND_RQ_Identifier: arg1.
	tmp2 := SortedCollection new.
	self
		loadStudies_C_FIND_RQDictionary: tmp1
			do: [ :arg2 | 
			tmp4 := Study new.
			tmp4 generalStudyIOM dataElementsValues: arg2.
			tmp4 patientStudyIOM dataElementsValues: arg2.
			tmp2 add: tmp4 ];
		close.
	^ tmp2
]

{ #category : #'application utilities' }
DBInterface >> nextSeriesInstanceUIDFor: studyInstanceUID [
"
	Answer the next available series instance UID in a Study
	PRD - August 29th, 2003 - March 18th, 2004
"
	| nextSeriesNumber answer |

	"Get the next series number"
	nextSeriesNumber := self nextSeriesNumberFor: studyInstanceUID.
	"Append the next series number to the given studyInstanceUID"
	answer := studyInstanceUID, nextSeriesNumber.
	"creating in this way a new valid series instance UID for the given study"
	^answer
]

{ #category : #'application utilities' }
DBInterface >> nextSeriesNumberFor: studyInstanceUID [
	"Answer the next series number available in a DICOM Study

	PRD - August 29th, 2003 - March 18th, 2004"

	| lastSeriesNumber answer study seriesNumberSortedCollection |
	"Series query message protocol conversion"
	study := Study new.
	study generalStudyIOM studyInstanceUID: studyInstanceUID.
	answer := self perform: ('loadSeries' , self queryRetrieveInformationModel , ':') asSymbol with: study.
	"Sort the already in use series numbers"
	seriesNumberSortedCollection := SortedCollection new.
	answer
		do: [ :aC_FINDIdentifier | seriesNumberSortedCollection add: aC_FINDIdentifier seriesNumber asNumber ].
	"Take the last series number in use"
	lastSeriesNumber := seriesNumberSortedCollection last.
	"The next series number...."
	answer := (lastSeriesNumber asNumber + 1) printString.
	"will be the answer"
	^ answer
]

{ #category : #'application utilities' }
DBInterface >> nextSeriesNumberFor: studyInstanceUID after: number [
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

{ #category : #'private (SCU retrieval)' }
DBInterface >> retrieveAndSend: matchesDictionary [
	"Retrieve all the IOD matches stored in matchesDictionary
	from the data repository to which the interface is connected
	and send them to the application. The dictionary key is the
	matched SOP Instance UID and the value contains an identifier
	with allows the localization of the corresponding IOD in the 
	database repository.
	
	PRD - 01.2001 - 03.2016"
	
	^self subclassResponsibility
]

{ #category : #'private (SCU retrieval)' }
DBInterface >> retrieveIOD: blobOID [

	^self subclassResponsibility
]

{ #category : #'SCU retrieval' }
DBInterface >> retrieveImagesTo: moveDestinationAE patientID: patientID studyInstanceUID: studyInstanceUID seriesInstanceUID: seriesInstanceUID listOfSOPInstanceUID: sopInstanceUIDList [

	| aC_MOVE_RQ_Identifier |

	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [StudyRoot_Retrieval_RQ_Identifier new.]
		ifFalse: [PatientRoot_Retrieval_RQ_Identifier new.].

	aC_MOVE_RQ_Identifier compositeObjectInstanceInformation.
	aC_MOVE_RQ_Identifier patientID: patientID.
	aC_MOVE_RQ_Identifier studyInstanceUID: (OrderedCollection with: studyInstanceUID).
	aC_MOVE_RQ_Identifier seriesInstanceUID: (OrderedCollection with: seriesInstanceUID).
	aC_MOVE_RQ_Identifier sopInstanceUID: sopInstanceUIDList.	

	self
		query: aC_MOVE_RQ_Identifier 
		do: [:databaseMatch | self retrieveAndSend: databaseMatch].

	"matchesDictionary := 
		self matchSOPInstancesFor: aC_MOVE_RQ_Identifier.

	^self retrieveAndSend: matchesDictionary."
]

{ #category : #'SCU retrieval' }
DBInterface >> retrievePatientTo: moveDestinationAE patientID: patientID patientStudies: listOfStudyInstanceUID [
	"Baseline behaviour of the C-MOVE SCP (Hierarchical search method).
	It's necessary to inform which series (a seriesInstanceUID or a list of 
	seriesInstanceUID). seriesInstanceUIDCollection is an OrderedCollection
	with on or more Series Instance UID for retrieval.
	
	PRD 09.2001 - 06.2002"
	
	| aC_MOVE_RQ_Identifier |

	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot 
		ifTrue: [
			StudyRoot_Retrieval_RQ_Identifier new studyInformation;
				studyInstanceUID: listOfStudyInstanceUID;
				yourself
		] ifFalse: [
			PatientRoot_Retrieval_RQ_Identifier new patientInformation;
				patientID: patientID;
				yourself.
		].

	self
		query: aC_MOVE_RQ_Identifier 
		do: [:databaseMatch | self retrieveAndSend: databaseMatch].

	"matchesDictionary := 
		self matchSOPInstancesFor: aC_MOVE_RQ_Identifier.
	self retrieveAndSend: matchesDictionary."
]

{ #category : #'SCU retrieval' }
DBInterface >> retrieveSeriesTo: moveDestinationAE patientID:  patientID studyInstanceUID: studyInstanceUID listOfSeriesInstanceUID: seriesInstanceUIDCollection [
	"Baseline behaviour of the C-MOVE SCP (Hierarchical search method). 
	It's necessary to inform which series (a seriesInstanceUID or a list of 
	seriesInstanceUID). seriesInstanceUIDCollection is an OrderedCollection
	 with on or more Series Instance UID for retrieval.
	
	PRD 09.2001 - 06.2002"

	| aC_MOVE_RQ_Identifier |
	
	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [StudyRoot_Retrieval_RQ_Identifier new.]
		ifFalse: [PatientRoot_Retrieval_RQ_Identifier new.].

	aC_MOVE_RQ_Identifier seriesInformation.
	aC_MOVE_RQ_Identifier patientID: patientID.
	aC_MOVE_RQ_Identifier studyInstanceUID: studyInstanceUID.
	aC_MOVE_RQ_Identifier seriesInstanceUID: seriesInstanceUIDCollection.

	self
		query: aC_MOVE_RQ_Identifier 
		do: [:databaseMatch | self retrieveAndSend: databaseMatch].

	"matchesDictionary := 
		self matchSOPInstancesFor: aC_MOVE_RQ_Identifier.
	^self retrieveAndSend: matchesDictionary."
]

{ #category : #'SCU retrieval' }
DBInterface >> retrieveStudyTo: moveDestinationAE patientID:  patientID studyInstanceUID: studyInstanceUID [
	"Baseline behaviour of the C-MOVE SCP (Hierarchical search method).
	It's necessary to inform which series (a seriesInstanceUID or a list of 
	seriesInstanceUID). seriesInstanceUIDCollection is an OrderedCollection
	with on or more Series Instance UID for retrieval.
	
	PRD 09.2001 - 06.2002"
	
	| aC_MOVE_RQ_Identifier |
	aC_MOVE_RQ_Identifier := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [StudyRoot_Retrieval_RQ_Identifier new]
		ifFalse: [PatientRoot_Retrieval_RQ_Identifier new].
		
	aC_MOVE_RQ_Identifier studyInformation.
	aC_MOVE_RQ_Identifier patientID: patientID.
	aC_MOVE_RQ_Identifier studyInstanceUID: studyInstanceUID.

	self
		query: aC_MOVE_RQ_Identifier 
		do: [:databaseMatch | self retrieveAndSend: databaseMatch].
		
	"matchesDictionary := 
		self matchSOPInstancesFor: aC_MOVE_RQ_Identifier.
	self retrieveAndSend: matchesDictionary."
]

{ #category : #'private (SCU retrieval)' }
DBInterface >> sendIODToApplication: aDicomIOD [

	| dicomIOD_Storage |

	"The IOD is inserted in a special IOD Storage Container Object.
	 The idea is to make the application that will receive the IOD for processing
	  able to recognize which is the remote application that is sending the IOD"
	dicomIOD_Storage := IOD_Storage new.
	dicomIOD_Storage dicomIOD: aDicomIOD.			"The IOD being transfered"
	dicomIOD_Storage localAE: self localAEDescription.	"The aplication that should receive the IOD"
	dicomIOD_Storage remoteAE: self remoteAEDescription.	"The application that is sending the IOD"

	self dicomApplication receiveObject: dicomIOD_Storage.
]

{ #category : #'SCU storage' }
DBInterface >> storeIOD: dicomIOD [

	^self dicomC_STORE: dicomIOD
]
