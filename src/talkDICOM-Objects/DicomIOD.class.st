"
bsonDictionary: aDictionary

	| iom |

	super bsonDictionary: aDictionary.
	self informationObjectModules do: 
			[:each |
			iom := each new.
			iom encoder: self encoder.
			iom dataElementsDictionary: self dataElementsDictionary.
			iom dataElementsValues: self dataElementsValues.
			self perform: (each moduleName , ':') asSymbol with: iom].
"
Class {
	#name : #DicomIOD,
	#superclass : #DicomObject,
	#instVars : [
		'sopClassUID',
		'name'
	],
	#classInstVars : [
		'InformationObjectModules',
		'iodName'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
DicomIOD class >> DicomIODName [

	^self subclassResponsibility
]

{ #category : #accessing }
DicomIOD class >> InformationObjectModules [

	^OrderedCollection new.
]

{ #category : #'computer reflection' }
DicomIOD class >> _addDicomParserVAccessorsToSubclasses_Pharo [
	"Cool!!!
	
	PRD August 09th, 2002"

	| instanceVariableNames method valueToken parameter |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserVAccessorsToSubclasses_Pharo].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		instanceVariableNames := OrderedCollection new.
		InformationObjectModules do: [:iom | (RBAddInstanceVariableChange add: iom moduleName to: self) execute].
		"instanceVariables := instanceVariableNames asArray."
	].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		InformationObjectModules do: [:iomClass | 
			(iomClass DataElements isKindOf: Dictionary) ifTrue: [
				iomClass DataElements do: [:dataElement |
					method := WriteStream on: String new.
					method 
						nextPutAll: dataElement name asString; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: '^', iomClass moduleName, ' ', dataElement name asString.
						
				MethodAddition new
					compile: method contents
						classified: 'accessing IOM data elements'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.
					
					"self compile: method contents classified: 'accessing IOM data elements' attributes: #()."

					method := WriteStream on: String new.
					valueToken := 'a', dataElement vr, 'Value'.
					method 
						nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: iomClass moduleName, ' ', dataElement name asString, ': ', valueToken; cr.

				MethodAddition new
					compile: method contents
						classified: 'accessing IOM data elements'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.

					"self compile: method contents classified: 'accessing IOM data elements' attributes: #()."
				]
			].
			method := WriteStream on: String new.
			method 
				nextPutAll: iomClass moduleName; cr; cr;
				tab; nextPutAll: '^', iomClass moduleName.

			MethodAddition new
					compile: method contents
						classified: 'accessing IOM'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.

			"self compile: method contents classified: 'accessing IOM' attributes: #()."

			method := WriteStream on: String new.
			parameter := 'a', iomClass name asString.
			method 
				nextPutAll: iomClass moduleName, ': ', parameter; cr; cr; 
				tab; nextPutAll: iomClass moduleName, ' := ', parameter, '.'; cr;
				tab; nextPutAll: iomClass moduleName, ' encoder: self encoder.'; cr; cr;

				tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary == self dataElementsDictionary ifFalse: ['; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary keysAndValuesDo: [:key :value |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: key put: value].'; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
				tab; nextPutAll: '].'; cr; cr;

				tab; nextPutAll: iomClass moduleName, ' dataElementsValues == self dataElementsValues ifFalse: ['; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues keysAndValuesDo: [:key :value |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: key put: value].'; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues'; cr;
				tab; nextPutAll: '].'; cr; cr.

			MethodAddition new
					compile: method contents
						classified: 'accessing IOM'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.

			"self compile: method contents classified: 'accessing IOM' attributes: #()."
		]
	]
]

