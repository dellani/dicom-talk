Class {
	#name : #NoSQLInterface,
	#superclass : #DBInterface,
	#instVars : [
		'root',
		'database',
		'patientsCache',
		'studiesCache',
		'seriesCache'
	],
	#category : #'talkDICOM-Interfaces-NoSQL'
}

{ #category : #'C-STORE' }
NoSQLInterface >> __dicomC_STORE: dicomIOD [
	"Store the received IOD into a MongoDB database.

	PRD 01-03.2002; 01-02.2016; 03.2017"

	| dictionary |
	"self logMessage: 'Beginning storage transaction'."
	[ dictionary := dicomIOD dataElementsValuesDictionaryOhneGroupLengthDataElements.
	"dataElementValuesDictionary := dicomIOD				
				dataElementsValuesDictionaryOhneGroupLengthAndPrivateDataElements."

	"Make sure that key fields aren't stored without extra blanks"
	self removeBlanksFromKeyFields: dictionary.
	self storeIMAGELevelInfo: dictionary.
	self seriesCache at: (dictionary at: 'seriesInstanceUID') ifAbsentPut: [ self storeSERIESLevelInfo: dictionary ].
	self studiesCache at: (dictionary at: 'studyInstanceUID') ifAbsentPut: [ self storeSTUDYLevelInfo: dictionary ].
	self patientsCache at: (dictionary at: 'patientID') ifAbsentPut: [ self storePATIENTLevelInfo: dictionary ] ]
		on: Error
		do: [ :anError | 
			self halt.
			self logMessage: 'IOD storage failed due to ' , anError description.
			self logMessage: 'Transaction couldn''t be completed: rolling back started'.
			self logMessage: '	Transaction rollback complete'.
			self logMessage: anError description ]
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> _createQueryFromC_FIND_RQ_Identifier: dicomC_FIND_RQ_Identifier [

	| newDictionary1 newDictionary2 |

	newDictionary1 := Dictionary new.
	newDictionary2 := Dictionary new.

	dicomC_FIND_RQ_Identifier dataElementsValues
		keysAndValuesDo: [:key :value| 
			key ~= 'queryRetrieveLevel' ifTrue: [
				newDictionary2 at: key put: true.
				value notEmpty
					ifTrue: [newDictionary1 at: key put: value trimBoth]
				].
			].
	^Array with: newDictionary1 with: newDictionary2
]

{ #category : #'C-STORE' }
NoSQLInterface >> _dicomC_STORE: dicomIOD [
	"Store the received IOD into a MongoDB database.

	PRD 01-03.2002; 01-02.2016"

	| dictionary microseconds1 microseconds2 microseconds3 microseconds4 |
	"self logMessage: 'Beginning storage transaction'."
	[ dictionary := dicomIOD dataElementsValuesDictionaryOhneGroupLengthDataElements.
	"dataElementValuesDictionary := dicomIOD				
				dataElementsValuesDictionaryOhneGroupLengthAndPrivateDataElements."

	"Make sure that key fields aren't stored without extra blanks"
	self removeBlanksFromKeyFields: dictionary.
	microseconds4 := Time microsecondsToRun: [ self storeIMAGELevelInfo: dictionary ].
	microseconds3 := Time
		microsecondsToRun: [ self seriesCache at: (dictionary at: 'seriesInstanceUID') ifAbsentPut: [ self storeSERIESLevelInfo: dictionary ] ].
	microseconds2 := Time
		microsecondsToRun: [ self studiesCache at: (dictionary at: 'studyInstanceUID') ifAbsentPut: [ self storeSTUDYLevelInfo: dictionary ] ].
	microseconds1 := Time
		microsecondsToRun: [ self patientsCache at: (dictionary at: 'patientID') ifAbsentPut: [ self storePATIENTLevelInfo: dictionary ] ]

	"logfile := '/tmp/mongointerface.log' asFilename appendStream.
	logfile 
		tab; nextPutAll: microseconds1 printString; 
		tab; nextPutAll: microseconds2 printString; 
		tab; nextPutAll: microseconds3 printString; 
		tab; nextPutAll: microseconds4 printString; 
	flush; close; release." ]
		on: Error
		do: [ :anError | 
			self halt.
			self logMessage: 'IOD storage failed due to ' , anError description.
			self logMessage: 'Transaction couldn''t be completed: rolling back started'.
			self logMessage: '	Transaction rollback complete'.
			self logMessage: anError description ]
]

{ #category : #'private (SCU retrieval)' }
NoSQLInterface >> _retrieveAndSend: databaseMatch [
	"Retrieve the IOD corresponding to the given database match
	from the data repository and send it to the application. For NoSQL 
	databases, 'databaseMatch' is a Dictionary storing all data element 
	values of the matched SOP Instance UID, where the key corresponds
	to the data element name and the value to data element value.
	
	PRD - 01.2001 - 03.2016"

	| microseconds1 sopInstance microseconds2 |

	"logfile := '/tmp/mongointerface.log' asFilename appendStream.
	logfile 
		nextPutAll: DateAndTime now printString; tab; 
		flush; close; release."

	microseconds1 := 
			Time microsecondsToRun: [sopInstance := self sopInstanceFromDictionary: databaseMatch].
	microseconds2 := 
		Time microsecondsToRun: [self sendIODToApplication: sopInstance].

	"logfile := '/tmp/mongointerface.log' asFilename appendStream.
	logfile 
		nextPutAll: microseconds1 printString; tab; nextPutAll: microseconds2 printString; cr;
		flush; close; release."

	"matchesDictionary values do: [:match |
		self cancel ifTrue: [^nil].
		sopInstance := self sopInstanceFromDictionary: databaseMatch.
		self sendIODToApplication: sopInstance]."
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> createQueryFromC_FIND_RQ_Identifier: dicomC_FIND_RQ_Identifier [

	| newDictionary1 newDictionary2 |

	newDictionary1 := Dictionary new.
	newDictionary2 := Dictionary new.

	dicomC_FIND_RQ_Identifier dataElementsValues
		keysAndValuesDo: [:key :value| 
			key ~= 'queryRetrieveLevel' ifTrue: [
				newDictionary2 at: key put: true.
				value notEmpty
					ifTrue: [newDictionary1 at: key put: value trimBoth]
				].
			].
	^Array with: newDictionary1 with: newDictionary2
]

{ #category : #'private (C-MOVE)' }
NoSQLInterface >> createQueryFromC_MOVE_RQ_Identifier: dicomC_MOVE_RQ_Identifier [

	| newDictionary1 array |

	newDictionary1 := Dictionary new.
	"newDictionary2 := Dictionary new."

	dicomC_MOVE_RQ_Identifier dataElementsValues keysAndValuesDo: [:key :value| 
		key ~= 'queryRetrieveLevel' ifTrue: [
			"newDictionary2 at: key put: true."
			(value isKindOf: OrderedCollection) ifTrue: [
				value size = 1 ifTrue: [
					newDictionary1 at: key put: value first trimBoth
				] ifFalse: [
					array := Array new: value size.
					1 to: value size do: [:index|
						array at: index put: [Dictionary new at: key put: (value at: index)]
					].
					newDictionary1 at: '$or:' put: array.
				]
			].
			(value isKindOf: String) ifTrue: [
				value notEmpty
					ifTrue: [newDictionary1 at: key put: value trimBoth]
				].
			].
		].
	"^Array with: newDictionary1 with: newDictionary2"
	^newDictionary1
]

{ #category : #accessing }
NoSQLInterface >> database [

	^database
]

{ #category : #accessing }
NoSQLInterface >> database: anObject [

	database := anObject
]

{ #category : #'C-STORE' }
NoSQLInterface >> dicomC_STORE: dicomIOD [
	"Store the received IOD into a MongoDB database.

	PRD 01-03.2002; 01-02.2016; 03.2017"

	| dictionary |
	"self logMessage: 'Beginning storage transaction'."
	[ dictionary := dicomIOD dataElementsValuesDictionaryOhneGroupLengthDataElements.
	"dataElementValuesDictionary := dicomIOD				
				dataElementsValuesDictionaryOhneGroupLengthAndPrivateDataElements."

	"Make sure that key fields aren't stored without extra blanks"
	self removeBlanksFromKeyFields: dictionary.
	self storeIMAGELevelInfo: dictionary.
	self seriesCache at: (dictionary at: 'seriesInstanceUID') ifAbsentPut: [ self storeSERIESLevelInfo: dictionary ].
	self studiesCache at: (dictionary at: 'studyInstanceUID') ifAbsentPut: [ self storeSTUDYLevelInfo: dictionary ].
	self patientsCache at: (dictionary at: 'patientID') ifAbsentPut: [ self storePATIENTLevelInfo: dictionary ] ]
		on: Error
		do: [ :anError | 
			self halt.
			self logMessage: 'IOD storage failed due to ' , anError description.
			self logMessage: 'Transaction couldn''t be completed: rolling back started'.
			self logMessage: '	Transaction rollback complete'.
			self logMessage: anError description ]
]

{ #category : #'SCU query' }
NoSQLInterface >> loadImages_C_FIND_IdentifierDictionary: aC_FIND_RQ_IdentifierDictionary [
	"Query series information from the database using the 
	supplied C-FIND-RQ-Identifier - PRD 09.2001 - 01.2016"

	| answer |
	^ (answer := self open) isNil
		ifFalse:
			[ Error signal: answer ]
		ifTrue:
			[ answer := self loadImages_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary.
			self close.	"Close database interface"
			answer ]
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadImages_C_FIND_RQ: dicomC_FIND_RQ_Identifier [

	| query |
	
	query := 
		self createQueryFromC_FIND_RQ_Identifier: dicomC_FIND_RQ_Identifier.
	^self 
		loadImages_C_FIND_RQDictionary: query.
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadImages_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary [

	| answer rsp_IdentifierClass aC_FIND_RSP_Identifier |
	
	answer := OrderedCollection new.
	"collection := Mongo.MongoCollection database: self database name: 'images'."

	rsp_IdentifierClass := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [StudyRoot_Query_RQ_Identifier]
		ifFalse: [PatientRoot_Query_RQ_Identifier].

	self loadImages_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: 
		[:aDictionary |
			aDictionary removeKey: '_id'.
			aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
			aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
			aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
			aC_FIND_RSP_Identifier compositeObjectInstanceInformation.
			answer add: aC_FIND_RSP_Identifier].
	^answer
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadImages_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: aBlock [

	^self subclassResponsibility
]

{ #category : #'SCU query' }
NoSQLInterface >> loadOneImage_C_FIND_IdentifierDictionary: aC_FIND_RQ_IdentifierDictionary [
	"Query images database and return the first match only.
	
	PRD 09.2001 - 04.2016"

	| answer |
	^(answer := self open) isNil
		ifFalse: 
			[Error signal: answer]
		ifTrue: 
			[answer := self loadOneImage_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary.
			self close.	"Close database interface"
			answer]
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadOneImage_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary [

	^self subclassResponsibility
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadOneImage_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [

	^self subclassResponsibility
]

{ #category : #'SCU query' }
NoSQLInterface >> loadPatients_C_FIND_IdentifierDictionary: aC_FIND_RQ_IdentifierDictionary [
	"Query patient information from the database using the 
	supplied C-FIND-RQ-IdentifierDictionary - PRD 09.2001 - 01.2016"

	| answer |
	^(answer := self open) isNil
		ifFalse: 
			[Error signal: answer]
		ifTrue: 
			[answer := self loadPatients_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary.
			self close.	"Close database interface"
			answer]
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadPatients_C_FIND_RQ: aC_FIND_RQ_Identifier [
	"Query the remote DICOM Application Entity about patient Information, 
	using the supplied DICOM C-FIND Identifier - PRD 09.2001 - 01.2016"

	| query |

	query:=
		self createQueryFromC_FIND_RQ_Identifier: aC_FIND_RQ_Identifier.
	^self 
		loadPatients_C_FIND_RQDictionary: query.
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadPatients_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary [
	"Query the remote DICOM Application Entity about patient Information, 
	using the supplied DICOM C-FIND Identifier - PRD 09.2001 - 01.2016"

	| answer aC_FIND_RSP_Identifier|

	"collectionName := self queryRetrieveInformationModelIsStudyRoot 
		ifTrue: ['studies'] ifFalse: ['patients'].
	mongoCollection := 
		MongoCollection database: self database name: collectionName."
	answer := OrderedCollection new.
	self loadPatients_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: 
		[:aDictionary |
			aDictionary removeKey: '_id'.

			self queryRetrieveInformationModelIsStudyRoot ifTrue: [
				aC_FIND_RSP_Identifier := StudyRoot_Query_RQ_Identifier new.
				aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
				aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
				aC_FIND_RSP_Identifier studyInformation.
			] ifFalse: [
				aC_FIND_RSP_Identifier := PatientRoot_Query_RQ_Identifier new.
				aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
				aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
				aC_FIND_RSP_Identifier patientInformation.
			].
			answer add: aC_FIND_RSP_Identifier].
	^answer
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadPatients_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary do: aBlock [

	^self subclassResponsibility
]

{ #category : #'SCU query' }
NoSQLInterface >> loadSeries_C_FIND_IdentifierDictionary: aC_FIND_RQ_IdentifierDictionary [
	"Query series information from the database using the 
	supplied C-FIND-RQ-IdentifierDictionary - PRD 09.2001 - 01.2016"

	| answer |
	^(answer := self open) isNil
		ifFalse: 
			[Error signal: answer]
		ifTrue: 
			[answer := self loadSeries_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary.
			self close.	"Close database interface"
			answer]
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadSeries_C_FIND_RQ: dicomC_FIND_RQ_Identifier [

	| query |
	
	query :=
		self createQueryFromC_FIND_RQ_Identifier: dicomC_FIND_RQ_Identifier.
	^self 
		loadSeries_C_FIND_RQDictionary: query.
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadSeries_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary [

	| aC_FIND_RSP_Identifier rsp_IdentifierClass answer |

	answer := OrderedCollection new.
	"mongoCollection := MongoCollection database: self database name: 'series'."

	rsp_IdentifierClass := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [StudyRoot_Query_RQ_Identifier]
		ifFalse: [PatientRoot_Query_RQ_Identifier].

	self loadSeries_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: 
		[:aDictionary |
			aDictionary removeKey: '_id'.
			aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
			aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
			aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
			aC_FIND_RSP_Identifier seriesInformation.
			answer add: aC_FIND_RSP_Identifier].
	^answer
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadSeries_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: aBlock [

	^self subclassResponsibility
]

{ #category : #'SCU query' }
NoSQLInterface >> loadStudies_C_FIND_IdentifierDictionary: aC_FIND_RQ_IdentifierDictionary [
	"Query study information from the database using the 
	supplied C_FIND_RQ_IdentifierDictionary - PRD 09.2001 - 01.2016"

	| answer |
	^(answer := self open) isNil
		ifFalse: 
			[Error signal: answer]
		ifTrue: 
			[answer := self loadStudies_C_FIND_RQDictionary: aC_FIND_RQ_IdentifierDictionary.
			self close.	"Close connection to database"
			answer]
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadStudies_C_FIND_RQ: dicomC_FIND_RQ_Identifier [

	| query |

	query := 
		self createQueryFromC_FIND_RQ_Identifier: dicomC_FIND_RQ_Identifier.
	^self 
		loadStudies_C_FIND_RQDictionary: query
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadStudies_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary [

	| aC_FIND_RSP_Identifier rsp_IdentifierClass answer |

	answer := OrderedCollection new.
	"mongoCollection := MongoCollection database: self database name: 'studies'."

	rsp_IdentifierClass := self queryRetrieveInformationModelIsStudyRoot
		ifTrue: [StudyRoot_Query_RQ_Identifier]
		ifFalse: [PatientRoot_Query_RQ_Identifier].

	self loadStudies_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: 
		[:aDictionary |
			aDictionary removeKey: '_id'.
			aC_FIND_RSP_Identifier := rsp_IdentifierClass new.
			aC_FIND_RSP_Identifier encoder: LittleEndianImplicitVRTS.
			aC_FIND_RSP_Identifier bsonDictionary: aDictionary.
			aC_FIND_RSP_Identifier studyInformation.
			answer add: aC_FIND_RSP_Identifier].
	^answer
]

{ #category : #'private (SCU query)' }
NoSQLInterface >> loadStudies_C_FIND_RQDictionary: dicomC_FIND_RQ_IdentifierDictionary do: aBlock [

	^self subclassResponsibility
]

{ #category : #private }
NoSQLInterface >> logAPIString [
	^'[DB API - NoSQL]'.
]

{ #category : #'C-FIND' }
NoSQLInterface >> nextQueryAnswer [

	^self queryAnswers atEnd ifFalse: [self queryAnswers next] ifTrue: [#noMoreAnswers].
]

{ #category : #accessing }
NoSQLInterface >> patientsCache [

	^patientsCache ifNil: [patientsCache := Dictionary new]
]

{ #category : #accessing }
NoSQLInterface >> patientsCache: anObject [

	patientsCache := anObject
]

{ #category : #'C-STORE' }
NoSQLInterface >> removeBlanksFromKeyFields: dictionary [
	"Make sure that key fields aren't stored without extra blanks.

	PRD 01-03.2002; 01-02.2016; 02.2017"

	dictionary at: 'patientID' put: (dictionary at: 'patientID') trimBoth.
	dictionary at: 'studyInstanceUID' put: (dictionary at: 'studyInstanceUID') trimBoth.
	dictionary at: 'seriesInstanceUID' put: (dictionary at: 'seriesInstanceUID') trimBoth.
	dictionary at: 'sopInstanceUID' put: (dictionary at: 'sopInstanceUID') trimBoth.
]

{ #category : #'private (SCU retrieval)' }
NoSQLInterface >> retrieveAndSend: databaseMatch [
	"Retrieve the IOD corresponding to the given database match
	from the data repository and send it to the application. For NoSQL 
	databases, 'databaseMatch' is a Dictionary storing all data element 
	values of the matched SOP Instance UID, where the key corresponds
	to the data element name and the value to data element value.
	
	PRD - 01.2001 - 03.2017"

	| sopInstance |
	sopInstance := self sopInstanceFromDictionary: databaseMatch.
	self sendIODToApplication: sopInstance
]

{ #category : #accessing }
NoSQLInterface >> root [

	^root
]

{ #category : #accessing }
NoSQLInterface >> root: anObject [

	root := anObject
]

{ #category : #accessing }
NoSQLInterface >> seriesCache [

	^seriesCache ifNil: [seriesCache := Dictionary new]
]

{ #category : #accessing }
NoSQLInterface >> seriesCache: anObject [

	seriesCache := anObject
]

{ #category : #'private (SCU retrieval)' }
NoSQLInterface >> sopInstanceFromDictionary: aDictionary [
	"Retrieve all the IOD matches stored in matchesDictionary
	from the data repository to which the interface is connected
	and send them to the application. The dictionary key is the
	matched SOP Instance UID and the value contains an identifier
	with allows the localization of the corresponding IOD in the 
	database repository.
	
	PRD - 01.2001 - 03.2016"

	| sopClassUID iodClass sopInstance |
	sopInstance := nil.
	sopClassUID := aDictionary at: 'sopClassUID'.
	iodClass := DicomRegistry SOPClasses at: sopClassUID ifAbsent: [ nil ].
	iodClass isNil
		ifTrue:
			[ self logMessage: 'Impossible to load SOP instance from database: Unsupported Storage SOP Class' ]
		ifFalse: [ sopInstance := iodClass new.
			aDictionary removeKey: '_id'.
			sopInstance encoder: LittleEndianImplicitVRTS.
			sopInstance bsonDictionary: aDictionary ].
	^ sopInstance
]

{ #category : #'private (application retrieval)' }
NoSQLInterface >> store: aDictionary interface: destinationInterface [

	| sopInstance |

	sopInstance := self sopInstanceFromDictionary: aDictionary.
	destinationInterface storeIOD: sopInstance.
]

{ #category : #'private (application retrieval)' }
NoSQLInterface >> store: aDictionary patientsDictionary: patientsDictionary [

	| sopInstance |

	sopInstance := self sopInstanceFromDictionary: aDictionary.
	patientsDictionary storeIOD: sopInstance.
]

{ #category : #accessing }
NoSQLInterface >> studiesCache [

	^studiesCache ifNil: [studiesCache := Dictionary new]
]

{ #category : #accessing }
NoSQLInterface >> studiesCache: anObject [

	studiesCache := anObject
]
