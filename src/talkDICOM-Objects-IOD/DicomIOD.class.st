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
	#classInstVars : [
		'InformationObjectModules'
	],
	#category : #'talkDICOM-Objects-IOD'
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

	| instanceVariableNames method valueToken parameter |

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
													iomClass DataElementsByName at: dictionaryDataElement name put: dataElement ] ] ] ] ] ].
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
									DataElementsByName at: dictionaryDataElement name put: dataElement ] ] ] ]
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
	^ self subclassResponsibility
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
DicomIOD class >> sopClassUID [
	self subclassResponsibility
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

	^self class InformationObjectModules
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

{ #category : #parsing }
DicomIOD >> pdvBytesStream: dicomPDVStream encoder: aDicomTransferSyntax [
	super pdvBytesStream: dicomPDVStream encoder: aDicomTransferSyntax.
	self populateIOMDictionaries: aDicomTransferSyntax.
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

	^self class sopClassUID
]
