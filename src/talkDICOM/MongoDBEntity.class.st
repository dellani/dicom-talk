Class {
	#name : #MongoDBEntity,
	#superclass : #NoSQLEntity,
	#category : #'talkDICOM-Interfaces-NoSQL'
}

{ #category : #accessing }
MongoDBEntity class >> interfaceClass [
"Interface class identification String  - PRD 29.02.2016"
	^'MongoDB'
]

{ #category : #accessing }
MongoDBEntity class >> xmlElement [
	^'mongodb'
]
