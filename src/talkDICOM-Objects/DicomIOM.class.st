Class {
	#name : #DicomIOM,
	#superclass : #DicomObject,
	#classInstVars : [
		'moduleName',
		'Name'
	],
	#category : #'talkDICOM-Objects'
}

{ #category : #accessing }
DicomIOM class >> Name [
	"Answer the name of the Information Object Module. To be used by <instantiators>. 
	See the parseIOD method in DicomIOD - PRD 06.2001"

	^Name.
]

{ #category : #'class initialization' }
DicomIOM class >> initialize [

	super initialize.
	moduleName := 'dicomIOM'.
	Name := 'Dicom IOM'
]

{ #category : #accessing }
DicomIOM class >> moduleName [
	"Answer the name of the Information Object Module. To be used by 
	<instantiators>.  See the parseIOD method in DicomIOD - PRD 06.2001"

	^moduleName.
]

{ #category : #checking }
DicomIOM >> checkIOM [
	"Do some basic checking in the IOM data 

	PRD 01.2002"

	^true.
]

{ #category : #copying }
DicomIOM >> copyFrom: aDicomObject [
	"Copy all the data element from the given DICOM Object to self.

	PRD - April 2th, 2004"

	aDicomObject copyTo: self.
]

{ #category : #copying }
DicomIOM >> copyTo: aDicomObject [
	"Copy all the data element values to the given DICOM Object.
	Note that both objects should be from the same class

	PRD - March 18th, 2004, March 10th, 2016"

	| value |

	(aDicomObject isKindOf: self class) ifTrue: [
		self dataElementsDefinition do: [:dataElementDefinition | 
			value := self perform: dataElementDefinition name.
			aDicomObject perform: (dataElementDefinition name asString copyWith: $:) asSymbol with: value.
		].
	]
]
