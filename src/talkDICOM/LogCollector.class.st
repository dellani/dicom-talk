Class {
	#name : #LogCollector,
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
LogCollector class >> new [

	^super new initialize
]

{ #category : #accessing }
LogCollector >> debugLevel [
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
LogCollector >> debugLevel: anInteger textCollector: aTextCollector [

	debugLevel := anInteger.
	textCollector := aTextCollector
]

{ #category : #initialize }
LogCollector >> initialize [

	textCollector := nil.
	debugLevel := 0.
	aSharedQueue := SharedQueue new.
	self initializeLoggingProcess.
]

{ #category : #initialize }
LogCollector >> initializeLoggingProcess [

	loggingProcess := [self logMessageProcess] newProcess.
	loggingProcess priority: Processor lowIOPriority "Processor userBackgroundPriority" "Processor userSchedulingPriority".
	loggingProcess resume.
]

{ #category : #logging }
LogCollector >> logMessage: aString [
"
	Write a log message to the log facility used by the Dicom Upper Layer
	PRD 07.2001 - 05.2002
"

	aSharedQueue isNil ifFalse: [aSharedQueue nextPut: Date today printString, ' ', Time now printString, ' - ', aString]
]

{ #category : #logging }
LogCollector >> logMessage: aString debugLevel: level [
"
	Write a log message to the log facility used by the Dicom Upper Layer
	PRD 07.2001 - 05-06.2002
"
	level <= debugLevel 
		ifTrue: [self logMessage: aString]
]

{ #category : #logging }
LogCollector >> logMessageProcess [

	| nextMessage |

	[aSharedQueue = nil] 
		whileFalse: 
		[
			nextMessage := aSharedQueue next.
			textCollector show: nextMessage; cr.

		].
]

{ #category : #initialize }
LogCollector >> release [

	loggingProcess terminate.
	aSharedQueue := nil.
]

{ #category : #accessing }
LogCollector >> textCollector [
"
	A TextCollector instance for logging messages
	PRD 07.2001 - 05.2002
"

	^textCollector.
]
