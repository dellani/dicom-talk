Class {
	#name : #VOILUTSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
VOILUTSequenceItem class >> initialize [
	Name := 'DICOM VOI LUT Sequence Item'.
	SequenceName := 'voiLUTSequenceItem'.
	self resetDataElements.
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ].
	self
		addDataElement:
			(SSDataElement
				newWith: #lutDescriptor
				tag: #(16r0028 16r3002)
				vm: '3'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #lutExplanation
				tag: #(16r0028 16r3003)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(OWDataElement
				newWith: #lutData
				tag: #(16r0028 16r3006)
				vm: '1-n'
				type: '1C')
]

{ #category : #'class initialization' }
VOILUTSequenceItem class >> macroItemClass [
	
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	 ^CodeSequenceMacroItem
]

{ #category : #'class initialization' }
VOILUTSequenceItem class >> macroItemClassDataElements [
	
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	 ^self macroItemClass DataElements
]

{ #category : #accessing }
VOILUTSequenceItem >> codeMeaning [

	^self dataElementsValues at: 'codeMeaning' ifAbsent: [
		self dataElementsDictionary at: 'codeMeaning' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeMeaning' put: (self dataElementsDictionary removeKey: 'codeMeaning') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> codeMeaning: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'codeMeaning' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #codeMeaning.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'codeMeaning' put: dataElement.
			self dataElementsValues removeKey: 'codeMeaning' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'codeMeaning' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> codeSetExtensionFlag [

	^self dataElementsValues at: 'contextGroupExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupExtensionFlag' put: (self dataElementsDictionary removeKey: 'contextGroupExtensionFlag') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> codeSetExtensionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contextGroupExtensionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'contextGroupExtensionFlag' put: dataElement.
			self dataElementsValues removeKey: 'contextGroupExtensionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contextGroupExtensionFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> codeValue [

	^self dataElementsValues at: 'codeValue' ifAbsent: [
		self dataElementsDictionary at: 'codeValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeValue' put: (self dataElementsDictionary removeKey: 'codeValue') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> codeValue: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'codeValue' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #codeValue.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'codeValue' put: dataElement.
			self dataElementsValues removeKey: 'codeValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'codeValue' put: aSHValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> codingMeaning [

	^self dataElementsValues at: 'codeMeaning' ifAbsent: [
		self dataElementsDictionary at: 'codeMeaning' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeMeaning' put: (self dataElementsDictionary removeKey: 'codeMeaning') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> codingMeaning: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'codeMeaning' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #codeMeaning.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'codeMeaning' put: dataElement.
			self dataElementsValues removeKey: 'codeMeaning' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'codeMeaning' put: aLOValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> codingSchemeDesignator [

	^self dataElementsValues at: 'codingSchemeDesignator' ifAbsent: [
		self dataElementsDictionary at: 'codingSchemeDesignator' ifPresent: [:dataElement |
			self dataElementsValues at: 'codingSchemeDesignator' put: (self dataElementsDictionary removeKey: 'codingSchemeDesignator') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> codingSchemeDesignator: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'codingSchemeDesignator' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #codingSchemeDesignator.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'codingSchemeDesignator' put: dataElement.
			self dataElementsValues removeKey: 'codingSchemeDesignator' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'codingSchemeDesignator' put: aSHValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> codingSchemeVersion [

	^self dataElementsValues at: 'codingSchemeVersion' ifAbsent: [
		self dataElementsDictionary at: 'codingSchemeVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'codingSchemeVersion' put: (self dataElementsDictionary removeKey: 'codingSchemeVersion') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> codingSchemeVersion: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'codingSchemeVersion' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #codingSchemeVersion.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'codingSchemeVersion' put: dataElement.
			self dataElementsValues removeKey: 'codingSchemeVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'codingSchemeVersion' put: aSHValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> contextGroupExtensionFlag [

	^self dataElementsValues at: 'contextGroupExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupExtensionFlag' put: (self dataElementsDictionary removeKey: 'contextGroupExtensionFlag') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> contextGroupExtensionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contextGroupExtensionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'contextGroupExtensionFlag' put: dataElement.
			self dataElementsValues removeKey: 'contextGroupExtensionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contextGroupExtensionFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> contextGroupLocalVersion [

	^self dataElementsValues at: 'contextGroupLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupLocalVersion' put: (self dataElementsDictionary removeKey: 'contextGroupLocalVersion') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> contextGroupLocalVersion: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'contextGroupLocalVersion' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contextGroupLocalVersion.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'contextGroupLocalVersion' put: dataElement.
			self dataElementsValues removeKey: 'contextGroupLocalVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contextGroupLocalVersion' put: aDTValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> contextGroupVersion [

	^self dataElementsValues at: 'contextGroupVersion' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupVersion' put: (self dataElementsDictionary removeKey: 'contextGroupVersion') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> contextGroupVersion: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'contextGroupVersion' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contextGroupVersion.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'contextGroupVersion' put: dataElement.
			self dataElementsValues removeKey: 'contextGroupVersion' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contextGroupVersion' put: aDTValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> contextIdentifier [

	^self dataElementsValues at: 'contextIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'contextIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextIdentifier' put: (self dataElementsDictionary removeKey: 'contextIdentifier') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> contextIdentifier: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'contextIdentifier' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contextIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'contextIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'contextIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contextIdentifier' put: aCSValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> lUTData [

	^self dataElementsValues at: 'lUTData' ifAbsent: [
		self dataElementsDictionary at: 'lUTData' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTData' put: (self dataElementsDictionary removeKey: 'lUTData') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> lUTData: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTData' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTData.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'lUTData' put: dataElement.
			self dataElementsValues removeKey: 'lUTData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTData' put: aLTValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> lUTDescriptor [

	^self dataElementsValues at: 'lUTDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTDescriptor' put: (self dataElementsDictionary removeKey: 'lUTDescriptor') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> lUTDescriptor: aUNValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:aDataElement | aDataElement value: aUNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aUNValue.
			self dataElementsDictionary at: 'lUTDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'lUTDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTDescriptor' put: aUNValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> lUTExplanation [

	^self dataElementsValues at: 'lUTExplanation' ifAbsent: [
		self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTExplanation' put: (self dataElementsDictionary removeKey: 'lUTExplanation') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> lUTExplanation: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTExplanation.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'lUTExplanation' put: dataElement.
			self dataElementsValues removeKey: 'lUTExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTExplanation' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> lutData [

	^self dataElementsValues at: 'lUTData' ifAbsent: [
		self dataElementsDictionary at: 'lUTData' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTData' put: (self dataElementsDictionary removeKey: 'lUTData') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> lutData: aOWValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTData' ifPresent: [:aDataElement | aDataElement value: aOWValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTData.
			dataElement encoder: self encoder.
			dataElement value: aOWValue.
			self dataElementsDictionary at: 'lUTData' put: dataElement.
			self dataElementsValues removeKey: 'lUTData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTData' put: aOWValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> lutDescriptor [

	^self dataElementsValues at: 'lUTDescriptor' ifAbsent: [
		self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTDescriptor' put: (self dataElementsDictionary removeKey: 'lUTDescriptor') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> lutDescriptor: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTDescriptor' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTDescriptor.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'lUTDescriptor' put: dataElement.
			self dataElementsValues removeKey: 'lUTDescriptor' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTDescriptor' put: aSSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> lutExplanation [

	^self dataElementsValues at: 'lUTExplanation' ifAbsent: [
		self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:dataElement |
			self dataElementsValues at: 'lUTExplanation' put: (self dataElementsDictionary removeKey: 'lUTExplanation') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VOILUTSequenceItem >> lutExplanation: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'lUTExplanation' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lUTExplanation.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'lUTExplanation' put: dataElement.
			self dataElementsValues removeKey: 'lUTExplanation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lUTExplanation' put: aLOValue
		]
	].

]

{ #category : #accessing }
VOILUTSequenceItem >> mappingResource [

	^self dataElementsValues at: 'mappingResource' ifAbsent: [
		self dataElementsDictionary at: 'mappingResource' ifPresent: [:dataElement |
			self dataElementsValues at: 'mappingResource' put: (self dataElementsDictionary removeKey: 'mappingResource') value.
		]
	]

]

{ #category : #accessing }
VOILUTSequenceItem >> mappingResource: aCSValue [

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
