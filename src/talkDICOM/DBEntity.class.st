Class {
	#name : #DBEntity,
	#superclass : #Object,
	#instVars : [
		'AETitle',
		'label',
		'portNumber',
		'ipAddress',
		'hostName',
		'databaseHostName',
		'databaseName',
		'userName',
		'password'
	],
	#category : #'talkDICOM-Interfaces'
}

{ #category : #accessing }
DBEntity class >> interfaceClass [
"Interface class identification String  - PRD 04-12.2001"
	^'DICOM'
]

{ #category : #accessing }
DBEntity class >> xmlElement [
	^'dicom'
]

{ #category : #comparing }
DBEntity >> = anApplicationEntity [


	^(self AETitle = anApplicationEntity AETitle) and: 
		[self ipAddress = anApplicationEntity ipAddress and: 
		[self hostName = anApplicationEntity hostName and: 
		[self portNumber = anApplicationEntity portNumber]]]
]

{ #category : #accessing }
DBEntity >> AETitle [
	"Application Entity Title for instances of SCP

	PRD 04.2001"

	^ AETitle
]

{ #category : #accessing }
DBEntity >> AETitle: anAETitle [
	"Application Entity Title for instances of SCP

	PRD 04.2001"

	AETitle := anAETitle
]

{ #category : #accessing }
DBEntity >> databaseHostName [
	^databaseHostName
]

{ #category : #accessing }
DBEntity >> databaseHostName: anObject [
	databaseHostName := anObject
]

{ #category : #accessing }
DBEntity >> databaseName [
	^databaseName
]

{ #category : #accessing }
DBEntity >> databaseName: anObject [
	databaseName := anObject
]

{ #category : #initialize }
DBEntity >> fromXMLElement: aXMLElement [
	self parseAETitleFrom: aXMLElement;
		parseLabelFrom: aXMLElement;
		parsePortFrom: aXMLElement;
		parseAddressFrom: aXMLElement;
		parseHostNameFrom: aXMLElement;
		parseDatabaseNameFrom: aXMLElement;
		parseDatabaseHostNameFrom: aXMLElement;
		parseUserNameFrom: aXMLElement;
		parsePasswordFrom: aXMLElement
]

{ #category : #testing }
DBEntity >> hasDeletionDelta [
"
	Answer true when the configuration of one SCP Application Entity includes an
	delta (number of days) for the automatic deletion of patients/studies. 

	PRD - July 21th, 2003
"

	^false
]

{ #category : #accessing }
DBEntity >> hostName [
	"
	The host name where de aplication lives - PRD 04-08.2001
"
	^hostName
]

{ #category : #accessing }
DBEntity >> hostName: aHostName [
"
	The host name where de aplication lives - PRD 04-08.2001
"
	hostName := aHostName
]

{ #category : #accessing }
DBEntity >> interfaceClass [
	^self class interfaceClass
]

{ #category : #accessing }
DBEntity >> ipAddress [
"
	The IP address of the Host where de aplication lives - PRD 04-08.2001
"
	^ipAddress.
]

{ #category : #accessing }
DBEntity >> ipAddress: anIPAddress [
"
	The IP address of the Host where de aplication lives - PRD 04-08.2001
"
	ipAddress := anIPAddress
]

{ #category : #accessing }
DBEntity >> label [
"
	A label containing a textual description of the Application Entity - PRD - February 12th, 2003
"
	^label.
]

{ #category : #accessing }
DBEntity >> label: aString [
"
	A String label containing a textual description of the Application Entity,
	limited to 32 characters - PRD - February 12th, 2003
"
	(aString isKindOf: String) ifTrue: [
		aString size <= 32 
			ifTrue: [label := aString]
			ifFalse: [label := aString copyFrom: 1 to: 32]
	]
	ifFalse: [label := AETitle]
]

{ #category : #initialize }
DBEntity >> parseDatabaseHostNameFrom: aXMLElement [
	self databaseHostName: 
		(aXMLElement elementNamed: 'databaseHostName') characterData
]

{ #category : #initialize }
DBEntity >> parseDatabaseNameFrom: aXMLElement [
	self databaseName: 
		(aXMLElement elementNamed: 'databaseName') characterData
]

{ #category : #initialize }
DBEntity >> parsePasswordFrom: aXMLElement [
	self password: 
		(aXMLElement elementNamed: 'password') characterData
]

{ #category : #initialize }
DBEntity >> parseUserNameFrom: aXMLElement [
	self userName: 
		(aXMLElement elementNamed: 'userName') characterData
]

{ #category : #accessing }
DBEntity >> password [
	^password
]

{ #category : #accessing }
DBEntity >> password: anObject [
	password := anObject
]

{ #category : #accessing }
DBEntity >> portNumber [
"
	The port Number at the DicomUpperLayer will be listening for connections - PRD 02-04.2001
"
	^portNumber.
]

{ #category : #accessing }
DBEntity >> portNumber: aPortNumber [
"
	Stores the port Number at the DicomUpperLayer will be listening for connections - PRD 02.2001
"
	portNumber := aPortNumber.
]

{ #category : #accessing }
DBEntity >> userName [
	^userName
]

{ #category : #accessing }
DBEntity >> userName: anObject [
	userName := anObject
]
