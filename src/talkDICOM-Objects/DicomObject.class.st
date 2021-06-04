Class {
	#name : #DicomObject,
	#superclass : #Object,
	#instVars : [
		'encoder',
		'dataElementsDictionary',
		'dataElementsValues',
		'dataElementsDefinition',
		'dataElementsDefinitionByName'
	],
	#classInstVars : [
		'DataElements',
		'Type1DataElements',
		'Type1CDataElements',
		'Type2DataElements',
		'Type2CDataElements',
		'Type3DataElements',
		'dataElementsDefinition',
		'dataElementsDefinitionByName'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
DicomObject class >> DataElements [
	^ DataElements
]

{ #category : #accessing }
DicomObject class >> Type1CDataElements [

	^ Type1CDataElements.
]

{ #category : #accessing }
DicomObject class >> Type1DataElements [ 

	^Type1DataElements.
]

{ #category : #accessing }
DicomObject class >> Type2CDataElements [

	^Type2CDataElements.
]

{ #category : #accessing }
DicomObject class >> Type2DataElements [

	^Type2DataElements.
]

{ #category : #accessing }
DicomObject class >> Type3DataElements [

	^Type3DataElements.
]

{ #category : #'private - data elements' }
DicomObject class >> addDataElement: aDicomDataElement [
	"Add a new Dicom Data Element to the appropriate DataElements Dictionary

	PRD 06.2001"

	DataElements at: aDicomDataElement tag put: aDicomDataElement.
	dataElementsDefinitionByName at: aDicomDataElement name put: aDicomDataElement.
	aDicomDataElement isType1
		ifTrue: [ self addType1DataElement: aDicomDataElement ].
	aDicomDataElement isType1C
		ifTrue: [ self addType1CDataElement: aDicomDataElement ].
	aDicomDataElement isType2
		ifTrue: [ self addType2DataElement: aDicomDataElement ].
	aDicomDataElement isType2C
		ifTrue: [ self addType2CDataElement: aDicomDataElement ].
	aDicomDataElement isType3
		ifTrue: [ self addType3DataElement: aDicomDataElement ]
]

{ #category : #'computer reflection' }
DicomObject class >> addDicomParserIIAccessorsToSubclasses [
	"Cool!!!

	PRD August 09th, 2002

	Note: this version supposes that the data element values 
	are stored in the instance variables of each DICOM Object subclass"

	| method valueToken |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserIIAccessorsToSubclasses.
	].

	(DataElements isKindOf: Dictionary) ifTrue: [
		DataElements do: [:dataElement |
			method := WriteStream on: String new.
			method 
				nextPutAll: dataElement name asString; cr; cr; 
				tab; nextPutAll: '^(', dataElement name asString, ' isNil ifTrue: ['; cr;
				tab; tab; nextPutAll: '(', dataElement name asString, ' := (dataElementsDictionary at: ', dataElement name printString, ' ifAbsent: [nil]) value)'; cr;
				tab; nextPutAll: ']'; cr;
				tab; nextPutAll: 'ifFalse: ['; cr;
				tab; tab; nextPutAll: dataElement name asString; cr;
				tab; nextPutAll: '])'; cr.

			self compile: method contents classified: 'accessing' attributes: #().

			method := WriteStream on: String new.
			valueToken := 'a', dataElement vr, 'Value'.
			method 
				nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
				tab; nextPutAll: '| dataElement |'; cr; cr;
				tab; nextPutAll: '(dataElement := dataElementsDictionary at: ', dataElement name printString, ' ifAbsent: [nil]) isNil ifFalse: ['; cr;
				tab; tab; nextPutAll: 'dataElement value: ', valueToken, '.'; cr;
				tab; nextPutAll: ']'; cr;
				tab; nextPutAll: 'ifTrue: ['; cr;
				tab; tab; nextPutAll: 'encoder isNil ifFalse: ['; cr;
				tab; tab; tab; nextPutAll: 'dataElement := self newDataElementNamed: ', dataElement name printString, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement encoder: encoder.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement value: ', valueToken, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElementsDictionary at: ', dataElement name printString, ' put: dataElement'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: '].'; cr;
				tab; nextPutAll: dataElement name asString, ' := ', valueToken; cr.

			self compile: method contents classified: 'accessing' attributes: #().
		]
	]
]

{ #category : #'computer reflection' }
DicomObject class >> addDicomParserIIIAccessorsToSubclasses [
	"Cool!!!

	PRD August 09th, 2002

	Note: this version supposes that the data element values 
	are stored in the dataElementsValues instance variable (a Dictionary)
	and not anymore in a instance variable for each data element.

	In this way, its is possible to implement a mechanism able to prevent
	that a data element value resides in an DicomObject subclass
	instance variable and also in the dataElementsDictionary at the same 
	time.

	============================================================
	audioComments

	^dataElementsValues at: #audioComments ifAbsent: [
		dataElementsDictionary at: #audioComments ifPresent: [:dataElement |
			dataElementsValues at: #audioComments put: (dataElementsDictionary removeKey: #audioComments) value.
		]
	 ]

	============================================================

	audioComments: aLTValue

	| dataElement |

	(dataElementsDictionary at: #audioComments ifPresent: [:dataElement | dataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [ 
			dataElement := self newDataElementNamed: #audioComments.
			dataElement encoder: encoder.
			dataElement value: aLTValue.
			dataElementsDictionary at: #audioComments put: dataElement.
			dataElementsValues removeKey: #audioComments ifAbsent: [nil].
		]
		ifFalse: [
			dataElementsValues at: #audioComments put: aLTValue
		]
	]

	PRD - 14thth July, 2003"

	| method valueToken |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserIIIAccessorsToSubclasses.
	].

	(DataElements isKindOf: Dictionary) ifTrue: [
		DataElements do: [:dataElement |

			method := WriteStream on: String new.
			method 
				nextPutAll: dataElement name asString; cr; cr; 
				tab; nextPutAll: '^dataElementsValues at: ', dataElement name printString, ' ifAbsent: ['; cr;
				tab; tab; nextPutAll: 'dataElementsDictionary at: ', dataElement name printString, ' ifPresent: [:dataElement |'; cr;
				tab; tab; tab; nextPutAll: 'dataElementsValues at: ', dataElement name printString, ' put: (dataElementsDictionary removeKey: ', dataElement name printString, ') value.'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: ']'; cr.

			self compile: method contents classified: 'accessing' attributes: #().

			method := WriteStream on: String new.
			valueToken := 'a', dataElement vr, 'Value'.
			method 
				nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
				tab; nextPutAll: '| dataElement |'; cr; cr;
				tab; nextPutAll: '(dataElementsDictionary at: ', dataElement name printString, ' ifPresent: [:aDataElement | aDataElement value: ', valueToken, ']) isNil ifTrue: ['; cr;
				tab; tab; nextPutAll: 'encoder notNil ifTrue: ['; cr;
				tab; tab; tab; nextPutAll: 'dataElement := self newDataElementNamed: ', dataElement name printString, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement encoder: encoder.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement value: ', valueToken, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElementsDictionary at: ', dataElement name printString, ' put: dataElement.'; cr;
				tab; tab; tab; nextPutAll: 'dataElementsValues removeKey: ', dataElement name printString, ' ifAbsent: [nil].'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; tab; nextPutAll: 'ifFalse: ['; cr;
				tab; tab; tab; nextPutAll: 'dataElementsValues at: ', dataElement name printString, ' put: ', valueToken; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: '].'; cr.

			self compile: method contents classified: 'accessing' attributes: #().
		]
	]
]

{ #category : #'computer reflection' }
DicomObject class >> addDicomParserIVAccessorsToSubclasses [
	"Cool!!!

	PRD August 09th, 2002

	Note: this version supposes that the data element values 
	are stored in the dataElementsValues instance variable (a Dictionary)
	and not anymore in a instance variable for each data element.

	In this way, its is possible to implement a mechanism able to prevent
	that a data element value resides in an DicomObject subclass
	instance variable and also in the dataElementsDictionary at the same 
	time.

	============================================================
	acquisitionNumber

	^self dataElementsValues at: 'acquisitionNumber' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionNumber' put: (self dataElementsDictionary removeKey: 'acquisitionNumber') value.
		]
	]
	============================================================
	acquisitionNumber

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'acquisitionNumber' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionNumber' put: aISValue
		]
	].

	PRD - 14thth July, 2003

	PRD 28th January, 2016 - Even cooler!!! "

	| method valueToken |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserIVAccessorsToSubclasses.
	].

	(DataElements isKindOf: Dictionary) ifTrue: [
		DataElements do: [:dataElement |

			method := WriteStream on: String new.
			method 
				nextPutAll: dataElement name asString; cr; cr; 
				tab; nextPutAll: '^self dataElementsValues at: ''', dataElement name asString, ''' ifAbsent: ['; cr;
				tab; tab; nextPutAll: 'self dataElementsDictionary at: ''', dataElement name asString, ''' ifPresent: [:dataElement |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: ''', dataElement name asString, ''' put: (self dataElementsDictionary removeKey: ''', dataElement name asString, ''') value.'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: ']'; cr.

			self compile: method contents classified: 'accessing' attributes: #().

			method := WriteStream on: String new.
			valueToken := 'a', dataElement vr, 'Value'.
			method 
				nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
				tab; nextPutAll: '| dataElement |'; cr; cr;
				tab; nextPutAll: '(self dataElementsDictionary at: ''', dataElement name asString, ''' ifPresent: [:aDataElement | aDataElement value: ', valueToken, ']) isNil ifTrue: ['; cr;
				tab; tab; nextPutAll: 'encoder notNil ifTrue: ['; cr;
				tab; tab; tab; nextPutAll: 'dataElement := self newDataElementNamed: ', dataElement name printString, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement encoder: self encoder.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement value: ', valueToken, '.'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: ''', dataElement name asString, ''' put: dataElement.'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues removeKey: ''', dataElement name asString, ''' ifAbsent: [nil].'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; tab; nextPutAll: 'ifFalse: ['; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: ''', dataElement name asString, ''' put: ', valueToken; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: '].'; cr.

			self compile: method contents classified: 'accessing' attributes: #().
		]
	]
]

{ #category : #'computer reflection 2017' }
DicomObject class >> addDicomParserVAccessorsToSubclasses_Pharo [
	"Cool!!!

	PRD August 09th, 2002

	Note: this version supposes that the data element values 
	are stored in the dataElementsValues instance variable (a Dictionary)
	and not anymore in a instance variable for each data element.

	In this way, its is possible to implement a mechanism able to prevent
	that a data element value resides in an DicomObject subclass
	instance variable and also in the dataElementsDictionary at the same 
	time.

	============================================================
	acquisitionNumber

	^self dataElementsValues at: 'acquisitionNumber' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionNumber' put: (self dataElementsDictionary removeKey: 'acquisitionNumber') value.
		]
	]
	============================================================
	acquisitionNumber

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'acquisitionNumber' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionNumber' put: aISValue
		]
	].

	PRD - 14thth July, 2003

	PRD 28th January, 2016 - Even cooler!!! 
	
	PRD - August 17, 2017 - Pharo version"

	| method |

	self subclasses do: [:aSubclass |
		aSubclass addDicomParserVAccessorsToSubclasses_Pharo.
	].

	(DataElements isKindOf: Dictionary) ifTrue: [
		DataElements do: [:dataElement |
			method := self computerReflection_accessor_01_for: dataElement.

				MethodAddition new
					compile: method contents
						classified: 'accessing'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.

			method := self computerReflection_accessor_02_for: dataElement.

				MethodAddition new
					compile: method contents
						classified: 'accessing'
						withStamp: DateAndTime now printString
						notifying: nil 
						logSource: true
						inClass: self;
					compile.

		]
	]
]

{ #category : #'computer reflection 2021' }
DicomObject class >> addFullTextualDataElementDefinitionaMethodsToSubclasses [
	"Add method 'fullTextualDataElementDefinition' to my subclasses.
	 'full textual' means that the sequence data element item attributes
	 will be expanded / present in the textual definition.

	(Computer reflection is always cool!!!)

	April 11 2021 - Initial implementation;
	April 18 2021 - Renamed to 'fullTextualDataElementDefinition' to 
	                diferentiate it from textualDataElementDefinition, 
	                which will not include the expanded sequence attributes - PRD."

	| method |

	self subclasses do: [ :aSubclass |
		aSubclass addFullTextualDataElementDefinitionaMethodsToSubclasses.
	].

	(DataElements isKindOf: Dictionary) & (DataElements isNotEmpty) ifTrue: [
		method := self computerReflection_fullTextualDataElementDefinitionMethod.

		MethodAddition new
			compile: method contents
			classified: 'class initialization - private'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile. ]
]

{ #category : #'computer reflection 2021' }
DicomObject class >> addTextualDataElementDefinitionaMethodsToSubclasses [
	"Add method 'textualDataElementDefinition' to my subclasses.
    Attributes of sequence data element items will not be listed.
	 (Computer reflection is always cool!!!)

	April 11 2021 - Initial implementation;
	April 18 2021 - Motified 'addTextualDataElementDefinitionaMethodsToSubclasses'
	                to not include the expanded sequence attributes - PRD."

	| method |

	self subclasses do: [ :aSubclass |
		aSubclass addTextualDataElementDefinitionaMethodsToSubclasses.
	].

	(DataElements isKindOf: Dictionary) & (DataElements isNotEmpty) ifTrue: [
		method := self computerReflection_textualDataElementDefinitionMethod.

		MethodAddition new
			compile: method contents
			classified: 'class initialization - private'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile. ]
]

{ #category : #'private - data elements' }
DicomObject class >> addType1CDataElement: aType1CDicomDataElement [
"
	Add a new Dicom Type 1C Data Element to the appropriate type 1C DataElements Dictionary
	PRD 06.2001
"	

	Type1CDataElements at: (aType1CDicomDataElement tag) put: aType1CDicomDataElement.
]

{ #category : #'private - data elements' }
DicomObject class >> addType1DataElement: aType1DicomDataElement [
"
	Add a new Dicom Type 1 Data Element to the appropriate type 1 DataElements Dictionary
	PRD 06.2001
"	

	Type1DataElements at: (aType1DicomDataElement tag) put: aType1DicomDataElement.
]

{ #category : #'private - data elements' }
DicomObject class >> addType2CDataElement: aType2CDicomDataElement [
"
	Add a new Dicom Type 2C Data Element to the appropriate type 2C DataElements Dictionary
	PRD 06.2001
"	

	Type2CDataElements at: (aType2CDicomDataElement tag) put: aType2CDicomDataElement.
]

{ #category : #'private - data elements' }
DicomObject class >> addType2DataElement: aType2DicomDataElement [
"
	Add a new Dicom Type 2 Data Element to the appropriate type 2 DataElements Dictionary
	PRD 06.2001
"	

	Type2DataElements at: (aType2DicomDataElement tag) put: aType2DicomDataElement.
]

{ #category : #'private - data elements' }
DicomObject class >> addType3DataElement: aType3DicomDataElement [
"
	Add a new Dicom Type 3 Data Element to the appropriate type 3 DataElements Dictionary
	PRD 06.2001
"	

	Type3DataElements at: (aType3DicomDataElement tag) put: aType3DicomDataElement.
]

{ #category : #'computer reflection 2017' }
DicomObject class >> computerReflection_accessor_01_for: dataElement [
	| method |
	method := String
		new: 10
		streamContents: [ :writeStream | 
			"method := WriteStream on: String new."
			writeStream
				nextPutAll: dataElement name asString; cr; cr;
				tab; nextPutAll: '^self dataElementsValues at: '''; nextPutAll: dataElement name asString; nextPutAll: ''' ifAbsent: ['; cr;
				tab; tab; 	nextPutAll: 'self dataElementsDictionary at: '''; 	nextPutAll: dataElement name asString; nextPutAll: ''' ifPresent: [:dataElement |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: '''; nextPutAll: dataElement name asString; nextPutAll: ''' put: (self dataElementsDictionary removeKey: '''; nextPutAll: dataElement name asString; nextPutAll: ''') value.'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: ']'; cr ].
	^ method
]

{ #category : #'computer reflection 2017' }
DicomObject class >> computerReflection_accessor_01_for: dataElement newName: newName [
	| method |
	method := String
		new: 10
		streamContents: [ :writeStream | 
			"method := WriteStream on: String new."
			writeStream
				nextPutAll: dataElement name asString; cr; cr;
				tab; nextPutAll: '^self dataElementsValues at: '''; nextPutAll: newName asString; nextPutAll: ''' ifAbsent: ['; cr;
				tab; tab; 	nextPutAll: 'self dataElementsDictionary at: '''; 	nextPutAll: newName asString; nextPutAll: ''' ifPresent: [:dataElement |'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: '''; nextPutAll: newName asString; nextPutAll: ''' put: (self dataElementsDictionary removeKey: '''; nextPutAll: newName asString; nextPutAll: ''') value.'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: ']'; cr ].
	^ method
]

{ #category : #'computer reflection 2017' }
DicomObject class >> computerReflection_accessor_02_for: dataElement [
	| method valueToken |
	valueToken := 'a', dataElement vr, 'Value'.
	method := String
		new: 10
		streamContents: [ :writeStream | 
			"method := WriteStream on: String new."
			writeStream
			"method := WriteStream on: String new."
				nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
				tab; nextPutAll: '| dataElement |'; cr; cr;
				tab; nextPutAll: '(self dataElementsDictionary at: ''', dataElement name asString, ''' ifPresent: [:aDataElement | aDataElement value: ', valueToken, ']) isNil ifTrue: ['; cr;
				tab; tab; nextPutAll: 'encoder notNil ifTrue: ['; cr;
				tab; tab; tab; nextPutAll: 'dataElement := self newDataElementNamed: ', dataElement name printString, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement encoder: self encoder.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement value: ', valueToken, '.'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: ''', dataElement name asString, ''' put: dataElement.'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues removeKey: ''', dataElement name asString, ''' ifAbsent: [nil].'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; tab; nextPutAll: 'ifFalse: ['; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: ''', dataElement name asString, ''' put: ', valueToken; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: '].'; cr].
	^ method
]

{ #category : #'computer reflection 2017' }
DicomObject class >> computerReflection_accessor_02_for: dataElement newName: newName [
	| method valueToken |
	valueToken := 'a', dataElement vr, 'Value'.
	method := String
		new: 10
		streamContents: [ :writeStream | 
			"method := WriteStream on: String new."
			writeStream
			"method := WriteStream on: String new."
				nextPutAll: dataElement name asString, ': ', valueToken; cr; cr; 
				tab; nextPutAll: '| dataElement |'; cr; cr;
				tab; nextPutAll: '(self dataElementsDictionary at: ''', newName asString, ''' ifPresent: [:aDataElement | aDataElement value: ', valueToken, ']) isNil ifTrue: ['; cr;
				tab; tab; nextPutAll: 'encoder notNil ifTrue: ['; cr;
				tab; tab; tab; nextPutAll: 'dataElement := self newDataElementNamed: ', newName printString, '.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement encoder: self encoder.'; cr;
				tab; tab; tab; nextPutAll: 'dataElement value: ', valueToken, '.'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsDictionary at: ''', newName asString, ''' put: dataElement.'; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues removeKey: ''', newName asString, ''' ifAbsent: [nil].'; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; tab; nextPutAll: 'ifFalse: ['; cr;
				tab; tab; tab; nextPutAll: 'self dataElementsValues at: ''', newName asString, ''' put: ', valueToken; cr;
				tab; tab; nextPutAll: ']'; cr;
				tab; nextPutAll: '].'; cr].
	^ method
]

{ #category : #'computer reflection 2021' }
DicomObject class >> computerReflection_fullTextualDataElementDefinitionMethod [
	"Code textual data element definition method using the information
	 stored in 'DataElement\. DataElement is a Dictionary holding instances
	 of DataElement indexed by its tags that were used to define DicomObject
	 instances in the past.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - Renamed to '_fullTextualDataElementDefinitionMethod' to 
	                diferentiate it from _textualDataElementDefinitionMethod, 
	                which will list the expanded sequence attributes - PRD."

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'fullTextualDataElementDefinition'; cr;
				tab; nextPut: $"; nextPutAll: 'Textual data element definition of myself.'; cr; cr;
				tab; nextPutAll: ' Computer reflection from '; 
				nextPutAll: DateAndTime now printString; nextPut: $"; cr; cr;
				
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream nextPutAll:'; cr;
				nextPut: $'; nextPutAll: self listDataElementDefinition_Full; nextPut: $'; nextPutAll: ' ]'; cr. ].
]

{ #category : #'computer reflection 2021' }
DicomObject class >> computerReflection_textualDataElementDefinitionMethod [
	"Code textual data element definition method using the information
	 stored in 'DataElement\. DataElement is a Dictionary holding instances
	 of DataElement indexed by its tags that were used to define DicomObject
	 instances in the past.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - Motified from '_fullTextualDataElementDefinitionMethod'
	                to not include the expanded sequence attributes - PRD."
	
	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: 'textualDataElementDefinition'; cr;
				tab; nextPut: $"; nextPutAll: 'Textual data element definition of myself.'; cr; cr;
				tab; nextPutAll: ' Computer reflection from '; 
				nextPutAll: DateAndTime now printString; nextPut: $"; cr; cr;
				
				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;
				tab; tab; tab; nextPutAll: 'aStream nextPutAll:'; cr;
				nextPut: $'; nextPutAll: self listDataElementDefinition; nextPut: $'; nextPutAll: ' ]'; cr. ].
]

{ #category : #'computer reflection 2017' }
DicomObject class >> correctedDataElementNames [
	"Computer Reflection is Cool!!!

	The DICOM standard define a keyword for every data element in part 6,
	data dictionary. Some of the keys used in this implementation differ
	from the ones now defined in the standard. This method corrects the
	set the names of the data elements defined in this implementation using
	the keys from part 6.

	PRD - September 13, 2017"

	| dictionaryDataElement method |
	self subclasses do: [ :aSubclass | aSubclass correctedDataElementNames ].
	(DataElements isDictionary)
		ifTrue: [ DataElements
				do: [ :dataElement | 
					"look for the DICOM data element definition in the data dictinary"
					dictionaryDataElement := DicomRegistry DataDictionary at: dataElement tag ifAbsent: [ nil ].
					dictionaryDataElement notNil
						ifTrue: [ "ifPresent: [ :dicomDefinition | dataElement name: dicomDefinition name ]"
							dataElement name = dictionaryDataElement name
								ifFalse: [
									Transcript show: self class printString; tab; show: dataElement name; tab; show: dictionaryDataElement name; cr.
									method := self computerReflection_accessor_01_for: dictionaryDataElement.
									MethodAddition new
												compile: method contents
												classified: 'accessing'
												withStamp: DateAndTime now printString
												notifying: nil 
												logSource: true
												inClass: self;
												compile.


									method := self computerReflection_accessor_01_for: dataElement newName: dictionaryDataElement name.
									MethodAddition new
												compile: method contents
												classified: 'accessing - talkDICOM names'
												withStamp: DateAndTime now printString
												notifying: nil 
												logSource: true
												inClass: self;
												compile.

									method := self computerReflection_accessor_02_for: dictionaryDataElement.
									MethodAddition new
												compile: method contents
												classified: 'accessing'
												withStamp: DateAndTime now printString
												notifying: nil 
												logSource: true
												inClass: self;
												compile.

									method := self computerReflection_accessor_02_for: dataElement newName: dictionaryDataElement name.
									MethodAddition new
												compile: method contents
												classified: 'accessing - talkDICOM names'
												withStamp: DateAndTime now printString
												notifying: nil 
												logSource: true
												inClass: self;
												compile.

											"dataElement name: dictionaryDataElement name" ] ] ] ]
]

{ #category : #'computer reflection 2017' }
DicomObject class >> correctedDataElementNames_II [
	"Computer Reflection is Cool!!!

	The DICOM standard define a keyword for every data element in part 6,
	data dictionary. Some of the keys used in this implementation differ
	from the ones now defined in the standard. This method corrects the
	set the names of the data elements defined in this implementation using
	the keys from part 6.

	PRD - September 13, 2017"

	| dictionaryDataElement |
	self subclasses do: [ :aSubclass | aSubclass correctedDataElementNames_II ].
	(DataElements isDictionary)
		ifTrue: [ DataElements
				do: [ :dataElement | 
					"look for the DICOM data element definition in the data dictinary"
					dictionaryDataElement := DicomRegistry DataDictionary at: dataElement tag ifAbsent: [ nil ].
					dictionaryDataElement notNil
						ifTrue: [ "ifPresent: [ :dicomDefinition | dataElement name: dicomDefinition name ]"
							dataElement name = dictionaryDataElement name
								ifFalse: [
									Transcript show: self class printString; tab; show: dataElement name; tab; show: dictionaryDataElement name; cr.

											dataElement name: dictionaryDataElement name. 
											dataElementsDefinitionByName at: dictionaryDataElement name put: dataElement] ] ] ]
]

{ #category : #accessing }
DicomObject class >> dataElementsDefinition [
	^ dataElementsDefinition
		ifNotNil: [ :arg | arg ]
		ifNil: [ dataElementsDefinition := Dictionary new ]
]

{ #category : #accessing }
DicomObject class >> dataElementsDefinition: aDictionary [
	dataElementsDefinition := aDictionary
]

{ #category : #accessing }
DicomObject class >> dataElementsDefinitionByName [
	^ dataElementsDefinitionByName
]

{ #category : #'class initialization' }
DicomObject class >> initialize [
	^ self subclassResponsibility
]

{ #category : #'class initialization - private' }
DicomObject class >> initializeDataElementsDefinition [
	"Parse data element definitions from my textual attributes listing.
	 Every DataElementDefinion instance created from the textual definitons
	 is stored in a Dictionary stored in the class instance variable 
	 DataElementsDefinition.
	
	 April 24 2021 - Initial implementation;
		May 13 2021 - Split the code for data elements initialization from the 
		              code that parsed the textual attributes definition; Now
		              the parsing is done by parseTextualAttributesDefinition - PRD"

	| aDictionary |
	aDictionary := self
		parseTextualAttributesDefinition: self textualAttributesDefinition.
	self dataElementsDefinition: aDictionary.

	dataElementsDefinitionByName := Dictionary new.
	aDictionary
		valuesDo: [ :dataElementDefinition | 
			self dataElementsDefinitionByName
				at: dataElementDefinition name
				put: dataElementDefinition ]
]

{ #category : #'computer reflection' }
DicomObject class >> initializeSubclasses [
	"Cool!!! - June 28, 2017"

	self subclasses
		do: [ :aSubclass | 
			aSubclass initialize.
			aSubclass initializeSubclasses ]
]

{ #category : #'computer reflection' }
DicomObject class >> instanceVariableNames [
	| superInstSize orderedCollection |
	superInstSize := 0.
	orderedCollection := OrderedCollection new.
	"(superInstSize := self superclass notNil
		ifTrue: [ self superclass instSize ]
		ifFalse: [ 0 ]) > 0
		ifTrue: [ orderedCollection addAll: self superclass instanceVariableNames ]."
	1 to: self instSize - superInstSize do: [ :i | orderedCollection add: (self instVarNames at: i) ].
	^ orderedCollection
]

{ #category : #utilities }
DicomObject class >> listDataElementDefinition [
	"List my data element definition using character (tab) separated values.
	
	 April 11 2021 - Initial implementation;
	 April 18 2021 - Motified from 'listDataElementDefinition_full' to not 
	                 include the expanded sequence attributes - Paulo R. Dellani."

	^ String
		new: 10
		streamContents: [ :aStream | 
			| definition |

			definition := SortedCollection withAll: DataElements values.
			definition isNotEmpty ifTrue: [ 
				(definition at: 1) csvPrintOn: aStream separator: Character tab level: 0.
				2 to: definition size do: [ :index | 
					aStream cr.
					(definition at: index) csvPrintOn: aStream separator: Character tab level: 0] ] ]
]

{ #category : #utilities }
DicomObject class >> listDataElementDefinition_Full [
	"List my data element definition using character (tab) separated values.
	
	April 11 2021 - Initial implementation;
	April 18 2021 - This method is the former 'listDataElementDefinition', which
	                was renamed and lists expanded sequence attributes - PRD."

	^ String
		new: 10
		streamContents: [ :aStream | 
			| definition |

			definition := SortedCollection withAll: DataElements values.
			definition isNotEmpty ifTrue: [ 
				(definition at: 1) csvPrintOn: aStream separator: Character tab level: 0.
				2 to: definition size do: [ :index | 
					aStream cr.
					(definition at: index) fullCSVPrintOn: aStream separator: Character tab level: 0] ] ]
]

{ #category : #'instance creation' }
DicomObject class >> new [
	^ super new
]

{ #category : #utilities }
DicomObject class >> parseTextualAttributesDefinition: textualAttributesDefinition [
	"Parse data element definitions from the listing in textualAttributesDefinition
	 and store it in a Dictionary, which is the return value of the message.

	 April 24 2021 - Initial implementation; 
	   May 09 2021 - Now the method receive the textual attributes definition 
						  as a message parameter, which allows for more flexibility;
		May 13 2021 - Split the code for data elements initialization from the 
		              code that parsed the textual attributes definition;
		              Changed the method name to parseTextualAttributesDefinition - PRD"

	| aDictionary inputStream line definitions |
	aDictionary := Dictionary new.
	inputStream := textualAttributesDefinition readStream.
	[ inputStream atEnd ]
		whileFalse: [ line := inputStream nextLine.
			(line includes: $#)
				ifFalse: [ definitions := DataElementDefinition fromTextualDefinition: line.
					"DataElementDefinition>fromTextualDefinition allways return an
					 OrderedCollection with one or more instances of DataElementDefinition"
					definitions
						do: [ :definition | aDictionary at: definition tag put: definition ] ] ].
	inputStream
		close;
		release.
	^ aDictionary
]

{ #category : #utilities }
DicomObject class >> privateDataElement: dataElementTag [
	| elementName |
	elementName := WriteStream on: String new.
	elementName nextPutAll: 'privateDataElement['.
	dataElementTag groupNumber printOn: elementName base: 16.
	elementName nextPutAll: ','.
	dataElementTag elementNumber printOn: elementName base: 16.
	elementName nextPutAll: ']'.
	^ UNDataElement new
		name: elementName contents asSymbol;
		tag: dataElementTag;
		vm: '1';
		description: 'Private Data Element with tag equal to: ' , dataElementTag printString;
		yourself
]

{ #category : #'private - data elements' }
DicomObject class >> resetDataElements [
"
	Reset the DataElements Dictionaries of the DICOM IOD to be represented
	PRD 06.2001
"	

	DataElements := Dictionary new.
	dataElementsDefinitionByName := Dictionary new.
	Type1DataElements := Dictionary new.
	Type1CDataElements := Dictionary new.
	Type2DataElements := Dictionary new.
	Type2CDataElements := Dictionary new.
	Type3DataElements := Dictionary new.
]

{ #category : #'class initialization - private' }
DicomObject class >> textualAttributesDefinition [
	^ ByteString new
]

{ #category : #utilities }
DicomObject class >> unknowDataElement: dataElementTag [

	| elementName |
	elementName := WriteStream on: String new.
	elementName nextPutAll: 'unknownDataElement['.
	dataElementTag groupNumber printOn: elementName base: 16.
	elementName nextPutAll: ','.
	dataElementTag elementNumber printOn: elementName base: 16.
	elementName nextPutAll: ']'.
	^ UNDataElement new 
		name: elementName contents asSymbol;
		tag: dataElementTag;
		vm: '1';
		description: 'Unknown Data Element with tag equal to: '
				, dataElementTag printString;
		yourself 
]

{ #category : #utilities }
DicomObject >> copyDataElementsFrom: aDicomObject [
	"Copy all the data element values from the given IOD to self - PRD - August 29th, 2003"

	| value |
	self class DataElements do: 
			[:dataElement |
			"For all my data elements copy a the corresponding data element values from given IOD"
			"Check if the given IOD can contain the data element"
			(aDicomObject respondsTo: dataElement name)
				ifTrue: 
					[(value := aDicomObject perform: dataElement name) notNil
						ifTrue: [self perform: (dataElement name asString , ':') asSymbol with: value]]]
]

{ #category : #copying }
DicomObject >> copyFrom: aDicomObject [
	"Copy all the data element from the given DICOM Object to self.

	PRD - April 2th, 2004"

	aDicomObject copyTo: self.
]

{ #category : #copying }
DicomObject >> copyTo: aDicomObject [
	"Copy all the data element values to the given DICOM Object.
	Note that both objects should be from the same class

	PRD - March 18th, 2004, March 10th, 2016"

	| keys dataElementValue |

	(aDicomObject isKindOf: self class) ifTrue: [
		keys := self dataElementsDictionary keys.
		keys do: [:key | 
			"'key' is the name of the data element as a String."
			dataElementValue := (self dataElementsDictionary at: key) value.
			self dataElementsValues at: key put: dataElementValue.

			"Remove data element whose value was decoded from dataElementsDictionary.
			Since the dictionary instance may be shared as a variable instance among 
			several instances of subclasses of Object, remove the keys instead of
			creating a new and empty instance of Dictionary."
			self dataElementsDictionary removeKey: key
		].

		keys := self dataElementsValues keys.

		keys do: [:key | 
			"'key' is the name of the data element as a String."
			dataElementValue := (self dataElementsValues at: key).
			aDicomObject dataElementsValues at: key put: dataElementValue.

			"Remove data element whose value was decoded from dataElementsDictionary.
			Since the dictionary instance may be shared as a variable instance among 
			several instances of subclasses of Object, remove the keys instead of
			creating a new and empty instance of Dictionary."
			(aDicomObject dataElementsDictionary includesKey: key) 
				ifTrue: [aDicomObject dataElementsDictionary removeKey: key]
		].
	]
]

{ #category : #'PDV Bytes' }
DicomObject >> dataElementsCollection [
	"Answer an OrderedCollection with the *DataElements found in the DicomObject instance

	PRD 05-12.2001, 02-06.2002"

	"Create DataElement instances with the stored data element values. 'Key' stores 
	the name of the data element as a String, need to be converted to a instance of class Symbol."

	| groupLengthTag groupLengthDataElement groupLengthDataElements dataElement keys |
	keys := self dataElementsValues keys.
	keys
		do: [ :key | 
			dataElement := self newDataElementNamed: key.
			dataElement encoder: self encoder.
			dataElement value: (self dataElementsValues at: key).
			self dataElementsDictionary at: key put: dataElement.
			"Remove all values encoded as data element instances. Since the dictionary instance 
			may be shared as a variable instance among several instances of subclasses of Object,
			remove the keys instead of creating a new and empty instance of Dictionary."
			self dataElementsValues removeKey: key ].
	groupLengthDataElements := Dictionary new.
	self dataElementsDictionary
		do: [ :aDataElement | 
			groupLengthTag := aDataElement groupLengthTag.
			groupLengthDataElement := groupLengthDataElements
				at: groupLengthTag
				ifAbsentPut: [ (ULDataElement
						newWith: #groupLength
						tag:
						(Array
								with: groupLengthTag groupNumber
								with: groupLengthTag elementNumber)
						vm: 1
						type: '3')
						encoder: self encoder;
						value: 16r0000 ].
			groupLengthDataElement
				value:
					groupLengthDataElement value
						+ aDataElement dataElementLength ].
	"Group Length Data Elements are optional, but some nasty DICOM implementations doesn´t work without them"
	"We use a SortedCollection here to follow the DICOM primitive that the data elements must be ordered by
	  their group and element numbers in a DICOM Presentation Data Value."
	^ SortedCollection new
		addAll: self dataElementsDictionary;
		addAll: groupLengthDataElements;
		yourself
]

{ #category : #accessing }
DicomObject >> dataElementsDefinition [
	^ dataElementsDefinition
		ifNotNil: [ :arg | arg ]
		ifNil: [ dataElementsDefinition := Dictionary new ]
]

{ #category : #accessing }
DicomObject >> dataElementsDefinition: aDictionary [
	dataElementsDefinition := aDictionary
]

{ #category : #accessing }
DicomObject >> dataElementsDefinitionByName [
	^ dataElementsDefinitionByName
]

{ #category : #accessing }
DicomObject >> dataElementsDefinitionByName: aDictionary [
	dataElementsDefinitionByName := aDictionary
]

{ #category : #accessing }
DicomObject >> dataElementsDictionary [
	^dataElementsDictionary
]

{ #category : #accessing }
DicomObject >> dataElementsDictionary: aDictionary [
	dataElementsDictionary := aDictionary
]

{ #category : #'PDV Bytes' }
DicomObject >> dataElementsDictionaryByTag [
	"Answer an Dictionary with the *DataElements found in the DicomObject instance.
	The DICOM data element tag is the key.

	PRD 05-12.2001, 02-06.2002, October 23, 2017

	Create DataElement instances with the stored data element values. 'Key' stores 
	the name of the data element as a String, need to be converted to a instance of class Symbol."

	| groupLengthTag groupLengthDataElement groupLengthDataElements dataElement keys dictionary |
	keys := self dataElementsValues keys.
	keys
		do: [ :key | 
			dataElement := self newDataElementNamed: key.
			dataElement encoder: self encoder.
			dataElement value: (self dataElementsValues at: key).
			self dataElementsDictionary at: key put: dataElement.
			"Remove all values encoded as data element instances. Since the dictionary instance 
			may be shared as a variable instance among several instances of subclasses of Object,
			remove the keys instead of creating a new and empty instance of Dictionary."
			self dataElementsValues removeKey: key ].
	groupLengthDataElements := Dictionary new.
	self dataElementsDictionary
		do: [ :aDataElement | 
			groupLengthTag := aDataElement groupLengthTag.
			groupLengthDataElement := groupLengthDataElements
				at: groupLengthTag
				ifAbsentPut: [ (ULDataElement
						newWith: #groupLength
						tag:
						(Array
								with: groupLengthTag groupNumber
								with: groupLengthTag elementNumber)
						vm: 1
						type: '3')
						encoder: self encoder;
						value: 16r0000 ].
			groupLengthDataElement
				value:
					groupLengthDataElement value
						+ aDataElement dataElementLength ].
	"Group Length Data Elements are optional, but some nasty DICOM implementations doesn´t work without them"
	"We use a SortedCollection here to follow the DICOM primitive that the data elements must be ordered by
	  their group and element numbers in a DICOM Presentation Data Value."

	dictionary := Dictionary new.
	self dataElementsDictionary do: [ :dicomDataElement | dictionary at: dicomDataElement tag put: dicomDataElement ].
	^ dictionary

	"^ SortedCollection new
		addAll: self dataElementsDictionary;
		addAll: groupLengthDataElements;
		yourself"
]

{ #category : #accessing }
DicomObject >> dataElementsValues [
	^dataElementsValues
]

{ #category : #accessing }
DicomObject >> dataElementsValues: anObject [
	dataElementsValues := anObject
]

{ #category : #'computer reflection' }
DicomObject >> doesNotUnderstand: aMessage [ 

	| selector |

	Transcript show: 'Intercepted message not understood:', aMessage selector printString ; cr.

	aMessage arguments size = 1 ifTrue: [ selector := self nameUpperCaseFirstLetter: aMessage selector asString allButLast ].
	aMessage hasArguments ifFalse: [ selector := self nameUpperCaseFirstLetter: aMessage selector asString ].

	aMessage arguments size = 1 
		ifTrue: [ 
			^ self storeDataElementValue: aMessage argument  for: selector ].
		
	aMessage hasArguments 
		ifFalse: [ 
			(self dataElementsValues includesKey: selector) | (self dataElementsDictionary includesKey: selector) ifTrue: [ 
				^ self dataElementsValues at: selector 
					ifAbsent: [
						self dataElementsDictionary at: selector 
							ifPresent: [ :dataElement |
								self dataElementsValues 
									at: selector 
									put: (self dataElementsDictionary removeKey: selector) value ] ] ] ].

	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
DicomObject >> encoder [
	"Contains a reference to the object class that represents the DICOM Transfer - Syntax being used - PRD 05.2001"

	^encoder
]

{ #category : #accessing }
DicomObject >> encoder: aDicomTransferSyntaxClass [
	"Contains a reference to the object class that represents the DICOM Transfer Syntax being used
	Also takes care of the encoding of all stored data elements.

	PRD 05.2001, 07.2003"

	| dataElement |
	aDicomTransferSyntaxClass isNil
		ifFalse: 
			[encoder = aDicomTransferSyntaxClass
				ifFalse: 
					[encoder := aDicomTransferSyntaxClass.
					"Create *DataElement instances with the stored data element values"
					self dataElementsValues keysAndValuesDo: 
							[:key :value |
							"dataElementValues shall not contain any unknown data element value,
				 			since only the values of known data elements are cached by its accessors"
							dataElement := self newDataElementNamed: key.
							dataElement encoder: aDicomTransferSyntaxClass.
							dataElement value: value.
							self dataElementsDictionary at: key put: dataElement].

					"Remove all data element values, since they are now safe"
					self dataElementsValues keys
						do: [:key | self dataElementsValues removeKey: key].

					"**** (Re)Encode all the other data elements, inclusive the unknown ones ********"
					self dataElementsDictionary keysAndValuesDo: 
							[:key :value |
							value encoder = aDicomTransferSyntaxClass
								ifFalse: 
									[dataElement := value copy.
									dataElement encoder: aDicomTransferSyntaxClass.
									dataElement value: value value.
									self dataElementsDictionary at: key put: dataElement]]]]
]

{ #category : #'parsing - private' }
DicomObject >> handleParsedDataElement: aDicomDataElement [
	"Handle a data element that was parsed from the DICOM presentation 
	 data value byte stream.
	
	 11 September 2017: Groups of private creator's data elements are dinamically
	                    loaded to the data elements definition of the DICOM object
	                    when a data element with a private creator's tag is found.
	                    This improves the parsing of private data elements stored
	                    in the PDV stream and handled by this method;
	      04 June 2021: Method refactored from  by either DicomObject>>pdvBytesStream:encoder
                       and DicomObject>>lightPDVBytesStream:encoder methods - Paulo R. Dellani"
	| dataElement |

	dataElement := aDicomDataElement.
	"If the data element is private, check if the private creators group of it is known"
	aDicomDataElement tag isPrivate
		ifTrue: [ aDicomDataElement tag isPrivateCreator
				ifTrue: [ dataElement := LODataElement new "See DICOM Part 5 Section 7.8.1"
															tag: aDicomDataElement tag;
															name: aDicomDataElement name;
															vm: 1;
															description: aDicomDataElement description;
															type: '1';
															encoder: self encoder;
															value: aDicomDataElement value; yourself.
					"Check if private creators group is already loaded, if not, then try to load it"
					self dataElementsDefinition
						at: dataElement tag
						ifAbsent: [ self loadPrivateCreatorsGroup: dataElement ] ] ].
	self dataElementsDictionary
		at: dataElement name
		ifPresent: [ Transcript
				show: 'Warning: data element ' , dataElement name asString , ' already parsed, skipping';
				cr ]
		ifAbsentPut: [ dataElement ]  
]

{ #category : #initialize }
DicomObject >> initialize [

	dataElementsDictionary := Dictionary new.
	dataElementsValues := Dictionary new.
	dataElementsDefinition := Dictionary new.
	dataElementsDefinitionByName := Dictionary new.
]

{ #category : #initialize }
DicomObject >> initializeDataElementsDefinition: textualAttributesDefinition [
	"Parse data element definitions from my textual attributes listing.
	 Every DataElementDefinion instance created from the textual definitons
	 is stored in a Dictionary stored in the class instance variable 
	 DataElementsDefinition.
	
	 24 April 2021: Initial implementation;
		13 May 2021: Split the code for data elements initialization from the 
		             code that parsed the textual attributes definition; Now
		             the parsing is done by parseTextualAttributesDefinition;
	  03 June 2021: Instance-side implementation of the method - Paulo R. Dellani"

	| aDictionary |
	aDictionary := DicomObject 
		parseTextualAttributesDefinition: textualAttributesDefinition.
	self dataElementsDefinition: aDictionary.

	dataElementsDefinitionByName := Dictionary new.
	aDictionary
		valuesDo: [ :dataElementDefinition | 
			self dataElementsDefinitionByName
				at: dataElementDefinition name
				put: dataElementDefinition ]
]

{ #category : #'parsing - private' }
DicomObject >> loadPrivateCreatorsGroup: aDicomDataElement [
	"Check if the dictionary of private data elements stores the private
	 creators group label found in the message parameter's 'aDicomDataElement'
	
    11 September 2017: Initial implementation;
         04 June 2021: Code now loads the private group into instance variable
	                    dataElementsDefinitionByName as well - Paulo R. Dellani"

	| elementsCollection xx newEntry newTag newName |
	elementsCollection := DicomRegistry PrivateCreatorsDataDictionary
		at: aDicomDataElement value trimBoth
		ifAbsent: [ nil ].
	elementsCollection ifNil: [ ^ self ].

	xx := aDicomDataElement tag elementNumber bitShift: 8.
	aDicomDataElement name: (TransferSyntax 
		privateCreatorDataElementNameFrom: aDicomDataElement tag) asSymbol.

	elementsCollection do: [ :entry | 
		newEntry := entry copy.
		newTag := DataElementTag new
			groupNumber: entry tag groupNumber;
			elementNumber: (xx bitXor: entry tag elementNumber);
			yourself.
		newName := String
			new: 10
			streamContents: [ :stream | 
				stream
					nextPutAll: newEntry name asString;
					nextPut: Character space.
				newTag printOn: stream ].
		newEntry name: newName.
		newEntry tag: newTag.
		self dataElementsDefinition at: newTag put: newEntry.
		self dataElementsDefinitionByName at: newName put: newEntry
	]
]

{ #category : #'computer reflection - private' }
DicomObject >> nameUpperCaseFirstLetter: dataElementName [
	^ String
		new: 10
		streamContents: [ :aStream | 
			(dataElementName copyFrom: 1 to: 3) = 'sop'
				ifTrue: [ aStream
						nextPutAll: 'SOP';
						nextPutAll: (dataElementName copyFrom: 4 to: dataElementName size) ]
				ifFalse: [ aStream
						nextPut: dataElementName first asUppercase;
						nextPutAll: (dataElementName copyFrom: 2 to: dataElementName size) ] ]
]

{ #category : #'data elements' }
DicomObject >> newDataElementNamed: dataElementName [
	"This creates a new instance of the [VR]DataElement for the given data element name.
	 If the name of data element is unknown, a instance of [VR]DataElement is created 
	 using the information stored in the given data element itself. This information is
	 encoded in the name by the method DicomObject>>unknowDataElement:. The encoding
	 follows the format 'unknow[0xgggg,0xeeee]VRDataElement'
	
	 06 June 2021: Adapted to handle the instance side dictionary of data element
	               definitions; This is the method where accessing the main dictionary
	               of data elements definitions might be the best solution - Paulo R. Dellani	"

	| dataElementDefinition valueRepresentation elementTag readStream |

	dataElementDefinition := self dataElementsDefinitionByName
		at: dataElementName
		ifAbsent: [ readStream := (dataElementName
				copyFrom: (dataElementName indexOf: $[) + 1
				to: (dataElementName indexOf: $,) - 1) readStream.
			elementTag := DataElementTag new.
			elementTag groupNumber: (Integer readFrom: readStream radix: 16).
			readStream := (dataElementName
				copyFrom: (dataElementName indexOf: $,) + 1
				to: (dataElementName indexOf: $]) - 1) readStream.
			elementTag elementNumber: (Integer readFrom: readStream radix: 16).
			valueRepresentation := dataElementName copyFrom: 8 to: 9.
			DataElementDefinition new
				vr: valueRepresentation;
				tag: elementTag;
				name: dataElementName;
				vm: '1';
				description: 'Private Data Element with tag equal to: ' , elementTag printString;
				yourself ].
	^ dataElementDefinition asDataElement
]

{ #category : #parsing }
DicomObject >> pdvBytesStream: dicomPDVStream [
	"Parse data elements stored in the DICOM presentation data value
	 byte stream according to Dicom Part 8 => 9.3.5.1 Presentation Data
	 Value Item Structure - Paulo R. Dellani"

	self pdvBytesStream: dicomPDVStream encoder: LittleEndianImplicitVRTS
]

{ #category : #parsing }
DicomObject >> pdvBytesStream: dicomPDVStream encoder: aDicomTransferSyntaxEncoder [
	"Parse data elements stored in the DICOM presentation data value
	 byte stream according to Dicom Part 8 => 9.3.5.1 Presentation Data
	 Value Item Structure.

	 11 September 2017: Groups of private creator's data elements are dinamically
	                    loaded to the data elements definition of the DICOM object
	                    when a data element with a private creator's tag is found.
	                    This improves the parsing of private data elements stored
	                    in the PDV stream and handled by this method;
	      04 June 2021: Method refactored from into DicomObject>>handleParsedDataElement:
                       - Paulo R. Dellani"
 		
	| aDicomDataElement |
	self encoder: aDicomTransferSyntaxEncoder.
	self dataElementsDictionary: Dictionary new.
	[ dicomPDVStream atEnd ]
		whileFalse: [ aDicomDataElement := aDicomTransferSyntaxEncoder
				dataElementFrom: dicomPDVStream
				dataElementsDefinition: self dataElementsDefinition.

			"group lenght data elements are not used and DICOM Data Set Trailing Padding is ignored"
			aDicomDataElement elementNumber = 16r0000 | (aDicomDataElement groupNumber = 16rFFFC)
				ifFalse: [ self handleParsedDataElement: aDicomDataElement ] ]
]

{ #category : #'PDV Bytes' }
DicomObject >> presentationDataValueBytesArray [
	"Generate a byte array with the message fields enconded as in a PDV
	 (Presentation Data Value) - PRD 05.2001, 02.2002"

	| pdvStream |
	pdvStream := WriteStream on: ByteArray new.
	self writePDVBytesOn: pdvStream.
	^pdvStream contents
]

{ #category : #'computer reflection - private' }
DicomObject >> storeDataElementValue: aDataElementValue for: aDataElementName [
	| dataElement |
	(self dataElementsDictionary at: aDataElementName ifPresent: [ :aDataElement | aDataElement value: aDataElementValue ]) ifNil: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: aDataElementName.
			dataElement encoder: self encoder.
			dataElement value: aDataElementValue.
			self dataElementsDictionary at: aDataElementName put: dataElement.
			self dataElementsValues removeKey: aDataElementName ifAbsent: [ nil ].
		]
		ifFalse: [
			self dataElementsValues at: aDataElementName put: aDataElementValue
		]
	].

]

{ #category : #'parsing - private' }
DicomObject >> unknowDataElement: dataElementTag [

	| elementName |
	elementName := WriteStream on: String new.
	elementName nextPutAll: 'unknownDataElement['.
	(dataElementTag at: 1) printOn: elementName base: 16.
	elementName nextPutAll: ','.
	(dataElementTag at: 2) printOn: elementName base: 16.
	elementName nextPutAll: ']'.
	^UNDataElement
		newWith: elementName contents asSymbol
		tag: dataElementTag
		vm: '1'
		description: 'Unknown Data Element with tag equal to: '
				, dataElementTag printString
]

{ #category : #'PDV Bytes' }
DicomObject >> writePDVBytesOn: aByteStream [
	"Write all the Presentation Data Value of this object (the DICOM data elements
	byte codification) in the given ByteStream - PRD 05.2001, 02.2002, 09.2003"

	self dataElementsCollection do: [ :each | each pdvBytes: aByteStream ]
]

{ #category : #'PDV Bytes' }
DicomObject >> writePDVBytesOnExcludePrivate: aByteStream [
	"Write the Presentation Data Value (the DICOM data elements
	byte codification) of data elements defined in the this object,
	excluding the private defined ones, in the given ByteStream
	- PRD 05.2001, 02.2002, 09.2003, 10.2017"

	self dataElementsCollectionExcludePrivate do: [:each | each pdvBytes: aByteStream]
]
