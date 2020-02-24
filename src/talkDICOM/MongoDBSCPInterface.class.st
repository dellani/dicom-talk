Class {
	#name : #MongoDBSCPInterface,
	#superclass : #MongoDBInterface,
	#category : #'talkDICOM-Interfaces-NoSQL-deprecated'
}

{ #category : #initialize }
MongoDBSCPInterface class >> initialize [

	DicomRegistry SCPInterfaces at: self aeConfigurationClass interfaceClass put: self
]

{ #category : #private }
MongoDBSCPInterface >> databaseHostName [
	^self localAEDescription databaseHostName
]

{ #category : #private }
MongoDBSCPInterface >> databaseName [
	^self localAEDescription databaseName.
]

{ #category : #private }
MongoDBSCPInterface >> password [
	^self localAEDescription password
]

{ #category : #private }
MongoDBSCPInterface >> portNumber [
	^self localAEDescription portNumber isNil ifTrue: ['5432'] ifFalse: [self localAEDescription portNumber printString]
]

{ #category : #private }
MongoDBSCPInterface >> usernameString [
	^self localAEDescription userName.
]