{ #category : #'computer reflection 2021' }
DicomIOD class >> addClassInitializationMethod [
	"Code the initialization method for class DicomIOD. This method will
	 initialize data element definitions for every implemented IOD to class
	 variable dicomIODDataElementDefinitions in DicomRegistry.
	
	 (Computer reflection is way cool!)

	 May 24 2021: Initial implementation - Paulo R. Dellani."

	| method |
	method := self computerReflection_IODInitializationMethod.
	MethodAddition new
		compile: method contents
		classified: 'class initialization'
		withStamp: DateAndTime now printString
		notifying: nil 
		logSource: true
		"This is a class method, so refer to my metaclass"
		inClass: self class;
	compile.
]

{ #category : #'computer reflection' }
DicomIOD class >> addDicomParserIIAccessorsToSubclasses [
	"Cool!!!

	PRD August 09th, 2002"

	| method valueToken parameter |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserIIAccessorsToSubclasses].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		InformationObjectModules do: [:iomClass | 
			(iomClass DataElements isKindOf: Dictionary) ifTrue: [
				iomClass DataElements do: [:dataElement |
					method := WriteStream on: String new.
					method 
						nextPutAll: dataElement name asString; cr; cr; 
						tab; nextPutAll: '^', iomClass moduleName, ' isNil'; cr;
						tab; tab; nextPutAll: 'ifFalse: [', iomClass moduleName, ' ', dataElement name asString, ']'; cr;
						tab; tab; nextPutAll: 'ifTrue: [nil]'; cr.
					self compile: method contents classified: 'accessing IOM data elements' attributes: #().
					method := WriteStream on: String new.
					valueToken := 'a', dataElement vr, 'Value'.
					method 
						nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil'; cr;
						tab; tab; nextPutAll: 'ifFalse: [', iomClass moduleName, ' ', dataElement name asString, ': ', valueToken, ']'; cr.
					self compile: method contents classified: 'accessing IOM data elements' attributes: #().
				]
			].
			method := WriteStream on: String new.
			method 
				nextPutAll: iomClass moduleName; cr; cr;
				tab; nextPutAll: '^', iomClass moduleName.
			self compile: method contents classified: 'accessing IOM' attributes: #().

			method := WriteStream on: String new.
			parameter := 'a', iomClass name asString.
			method 
				nextPutAll: iomClass moduleName, ': ', parameter; cr; cr; 
				tab; nextPutAll: iomClass moduleName, ' := ', parameter, '.'; cr;
				tab; nextPutAll: iomClass moduleName, ' encoder: encoder.'; cr;
				tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary isNil ifFalse: ['; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary keysAndValuesDo: [:key :value |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: key put: value]'; cr;
				tab; nextPutAll: '].'; cr;
				tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary'; cr.
			self compile: method contents classified: 'accessing IOM' attributes: #().
		]
	]
]

{ #category : #'computer reflection' }
DicomIOD class >> addDicomParserIIIAccessorsToSubclasses [
	"Cool!!!

	PRD August 09th, 2002"

	| method valueToken parameter |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserIIIAccessorsToSubclasses].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		InformationObjectModules do: [:iomClass | 
			(iomClass DataElements isKindOf: Dictionary) ifTrue: [
				iomClass DataElements do: [:dataElement |
					method := WriteStream on: String new.
					method 
						nextPutAll: dataElement name asString; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: '^', iomClass moduleName, ' ', dataElement name asString.
					self compile: method contents classified: 'accessing IOM data elements' attributes: #().

					method := WriteStream on: String new.
					valueToken := 'a', dataElement vr, 'Value'.
					method 
						nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: iomClass moduleName, ' ', dataElement name asString, ': ', valueToken; cr.
					self compile: method contents classified: 'accessing IOM data elements' attributes: #().
				]
			].
			method := WriteStream on: String new.
			method 
				nextPutAll: iomClass moduleName; cr; cr;
				tab; nextPutAll: '^', iomClass moduleName.
			self compile: method contents classified: 'accessing IOM' attributes: #().

			method := WriteStream on: String new.
			parameter := 'a', iomClass name asString.
			method 
				nextPutAll: iomClass moduleName, ': ', parameter; cr; cr; 
				tab; nextPutAll: iomClass moduleName, ' := ', parameter, '.'; cr;
				tab; nextPutAll: iomClass moduleName, ' encoder: encoder.'; cr;
				tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary keysAndValuesDo: [:key :value |'; cr;
				tab; tab; nextPutAll: 'self dataElementsDictionary at: key put: value].'; cr;
				tab; nextPutAll: iomClass moduleName, ' dataElementsValues keysAndValuesDo: [:key :value |'; cr;
				tab; tab; nextPutAll: 'self dataElementsValues at: key put: value].'; cr;
				tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
				tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues'; cr.
			self compile: method contents classified: 'accessing IOM' attributes: #().
		]
	]
]

{ #category : #'computer reflection' }
DicomIOD class >> addDicomParserIVAccessorsToSubclasses [
	"Cool!!!
	
	PRD August 09th, 2002"

	| instanceVariableNames method valueToken parameter instanceVariables |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserIVAccessorsToSubclasses].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		instanceVariableNames := OrderedCollection new.
		InformationObjectModules do: [:iom | instanceVariableNames add: iom moduleName].
		instanceVariables := instanceVariableNames asArray.
	].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		InformationObjectModules do: [:iomClass | 
			(iomClass DataElements isKindOf: Dictionary) ifTrue: [
				iomClass DataElements do: [:dataElement |
					method := WriteStream on: String new.
					method 
						nextPutAll: dataElement name asString; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: '^', iomClass moduleName, ' ', dataElement name asString.
					self compile: method contents classified: 'accessing IOM data elements' attributes: #().

					method := WriteStream on: String new.
					valueToken := 'a', dataElement vr, 'Value'.
					method 
						nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: iomClass moduleName, ' ', dataElement name asString, ': ', valueToken; cr.
					self compile: method contents classified: 'accessing IOM data elements' attributes: #().
				]
			].
			method := WriteStream on: String new.
			method 
				nextPutAll: iomClass moduleName; cr; cr;
				tab; nextPutAll: '^', iomClass moduleName.
			self compile: method contents classified: 'accessing IOM' attributes: #().

			method := WriteStream on: String new.
			parameter := 'a', iomClass name asString.
			method 
				nextPutAll: iomClass moduleName, ': ', parameter; cr; cr; 
				tab; nextPutAll: iomClass moduleName, ' := ', parameter, '.'; cr;
				tab; nextPutAll: iomClass moduleName, ' encoder: self encoder.'; cr; cr;

				tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary == self dataElementsDictionary ifFalse: ['; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary keysAndValuesDo: [:key :value |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: key put: value].'; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
				tab; nextPutAll: '].'; cr; cr;

				tab; nextPutAll: iomClass moduleName, ' dataElementsValues == self dataElementsValues ifFalse: ['; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues keysAndValuesDo: [:key :value |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: key put: value].'; cr;
				tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues'; cr;
				tab; nextPutAll: '].'; cr; cr.
			self compile: method contents classified: 'accessing IOM' attributes: #().
		]
	]
]

