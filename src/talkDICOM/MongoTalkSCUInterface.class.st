Class {
	#name : #MongoTalkSCUInterface,
	#superclass : #MongoTalkInterface,
	#category : #'talkDICOM-Interfaces-NoSQL'
}

{ #category : #initialize }
MongoTalkSCUInterface class >> initialize [

	DicomRegistry SCUInterfaces at: self aeConfigurationClass interfaceClass put: self
]

{ #category : #private }
MongoTalkSCUInterface >> databaseHostName [
	^self remoteAEDescription databaseHostName.
]

{ #category : #private }
MongoTalkSCUInterface >> databaseName [
	^self remoteAEDescription databaseName.
]

{ #category : #private }
MongoTalkSCUInterface >> password [
	^self remoteAEDescription password
]

{ #category : #private }
MongoTalkSCUInterface >> portNumber [
	^self remoteAEDescription portNumber isNil ifTrue: ['5432'] ifFalse: [self remoteAEDescription portNumber printString]
]

{ #category : #private }
MongoTalkSCUInterface >> usernameString [
	^self remoteAEDescription userName.
]
