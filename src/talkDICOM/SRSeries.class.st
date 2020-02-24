Class {
	#name : #SRSeries,
	#superclass : #Series,
	#category : #'talkDICOM-InformationModel'
}

{ #category : #printing }
SRSeries >> printSeriesDateOn: aStream [
	aStream nextPutAll: ''
]

{ #category : #printing }
SRSeries >> printSeriesTimeOn: aStream [ 
	aStream nextPutAll: ''
]

{ #category : #accessing }
SRSeries >> srDocumentSeriesIOM [
	^ generalSeriesIOM isNil
		ifTrue: [ generalSeriesIOM := SRDocumentSeriesIOM new ]
		ifFalse: [ generalSeriesIOM ]
]
