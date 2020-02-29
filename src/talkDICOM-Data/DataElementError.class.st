Class {
	#name : #DataElementError,
	#superclass : #Error,
	#instVars : [
		'dataElement'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #signaling }
DataElementError class >> dataElement: argument [
	^self new dataElement: argument; yourself
	
"signalWithDataElement: aDataElement

	^(self dataElement: aDataElement) signal"
]

{ #category : #signaling }
DataElementError class >> signalWithDataElement: aDataElement [

	^(self dataElement: aDataElement) signal
]

{ #category : #signaling }
DataElementError class >> signalWithDataElement: aDataElement message: message [

	^(self dataElement: aDataElement) signal: message
]

{ #category : #'exception description' }
DataElementError >> dataElement [
	^ dataElement
]

{ #category : #'exception builder' }
DataElementError >> dataElement: dataElementInstance [
	dataElement := dataElementInstance
]

{ #category : #'exception description' }
DataElementError >> isResumable [
	"Determine whether an exception is resumable."

	^ true
]
