Class {
	#name : #Logger,
	#superclass : #Object,
	#instVars : [
		'debugLevel',
		'textCollector',
		'loggingProcess',
		'aSharedQueue'
	],
	#category : #'talkDICOM-Core'
}

{ #category : #'instance creation' }
Logger class >> new [
	^ super new initialize
]

{ #category : #accessing }
Logger >> debugLevel [
"
	The Level of debugging messages on the log console
	level = 0	-> no messages
	level = 1  	-> operation messages
	level = 2  	-> ACSE messages
	level = 3  	-> DIMSE Messagees
	level = 4  	-> More DIMSE Messages
	level = 5  	-> All Messages
	level = 10 	-> Individual Data Elements Parsing Debug Messages
	PRD 02-07.2001
"

	^debugLevel.
]

{ #category : #initialize }
Logger >> debugLevel: anInteger textCollector: aTextCollector [

	debugLevel := anInteger.
	textCollector := aTextCollector
]

{ #category : #initialize }
Logger >> initialize [

	textCollector := nil.
	debugLevel := 0.
	aSharedQueue := SharedQueue new.
	self initializeLoggingProcess.
]

{ #category : #initialize }
Logger >> initializeLoggingProcess [

	loggingProcess := [self logMessageProcess] newProcess.
	loggingProcess priority: Processor lowIOPriority "Processor userBackgroundPriority" "Processor userSchedulingPriority".
	loggingProcess resume.
]

{ #category : #logging }
Logger >> logMessage: aString [
"
	Write a log message to the log facility used by the Dicom Upper Layer
	PRD 07.2001 - 05.2002
"

	aSharedQueue isNil ifFalse: [aSharedQueue nextPut: Date today printString, ' ', Time now printString, ' - ', aString]
]

{ #category : #logging }
Logger >> logMessage: aString debugLevel: level [
"
	Write a log message to the log facility used by the Dicom Upper Layer
	PRD 07.2001 - 05-06.2002
"
	level <= debugLevel 
		ifTrue: [self logMessage: aString]
]

{ #category : #logging }
Logger >> logMessageProcess [

	| nextMessage |

	[aSharedQueue = nil] 
		whileFalse: 
		[
			nextMessage := aSharedQueue next.
			textCollector show: nextMessage; cr.

		].
]

{ #category : #initialize }
Logger >> release [

	loggingProcess terminate.
	aSharedQueue := nil.
]

{ #category : #accessing }
Logger >> textCollector [
"
	A TextCollector instance for logging messages
	PRD 07.2001 - 05.2002
"

	^textCollector.
]
