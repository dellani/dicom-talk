Class {
	#name : #VerifyingObserverIdentificationCodeSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
VerifyingObserverIdentificationCodeSequenceItem class >> initialize [
	Name := 'DICOM Verifying Observer Identification Code Sequence Item'.
	SequenceName := 'verifyingObserverIdentificationCodeSequenceItem'.
	self resetDataElements.
	self initializeSequenceDataElementTag: #(16r0040 16rA088).

	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ]
]

{ #category : #'class initialization' }
VerifyingObserverIdentificationCodeSequenceItem class >> macroItemClass [
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"

	^ OrderedCollection with: CodeSequenceMacroItem
]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> codeMeaning [

	^self dataElementsValues at: 'codeMeaning' ifAbsent: [
		self dataElementsDictionary at: 'codeMeaning' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeMeaning' put: (self dataElementsDictionary removeKey: 'codeMeaning') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> codeMeaning: aLOValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> codeSetExtensionFlag [

	^self dataElementsValues at: 'contextGroupExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupExtensionFlag' put: (self dataElementsDictionary removeKey: 'contextGroupExtensionFlag') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VerifyingObserverIdentificationCodeSequenceItem >> codeSetExtensionFlag: aCSValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> codeValue [

	^self dataElementsValues at: 'codeValue' ifAbsent: [
		self dataElementsDictionary at: 'codeValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeValue' put: (self dataElementsDictionary removeKey: 'codeValue') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> codeValue: aSHValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> codingMeaning [

	^self dataElementsValues at: 'codeMeaning' ifAbsent: [
		self dataElementsDictionary at: 'codeMeaning' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeMeaning' put: (self dataElementsDictionary removeKey: 'codeMeaning') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
VerifyingObserverIdentificationCodeSequenceItem >> codingMeaning: aLOValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> codingSchemeDesignator [

	^self dataElementsValues at: 'codingSchemeDesignator' ifAbsent: [
		self dataElementsDictionary at: 'codingSchemeDesignator' ifPresent: [:dataElement |
			self dataElementsValues at: 'codingSchemeDesignator' put: (self dataElementsDictionary removeKey: 'codingSchemeDesignator') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> codingSchemeDesignator: aSHValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> codingSchemeVersion [

	^self dataElementsValues at: 'codingSchemeVersion' ifAbsent: [
		self dataElementsDictionary at: 'codingSchemeVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'codingSchemeVersion' put: (self dataElementsDictionary removeKey: 'codingSchemeVersion') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> codingSchemeVersion: aSHValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> contextGroupExtensionFlag [

	^self dataElementsValues at: 'contextGroupExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupExtensionFlag' put: (self dataElementsDictionary removeKey: 'contextGroupExtensionFlag') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> contextGroupExtensionFlag: aCSValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> contextGroupLocalVersion [

	^self dataElementsValues at: 'contextGroupLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupLocalVersion' put: (self dataElementsDictionary removeKey: 'contextGroupLocalVersion') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> contextGroupLocalVersion: aDTValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> contextGroupVersion [

	^self dataElementsValues at: 'contextGroupVersion' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupVersion' put: (self dataElementsDictionary removeKey: 'contextGroupVersion') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> contextGroupVersion: aDTValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> contextIdentifier [

	^self dataElementsValues at: 'contextIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'contextIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextIdentifier' put: (self dataElementsDictionary removeKey: 'contextIdentifier') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> contextIdentifier: aCSValue [

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
VerifyingObserverIdentificationCodeSequenceItem >> mappingResource [

	^self dataElementsValues at: 'mappingResource' ifAbsent: [
		self dataElementsDictionary at: 'mappingResource' ifPresent: [:dataElement |
			self dataElementsValues at: 'mappingResource' put: (self dataElementsDictionary removeKey: 'mappingResource') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverIdentificationCodeSequenceItem >> mappingResource: aCSValue [

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
