Class {
	#name : #Series,
	#superclass : #Object,
	#instVars : [
		'generalSeriesIOM',
		'images',
		'presentationStates',
		'study',
		'palette',
		'imagesInfo',
		'timestamp'
	],
	#category : #'talkDICOM-InformationModel'
}

{ #category : #'instance creation' }
Series class >> fromC_FINDPatientRoot_RSP_Identifier: aC_FINDPatientRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDPatientRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	| newInstance |
	newInstance := self new.
	newInstance 
		bodyPartExamined: aC_FINDPatientRoot_RSP_Identifier bodyPartExamined.
	newInstance 
		modality: aC_FINDPatientRoot_RSP_Identifier modality.
	newInstance 
		numberOfSeriesRelatedInstances: aC_FINDPatientRoot_RSP_Identifier numberOfSeriesRelatedInstances.
	newInstance 
		seriesDate: aC_FINDPatientRoot_RSP_Identifier seriesDate.
	newInstance 
		seriesDescription: aC_FINDPatientRoot_RSP_Identifier seriesDescription.
	newInstance
		seriesInstanceUID: aC_FINDPatientRoot_RSP_Identifier seriesInstanceUID.
	newInstance
		seriesNumber: aC_FINDPatientRoot_RSP_Identifier seriesNumber.
	newInstance 
		seriesTime: aC_FINDPatientRoot_RSP_Identifier seriesTime.
	^newInstance
]

