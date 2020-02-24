Class {
	#name : #DicomBrowser,
	#superclass : #Object,
	#instVars : [
		'browser',
		'interface'
	],
	#category : #'talkDICOM-Browser'
}

{ #category : #'as yet unclassified' }
DicomBrowser class >> open [
	^ self new open
]

{ #category : #accessing }
DicomBrowser class >> title [
	^ 'DICOM Database Browser'
]

{ #category : #'as yet unclassified' }
DicomBrowser >> _patientsIn: constructor [
	constructor list
		display: [ :dicomInteface | dicomInteface loadPatientsList: self aC_FIND_RQ_Identifier ];
		icon: [ Smalltalk ui icons iconNamed: #user ];
		format: #printName
]

{ #category : #'as yet unclassified' }
DicomBrowser >> _seriesOf: arg1 [
	| tmp2 |
	tmp2 := arg1 table.
	tmp2
		title: 'Series';
		"display: [ :arg2 | interface loadSeriesList: arg2 asPatientRootC_FIND_RQ_Identifier ];"
		display: [ :arg2 | | seriesList |  browser status: 'Loading patients list'. seriesList := interface loadSeriesList: arg2 asPatientRoot_Query_RQ_Identifier. browser status: 'Ready'. seriesList ];

		column: 'Series number'
			evaluated: [ :arg3 | arg3 seriesNumber ]
			width: 125;
		column: 'Date'
			evaluated: [ :arg4 | 
			String
				new: 10
				streamContents: [ :arg5 | arg4 printSeriesDateOn: arg5 ] ]
			width: 150;
		column: 'Time'
			evaluated: [ :arg6 | 
			String
				new: 10
				streamContents: [ :arg7 | arg6 printSeriesTimeOn: arg7 ] ]
			width: 150;
		column: 'Modality' evaluated: [ :arg8 | arg8 modality ] width: 75;
		column: 'Description' evaluated: [ :arg9 | arg9 seriesDescription ];
		icon: [ :arg10 | 
			arg10 modality = 'SR'
				ifTrue: [ Smalltalk ui icons iconNamed: #smallJustified ]
				ifFalse: [ Smalltalk ui icons iconNamed: #image ] ]
]

{ #category : #'as yet unclassified' }
DicomBrowser >> aC_FIND_RQ_Identifier [

	| aC_FIND_Identifier |
	aC_FIND_Identifier := PatientRoot_Query_RQ_Identifier new.
	aC_FIND_Identifier  patientInformation.
	aC_FIND_Identifier  patientsName: 
			((PersonName new: 5) at: 1 put: String new; yourself).		
	aC_FIND_Identifier  patientID: String new.
	^aC_FIND_Identifier
]

{ #category : #building }
DicomBrowser >> buildBrowser [

	browser := GLMTabulator new
		title: self class title;
		row: #patients;
		row: #studies;
		row: #series;
		"row: #images;"
		yourself.
	browser 
		hasStatusbar: true.

	browser
		act: [ :arg1 | arg1 inspect ]
			on: $/
			entitled: 'Global action with shortcut';
		act: [ :arg2 | arg2 inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			entitled: 'Action with icon'.

	browser transmit
		to: #patients;
		andShow: [ :arg3 | self patientsIn: arg3 ].
	browser transmit
		from: #patients;
		to: #studies;
		andShow: [ :arg4 | self studiesOf: arg4 ].
	browser transmit
		from: #studies;
		to: #series;
		andShow: [ :arg5 | self seriesOf: arg5 ].

	^ browser
]

{ #category : #'as yet unclassified' }
DicomBrowser >> open [
	self buildBrowser.
	browser openOn: self organizer
]

{ #category : #'as yet unclassified' }
DicomBrowser >> organizer [
	^ interface
		ifNil: [ interface := MongoTalkInterface new ]
		ifNotNil: [ interface ]
]

{ #category : #'as yet unclassified' }
DicomBrowser >> patientsIn: constructor [
	constructor table 
		title: 'Patients';
		selectionAct: [ :arg2 | arg2 inspect ]
			on: $i
			entitled: 'Selection action';
		act: [ :arg3 | arg3 inspect ] entitled: 'Action without icon';
		act: [ :arg4 | arg4 inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			entitled: 'Action with icon';
		column: 'Patient ID'
			evaluated: [ :arg5 | arg5 patientID asString ]
			width: 125;
		column: 'First name'
			evaluated: [ :arg6 | arg6 patientsName givenNameComplex ]
			width: 150;
		column: 'Last name'
			evaluated: [ :arg7 | arg7 patientsName familyNameComplex ]
			width: 150;
		display: [ :arg8 | | patientsList |  browser status: 'Loading patients list'. patientsList := arg8 loadPatientsList: self aC_FIND_RQ_Identifier. browser status: 'Ready'. patientsList ];
		filterOn: [ :text :each | each matches: text ];
		helpMessage:  'Enter a regular expression (e.g., "P.*D")';
		icon: [ Smalltalk ui icons iconNamed: #user ]
]

{ #category : #'as yet unclassified' }
DicomBrowser >> seriesOf: arg1 [
	| tmp2 |
	tmp2 := arg1 table.
	tmp2
		title: 'Series';
		beMultiple;
		act: [ :arg3 | EraserPipeline resolutionCT_ERASER: arg3 selection ] entitled: 'Compute CTP time resolution';
		"display: [ :arg2 | interface loadSeriesList: arg2 asPatientRootC_FIND_RQ_Identifier ];"
		display: [ :arg2 | | seriesList |  browser status: 'Loading patients list'. seriesList := interface loadSeriesList: arg2 asPatientRoot_Query_RQ_Identifier. browser status: 'Ready'. seriesList do: [:item | item study: arg2]. seriesList ];

		column: 'Series number'
			evaluated: [ :arg3 | arg3 seriesNumber ]
			width: 125;
		column: 'Time stamp'
			evaluated: [ :arg4 | 
			String
				new: 10
				streamContents: [ :arg5 | arg4 printSeriesDateOn: arg5. arg5 nextPutAll: ' '. arg4 printSeriesTimeOn: arg5 ] ]
			width: 150;
		column: 'Modality' evaluated: [ :arg8 | arg8 modality ] width: 75;
		column: 'Description' evaluated: [ :arg9 | arg9 seriesDescription ];
		column: 'numberOfSeriesRelatedInstances' evaluated: [ :arg9 | arg9 numberOfSeriesRelatedInstances ];
		icon: [ :arg10 | 
			arg10 modality = 'SR'
				ifTrue: [ Smalltalk ui icons iconNamed: #smallJustified ]
				ifFalse: [ Smalltalk ui icons iconNamed: #image ] ]
]

{ #category : #'as yet unclassified' }
DicomBrowser >> studiesOf: arg1 [
	| tmp2 |
	tmp2 := arg1 table.
	tmp2
		title: 'Studies';
		"display: [ :arg2 | interface loadStudiesList: arg2 asPatientRootC_FIND_RQ_Identifier ];"
			display: [ :arg2 | 
			| studiesList |
			browser status: 'Loading patients list'.
			studiesList := interface loadStudiesList: arg2 asPatientRoot_Query_RQ_Identifier.
			browser status: 'Ready'.
			studiesList do: [ :item | item patient: arg2 ].
			studiesList ];
		column: 'Study ID'
			evaluated: [ :arg3 | arg3 studyID ]
			width: 125;
		column: 'Time stamp'
			evaluated: [ :arg4 | 
				String new: 10 streamContents: [ :arg5 | 
					arg4 studyDate asDate printOn: arg5 format: #(1 2 3 $  2 1).
					arg5 nextPut: Character space.
					arg4 studyTime asTime print24: true on: arg5 ] ]
			width: 150;
		"column: 'Date'
			evaluated: [ :arg4 | String new: 10 streamContents: [ :arg5 | arg4 studyDate asDate printOn: arg5 format: #(1 2 3 $  2 1) ] ]
			width: 150;
		column: 'Time'
			evaluated: [ :arg6 | String new: 10 streamContents: [ :arg7 | arg6 studyTime asTime print24: true on: arg7 ] ]
			width: 150;"
		column: 'Description'
			evaluated: [ :arg8 | 
				String new: 10
					streamContents: [ :arg9 | 
					arg9
						nextPutAll:
							(arg8 studyDescription notNil
								ifTrue: [ arg8 studyDescription ]
								ifFalse: [ '' ]) ] ];
		"evaluated: [ :arg6 | arg6 studyDescription ];"
			icon: [ Smalltalk ui icons iconNamed: #book ]
]
