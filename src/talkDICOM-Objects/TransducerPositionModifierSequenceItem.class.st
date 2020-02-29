Class {
	#name : #TransducerPositionModifierSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
TransducerPositionModifierSequenceItem class >> initialize [
	"DICOM Transducer Position Modifier Sequence Item

	PRD 05.2002 - 02.2017"

	Name := 'DICOM Transducer Position Modifier Sequence Item'.
	SequenceName := 'transducerPositionModifierSequenceItem'.
	self resetDataElements.
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ]
]

{ #category : #'class initialization' }
TransducerPositionModifierSequenceItem class >> macroItemClass [
	
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	 ^CodeSequenceMacroItem
]

{ #category : #'class initialization' }
TransducerPositionModifierSequenceItem class >> macroItemClassDataElements [
	
	"****************** Code Sequence Macro - PS 3.3-2000 Table 8.8-1 *************************"
	 ^self macroItemClass DataElements
]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> codeMeaning [

	^self dataElementsValues at: 'codeMeaning' ifAbsent: [
		self dataElementsDictionary at: 'codeMeaning' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeMeaning' put: (self dataElementsDictionary removeKey: 'codeMeaning') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> codeMeaning: aLOValue [

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
TransducerPositionModifierSequenceItem >> codeSetExtensionFlag [

	^self dataElementsValues at: 'contextGroupExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupExtensionFlag' put: (self dataElementsDictionary removeKey: 'contextGroupExtensionFlag') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TransducerPositionModifierSequenceItem >> codeSetExtensionFlag: aCSValue [

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
TransducerPositionModifierSequenceItem >> codeValue [

	^self dataElementsValues at: 'codeValue' ifAbsent: [
		self dataElementsDictionary at: 'codeValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeValue' put: (self dataElementsDictionary removeKey: 'codeValue') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> codeValue: aSHValue [

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
TransducerPositionModifierSequenceItem >> codingMeaning [

	^self dataElementsValues at: 'codeMeaning' ifAbsent: [
		self dataElementsDictionary at: 'codeMeaning' ifPresent: [:dataElement |
			self dataElementsValues at: 'codeMeaning' put: (self dataElementsDictionary removeKey: 'codeMeaning') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TransducerPositionModifierSequenceItem >> codingMeaning: aLOValue [

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
TransducerPositionModifierSequenceItem >> codingSchemeDesignator [

	^self dataElementsValues at: 'codingSchemeDesignator' ifAbsent: [
		self dataElementsDictionary at: 'codingSchemeDesignator' ifPresent: [:dataElement |
			self dataElementsValues at: 'codingSchemeDesignator' put: (self dataElementsDictionary removeKey: 'codingSchemeDesignator') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> codingSchemeDesignator: aSHValue [

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
TransducerPositionModifierSequenceItem >> codingSchemeVersion [

	^self dataElementsValues at: 'codingSchemeVersion' ifAbsent: [
		self dataElementsDictionary at: 'codingSchemeVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'codingSchemeVersion' put: (self dataElementsDictionary removeKey: 'codingSchemeVersion') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> codingSchemeVersion: aSHValue [

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
TransducerPositionModifierSequenceItem >> contextGroupExtensionFlag [

	^self dataElementsValues at: 'contextGroupExtensionFlag' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupExtensionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupExtensionFlag' put: (self dataElementsDictionary removeKey: 'contextGroupExtensionFlag') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> contextGroupExtensionFlag: aCSValue [

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
TransducerPositionModifierSequenceItem >> contextGroupLocalVersion [

	^self dataElementsValues at: 'contextGroupLocalVersion' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupLocalVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupLocalVersion' put: (self dataElementsDictionary removeKey: 'contextGroupLocalVersion') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> contextGroupLocalVersion: aDTValue [

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
TransducerPositionModifierSequenceItem >> contextGroupVersion [

	^self dataElementsValues at: 'contextGroupVersion' ifAbsent: [
		self dataElementsDictionary at: 'contextGroupVersion' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextGroupVersion' put: (self dataElementsDictionary removeKey: 'contextGroupVersion') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> contextGroupVersion: aDTValue [

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
TransducerPositionModifierSequenceItem >> contextIdentifier [

	^self dataElementsValues at: 'contextIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'contextIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'contextIdentifier' put: (self dataElementsDictionary removeKey: 'contextIdentifier') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> contextIdentifier: aCSValue [

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
TransducerPositionModifierSequenceItem >> mappingResource [

	^self dataElementsValues at: 'mappingResource' ifAbsent: [
		self dataElementsDictionary at: 'mappingResource' ifPresent: [:dataElement |
			self dataElementsValues at: 'mappingResource' put: (self dataElementsDictionary removeKey: 'mappingResource') value.
		]
	]

]

{ #category : #accessing }
TransducerPositionModifierSequenceItem >> mappingResource: aCSValue [

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
