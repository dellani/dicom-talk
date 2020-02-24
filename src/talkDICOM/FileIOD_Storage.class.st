Class {
	#name : #'FileIOD_Storage',
	#superclass : #'IOD_Storage',
	#instVars : [
		'filename'
	],
	#category : #'talkDICOM-Interfaces'
}

{ #category : #accessing }
FileIOD_Storage >> filename [

	^filename
]

{ #category : #accessing }
FileIOD_Storage >> filename: anObject [

	filename := anObject
]
