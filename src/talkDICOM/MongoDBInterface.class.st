Class {
	#name : #MongoDBInterface,
	#superclass : #NoSQLInterface,
	#category : #'talkDICOM-Interfaces-NoSQL-deprecated'
}

{ #category : #accessing }
MongoDBInterface class >> aeConfigurationClass [

	^MongoDBEntity
]

{ #category : #'open-close' }
MongoDBInterface >> close [

	self root close; release
]

{ #category : #'C-DELETE' }
MongoDBInterface >> deleteImage: anInformationEntity [ 

	| query mongoCollection |

	self halt.
	query := Dictionary new
					at: 'patientID' put: anInformationEntity series study patient patientID trimBoth;
					at: 'studyInstanceUID' put: anInformationEntity series study studyInstanceUID trimBoth;
					at: 'seriesInstanceUID' put: anInformationEntity series seriesInstanceUID trimBoth;
					at: 'sopInstanceUID' put: anInformationEntity sopInstanceUID trimBoth;
					yourself.

	mongoCollection := MongoCollection database: self database name: 'images'.
	mongoCollection delete: query.
	mongoCollection release.
]

{ #category : #'C-DELETE' }
MongoDBInterface >> deletePatient: aPatient [

	| query mongoCollection |

	query := Dictionary new at: #patientID put: aPatient patientID trimBoth; yourself.
	
	mongoCollection := MongoCollection database: self database name: 'images'.
	mongoCollection delete: query.
	mongoCollection release.
	
	mongoCollection := MongoCollection database: self database name: 'series'.
	mongoCollection delete: query.
	mongoCollection release.

	mongoCollection := MongoCollection database: self database name: 'studies'.
	mongoCollection delete: query.
	mongoCollection release.

	mongoCollection := MongoCollection database: self database name: 'patients'.
	mongoCollection delete: query.
	mongoCollection release.
]

{ #category : #'C-DELETE' }
MongoDBInterface >> deleteSeries: aSeries [

	| query mongoCollection |

	query := Dictionary new 
					at: 'patientID' put: aSeries study patient patientID trimBoth; 
					at: 'studyInstanceUID' put: aSeries study studyInstanceUID trimBoth; 
					at: 'seriesInstanceUID' put: aSeries seriesInstanceUID trimBoth; 
					yourself.

	mongoCollection := MongoCollection database: self database name: 'images'.
	mongoCollection delete: query.
	mongoCollection release.
	
	mongoCollection := MongoCollection database: self database name: 'series'.
	mongoCollection delete: query.
	mongoCollection release.
]

{ #category : #'C-DELETE' }
MongoDBInterface >> deleteStudiesOlderThan: numberOfDays [
"
	This method will delete all the studies from a data base data repository 
	older than a certain number of days - PRD - July 31th, 2003
"
]

{ #category : #'C-DELETE' }
MongoDBInterface >> deleteStudy: aStudy [

	| query mongoCollection |

	query := Dictionary new 
					at: 'patientID' put: aStudy patient patientID trimBoth; 
					at: 'studyInstanceUID' put: aStudy studyInstanceUID trimBoth; 
					yourself.

	mongoCollection := MongoCollection database: self database name: 'images'.
	mongoCollection delete: query.
	mongoCollection release.
	
	mongoCollection := MongoCollection database: self database name: 'series'.
	mongoCollection delete: query.
	mongoCollection release.
	
	mongoCollection := MongoCollection database: self database name: 'studies'.
	mongoCollection delete: query.
	mongoCollection release.
]

{ #category : #'private (SCU query)' }
MongoDBInterface >> loadImages_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [

	| mongoCollection |

	mongoCollection := MongoCollection database: self database name: 'images'.
	(mongoCollection find: aC_FIND_RQ_IdentifierDictionary) do: aBlock "[:aDictionary |
		aDictionary removeKey: '_id'.
		aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
		aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
		aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
		aC_FIND_RSP_Identifier compositeObjectInstanceInformation.
		answer add: aC_FIND_RSP_Identifier
	].
	^answer"
]

{ #category : #'private (SCU query)' }
MongoDBInterface >> loadOneImage_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary [

	| mongoCollection |

	mongoCollection := MongoCollection database: self database name: 'images'.
	^mongoCollection findOne: aC_FIND_RQ_IdentifierDictionary") do: aBlock [:aDictionary |
		aDictionary removeKey: '_id'.
		aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
		aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
		aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
		aC_FIND_RSP_Identifier compositeObjectInstanceInformation.
		answer add: aC_FIND_RSP_Identifier
	].
	^answer"
]

{ #category : #'private (SCU query)' }
MongoDBInterface >> loadOneImage_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [

	| mongoCollection |

	mongoCollection := MongoCollection database: self database name: 'images'.
	(mongoCollection findOne: aC_FIND_RQ_IdentifierDictionary) do: aBlock "[:aDictionary |
		aDictionary removeKey: '_id'.
		aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
		aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
		aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
		aC_FIND_RSP_Identifier compositeObjectInstanceInformation.
		answer add: aC_FIND_RSP_Identifier
	].
	^answer"
]

{ #category : #'private (SCU query)' }
MongoDBInterface >> loadPatients_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [
	"Query the remote DICOM Application Entity about patient Information, 
	using the supplied DICOM C-FIND Identifier - PRD 09.2001 - 01.2016"

	| collectionName mongoCollection|

	collectionName := 
		self queryRetrieveInformationModelIsStudyRoot 
			ifTrue: ['studies'] ifFalse: ['patients'].
	mongoCollection := 
		MongoCollection database: self database name: collectionName.
	(mongoCollection find: aC_FIND_RQ_IdentifierDictionary) do: aBlock "[:aDictionary |
			aDictionary removeKey: '_id'.

			self queryRetrieveInformationModelIsStudyRoot ifTrue: [
				aC_FIND_RSP_Identifier := C_FINDStudyRoot_RSP_Identifier new.
				aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
				aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
				aC_FIND_RSP_Identifier studyInformation.
			] ifFalse: [
				aC_FIND_RSP_Identifier := C_FINDPatientRoot_RSP_Identifier new.
				aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
				aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
				aC_FIND_RSP_Identifier patientInformation.
			].
			answer add: aC_FIND_RSP_Identifier].
	^answer"
]

{ #category : #'private (SCU query)' }
MongoDBInterface >> loadSeries_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: aBlock [

	| mongoCollection |

	mongoCollection := MongoCollection database: self database name: 'series'.
	(mongoCollection find: dicomC_FIND_RQ_IdentifierDictionary) do: aBlock."[:aDictionary |
		aDictionary removeKey: '_id'.
		aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
		aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
		aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
		aC_FIND_RSP_Identifier seriesInformation.
		answer add: aC_FIND_RSP_Identifier
	].
	^answer"
]

{ #category : #'private (SCU query)' }
MongoDBInterface >> loadStudies_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: aBlock [

	| mongoCollection |

	mongoCollection := MongoCollection database: self database name: 'studies'.
	(mongoCollection find: dicomC_FIND_RQ_IdentifierDictionary) do: aBlock "[:aDictionary |
		aDictionary removeKey: '_id'.
		aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
		aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
		aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
		aC_FIND_RSP_Identifier studyInformation.
		answer add: aC_FIND_RSP_Identifier
	].
	^answer"
]

{ #category : #private }
MongoDBInterface >> logAPIString [
	^'[DB API - MongoDB]'.
]

{ #category : #'private (C-MOVE)' }
MongoDBInterface >> matchSOPInstancesFor: aC_MOVE_RQ_Identifier [
	"Performs a query in the local database, answering an OrderedCollection
	with all SOP Instance UIDs matches to the given C-MOVE-RQ Identifier

	PRD - 02-06.2002"
	
	| query mongoCollection mongoCursor |
	query := 
		self createQueryFromC_MOVE_RQ_Identifier: aC_MOVE_RQ_Identifier.
		
	mongoCollection := MongoCollection database: self database name: 'images'.
	mongoCursor := (mongoCollection find: query).
	^mongoCursor

	"mongoCursor := mongoCollection
				find: (Array with: ((Dictionary new)
								at: 'studyInstanceUID' put: (newDictionary at: 'studyInstanceUID');
								yourself)
						with: ((Dictionary new)
								at: 'studyInstanceUID' put: true;
								yourself)).
	(nextObject := mongoCursor nextObject) 
		ifNotNil: [newDictionary at: '_id' put: (nextObject at: '_id')].

	mongoCollection save: newDictionary.
	^newDictionary."


	"| keysTokens sopInstances seriesInstances studyInstances whereClause patientExpression |

	keysTokens := OrderedCollection new.

	(patientExpression := self sqlLogicalExpressionForPATIENTLevel: aC_MOVE_RQ_Identifier) isEmpty 
		ifFalse: [keysTokens add: '(', patientExpression, ')'].
	(studyInstances := self sqlLogicalExpressionForSTUDYLevel: aC_MOVE_RQ_Identifier) isEmpty 
		ifFalse: [keysTokens add: '(', studyInstances, ')'].
	(seriesInstances := self sqlLogicalExpressionForSERIESLevel: aC_MOVE_RQ_Identifier) isEmpty 
		ifFalse: [keysTokens add: '(', seriesInstances, ')'].
	(sopInstances := self sqlLogicalExpressionForIMAGELevel: aC_MOVE_RQ_Identifier) isEmpty 
		ifFalse: [keysTokens add: '(', sopInstances, ')'].
	whereClause := String new.
	keysTokens do: [:keyToken | whereClause := whereClause, keyToken, 
		(keysTokens last = keyToken ifTrue: [''] ifFalse: [' AND '])].
	^whereClause isEmpty 
		ifFalse: [' WHERE ', whereClause] 
		ifTrue: [whereClause]"
]

{ #category : #'open-close' }
MongoDBInterface >> open [

	self root: MongoConnection default.
	self root open.
	self database: (self root databaseAt: 'DICOMDB').
	
	^self root socket isActive ifTrue: [nil] ifFalse: ['Something went wrong while openning the interface']
]

{ #category : #'private (application retrieval)' }
MongoDBInterface >> query: aC_MOVE_RQ_Identifier [

	| query mongoCollection |

	query := 
		self createQueryFromC_MOVE_RQ_Identifier: aC_MOVE_RQ_Identifier.
	
	mongoCollection := MongoCollection database: self database name: 'images'.
	^mongoCollection find: query
]

{ #category : #'private (application retrieval)' }
MongoDBInterface >> query: aC_MOVE_RQ_Identifier do: aBlock [

	(self query: aC_MOVE_RQ_Identifier) do: aBlock
]

{ #category : #'private (C-STORE)' }
MongoDBInterface >> storeIMAGELevelInfo: dataElementValuesDictionary [
	"Store IMAGE Level data into the database. If a record with the same sopInstanceUID
	is already present at the database, update it with data from the IOD's dictionary of data elements.

	PRD 09-10.2001 - 13.02.2016"

	| mongoCollection mongoCursor nextObject newDictionary |

	mongoCollection := MongoCollection database: self database name: 'images'.

	newDictionary := Dictionary new.
	newDictionary 
		at: 'patientID' put: (dataElementValuesDictionary at: 'patientID').
	newDictionary 
		at: 'studyInstanceUID' put: (dataElementValuesDictionary at: 'studyInstanceUID').
	self seriesStorageKeys do: [:key |
			dataElementValuesDictionary at: key
				ifPresent: [:value | newDictionary at: key put: value]].
	newDictionary 
		at: 'sopInstanceUID' put: (dataElementValuesDictionary at: 'sopInstanceUID').
	newDictionary 
		at: 'instanceNumber' put: (dataElementValuesDictionary at: 'instanceNumber').

	mongoCursor := mongoCollection
				find: (Array with: ((Dictionary new)
								at: 'sopInstanceUID' put: (dataElementValuesDictionary at: 'sopInstanceUID');
								yourself)
						with: ((Dictionary new)
								at: 'sopInstanceUID' put: true;
								yourself)).

	(nextObject := mongoCursor nextObject) 
		"ifNotNil: [newDictionary at: '_id' put: (nextObject at: '_id')]."
		ifNotNil: [dataElementValuesDictionary at: '_id' put: (nextObject at: '_id')].

	"elementValue := dataElementValuesDictionary at: 'privateOBDataElement[29,1010]'.
	dataElementValuesDictionary 
		removeKey: 'privateOBDataElement[29,1010]'.
	dataElementValuesDictionary at: 'privateOBTESTE01' put: elementValue.
		
	elementValue := dataElementValuesDictionary at: 'privateOBDataElement[29,1020]'.
	dataElementValuesDictionary 
		removeKey: 'privateOBDataElement[29,1020]'.
	dataElementValuesDictionary at: 'privateOBTESTE02' put: elementValue.

	elementValue := dataElementValuesDictionary at: 'privateOBDataElement[29,1310]'.
	dataElementValuesDictionary 
		removeKey: 'privateOBDataElement[29,1310]'.
	dataElementValuesDictionary at: 'privateOBTESTE03' put: elementValue."
		
	"dataElementValuesDictionary
		removeKey: 'privateOBDataElement[29,1010]'.
		removeKey: 'privateOBDataElement[29,1020]'.
		removeKey: 'privateOBDataElement[29,1310]'."
		
	mongoCollection save: dataElementValuesDictionary.
	"mongoCollection save: newDictionary."

	^dataElementValuesDictionary
]

{ #category : #'private (C-STORE)' }
MongoDBInterface >> storePATIENTLevelInfo: dataElementValuesDictionary [
	"Store PATIENT Level data into the database. If a record with the same patientID
	is already present at the database, update it with data fromthe IOD's dictionary of data elements.

	PRD 09-10.2001 - 13.02.2016"

	| mongoCollection newDictionary mongoCursor nextObject |

	mongoCollection := MongoCollection database: self database name: 'patients'.

	newDictionary := Dictionary new.
	self patientStorageKeys do: [:key |
		dataElementValuesDictionary at: key
			ifPresent: [:value | newDictionary at: key put: value]].
	mongoCursor := mongoCollection
				find: (Array with: ((Dictionary new)
								at: 'patientID' put: (newDictionary at: 'patientID');
								yourself)
						with: ((Dictionary new)
								at: 'patientID' put: true;
								yourself)).
	(nextObject := mongoCursor nextObject)
		ifNotNil: [newDictionary at: '_id' put: (nextObject at: '_id')].

	mongoCollection save: newDictionary.
	^newDictionary.
]

{ #category : #'private (C-STORE)' }
MongoDBInterface >> storeSERIESLevelInfo: dataElementValuesDictionary [
	"Store SERIES Level data into the database. If a record with the same seriesInstanceUID 
	is already present at the database, update it with data from the IOD's dictionary of data elements.

	PRD 09-10.2001 - 13.02.2016"

	| mongoCollection newDictionary mongoCursor nextObject |

	mongoCollection := MongoCollection database: self database name: 'series'.

	newDictionary := Dictionary new.
	newDictionary 
		at: 'patientID' put: (dataElementValuesDictionary at: 'patientID').
	newDictionary 
		at: 'studyInstanceUID' put: (dataElementValuesDictionary at: 'studyInstanceUID').
	self seriesStorageKeys do: [:key |
			dataElementValuesDictionary at: key
				ifPresent: [:value | newDictionary at: key put: value]].

	mongoCursor := mongoCollection
				find: (Array with: ((Dictionary new)
								at: 'seriesInstanceUID' put: (newDictionary at: 'seriesInstanceUID');
								yourself)
						with: ((Dictionary new)
								at: 'seriesInstanceUID' put: true;
								yourself)).
	(nextObject := mongoCursor nextObject) 
		ifNotNil: [newDictionary at: '_id' put: (nextObject at: '_id')].

	mongoCollection save: newDictionary.
	^newDictionary.
]

{ #category : #'private (C-STORE)' }
MongoDBInterface >> storeSTUDYLevelInfo: dataElementValuesDictionary [
	"Store STUDY Level data into the database. If a record with the same studyInstanceUID 
	is already present at the database, update it with data from the IOD's dictionary of data elements.

	PRD 09.2001 - 13.02.2016"

	| mongoCollection newDictionary mongoCursor nextObject |

	mongoCollection := MongoCollection database: self database name: 'studies'.

	newDictionary := Dictionary new.
	newDictionary 
		at: 'patientID' put: (dataElementValuesDictionary at: 'patientID').
	self studyStorageKeys do: [:key |
		dataElementValuesDictionary at: key
			ifPresent: [:value | newDictionary at: key put: value]].
	mongoCursor := mongoCollection
				find: (Array with: ((Dictionary new)
								at: 'studyInstanceUID' put: (newDictionary at: 'studyInstanceUID') trimBoth;
								yourself)
						with: ((Dictionary new)
								at: 'studyInstanceUID' put: true;
								yourself)).
	(nextObject := mongoCursor nextObject) 
		ifNotNil: [newDictionary at: '_id' put: (nextObject at: '_id')].

	mongoCollection save: newDictionary.
	^newDictionary.
]
