Class {
	#name : #FileSetIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
FileSetIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM File-Set Information Object Module
	PS 3.3-2001 Annex F Part 3 - PRD 08.2002"

	self resetDataElements.
	Name := 'DICOM File-set Information Object Module'.
	moduleName := 'fileSetIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #fileSetID
				tag: #(16r0004 16r1130)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #fileSetDescriptorFileID
				tag: #(16r0004 16r1141)
				vm: '1-8'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #specificCharacterSetOfFileSetDescriptorFile
				tag: #(16r0004 16r1142)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
FileSetIOM >> fileSetDescriptorFileID [

	^self dataElementsValues at: 'fileSetDescriptorFileID' ifAbsent: [
		self dataElementsDictionary at: 'fileSetDescriptorFileID' ifPresent: [:dataElement |
			self dataElementsValues at: 'fileSetDescriptorFileID' put: (self dataElementsDictionary removeKey: 'fileSetDescriptorFileID') value.
		]
	]

]

{ #category : #accessing }
FileSetIOM >> fileSetDescriptorFileID: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'fileSetDescriptorFileID' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fileSetDescriptorFileID.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'fileSetDescriptorFileID' put: dataElement.
			self dataElementsValues removeKey: 'fileSetDescriptorFileID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fileSetDescriptorFileID' put: aCSValue
		]
	].

]

{ #category : #accessing }
FileSetIOM >> fileSetID [

	^self dataElementsValues at: 'fileSetID' ifAbsent: [
		self dataElementsDictionary at: 'fileSetID' ifPresent: [:dataElement |
			self dataElementsValues at: 'fileSetID' put: (self dataElementsDictionary removeKey: 'fileSetID') value.
		]
	]

]

{ #category : #accessing }
FileSetIOM >> fileSetID: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'fileSetID' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fileSetID.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'fileSetID' put: dataElement.
			self dataElementsValues removeKey: 'fileSetID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fileSetID' put: aCSValue
		]
	].

]

{ #category : #accessing }
FileSetIOM >> specificCharacterSetOfFileSetDescriptorFile [

	^self dataElementsValues at: 'specificCharacterSetOfFileSetDescriptorFile' ifAbsent: [
		self dataElementsDictionary at: 'specificCharacterSetOfFileSetDescriptorFile' ifPresent: [:dataElement |
			self dataElementsValues at: 'specificCharacterSetOfFileSetDescriptorFile' put: (self dataElementsDictionary removeKey: 'specificCharacterSetOfFileSetDescriptorFile') value.
		]
	]

]

{ #category : #accessing }
FileSetIOM >> specificCharacterSetOfFileSetDescriptorFile: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'specificCharacterSetOfFileSetDescriptorFile' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #specificCharacterSetOfFileSetDescriptorFile.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'specificCharacterSetOfFileSetDescriptorFile' put: dataElement.
			self dataElementsValues removeKey: 'specificCharacterSetOfFileSetDescriptorFile' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'specificCharacterSetOfFileSetDescriptorFile' put: aCSValue
		]
	].

]
