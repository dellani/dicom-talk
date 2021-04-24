Class {
	#name : #ContentTemplateSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ContentTemplateSequenceItem class >> initialize [
	"DICOM Content Template Sequence Item - initialization method

	RC MS - Jan 24th, 2002
	DICOM Structured Reporting"

	Name := 'DICOM Content Template Sequence Item'.
	SequenceName := 'contentTemplateSequenceItem'.
	self initializeSequenceDataElementTag: #(16r0040 16rA504).

	self resetDataElements.
	"****************** Document Relationship Macro Attributes - Supplement 23, 2000 - Table C.17.3-4 *************************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ]
]

{ #category : #'class initialization' }
ContentTemplateSequenceItem class >> macroItemClass [
	"****************** Document Relationship Macro Attributes - Supplement 23, 2000 - Table C.17.3-4 *************************"

	^ OrderedCollection with: TemplateIdentificationMacroItem
]

{ #category : #accessing }
ContentTemplateSequenceItem >> mappingResource [

	^self dataElementsValues at: 'mappingResource' ifAbsent: [
		self dataElementsDictionary at: 'mappingResource' ifPresent: [:dataElement |
			self dataElementsValues at: 'mappingResource' put: (self dataElementsDictionary removeKey: 'mappingResource') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> mappingResource: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'mappingResource' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #mappingResource.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'mappingResource' put: dataElement.
			self dataElementsValues removeKey: 'mappingResource' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'mappingResource' put: aCSValue
		]
	].

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateExtensionCreatorUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionCreatorUID') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateExtensionCreatorUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateExtensionCreatorUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateExtensionCreatorUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateExtensionFlag [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionFlag') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateExtensionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateExtensionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateExtensionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateExtensionOrganizationUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionOrganizationUID') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateExtensionOrganizationUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateExtensionOrganizationUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateExtensionOrganizationUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateLocalVersion [

	^self dataElementsValues at: 'rETIRED_TemplateLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateLocalVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateLocalVersion') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateLocalVersion: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateLocalVersion.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateLocalVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateLocalVersion' put: aDTValue
		]
	].

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateVersion [

	^self dataElementsValues at: 'rETIRED_TemplateVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateVersion') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> rETIRED_TemplateVersion: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateVersion' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateVersion.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'rETIRED_TemplateVersion' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateVersion' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateExtensionCreatorUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionCreatorUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateExtensionCreatorUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateExtensionCreatorUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateExtensionCreatorUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' put: aUIValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateExtensionFlag [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionFlag') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateExtensionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateExtensionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateExtensionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateExtensionOrganizationUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionOrganizationUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateExtensionOrganizationUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateExtensionOrganizationUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateExtensionOrganizationUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ContentTemplateSequenceItem >> templateIdentifier [

	^self dataElementsValues at: 'templateIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'templateIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'templateIdentifier' put: (self dataElementsDictionary removeKey: 'templateIdentifier') value.
		]
	]

]

{ #category : #accessing }
ContentTemplateSequenceItem >> templateIdentifier: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'templateIdentifier' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #templateIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'templateIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'templateIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'templateIdentifier' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateLocalVersion [

	^self dataElementsValues at: 'rETIRED_TemplateLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateLocalVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateLocalVersion') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateLocalVersion: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateLocalVersion.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateLocalVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateLocalVersion' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateVersion [

	^self dataElementsValues at: 'rETIRED_TemplateVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateVersion') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentTemplateSequenceItem >> templateVersion: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_TemplateVersion' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_TemplateVersion.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'rETIRED_TemplateVersion' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_TemplateVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_TemplateVersion' put: aDTValue
		]
	].

]
