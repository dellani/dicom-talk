Class {
	#name : #MongoTalkInterface,
	#superclass : #NoSQLInterface,
	#category : #'talkDICOM-Interfaces-NoSQL'
}

{ #category : #accessing }
MongoTalkInterface class >> aeConfigurationClass [

	^MongoTalkEntity
]

{ #category : #'open-close' }
MongoTalkInterface >> close [
	self root
		close;
		release
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> increaseInstanceCount: dataElementsDictionary [
	"Keep instance accounting up to date - PRD 11 July, 2017"

	self increaseStudyRelatedInstanceCount: dataElementsDictionary.
	self increaseSeriesRelatedInstanceCount: dataElementsDictionary
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> increaseSeriesRelatedInstanceCount: dataElementsDictionary [
	"Keep instance accounting at the study level up to date - PRD 11 July, 2017"

	| collection newDictionary mongoQuery mongoCollection queryAnswer seriesRelatedInstanceCount |
	collection := 'series'.
	newDictionary := Dictionary new.
	newDictionary at: 'patientID' put: (dataElementsDictionary at: 'patientID').
	newDictionary at: 'studyInstanceUID' put: (dataElementsDictionary at: 'studyInstanceUID').
	self seriesStorageKeys
		do: [ :key | dataElementsDictionary at: key ifPresent: [ :value | newDictionary at: key put: value ] ].
	mongoCollection := MongoCollection database: self database name: collection.
	mongoQuery := mongoCollection newQuery.
	mongoQuery
		where:
			(Dictionary new
				at: 'seriesInstanceUID' put: (newDictionary at: 'seriesInstanceUID');
				yourself);
		fields:
			(Dictionary new
				at: 'seriesInstanceUID' put: true;
				at: 'seriesRelatedInstanceCount' put: true;
				yourself).
	queryAnswer := mongoCollection performQuery: mongoQuery.
	queryAnswer notEmpty
		ifTrue: [ seriesRelatedInstanceCount := queryAnswer first at: 'seriesRelatedInstanceCount' ifAbsent: [0].
			seriesRelatedInstanceCount := seriesRelatedInstanceCount isNumber
				ifTrue: [ seriesRelatedInstanceCount + 1 ]
				ifFalse: [ 1 ].
			newDictionary at: 'seriesRelatedInstanceCount' put: seriesRelatedInstanceCount.
			self database update: queryAnswer first with: newDictionary collection: collection ]
		ifFalse: [ self database insert: (Array with: newDictionary) collection: collection ]
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> increaseStudyRelatedInstanceCount: dataElementsDictionary [
	"Keep instance accounting at the study level up to date - PRD 11 July, 2017"

	| collection newDictionary mongoQuery mongoCollection queryAnswer studyRelatedInstanceCount |
	collection := 'studies'.
	newDictionary := Dictionary new.
	newDictionary at: 'patientID' put: (dataElementsDictionary at: 'patientID').
	self studyStorageKeys
		do: [ :key | dataElementsDictionary at: key ifPresent: [ :value | newDictionary at: key put: value ] ].
	mongoCollection := MongoCollection database: self database name: collection.
	mongoQuery := mongoCollection newQuery.
	mongoQuery
		where:
			(Dictionary new
				at: 'studyInstanceUID' put: (newDictionary at: 'studyInstanceUID');
				yourself);
		fields:
			(Dictionary new
				at: 'studyInstanceUID' put: true;
				at: 'studyRelatedInstanceCount' put: true;
				yourself).
	queryAnswer := mongoCollection performQuery: mongoQuery.
	queryAnswer notEmpty
		ifTrue: [ studyRelatedInstanceCount := queryAnswer first at: 'studyRelatedInstanceCount' ifAbsent: [0].
			studyRelatedInstanceCount := studyRelatedInstanceCount isNumber
				ifTrue: [ studyRelatedInstanceCount + 1 ]
				ifFalse: [ 1 ].
			newDictionary at: 'studyRelatedInstanceCount' put: studyRelatedInstanceCount.
			self database update: queryAnswer first with: newDictionary collection: collection ]
		ifFalse: [ self database insert: (Array with: newDictionary) collection: collection ]
]

{ #category : #'private (SCU query)' }
MongoTalkInterface >> loadImages_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [
	self load_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary collectionName: 'images' do: aBlock

	"mongoCollection := MongoCollection database: self database name: 'images'.
	mongoQuery := mongoCollection newQuery.
	(aC_FIND_RQ_IdentifierDictionary isKindOf: Dictionary)
		ifTrue: [ mongoQuery where: aC_FIND_RQ_IdentifierDictionary ]
		ifFalse: [ mongoQuery
				where: (aC_FIND_RQ_IdentifierDictionary at: 1);
				fields: (aC_FIND_RQ_IdentifierDictionary at: 2) ].
	(mongoCollection performQuery: mongoQuery) do: aBlock"
]

{ #category : #'private (SCU query)' }
MongoTalkInterface >> loadOneImage_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary [
	| collection |
	collection := MongoCollection database: self database name: 'images'.
	^ collection detect: aC_FIND_RQ_IdentifierDictionary
]

{ #category : #'private (SCU query)' }
MongoTalkInterface >> loadPatients_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [
	"Query the remote DICOM Application Entity about 	patient
	information, using the supplied DICOM C-FIND identifier.
	
	PRD 09.2001 - 02.2017"

	| collectionName |
	collectionName := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [ 'studies' ]
		ifFalse: [ 'patients' ].
	self load_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary collectionName: collectionName do: aBlock

	"mongoCollection := MongoCollection database: self database name: collectionName.
	mongoQuery := mongoCollection newQuery.
	(aC_FIND_RQ_IdentifierDictionary isKindOf: Dictionary)
		ifTrue: [ mongoQuery where: aC_FIND_RQ_IdentifierDictionary ]
		ifFalse: [ mongoQuery
				where: (aC_FIND_RQ_IdentifierDictionary at: 1);
				fields: (aC_FIND_RQ_IdentifierDictionary at: 2) ].
	(mongoCollection performQuery: mongoQuery) do: aBlock"
]

{ #category : #'private (SCU query)' }
MongoTalkInterface >> loadSeries_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [
	self load_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary collectionName: 'series' do: aBlock
	"mongoCollection := MongoCollection database: self database name: 'series'.
	mongoQuery := mongoCollection newQuery.
	(aC_FIND_RQ_IdentifierDictionary isKindOf: Dictionary)
		ifTrue: [ mongoQuery where: aC_FIND_RQ_IdentifierDictionary ]
		ifFalse: [ mongoQuery
				where: (aC_FIND_RQ_IdentifierDictionary at: 1);
				fields: (aC_FIND_RQ_IdentifierDictionary at: 2) ].
	(mongoCollection performQuery: mongoQuery) do: aBlock"
]

{ #category : #'private (SCU query)' }
MongoTalkInterface >> loadStudies_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [
	self load_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary collectionName: 'studies' do: aBlock

	"| mongoCollection mongoQuery |
	mongoCollection := MongoCollection database: self database name: 'studies'.
	mongoQuery := mongoCollection newQuery.
	(aC_FIND_RQ_IdentifierDictionary isKindOf: Dictionary)
		ifTrue: [ mongoQuery where: aC_FIND_RQ_IdentifierDictionary ]
		ifFalse: [ mongoQuery
				where: (aC_FIND_RQ_IdentifierDictionary at: 1);
				fields: (aC_FIND_RQ_IdentifierDictionary at: 2) ].
	(mongoCollection performQuery: mongoQuery) do: aBlock"
]

{ #category : #'private (SCU query)' }
MongoTalkInterface >> load_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary collectionName: collectionName do: aBlock [
	| mongoCollection mongoQuery |
	"collection := MongoCollection database: self database name: 'images'.
	(collection select: dicomC_FIND_RQ_IdentifierDictionary) do: aBlock."
	mongoCollection := MongoCollection database: self database name: collectionName.
	mongoQuery := mongoCollection newQuery.
	(aC_FIND_RQ_IdentifierDictionary isKindOf: Dictionary)
		ifTrue: [ mongoQuery where: aC_FIND_RQ_IdentifierDictionary ]
		ifFalse: [ mongoQuery
				where: (aC_FIND_RQ_IdentifierDictionary at: 1);
				fields: (aC_FIND_RQ_IdentifierDictionary at: 2) ].
	(mongoCollection performQuery: mongoQuery) do: aBlock
]

{ #category : #private }
MongoTalkInterface >> logAPIString [
	^'[DB API - MongoTalk]'.
]

{ #category : #'private (C-MOVE)' }
MongoTalkInterface >> matchSOPInstancesFor: aC_MOVE_RQ_Identifier [
	"Performs a query in the local database, answering an OrderedCollection
	with all SOP Instance UIDs matches to the given C-MOVE-RQ Identifier

	PRD - 02-06.2002"

	| query mongoCursor mongoCollection |

	query := 
		self createQueryFromC_MOVE_RQ_Identifier: aC_MOVE_RQ_Identifier.
		
	mongoCollection := MongoCollection database: self database name: 'images'.
	mongoCursor := mongoCollection query: query.
	^mongoCursor
]

{ #category : #'open-close' }
MongoTalkInterface >> open [
	self root: (Mongo host: 'localhost' port: 27017).
	self root open.
	"self database: (self root databaseNamed: 'DICOMDB')."
	self database: (self root databaseNamed: 'DICOMTEST').
	^ self root isOpen
		ifTrue: [ nil ]
		ifFalse: [ Error signal: 'Something went wrong while openning the interface' ]
]

{ #category : #'private (application retrieval)' }
MongoTalkInterface >> query: aC_MOVE_RQ_Identifier [
	| query mongoCollection |
	query := self createQueryFromC_MOVE_RQ_Identifier: aC_MOVE_RQ_Identifier.
	mongoCollection := MongoCollection database: self database name: 'images'.
	^ mongoCollection query: query
]

{ #category : #'private (application retrieval)' }
MongoTalkInterface >> query: aC_MOVE_RQ_Identifier do: aBlock [
	(self query: aC_MOVE_RQ_Identifier) do: aBlock
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> storeIMAGELevelInfo: dataElementsDictionary [
	"Store IMAGE Level data into the database. If a record with the same sopInstanceUID
	is already present at the database, update it with data from the IOD's dictionary of data elements.
	PRD 09-10.2001 - 02.2017
	
	Code adapted to the MongoTalk  API as of February 23, 2017 - PRD"

	| collection mongoQuery queryAnswer mongoCollection |
	collection := 'images'.
	mongoCollection := MongoCollection database: self database name: collection.
	mongoQuery := mongoCollection newQuery.
	mongoQuery
		where:
			(Dictionary new
				at: 'sopInstanceUID' put: (dataElementsDictionary at: 'sopInstanceUID');
				yourself);
		fields:
			(Dictionary new
				at: 'sopInstanceUID' put: true;
				yourself).
	queryAnswer := mongoCollection performQuery: mongoQuery.
	queryAnswer notEmpty
		ifTrue: [ self database update: queryAnswer first with: dataElementsDictionary collection: collection ]
		ifFalse: [ 
			self database insert: (Array with: dataElementsDictionary) collection: collection.
			self increaseInstanceCount: dataElementsDictionary ].
	^ dataElementsDictionary
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> storePATIENTLevelInfo: dataElementValuesDictionary [
	"Store PATIENT Level data into the database. If a record with the same patientID
	is already present at the database, update it with data fromthe IOD's dictionary of data elements.
	PRD 09-10.2001 - 03.2016
	
	Code adapted to the MongoTalk  API as of February 23, 2017 - PRD"

	| collection newDictionary mongoQuery mongoCollection queryAnswer |
	collection := 'patients'.
	newDictionary := Dictionary new.
	self patientStorageKeys
		do: [ :key | dataElementValuesDictionary at: key ifPresent: [ :value | newDictionary at: key put: value ] ].
	mongoCollection := MongoCollection database: self database name: collection.
	mongoQuery := mongoCollection newQuery.
	mongoQuery
		where:
			(Dictionary new
				at: 'patientID' put: (newDictionary at: 'patientID');
				yourself);
		fields:
			(Dictionary new
				at: 'patientID' put: true;
				yourself).
	queryAnswer := mongoCollection performQuery: mongoQuery.
	queryAnswer notEmpty
		ifTrue: [ self database update: queryAnswer first with: newDictionary collection: collection ]
		ifFalse: [ self database insert: (Array with: newDictionary) collection: collection ].
	^ newDictionary
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> storeSERIESLevelInfo: dataElementsDictionary [
	"Store SERIES Level data into the database. If a record with the same seriesInstanceUID 
	is already present at the database, update it with data from the IOD's dictionary of data elements.
	PRD 09-10.2001 - 02.2016
	
	Code adapted to the MongoTalk  API as of February 23, 2017 - PRD"

	| collection newDictionary mongoQuery mongoCollection queryAnswer |
	collection := 'series'.
	newDictionary := Dictionary new.
	newDictionary at: 'patientID' put: (dataElementsDictionary at: 'patientID').
	newDictionary at: 'studyInstanceUID' put: (dataElementsDictionary at: 'studyInstanceUID').
	self seriesStorageKeys
		do: [ :key | dataElementsDictionary at: key ifPresent: [ :value | newDictionary at: key put: value ] ].
	mongoCollection := MongoCollection database: self database name: collection.
	mongoQuery := mongoCollection newQuery.
	mongoQuery
		where:
			(Dictionary new
				at: 'seriesInstanceUID' put: (newDictionary at: 'seriesInstanceUID');
				yourself);
		fields:
			(Dictionary new
				at: 'seriesInstanceUID' put: true;
				yourself).
	queryAnswer := mongoCollection performQuery: mongoQuery.
	queryAnswer notEmpty
		ifTrue: [ self database update: queryAnswer first with: newDictionary collection: collection ]
		ifFalse: [ self database insert: (Array with: newDictionary) collection: collection ].
	^ newDictionary
]

{ #category : #'private (C-STORE)' }
MongoTalkInterface >> storeSTUDYLevelInfo: dataElementsDictionary [
	"Store STUDY Level data into the database. If a record with the same studyInstanceUID 
	is already present at the database, update it with data from the IOD's dictionary of data elements.
	PRD 09-10.2001 - 03.2016
	
	Code adapted to the MongoTalk  API as of February 23, 2017 - PRD"

	| collection newDictionary mongoQuery mongoCollection queryAnswer |
	collection := 'studies'.
	newDictionary := Dictionary new.
	newDictionary at: 'patientID' put: (dataElementsDictionary at: 'patientID').
	self studyStorageKeys
		do: [ :key | dataElementsDictionary at: key ifPresent: [ :value | newDictionary at: key put: value ] ].
	mongoCollection := MongoCollection database: self database name: collection.
	mongoQuery := mongoCollection newQuery.
	mongoQuery
		where:
			(Dictionary new
				at: 'studyInstanceUID' put: (newDictionary at: 'studyInstanceUID');
				yourself);
		fields:
			(Dictionary new
				at: 'studyInstanceUID' put: true;
				yourself).
	queryAnswer := mongoCollection performQuery: mongoQuery.
	queryAnswer notEmpty
		ifTrue: [ self database update: queryAnswer first with: newDictionary collection: collection ]
		ifFalse: [ self database insert: (Array with: newDictionary) collection: collection ].
	^ newDictionary
]
