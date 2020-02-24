Class {
	#name : #MongoDBSCUInterface,
	#superclass : #MongoDBInterface,
	#category : #'talkDICOM-Interfaces-NoSQL-deprecated'
}

{ #category : #initialize }
MongoDBSCUInterface class >> initialize [

	DicomRegistry SCUInterfaces at: self aeConfigurationClass interfaceClass put: self
]

{ #category : #private }
MongoDBSCUInterface >> databaseHostName [
	^self remoteAEDescription databaseHostName.
]

{ #category : #private }
MongoDBSCUInterface >> databaseName [
	^self remoteAEDescription databaseName.
]

{ #category : #private }
MongoDBSCUInterface >> password [
	^self remoteAEDescription password
]

{ #category : #private }
MongoDBSCUInterface >> portNumber [
	^self remoteAEDescription portNumber isNil ifTrue: ['5432'] ifFalse: [self remoteAEDescription portNumber printString]
]

{ #category : #private }
MongoDBSCUInterface >> usernameString [
	^self remoteAEDescription userName.
]