{ #category : #'instance creation' }
Series class >> fromC_FINDStudyRoot_RSP_Identifier: aC_FINDStudyRoot_RSP_Identifier [
	"Create a new instance of myself from C_FINDStudyRoot_RSP_Identifier instance variables.

	PRD - February 2nd, 2016"

	^self
		fromC_FINDPatientRoot_RSP_Identifier: aC_FINDStudyRoot_RSP_Identifier
]

{ #category : #'instance creation' }
Series class >> fromIOD: anIOD [
"
	Create a new instance of myself using the GeneralSeries IOM data element 
	values from the given IOD, if it contains such IOM.
	PRD - December 13th, 2004
"
	| newInstance value |

	newInstance := self new.
	(anIOD respondsTo: #generalSeriesIOM) ifTrue: [
		"SR IODs have an special class of General Series IOM, SR Document Series IOM,
             which does not have all the elements of the general series IOM"
		anIOD generalSeriesIOM class DataElements do: [:aDataElement |
		"GeneralSeriesIOM DataElements do: [:aDataElement |"
			(value := anIOD perform: aDataElement name) notNil ifTrue: [
			newInstance perform: (aDataElement name asString, ':') asSymbol with: value]
		].
	].

	(anIOD respondsTo: #srDocumentSeriesIOM) ifTrue: [
		"SR IODs have an special class of General Series IOM, SR Document Series IOM,
             which does not have all the elements of the general series IOM"
		anIOD srDocumentSeriesIOM class DataElements do: [:aDataElement |
		"SRDocumentSeriesIOM DataElements do: [:aDataElement |"
			(value := anIOD perform: aDataElement name) notNil ifTrue: [
			newInstance perform: (aDataElement name asString, ':') asSymbol with: value]
		].
	].
	^newInstance
]

{ #category : #comparing }
Series >> < aSeries [
	"PRD - August 08th, 2002"

	^self seriesNumber notNil & aSeries seriesNumber notNil
		ifTrue: [self seriesNumber asNumber < aSeries seriesNumber asNumber]
		ifFalse: [self seriesTime < aSeries seriesTime]
]

{ #category : #comparing }
Series >> <= aSeries [
	"PRD - August 08th, 2002"

	^self seriesNumber notNil & aSeries seriesNumber notNil
		ifTrue: [self seriesNumber asNumber <= aSeries seriesNumber asNumber]
		ifFalse: 
			[self seriesNumber notNil & aSeries seriesNumber notNil
				ifTrue: [self seriesTime <= aSeries seriesTime]
				ifFalse: [self seriesNumber notNil]]
]

{ #category : #comparing }
Series >> > aSeries [
	"PRD - August 08th, 2002"

	^self seriesNumber notNil & aSeries seriesNumber notNil
		ifTrue: [self seriesNumber asNumber > aSeries seriesNumber asNumber]
		ifFalse: [self seriesTime > aSeries seriesTime]
]

{ #category : #comparing }
Series >> >= aSeries [
	"PRD - August 08th, 2002"

	^self seriesNumber notNil & aSeries seriesNumber notNil
		ifTrue: [self seriesNumber asNumber > aSeries seriesNumber asNumber]
		ifFalse: [self seriesTime >= aSeries seriesTime]
]

{ #category : #printing }
Series >> _printSeriesDateOn: aStream [
	self seriesDate isNil
		ifTrue: [ self contentDate isNil
				ifTrue: [ aStream nextPutAll: 'nil' ]
				ifFalse: [ self contentDate asDate printOn: aStream format: #(1 2 3 $  2 1 2) ] ]
		ifFalse: [ self seriesDate asDate printOn: aStream format: #(1 2 3 $  2 1 2) ]
]

{ #category : #converting }
Series >> asDicomDirectoryRecordSequenceItem [

	^DirectoryRecordSequenceItem new
		offsetOfTheNextDirectoryRecord: 0;						"**** This information is unknown at the moment*** "
		recordInUseFlag: 16rFFFF;								"**** Record is in use ******"
		offsetOfReferencedLowerLevelDirectoryEntity: 0;			"**** This information is unknown at the moment*** "
		directoryRecordType: 'SERIES';							"**** This is a SERIES Directory Record *****"
		modality: self modality;
		seriesInstanceUID: self seriesInstanceUID;
		seriesNumber: self seriesNumber;
		bodyPartExamined: self bodyPartExamined;
		seriesDate: self seriesDate;
		seriesTime: self seriesTime;
		performingPhysiciansName: self performingPhysiciansName;
		protocolName: self protocolName;
		seriesDescription: self seriesDescription;
		operatorsName: self operatorsName.
]

{ #category : #converting }
Series >> asDictionary [

	| newDictionary |
	newDictionary := Dictionary new.
	newDictionary at: 'patientID' put: self study patient patientID.
	newDictionary at: 'studyInstanceUID' put: self study studyInstanceUID.
	newDictionary at: 'seriesInstanceUID' put: self seriesInstanceUID.
	^newDictionary
]

{ #category : #'accessing - general series IOM' }
Series >> bodyPartExamined [

	^self generalSeriesIOM bodyPartExamined
]

{ #category : #'accessing - general series IOM' }
Series >> bodyPartExamined: anObject [

	self generalSeriesIOM bodyPartExamined: anObject
]

{ #category : #accessing }
Series >> generalSeriesIOM [

	^generalSeriesIOM isNil
		ifTrue: [generalSeriesIOM := GeneralSeriesIOM new]
		ifFalse: [generalSeriesIOM]
]

{ #category : #accessing }
Series >> generalSeriesIOM: aGeneralSeriesIOM [

	generalSeriesIOM := aGeneralSeriesIOM
]

{ #category : #images }
Series >> images [

	^images isNil ifTrue: [images := Dictionary new] ifFalse: [images]
]

{ #category : #images }
Series >> images: aDictionary [

	images := aDictionary
]

{ #category : #accessing }
Series >> imagesInfo [

	^imagesInfo isNil
		ifTrue: [imagesInfo := Dictionary new]
		ifFalse: [imagesInfo]
]

{ #category : #accessing }
Series >> imagesInfo: aDictionary [

	imagesInfo := aDictionary
]

{ #category : #images }
Series >> includesImage: anImage [

	^self images includesKey: anImage sopInstanceUID trimBoth key
]

{ #category : #testing }
Series >> isImage [
	"Answer true if this object contains any kind of image
	PRD - November 13th, 2002"

	^false
]

{ #category : #'accessing - general series IOM' }
Series >> largestPixelValueInSeries [

	^self generalSeriesIOM largestPixelValueInSeries
]

{ #category : #'accessing - general series IOM' }
Series >> largestPixelValueInSeries: anObject [

	self generalSeriesIOM largestPixelValueInSeries: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> laterality [

	^self generalSeriesIOM laterality
]

{ #category : #'accessing - general series IOM' }
Series >> laterality: anObject [

	self generalSeriesIOM laterality: anObject
]

{ #category : #printing }
Series >> listEntryPrint [
	^ String
		new: 10
		streamContents: [ :aStream | 
			aStream nextPutAll: 'Series '.
			(self seriesNumber isNil
				ifFalse: [ self seriesNumber ]
				ifTrue: [ String new ]) printOn: aStream.
			aStream nextPutAll: ' - '.
			(self seriesTime isNil
				ifFalse: [ self seriesTime asTime ]
				ifTrue: [ Time hour: 0 minute: 0 second: 0 ]) print24: true on: aStream.
			aStream nextPutAll: ' - '.
			(self seriesDescription isNil
				ifFalse: [ self seriesDescription ]
				ifTrue: [ String new ]) printOn: aStream ]
]

{ #category : #'accessing - general series IOM' }
Series >> modality [

	^self generalSeriesIOM modality
]

{ #category : #'accessing - general series IOM' }
Series >> modality: anObject [

	self generalSeriesIOM modality: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> numberOfSeriesRelatedInstances [

	^self generalSeriesIOM numberOfSeriesRelatedInstances
]

{ #category : #'accessing - general series IOM' }
Series >> numberOfSeriesRelatedInstances: anObject [

	self generalSeriesIOM numberOfSeriesRelatedInstances: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> operatorsName [

	^self generalSeriesIOM operatorsName
]

{ #category : #'accessing - general series IOM' }
Series >> operatorsName: anObject [

	self generalSeriesIOM operatorsName: anObject
]

{ #category : #accessing }
Series >> palette [

	^palette
]

{ #category : #accessing }
Series >> palette: anObj [

	palette := anObj
]

{ #category : #'accessing - general series IOM' }
Series >> patientPosition [

	^self generalSeriesIOM patientPosition
]

{ #category : #'accessing - general series IOM' }
Series >> patientPosition: anObject [

	self generalSeriesIOM patientPosition: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> performedActionItemSequence [

	^self generalSeriesIOM performedActionItemSequence
]

{ #category : #'accessing - general series IOM' }
Series >> performedActionItemSequence: anObject [

	self generalSeriesIOM performedActionItemSequence: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepDescription [

	^self generalSeriesIOM performedProcedureStepDescription
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepDescription: anObject [

	self generalSeriesIOM performedProcedureStepDescription: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepID [

	^self generalSeriesIOM performedProcedureStepID
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepID: anObject [

	self generalSeriesIOM performedProcedureStepID: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepStartDate [

	^self generalSeriesIOM performedProcedureStepStartDate
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepStartDate: anObject [

	self generalSeriesIOM performedProcedureStepStartDate: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepStartTime [

	^self generalSeriesIOM performedProcedureStepStartTime
]

{ #category : #'accessing - general series IOM' }
Series >> performedProcedureStepStartTime: anObject [

	self generalSeriesIOM performedProcedureStepStartTime: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> performingPhysiciansName [

	^self generalSeriesIOM performingPhysiciansName
]

{ #category : #'accessing - general series IOM' }
Series >> performingPhysiciansName: anObject [

	self generalSeriesIOM performingPhysiciansName: anObject
]

{ #category : #printing }
Series >> printOn: aStream [

	aStream nextPutAll: 'Series '.

	self seriesNumber isNil 
		ifFalse: [self seriesNumber printOn: aStream paddedWith: Character space to: 16r000A]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r000A].

	(self seriesDate isKindOf: Date)
		ifTrue: [self seriesDate printString printOn: aStream paddedWith: Character space to: 16r0014]
		ifFalse: [String new printOn: aStream paddedWith: Character space to: 16r0014].

	(self seriesTime isKindOf: Time)
		ifTrue: [self seriesTime printString printOn: aStream paddedWith: Character space to: 16r000C]
		ifFalse: [String new printOn: aStream paddedWith: Character space to: 16r000C].

	self modality isNil 
		ifFalse: [self modality printOn: aStream paddedWith: Character space to: 16r0004]
		ifTrue: [String new printOn: aStream paddedWith: Character space to: 16r0004].

	self seriesDescription isNil 
		ifFalse: [aStream nextPutAll: self seriesDescription].
]

{ #category : #printing }
Series >> printSeriesDateOn: aStream [
	self seriesDate isNil
		ifTrue: [ aStream nextPutAll: 'nil' ]
		ifFalse: [ self seriesDate asDate printOn: aStream format: #(1 2 3 $  2 1 2) ]
]

{ #category : #printing }
Series >> printSeriesTimeOn: aStream [
	self seriesTime isNil
		ifTrue: [ aStream nextPutAll: 'nil' ]
		ifFalse: [ self seriesTime asTime print24: true on: aStream ]
]

{ #category : #'accessing - general series IOM' }
Series >> protocolName [

	^self generalSeriesIOM protocolName
]

{ #category : #'accessing - general series IOM' }
Series >> protocolName: anObject [

	self generalSeriesIOM protocolName: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> referencedStudyComponentSequence [

	^self generalSeriesIOM referencedStudyComponentSequence
]

{ #category : #'accessing - general series IOM' }
Series >> referencedStudyComponentSequence: anObject [

	self generalSeriesIOM referencedStudyComponentSequence: anObject
]

{ #category : #'initialize-release' }
Series >> release [

	study := nil.
	super release
]

{ #category : #images }
Series >> removeImage: anImage [
	^ self images removeKey: anImage sopInstanceUID trimBoth ifAbsent: [ nil ]
]

{ #category : #'accessing - general series IOM' }
Series >> requestAttributesSequence [

	^self generalSeriesIOM requestAttributesSequence
]

{ #category : #'accessing - general series IOM' }
Series >> requestAttributesSequence: anObject [

	self generalSeriesIOM requestAttributesSequence: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> seriesDate [

	^self generalSeriesIOM seriesDate
]

{ #category : #'accessing - general series IOM' }
Series >> seriesDate: anObject [

	self generalSeriesIOM seriesDate: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> seriesDescription [

	^self generalSeriesIOM seriesDescription
]

{ #category : #'accessing - general series IOM' }
Series >> seriesDescription: anObject [

	self generalSeriesIOM seriesDescription: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> seriesInstanceUID [

	^self generalSeriesIOM seriesInstanceUID
]

{ #category : #'accessing - general series IOM' }
Series >> seriesInstanceUID: anObject [

	self generalSeriesIOM seriesInstanceUID: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> seriesNumber [

	^self generalSeriesIOM seriesNumber
]

{ #category : #'accessing - general series IOM' }
Series >> seriesNumber: anObject [

	self generalSeriesIOM seriesNumber: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> seriesTime [

	^self generalSeriesIOM seriesTime
]

{ #category : #'accessing - general series IOM' }
Series >> seriesTime: anObject [

	self generalSeriesIOM seriesTime: anObject
]

{ #category : #'accessing - general series IOM' }
Series >> smallestPixelValueInSeries [

	^self generalSeriesIOM smallestPixelValueInSeries
]

{ #category : #'accessing - general series IOM' }
Series >> smallestPixelValueInSeries: anObject [

	self generalSeriesIOM smallestPixelValueInSeries: anObject
]

{ #category : #images }
Series >> storeImage: anImage [
	anImage series: self.
	self images at: anImage sopInstanceUID trimBoth put: anImage.
	self storeImageInfo: anImage
]

{ #category : #images }
Series >> storeImageInfo: anImage [
	anImage series: self.
	self imagesInfo at: anImage sopInstanceUID trimBoth put: anImage
]

{ #category : #accessing }
Series >> study [

	^study isNil ifTrue: [study := Study new] ifFalse: [study]
]

{ #category : #accessing }
Series >> study: aStudy [

	study := aStudy
]

{ #category : #accessing }
Series >> timestamp [

	^timestamp isNil
		ifTrue: 
			[timestamp := DateAndTime
								date: self seriesDate
								time: self seriesTime]
		ifFalse: [timestamp]
]

{ #category : #accessing }
Series >> timestamp: anObject [

	timestamp := anObject
]
