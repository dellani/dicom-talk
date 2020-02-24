Class {
	#name : #PatientDictionary,
	#superclass : #Object,
	#type : #variable,
	#instVars : [
		'title',
		'patientsDictionary',
		'studiesDictionary',
		'seriesDictionary',
		'imagesDictionary'
	],
	#category : #'talkDICOM-Interfaces'
}

{ #category : #accessing }
PatientDictionary >> dicomImages [
"	Return an instance of OrderedCollection with all the DicomImage subclasses instances 
	stored by myself  - PRD - December 19th, 2002 - August 08th, 2017"

	| anOrderedCollection |

	anOrderedCollection := OrderedCollection new.
	self patientsDictionary keysAndValuesDo: [:key :aPatient |
		aPatient studies do: [:aStudy |
			aStudy series do: [:aSeries |
				anOrderedCollection addAll: aSeries images]
		]
	].
	^anOrderedCollection
]

{ #category : #accessing }
PatientDictionary >> imagesDictionary [

	^imagesDictionary isNil ifTrue: [imagesDictionary := Dictionary new] ifFalse: [imagesDictionary]
]

{ #category : #accessing }
PatientDictionary >> patients [
	"Answer the name(s) of the patient(s) that are stored in the patientsDictionary

	PRD 08.2002"

	| aString |
	aString := String new.
	self patientsDictionary
		do: [ :aPatient | 
			aString := aString isEmpty
				ifTrue: [ aPatient patientsName printString ]
				ifFalse: [ aPatient patientsName printString , ' and ' , aString ] ].
	^ aString
]

{ #category : #accessing }
PatientDictionary >> patientsDictionary [

	^patientsDictionary isNil ifTrue: [patientsDictionary := Dictionary new] ifFalse: [patientsDictionary]
]

{ #category : #printing }
PatientDictionary >> printString [
	^ 'Patients stored on '
		,
			(self title isNil
				ifTrue: [ '' ]
				ifFalse: [ self title ])
]

{ #category : #'initialize-release' }
PatientDictionary >> release [

	seriesDictionary := nil.
	imagesDictionary := nil.
	studiesDictionary := nil.
	patientsDictionary := nil.
]

{ #category : #accessing }
PatientDictionary >> retrieve: anObject [
	anObject patientLevel
		ifTrue: [ ^ self retrievePatient: anObject patient ].
	anObject studyLevel
		ifTrue: [ ^ self retrieveStudy: anObject study ].
	anObject seriesLevel
		ifTrue: [ ^ self retrieveSeries: anObject series ].
	anObject imageLevel
		ifTrue: [ ^ self retrieveImage: anObject images ]
]

{ #category : #accessing }
PatientDictionary >> retrieveImage: anObject [

	| series |

	^(series := self retrieveSeries: anObject series) notNil ifTrue: [
		series images at: anObject sopInstanceUID trimBoth ifAbsent: [nil]
	] ifFalse: [nil]
]

{ #category : #accessing }
PatientDictionary >> retrievePatient: anObject [

	^self patientsDictionary at: anObject patientID trimBoth ifAbsent: [nil]
]

{ #category : #accessing }
PatientDictionary >> retrieveSeries: anObject [

	| study |

	^(study := self retrieveStudy: anObject study) notNil ifTrue: [
		study series at: anObject seriesInstanceUID trimBoth ifAbsent: [nil]
	] ifFalse: [nil]
]

{ #category : #accessing }
PatientDictionary >> retrieveStudy: anObject [

	| patient |

	^(patient := self retrievePatient: anObject patient) notNil ifTrue: [
		patient studies at: anObject studyInstanceUID trimBoth ifAbsent: [nil]
	] ifFalse: [nil]
]

{ #category : #accessing }
PatientDictionary >> seriesDictionary [

	^seriesDictionary isNil ifTrue: [seriesDictionary := Dictionary new] ifFalse: [seriesDictionary]
]

{ #category : #printing }
PatientDictionary >> statusIcon [

	^DicomIconLibrary visualFor: #patientIcon
]

{ #category : #private }
PatientDictionary >> storeDicomImage: anIOD series: aSeries [
	| aDicomImage |
	aDicomImage := anIOD asDicomImage.
	aSeries storeImage: aDicomImage.
	self imagesDictionary at: anIOD sopInstanceUID trimBoth put: aDicomImage.
	^ aDicomImage
]

{ #category : #'IOD storage' }
PatientDictionary >> storeIOD: anIOD [
	| aDicomImage aPatient aStudy aSeries |
	aPatient := self storePatientIE: anIOD.
	aStudy := self storeStudyIE: anIOD patient: aPatient.
	aSeries := self storeSeriesIE: anIOD study: aStudy.
	aDicomImage := self storeDicomImage: anIOD series: aSeries.
	^ aDicomImage
]

{ #category : #private }
PatientDictionary >> storePatientIE: anIOD [
	| aPatient |
	aPatient := self patientsDictionary
		at: anIOD patientID trimBoth
		ifAbsentPut: [ Patient fromIOD: anIOD ].
	^ aPatient
]

{ #category : #private }
PatientDictionary >> storeSeriesIE: anIOD study: aStudy [
	| aSeries |
	aSeries := aStudy series
		at: anIOD seriesInstanceUID trimBoth
		ifAbsent: [ Series fromIOD: anIOD ].
	aStudy storeSeries: aSeries.
	self seriesDictionary at: anIOD seriesInstanceUID trimBoth put: aSeries.
	^ aSeries
]

{ #category : #private }
PatientDictionary >> storeStudyIE: anIOD patient: aPatient [
	| aStudy |
	aStudy := aPatient studies
		at: anIOD studyInstanceUID trimBoth
		ifAbsentPut: [ Study fromIOD: anIOD ].
	aPatient storeStudy: aStudy.
	self studiesDictionary at: anIOD studyInstanceUID trimBoth put: aStudy.
	^ aStudy
]

{ #category : #accessing }
PatientDictionary >> studiesDictionary [

	^studiesDictionary isNil ifTrue: [studiesDictionary := Dictionary new] ifFalse: [studiesDictionary]
]

{ #category : #accessing }
PatientDictionary >> title [

	^title
]

{ #category : #accessing }
PatientDictionary >> title: aString [

	title := aString
]

{ #category : #accessing }
PatientDictionary >> values [

	^self patientsDictionary values
]
