Class {
	#name : #'IOD_Storage',
	#superclass : #Object,
	#instVars : [
		'dicomIOD',
		'localAE',
		'remoteAE'
	],
	#category : #'talkDICOM-Interfaces'
}

{ #category : #accessing }
IOD_Storage >> dicomIOD [
	^dicomIOD
]

{ #category : #accessing }
IOD_Storage >> dicomIOD: anObject [
	dicomIOD := anObject
]

{ #category : #accessing }
IOD_Storage >> localAE [
	^localAE
]

{ #category : #accessing }
IOD_Storage >> localAE: anObject [
	localAE := anObject
]

{ #category : #accessing }
IOD_Storage >> remoteAE [
	^remoteAE
]

{ #category : #accessing }
IOD_Storage >> remoteAE: anObject [
	remoteAE := anObject
]
