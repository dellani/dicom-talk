Class {
	#name : #MongoTalkEntity,
	#superclass : #NoSQLEntity,
	#category : #'talkDICOM-Interfaces-NoSQL'
}

{ #category : #accessing }
MongoTalkEntity class >> interfaceClass [
"Interface class identification String  - PRD 15.03.2016"
	^'MongoTalk'
]

{ #category : #accessing }
MongoTalkEntity class >> xmlElement [
	^'mongotalk'
]