{ #category : #'computer reflection' }
DicomIOD class >> addDicomParserVAccessorsToSubclasses_Pharo [
	"Cool!!!
	
	PRD Oktober 06, 2017"

	| instanceVariableNames method |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserVAccessorsToSubclasses_Pharo].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		instanceVariableNames := self instanceVariableNames.
		InformationObjectModules do: [:iom | (instanceVariableNames includes: iom moduleName asSymbol) ifFalse: [(RBAddInstanceVariableChange add: iom moduleName to: self) execute]].
		"instanceVariables := instanceVariableNames asArray."
	].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		InformationObjectModules do: [:iomClass | 
			(iomClass DataElements isKindOf: Dictionary) ifTrue: [
				iomClass DataElements do: [:dataElement |
					method := self computerReflection_accessor_01_for: dataElement iomClass: iomClass.
						
					MethodAddition new
						compile: method
							classified: 'accessing IOM data elements'
							withStamp: DateAndTime now printString
							notifying: nil 
							logSource: true
							inClass: self; compile.
					

					method := self computerReflection_accessor_02_for: dataElement iomClass: iomClass.

					MethodAddition new
						compile: method
							classified: 'accessing IOM data elements'
							withStamp: DateAndTime now printString
							notifying: nil 
							logSource: true
							inClass: self; 	compile.

				]
			].
			method := self computerReflection_accessor_03_for: iomClass.

			MethodAddition new
					compile: method
						classified: 'accessing IOM'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.

			method := self computerReflection_accessor_04_for: iomClass.

			MethodAddition new
					compile: method contents
						classified: 'accessing IOM'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.
		]
	]
]

