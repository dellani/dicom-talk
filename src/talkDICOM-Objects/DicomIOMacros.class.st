Class {
	#name : #DicomIOMacros,
	#superclass : #DicomObject,
	#classInstVars : [
		'description',
		'macroName'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #'computer reflection 2021' }
DicomIOMacros class >> addIOMacroTextualDescriptionMethods [
	"Compile a method that returns the textual attributes definition of my 
	 subclasses to myself. The method is coded by 
	 computerReflection_IOMacroTextualDataElementsDefinitionMethod: 
	 and added to protocol 'textual attributes definition'.
	
	 (Computer reflection is way cool!)

	 24 May 2021 - Paulo R. Dellani"

	self subclassesDo: [ : aDicomIOMacroSubclass | | method |
		method := self computerReflection_IOMacroTextualDataElementsDefinitionMethod: aDicomIOMacroSubclass.
		MethodAddition new
			compile: method contents
			classified: 'textual attributes definition'
			withStamp: DateAndTime now printString
			notifying: nil 
			logSource: true
			"This is a class method, so refer to my metaclass"
			inClass: self class;
		compile. ]
]

{ #category : #'computer reflection 2021' }
DicomIOMacros class >> computerReflection_IOMacroTextualDataElementsDefinitionMethod: aDicomIOMacroSubclass [
	"Code textual data element definition method for aDicomIOMacroSubclass according
	 to the contents of class variable 'DataElements'. DataElements is a Dictionary
	 holding instances of DataElement indexed by its tags that were used to define
	 DicomObject instances in the past.
	
	 May 24  2021 - This is an adaptation of 
	                DicomIOM>computerReflection_IOMTextualDataElementsDefinitionMethod: - PRD."

	^ String
		new: 10
		streamContents: [ :writeStream | 
			writeStream
				nextPutAll: aDicomIOMacroSubclass macroName; 
				nextPutAll: 'TextualDataElementsDefinition'; cr;
				tab; nextPut: $"; 	nextPutAll: 'Textual data element definition for '; 
				                  nextPutAll: aDicomIOMacroSubclass description; cr; cr;
				tab; nextPutAll: ' Coder: DicomIOMacro>computerReflection_IOMacroTextualDataElementsDefinitionMethod:'; cr; cr;
				tab; nextPut: $ ; nextPutAll: DateAndTime now printString; nextPutAll: ' - Computer Reflection'; nextPut: $"; cr; cr;

				tab; nextPutAll: '^ ByteString'; cr;
				tab; tab; nextPutAll: 'new: 10'; cr;
				tab; tab; nextPutAll: 'streamContents: [ :aStream |'; cr;

				tab; tab; tab; nextPutAll: 'aStream'; cr;
				tab; tab; tab; tab; nextPutAll: 'nextPutAll:'; cr; nextPutAll: '''# ';
					                 nextPutAll: aDicomIOMacroSubclass description; cr;
				nextPutAll: aDicomIOMacroSubclass listDataElementDefinition; nextPut: $'; nextPutAll: ' ]'; cr. ].
]

{ #category : #accessing }
DicomIOMacros class >> description [
	^ description
]

{ #category : #accessing }
DicomIOMacros class >> macroName [
	^ macroName
]
