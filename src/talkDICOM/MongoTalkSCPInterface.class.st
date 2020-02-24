Class {
	#name : #MongoTalkSCPInterface,
	#superclass : #MongoTalkInterface,
	#category : #'talkDICOM-Interfaces-NoSQL'
}

{ #category : #initialize }
MongoTalkSCPInterface class >> initialize [

	DicomRegistry SCPInterfaces at: self aeConfigurationClass interfaceClass put: self
]

{ #category : #private }
MongoTalkSCPInterface >> databaseHostName [
	^self localAEDescription databaseHostName
]

{ #category : #private }
MongoTalkSCPInterface >> databaseName [
	^self localAEDescription databaseName.
]

{ #category : #private }
MongoTalkSCPInterface >> password [
	^self localAEDescription password
]

{ #category : #private }
MongoTalkSCPInterface >> portNumber [
	^self localAEDescription portNumber isNil ifTrue: ['5432'] ifFalse: [self localAEDescription portNumber printString]
]

{ #category : #private }
MongoTalkSCPInterface >> usernameString [
	^self localAEDescription userName.
]