{ #category : #'computer reflection 2021' }
DicomIOD class >> addIODTextualAttributesDefinitions [

	| method |
	self subclasses do: [ :aSubclass |
		aSubclass InformationObjectModules ifNotEmpty: [
			method := self computerReflection_IODtextualAttributesDefinitionMethod: aSubclass.
			MethodAddition new
				compile: method contents
				classified: 'textual attributes definition'
				withStamp: DateAndTime now printString
				notifying: nil 
				logSource: true
				"This is a class method, so refer to my metaclass"
				inClass: self class;
			compile. ] ]

]

{ #category : #'computer reflection 2021' }
DicomIOD class >> addTextualAttributesDefinition [

	| method |
	self subclasses do: [ :aSubclass |
		aSubclass addTextualAttributesDefinition ].

	self InformationObjectModules ifNotEmpty: [
		method := self computerReflection_textualAttributesDefinitionMethod.
		MethodAddition new
			compile: method contents
			classified: 'textual attributes definition'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile.
	]

]

{ #category : #'computer reflection 2021' }
DicomIOD class >> computerReflection_IODInitializationMethod [
	"Code the class initialization method for DicomIOD that populates
	 class variable DicomRegistry>dicomIODDataElementDefinitions with 
	 data element definitions for several IODs. 
	
	  24 May 2021: Initial implementation;
	 03 June 2021: Initialization code now creates a DicomIOD instance 
	               for every supported SOP Class UID and initializes 
	               with IOD name, SOP Class UID and the data elements 
	               definition - Paulo R. Dellani"

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'initialize'; cr;
				tab; nextPut: $"; 	
				nextPutAll: 'Populates class variable DicomRegistry>dicomIODDataElementDefinitions ';
				nextPutAll: 'with data element definitions for the implemented IODs bellow.'; cr; cr;
				tab; nextPutAll: ' Coder: DicomIOD>computerReflection_IODInitializationMethod'; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr.

			writeStream
				cr; tab; nextPutAll: 'DicomRegistry resetDicomIODDataElementDefinitions.'; cr.

			self subclassesDo: [ : aDicomIODSubclass |
				aDicomIODSubclass sopClassUID ifNotNil: [ 
					writeStream
						cr; tab; nextPutAll: 'DicomRegistry registerDicomIODDataElementDefinition: (';
						cr; tab; tab; nextPutAll: 'self new'; 
						cr; tab; tab; tab; nextPutAll: 'name: '''; nextPutAll: aDicomIODSubclass DicomIODName; nextPutAll: ''';';
						cr; tab; tab; tab; nextPutAll: 'sopClassUID: '''; nextPutAll: aDicomIODSubclass sopClassUID; nextPutAll: ''';';
						cr; tab; tab; tab; nextPutAll: 'initializeDataElementsDefinition: self ';
						nextPutAll: 'textualAttributesDefinitionFor'; 
						nextPutAll: aDicomIODSubclass iodName; nextPutAll: ';';
						cr; tab; tab; tab; nextPutAll: 'yourself )'; cr;
						tab; tab; nextPutAll: 'sopClassUID: ''';
						nextPutAll: aDicomIODSubclass sopClassUID;
						nextPutAll: '''.'; cr.
			] ] ].
]

{ #category : #'computer reflection 2021' }
DicomIOD class >> computerReflection_IODtextualAttributesDefinitionMethod: aDicomIODSubclass [
	"Code a method for textual attributes definition by combining the textual
	 data elements definition of the my information object modules.
	
	April 18 2021 - PRD."
	
	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'textualAttributesDefinitionFor'; 
				nextPutAll: aDicomIODSubclass iodName; cr;
				tab; nextPut: $"; nextPutAll: 'Textual attributes definition for '; nextPutAll: aDicomIODSubclass DicomIODName; cr; cr;
				tab; nextPutAll: ' Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod '; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;
				
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll: DicomIOM ';
					                 nextPutAll: aDicomIODSubclass InformationObjectModules first moduleName; 
					                 nextPutAll: 'TextualDataElementsDefinition; cr'.

			2 to: aDicomIODSubclass InformationObjectModules size do: [ :index  | | aDicomIOMSubclass | 
				aDicomIOMSubclass := aDicomIODSubclass InformationObjectModules at: index.
				writeStream
					nextPut: $;; cr;
					tab; tab; tab; tab; nextPutAll: 'nextPutAll: DicomIOM ';
						                 nextPutAll: aDicomIOMSubclass moduleName; 
						                 nextPutAll: 'TextualDataElementsDefinition; cr'. ].
			writeStream
				nextPutAll: ' ]'; cr. ]
]

{ #category : #'computer reflection' }
DicomIOD class >> computerReflection_accessor_01_for: dataElement iomClass: iomClass [
	| method |

	method := String
		new: 10
		streamContents: [ :writeStream | 
					writeStream 
						nextPutAll: dataElement name asString; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: '^', iomClass moduleName, ' ', dataElement name asString].
					
	^ method
						

]

{ #category : #'computer reflection' }
DicomIOD class >> computerReflection_accessor_01_for: dataElement iomClass: iomClass newName: newName [
	| method |

	method := String
		new: 10
		streamContents: [ :writeStream | 
					writeStream 
						nextPutAll: dataElement name asString; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: '^', iomClass moduleName, ' ', newName asString].
					
	^ method
						

]

{ #category : #'computer reflection' }
DicomIOD class >> computerReflection_accessor_02_for: dataElement iomClass: iomClass [
	| method valueToken |

	valueToken := 'a', dataElement vr, 'Value'.

	method := String
		new: 10
		streamContents: [ :writeStream | 
									writeStream
										nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
										tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
										tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
										tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
										tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
										tab; nextPutAll: '].'; cr; cr;
										tab; nextPutAll: iomClass moduleName, ' ', dataElement name asString, ': ', valueToken; cr].
	^ method
]

{ #category : #'computer reflection' }
DicomIOD class >> computerReflection_accessor_02_for: dataElement iomClass: iomClass newName: newName [
	| method valueToken |

	valueToken := 'a', dataElement vr, 'Value'.

	method := String
		new: 10
		streamContents: [ :writeStream | 
									writeStream
										nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
										tab; nextPutAll: iomClass moduleName, ' isNil ifTrue: ['; cr;
										tab; tab; nextPutAll: iomClass moduleName, ' := ', iomClass name asString, ' new.'; cr;
										tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
										tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues.'; cr;
										tab; nextPutAll: '].'; cr; cr;
										tab; nextPutAll: iomClass moduleName, ' ', newName asString, ': ', valueToken; cr].
	^ method
]

{ #category : #'computer reflection' }
DicomIOD class >> computerReflection_accessor_03_for: iomClass [
	| method |

	method := String
		new: 10
		streamContents: [ :writeStream | 
									writeStream
										nextPutAll: iomClass moduleName; cr; cr;
										tab; nextPutAll: '^', iomClass moduleName].
	^ method
	


]

{ #category : #'computer reflection' }
DicomIOD class >> computerReflection_accessor_04_for: iomClass [
	| method parameter |

	parameter := 'a', iomClass name asString.
	method := String
		new: 10
		streamContents: [ :writeStream | 
					writeStream
						nextPutAll: iomClass moduleName, ': ', parameter; cr; cr; 
						tab; nextPutAll: iomClass moduleName, ' := ', parameter, '.'; cr;
						tab; nextPutAll: iomClass moduleName, ' encoder: self encoder.'; cr; cr;
						tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary == self dataElementsDictionary ifFalse: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary keysAndValuesDo: [:key :value |'; cr;
						tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: key put: value].'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsDictionary: self dataElementsDictionary.'; cr;
						tab; nextPutAll: '].'; cr; cr;
						tab; nextPutAll: iomClass moduleName, ' dataElementsValues == self dataElementsValues ifFalse: ['; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues keysAndValuesDo: [:key :value |'; cr;
						tab; tab; tab; nextPutAll: 'self dataElementsValues at: key put: value].'; cr;
						tab; tab; nextPutAll: iomClass moduleName, ' dataElementsValues: self dataElementsValues'; cr;
						tab; nextPutAll: '].'; cr; cr].
	^ method
]

{ #category : #'computer reflection 2021' }
DicomIOD class >> computerReflection_textualAttributesDefinitionMethod [
	"Code a method for textual attributes definition by combining the textual
	 data elements definition of the my information object modules.
	
	April 18 2021 - PRD."
	
	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'textualAttributesDefinition'; cr;
				tab; nextPut: $"; nextPutAll: 'Textual attributes definition for '; nextPutAll: self DicomIODName; cr; cr;
				tab; nextPutAll: ' Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod '; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;
				
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll: DicomIOM ';
					                 nextPutAll: InformationObjectModules first moduleName; 
					                 nextPutAll: 'TextualDataElementsDefinition; cr'.

			2 to: InformationObjectModules size do: [ :index  | | aDicomIOMSubclass | 
				aDicomIOMSubclass := InformationObjectModules at: index.
				writeStream
					nextPut: $;; cr;
					tab; tab; tab; tab; nextPutAll: 'nextPutAll: DicomIOM ';
						                 nextPutAll: aDicomIOMSubclass moduleName; 
						                 nextPutAll: 'TextualDataElementsDefinition; cr'. ].
			writeStream
				nextPutAll: ' ]'; cr. ]
]

{ #category : #'computer reflection' }
DicomIOD class >> correctedDataElementNames [
	"Computer Reflection is Cool!!!

	The DICOM standard define a keyword for every data element in part 6,
	data dictionary. Some of the keys used in this implementation differ
	from the ones now defined in the standard. This method corrects the
	set the names of the data elements defined in this implementation using
	the keys from part 6.

	PRD - September 13, 2017"

	| dictionaryDataElement method |
	self subclasses do: [ :aSubclass | aSubclass correctedDataElementNames ].

	(InformationObjectModules isKindOf: OrderedCollection) ifTrue: [
		InformationObjectModules do: [:iomClass | 
			(iomClass DataElements isDictionary) ifTrue: [
				iomClass DataElements do: [:dataElement |
					"look for the DICOM data element definition in the data dictinary"
					dictionaryDataElement := DicomRegistry DataDictionary at: dataElement tag ifAbsent: [ nil ].
					dictionaryDataElement notNil
						ifTrue: [ 
							dataElement name = dictionaryDataElement name
								ifFalse: [

					Transcript show: self class printString; tab; show: dataElement name; tab; show: dictionaryDataElement name; cr.

					method := self computerReflection_accessor_01_for: dictionaryDataElement iomClass: iomClass.
					MethodAddition new
						compile: method
							classified: 'accessing IOM data elements'
							withStamp: DateAndTime now printString
							notifying: nil 
							logSource: true
							inClass: self; compile.

					method := self computerReflection_accessor_01_for: dataElement iomClass: iomClass newName: dictionaryDataElement name.
					MethodAddition new
						compile: method
							classified: 'accessing IOM data elements - talkDICOM names'
							withStamp: DateAndTime now printString
							notifying: nil 
							logSource: true
							inClass: self; compile.

					method := self computerReflection_accessor_02_for: dictionaryDataElement iomClass: iomClass.
					MethodAddition new
						compile: method
							classified: 'accessing IOM data elements'
							withStamp: DateAndTime now printString
							notifying: nil 
							logSource: true
							inClass: self; 	compile.
								
					method := self computerReflection_accessor_02_for: dataElement iomClass: iomClass newName: dictionaryDataElement name.
					MethodAddition new
						compile: method
							classified: 'accessing IOM data elements - talkDICOM names'
							withStamp: DateAndTime now printString
							notifying: nil 
							logSource: true
							inClass: self; 	compile  ] ] ] ] ] ]
			"dataElement name: dictionaryDataElement name"
]

{ #category : #'computer reflection' }
DicomIOD class >> correctedDataElementNames_II [
	"Computer Reflection is Cool!!!

	The DICOM standard define a keyword for every data element in part 6,
	data dictionary. Some of the keys used in this implementation differ
	from the ones now defined in the standard. This method corrects the
	set the names of the data elements defined in this implementation using
	the keys from part 6.

	PRD - September 13, 2017"

	| dictionaryDataElement |
	self subclasses do: [ :aSubclass | aSubclass correctedDataElementNames_II ].
	(InformationObjectModules isKindOf: OrderedCollection)
		ifTrue: [ InformationObjectModules
				do: [ :iomClass | 
					iomClass DataElements isDictionary
						ifTrue: [ iomClass DataElements
								do: [ :dataElement | 
									"look for the DICOM data element definition in the data dictinary"
									dictionaryDataElement := DicomRegistry DataDictionary at: dataElement tag ifAbsent: [ nil ].
									dictionaryDataElement notNil
										ifTrue: [ dataElement name = dictionaryDataElement name
												ifFalse: [ dataElement name: dictionaryDataElement name.
													iomClass dataElementsDefinitionByName at: dictionaryDataElement name put: dataElement ] ] ] ] ] ].
	DataElements isDictionary
		ifTrue: [ DataElements
				do: [ :dataElement | 
					"look for the DICOM data element definition in the data dictinary"
					dictionaryDataElement := DicomRegistry DataDictionary at: dataElement tag ifAbsent: [ nil ].
					dictionaryDataElement notNil
						ifTrue: [ "ifPresent: [ :dicomDefinition | dataElement name: dicomDefinition name ]"
							dataElement name = dictionaryDataElement name
								ifFalse: [ Transcript
										show: self class printString;
										tab;
										show: dataElement name;
										tab;
										show: dictionaryDataElement name;
										cr.
									dataElement name: dictionaryDataElement name.
									dataElementsDefinitionByName at: dictionaryDataElement name put: dataElement ] ] ] ]
]

{ #category : #printing }
DicomIOD class >> dataElementsTable [
"
	Return a string of characters with a table listing all the
	DICOM data elements that compose the IOD definition.
	PRD - July 15th 2004
"

	| aStream |
	aStream := WriteStream on: String new.
	80 timesRepeat: [aStream nextPutAll: '-'].
	aStream cr; nextPutAll: self DicomIODName; cr.
	80 timesRepeat: [aStream nextPutAll: '-'].
	aStream cr; cr.
	(SortedCollection withAll: DataElements) do: [:dataElement |
		aStream nextPutAll: dataElement printTableEntry
	].
	^aStream contents
]

{ #category : #'class initialization' }
DicomIOD class >> initialize [
	"Populates class variable DicomRegistry>dicomIODDataElementDefinitions with data element definitions for the implemented IODs bellow.

	 Coder: DicomIOD>computerReflection_IODInitializationMethod

	 2021-06-03T16:35:47.748079+02:00 - Computer Reflection"

	DicomRegistry resetDicomIODDataElementDefinitions.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Ambulatory ECG Waveform IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.9.1.3';
			initializeDataElementsDefinition: self textualAttributesDefinitionForAmbulatoryECGWaveform_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.9.1.3'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Basic Directory IOD';
			sopClassUID: '1.2.840.10008.1.3.10';
			initializeDataElementsDefinition: self textualAttributesDefinitionForBasicDirectory_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.1.3.10'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Basic Voice Audio ECG Waveform IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.9.4.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForBasicVoiceAudioECGWaveform_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.9.4.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'CR IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForCR_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'CT IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.2';
			initializeDataElementsDefinition: self textualAttributesDefinitionForCT_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.2'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Cardiac Electrophysiology Waveform IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.9.3.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForCardiacElectrophysiologyECGWaveform_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.9.3.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Enhanced XA IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.12.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForEnhancedXA_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.12.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'General ECG Waveform IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.9.1.2';
			initializeDataElementsDefinition: self textualAttributesDefinitionForGeneralECGWaveform_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.9.1.2'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Grayscale Softcopy Presentation State IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.11.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForGrayscaleSoftcopyPresentationState_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.11.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Hemodinamic ECG Waveform IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.9.2.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForHemodinamicECGWaveform_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.9.2.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'KO IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.88.59';
			initializeDataElementsDefinition: self textualAttributesDefinitionForKeyObjectSelectionDocument_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.88.59'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'MR IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.4';
			initializeDataElementsDefinition: self textualAttributesDefinitionForMR_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.4'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Multi-frame True Color Secondary Capture IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.7.4';
			initializeDataElementsDefinition: self textualAttributesDefinitionForMultiframeTrueColorSC_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.7.4'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'NM IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.20';
			initializeDataElementsDefinition: self textualAttributesDefinitionForNM_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.20'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'Raw Data IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.66';
			initializeDataElementsDefinition: self textualAttributesDefinitionForRawData_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.66'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'SC IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.7';
			initializeDataElementsDefinition: self textualAttributesDefinitionForSC_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.7'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: '12-lead ECG Waveform IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.9.1.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForTwelveLeadECGWaveform_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.9.1.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'US IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.6.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForUS_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.6.1'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'US (retired) IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.6';
			initializeDataElementsDefinition: self textualAttributesDefinitionForUSretired_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.6'.

	DicomRegistry registerDicomIODDataElementDefinition: (
		self new
			name: 'XA IOD';
			sopClassUID: '1.2.840.10008.5.1.4.1.1.12.1';
			initializeDataElementsDefinition: self textualAttributesDefinitionForXA_IOD;
			yourself )
		sopClassUID: '1.2.840.10008.5.1.4.1.1.12.1'.

]

{ #category : #'computer reflection' }
DicomIOD class >> instanceVariableNames [
	| superInstSize orderedCollection |
	orderedCollection := OrderedCollection new.
	(superInstSize := self superclass notNil
		ifTrue: [ self superclass instSize ]
		ifFalse: [ 0 ]) > 0
		ifTrue: [ orderedCollection addAll: self superclass instanceVariableNames ].
	1 to: self instSize - superInstSize do: [ :i | orderedCollection add: (self instVarNames at: i) ].
	^ orderedCollection
]

{ #category : #accessing }
DicomIOD class >> iodName [
	^ iodName
]

{ #category : #accessing }
DicomIOD class >> sopClassUID [
	self subclassResponsibility
]

{ #category : #'class initialization - private' }
DicomIOD class >> textualAttributesDefinition [
	^ self subclassResponsibility
]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForAmbulatoryECGWaveform_IOD [
	"Textual attributes definition for Ambulatory ECG Waveform IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.626232+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformAnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForBasicDirectory_IOD [
	"Textual attributes definition for Basic Directory IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.637714+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM fileSetIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM directoryInformationIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForBasicVoiceAudioECGWaveform_IOD [
	"Textual attributes definition for Basic Voice Audio ECG Waveform IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.643133+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformAnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForCR_IOD [
	"Textual attributes definition for CR IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.647074+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM crSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM constrastBolusIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM crImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM curveIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM modalityLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForCT_IOD [
	"Textual attributes definition for CT IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.650954+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM constrastBolusIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM ctImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForCardiacElectrophysiologyECGWaveform_IOD [
	"Textual attributes definition for Cardiac Electrophysiology Waveform IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.65561+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformAnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForEnhancedXA_IOD [
	"Textual attributes definition for Enhanced XA IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.661167+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForGeneralECGWaveform_IOD [
	"Textual attributes definition for General ECG Waveform IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.664783+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformAnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForGrayscaleSoftcopyPresentationState_IOD [
	"Textual attributes definition for Grayscale Softcopy Presentation State IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.668859+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM presentationSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM presentationStateIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM maskIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM displayShutterIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM bitmapDisplayShutterIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayCurveActivationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM displayedAreaIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM graphicAnnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM spacialTransformationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM graphicLayerIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM modalityLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM softcopyVOI_LUT_IOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM softcopyPresentationLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForHemodinamicECGWaveform_IOD [
	"Textual attributes definition for Hemodinamic ECG Waveform IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.67518+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformAnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForKeyObjectSelectionDocument_IOD [
	"Textual attributes definition for KO IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.679803+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM srDocumentContentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForMR_IOD [
	"Textual attributes definition for MR IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.683222+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM constrastBolusIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM mrImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForMultiframeTrueColorSC_IOD [
	"Textual attributes definition for Multi-frame True Color Secondary Capture IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.688665+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM scEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM multiFrameIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM scImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForNM_IOD [
	"Textual attributes definition for NM IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.692523+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmPETPatientOrientationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmImagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM multiFrameIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmMultiFrameIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmIsotopeIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmDetectorIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmTomoAcquisitionIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmMultiGatedAcquisitionIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmPhaseIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM nmReconstructionIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM curveIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForRawData_IOD [
	"Textual attributes definition for Raw Data IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.696782+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForSC_IOD [
	"Textual attributes definition for SC IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.701399+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM scEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM scImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM modalityLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForTwelveLeadECGWaveform_IOD [
	"Textual attributes definition for 12-lead ECG Waveform IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.705271+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM acquisitionContextIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM waveformAnotationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForUS_IOD [
	"Textual attributes definition for US (retired) IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.709001+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM usFrameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM paletteColorLookupTableIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM constrastBolusIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM usRegionCalibrationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM usImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM curveIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM curveIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM audioIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForUSretired_IOD [
	"Textual attributes definition for US (retired) IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.71435+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM frameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM usFrameOfReferenceIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM paletteColorLookupTableIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM constrastBolusIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM usRegionCalibrationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM usImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM curveIdentificationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM curveIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM audioIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr ]

]

{ #category : #'textual attributes definition' }
DicomIOD class >> textualAttributesDefinitionForXA_IOD [
	"Textual attributes definition for XA IOD

	 Coder: DicomIOD>computerReflection_textualAttributesDefinitionMethod 

	 2021-05-24T14:29:13.718983+02:00 - Computer Reflection"

	^ ByteString
		new: 10
		streamContents: [ :aStream |
			aStream
				nextPutAll: DicomIOM patientIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM patientStudyIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalSeriesIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM synchronizationIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalEquipmentIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM generalImageIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM imagePixelIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM constrastBolusIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM multiFrameIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM overlayPlaneIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM modalityLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM voiLUTIOMTextualDataElementsDefinition; cr;
				nextPutAll: DicomIOM sopCommonIOMTextualDataElementsDefinition; cr ]

]

{ #category : #comparing }
DicomIOD >> < aDicomIOD [
	"PRD - March 05th, 2004"

	^self subclassResponsibility
]

{ #category : #comparing }
DicomIOD >> <= aDicomIOD [
	"PRD - March 05th, 2004"

	^self subclassResponsibility
]

{ #category : #comparing }
DicomIOD >> > aDicomIOD [
	"PRD - March 05th, 2004"

	^self subclassResponsibility
]

{ #category : #comparing }
DicomIOD >> >= aDicomIOD [
	"PRD - March 05th, 2004"

	^self subclassResponsibility
]

{ #category : #printing }
DicomIOD >> dataElementsTable [
"
	Return a string of characters with a table listing all the
	DICOM data elements that compose the IOD definition.
	PRD - July 15th 2004
"

	| aStream |
	aStream := WriteStream on: String new.
	(SortedCollection withAll: self dataElementsDefinition) do: [:dataElement |
		aStream nextPutAll: dataElement printTableEntry; cr.
	].
	^aStream contents
]

{ #category : #printing }
DicomIOD >> dataElementsTableWithValues [
	"Return a string of characters with a table listing all the DICOM 
	data elements that compose the IOD definition. 	PRD - July 15th 2004"

	| aStream |
	aStream := WriteStream on: String new.
	(SortedCollection withAll: self dataElementsCollection) do: 
			[:dataElement |
			dataElement elementNumber == 0
				ifFalse: 
					[aStream
						nextPutAll: dataElement printTableEntryWithValues;
						cr]].
	^aStream contents
]

{ #category : #accessing }
DicomIOD >> encoder: aDicomTransferSyntax [

	| iom |

	super encoder: aDicomTransferSyntax.
	self informationObjectModules do: 
			[:each |
			iom := each new.
			iom encoder: aDicomTransferSyntax.
			iom dataElementsDictionary: self dataElementsDictionary.
			iom dataElementsValues: self dataElementsValues.
			self perform: (each moduleName , ':') asSymbol with: iom].
]

{ #category : #'unique identifiers' }
DicomIOD >> identifyIOD [

	| studyInstanceUID seriesInstanceUID sopInstanceUID |

	studyInstanceUID := self newStudyInstanceUID.
	seriesInstanceUID := self newSeriesInstanceUID: studyInstanceUID seriesNumber: self seriesNumber.
	sopInstanceUID := self newSOPInstanceUID: seriesInstanceUID instanceNumber: self instanceNumber.

	self studyInstanceUID: studyInstanceUID.
	self seriesInstanceUID: seriesInstanceUID.
	self sopInstanceUID: sopInstanceUID.
]

{ #category : #accessing }
DicomIOD >> informationObjectModules [
	^ self class InformationObjectModules
]

{ #category : #accessing }
DicomIOD >> name [
	^ name
]

{ #category : #accessing }
DicomIOD >> name: byteString [
	name := byteString
]

{ #category : #'unique identifiers' }
DicomIOD >> newSOPInstanceUID: seriesInstanceUID instanceNumber: aNumber [
	"See PS 3.5-2000 Annex B"

	^ seriesInstanceUID , '.' , aNumber , '.' , Time now asSeconds printString
]

{ #category : #'unique identifiers' }
DicomIOD >> newSeriesInstanceUID: studyInstanceUID seriesNumber: aSeriesNumber [
	"See PS 3.5-2000 Annex B"

	^ studyInstanceUID , '.' , aSeriesNumber
]

{ #category : #'unique identifiers' }
DicomIOD >> newStudyInstanceUID [
	"Root numbers explanation:

	1 		= ISO
	2 		= ANSI Member Body
      840 	= Country Code (U.S.)
	81469 	=  Member Organization Identifier (bogus)

	Suffix:
	01 		= SmallDICOM Software Identification
      0000	= SmallDICOM Software Serial Number

	See PS 3.5-2000 Annex B"	
	

	| root suffix |
	root := '1.2.840.81469'.
	suffix := '01.0000.', DateAndTime now asSeconds  printString.

	^root, '.', suffix
]

{ #category : #'parsing - private' }
DicomIOD >> populateIOMDictionaries: aDicomTransferSyntax [
	| iom |

	self informationObjectModules
		do: [ :each | 
			iom := each new.
			iom encoder: aDicomTransferSyntax.
			iom dataElementsDictionary: self dataElementsDictionary.
			iom dataElementsValues: self dataElementsValues.
			self perform: (each moduleName , ':') asSymbol with: iom ]
]

{ #category : #accessing }
DicomIOD >> sopClassUID [
	^ sopClassUID
]

{ #category : #accessing }
DicomIOD >> sopClassUID: anUID [
	sopClassUID := anUID
]
