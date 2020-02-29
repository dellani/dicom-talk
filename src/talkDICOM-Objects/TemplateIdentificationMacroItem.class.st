Class {
	#name : #TemplateIdentificationMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
TemplateIdentificationMacroItem class >> initialize [
	"DICOM Code Sequence Macro Item - initialization method

	PRD, RC, MS - Jan 24th, 2002
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Template Identification Macro Item'.
	SequenceName := 'templateIdentificationMacroItem'.
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	self
		addDataElement:
			(CSDataElement
				newWith: #templateIdentifier
				tag: #(16r0040 16rDB00)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #mappingResource
				tag: #(16r0008 16r0105)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DTDataElement
				newWith: #templateVersion
				tag: #(16r0040 16rDB06)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DTDataElement
				newWith: #templateLocalVersion
				tag: #(16r0040 16rDB07)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(CSDataElement
				newWith: #templateExtensionFlag
				tag: #(16r0040 16rDB0B)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #templateExtensionOrganizationUID
				tag: #(16r0040 16rDB0C)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(UIDataElement
				newWith: #templateExtensionCreatorUID
				tag: #(16r0040 16rDB0D)
				vm: '1'
				type: '2C')
]

{ #category : #accessing }
TemplateIdentificationMacroItem >> mappingResource [

	^self dataElementsValues at: 'mappingResource' ifAbsent: [
		self dataElementsDictionary at: 'mappingResource' ifPresent: [:dataElement |
			self dataElementsValues at: 'mappingResource' put: (self dataElementsDictionary removeKey: 'mappingResource') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> mappingResource: aCSValue [

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
TemplateIdentificationMacroItem >> rETIRED_TemplateExtensionCreatorUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionCreatorUID') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> rETIRED_TemplateExtensionCreatorUID: aUIValue [

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
TemplateIdentificationMacroItem >> rETIRED_TemplateExtensionFlag [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionFlag') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> rETIRED_TemplateExtensionFlag: aCSValue [

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
TemplateIdentificationMacroItem >> rETIRED_TemplateExtensionOrganizationUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionOrganizationUID') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> rETIRED_TemplateExtensionOrganizationUID: aUIValue [

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
TemplateIdentificationMacroItem >> rETIRED_TemplateLocalVersion [

	^self dataElementsValues at: 'rETIRED_TemplateLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateLocalVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateLocalVersion') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> rETIRED_TemplateLocalVersion: aDTValue [

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
TemplateIdentificationMacroItem >> rETIRED_TemplateVersion [

	^self dataElementsValues at: 'rETIRED_TemplateVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateVersion') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> rETIRED_TemplateVersion: aDTValue [

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
TemplateIdentificationMacroItem >> templateExtensionCreatorUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionCreatorUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionCreatorUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TemplateIdentificationMacroItem >> templateExtensionCreatorUID: aUIValue [

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
TemplateIdentificationMacroItem >> templateExtensionFlag [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionFlag' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionFlag') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TemplateIdentificationMacroItem >> templateExtensionFlag: aCSValue [

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
TemplateIdentificationMacroItem >> templateExtensionOrganizationUID [

	^self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateExtensionOrganizationUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateExtensionOrganizationUID' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateExtensionOrganizationUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TemplateIdentificationMacroItem >> templateExtensionOrganizationUID: aUIValue [

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
TemplateIdentificationMacroItem >> templateIdentifier [

	^self dataElementsValues at: 'templateIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'templateIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'templateIdentifier' put: (self dataElementsDictionary removeKey: 'templateIdentifier') value.
		]
	]

]

{ #category : #accessing }
TemplateIdentificationMacroItem >> templateIdentifier: aCSValue [

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
TemplateIdentificationMacroItem >> templateLocalVersion [

	^self dataElementsValues at: 'rETIRED_TemplateLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateLocalVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateLocalVersion') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TemplateIdentificationMacroItem >> templateLocalVersion: aDTValue [

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
TemplateIdentificationMacroItem >> templateVersion [

	^self dataElementsValues at: 'rETIRED_TemplateVersion' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_TemplateVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_TemplateVersion' put: (self dataElementsDictionary removeKey: 'rETIRED_TemplateVersion') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TemplateIdentificationMacroItem >> templateVersion: aDTValue [

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
