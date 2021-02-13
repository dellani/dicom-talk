Class {
	#name : #ContentSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ContentSequenceItem class >> initialize [
	Name := 'Dicom Content Sequence Item'.
	SequenceName := 'contentSequenceItem'.
	self resetDataElements.
	"****************** Document Content Macro  - PS 3.3-2001 Table 17.3-5 *************************
	**************   Supplement 23 Table C.17.3-4: Document Relationship Macro **********************"
	self macroItemClassDataElements valuesDo: [ :aDataElement | self addDataElement: aDataElement ].
	self
		addDataElement:
			(CSDataElement
				newWith: #relationshipType
				tag: #(16r0040 16rA010)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #referencedContentItemIdentifier
				tag: #(16r0040 16rDB73)
				vm: '1-n'
				type: '1C')	"vm = 1-n"
]

{ #category : #'class initialization' }
ContentSequenceItem class >> macroItemClass [
	
	"****************** Document Content Macro  - PS 3.3-2001 Table 17.3-5 *************************"
	 ^DocumentContentMacroItem
]

{ #category : #'class initialization' }
ContentSequenceItem class >> macroItemClassDataElements [
	"****************** Document Content Macro  - PS 3.3-2001 Table 17.3-5 *************************
	**************   Supplement 23 Table C.17.3-4: Document Relationship Macro **********************"

	^ (DocumentRelationshipMacroItem initialize; DataElements) , (DocumentContentMacroItem initialize ; DataElements)
]

{ #category : #'accessing - talkDICOM names' }
ContentSequenceItem >> UID [

	^self dataElementsValues at: 'uID' ifAbsent: [
		self dataElementsDictionary at: 'uID' ifPresent: [:dataElement |
			self dataElementsValues at: 'uID' put: (self dataElementsDictionary removeKey: 'uID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentSequenceItem >> UID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'uID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #uID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'uID' put: dataElement.
			self dataElementsValues removeKey: 'uID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'uID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> conceptCodeSequence [

	^self dataElementsValues at: 'conceptCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptCodeSequence') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> conceptCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> conceptNameCodeSequence [

	^self dataElementsValues at: 'conceptNameCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'conceptNameCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'conceptNameCodeSequence' put: (self dataElementsDictionary removeKey: 'conceptNameCodeSequence') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> conceptNameCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'conceptNameCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conceptNameCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'conceptNameCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'conceptNameCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conceptNameCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> contentSequence [

	^self dataElementsValues at: 'contentSequence' ifAbsent: [
		self dataElementsDictionary at: 'contentSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentSequence' put: (self dataElementsDictionary removeKey: 'contentSequence') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> contentSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contentSequence' put: dataElement.
			self dataElementsValues removeKey: 'contentSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> contentTemplateSequence [

	^self dataElementsValues at: 'contentTemplateSequence' ifAbsent: [
		self dataElementsDictionary at: 'contentTemplateSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentTemplateSequence' put: (self dataElementsDictionary removeKey: 'contentTemplateSequence') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> contentTemplateSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentTemplateSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentTemplateSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'contentTemplateSequence' put: dataElement.
			self dataElementsValues removeKey: 'contentTemplateSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentTemplateSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> continuityOfContent [

	^self dataElementsValues at: 'continuityOfContent' ifAbsent: [
		self dataElementsDictionary at: 'continuityOfContent' ifPresent: [:dataElement |
			self dataElementsValues at: 'continuityOfContent' put: (self dataElementsDictionary removeKey: 'continuityOfContent') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> continuityOfContent: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'continuityOfContent' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #continuityOfContent.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'continuityOfContent' put: dataElement.
			self dataElementsValues removeKey: 'continuityOfContent' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'continuityOfContent' put: aCSValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> date [

	^self dataElementsValues at: 'date' ifAbsent: [
		self dataElementsDictionary at: 'date' ifPresent: [:dataElement |
			self dataElementsValues at: 'date' put: (self dataElementsDictionary removeKey: 'date') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> date: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'date' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #date.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'date' put: dataElement.
			self dataElementsValues removeKey: 'date' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'date' put: aDAValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> dateTime [

	^self dataElementsValues at: 'dateTime' ifAbsent: [
		self dataElementsDictionary at: 'dateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'dateTime' put: (self dataElementsDictionary removeKey: 'dateTime') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> dateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'dateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'dateTime' put: dataElement.
			self dataElementsValues removeKey: 'dateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> graphicData [

	^self dataElementsValues at: 'graphicData' ifAbsent: [
		self dataElementsDictionary at: 'graphicData' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicData' put: (self dataElementsDictionary removeKey: 'graphicData') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> graphicData: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicData' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicData.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'graphicData' put: dataElement.
			self dataElementsValues removeKey: 'graphicData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicData' put: aFLValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> graphicType [

	^self dataElementsValues at: 'graphicType' ifAbsent: [
		self dataElementsDictionary at: 'graphicType' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicType' put: (self dataElementsDictionary removeKey: 'graphicType') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> graphicType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'graphicType' put: dataElement.
			self dataElementsValues removeKey: 'graphicType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicType' put: aCSValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> measuredValueSequence [

	^self dataElementsValues at: 'measuredValueSequence' ifAbsent: [
		self dataElementsDictionary at: 'measuredValueSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'measuredValueSequence' put: (self dataElementsDictionary removeKey: 'measuredValueSequence') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> measuredValueSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'measuredValueSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #measuredValueSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'measuredValueSequence' put: dataElement.
			self dataElementsValues removeKey: 'measuredValueSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'measuredValueSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> observationDateTime [

	^self dataElementsValues at: 'observationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'observationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'observationDateTime' put: (self dataElementsDictionary removeKey: 'observationDateTime') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> observationDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'observationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #observationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'observationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'observationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'observationDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> personName [

	^self dataElementsValues at: 'personName' ifAbsent: [
		self dataElementsDictionary at: 'personName' ifPresent: [:dataElement |
			self dataElementsValues at: 'personName' put: (self dataElementsDictionary removeKey: 'personName') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> personName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'personName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #personName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'personName' put: dataElement.
			self dataElementsValues removeKey: 'personName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'personName' put: aPNValue
		]
	].

]

{ #category : #printing }
ContentSequenceItem >> printOn: aStream [

	aStream nextPutAll: (self valueType printString, '\',  (self textValue isNil ifTrue: [''] ifFalse: [' ', self textValue printString]), (self contentSequence isNil ifFalse: ['[...]'] ifTrue: [''])) withCRs.
]

{ #category : #accessing }
ContentSequenceItem >> referencedContentItemIdentifier [

	^self dataElementsValues at: 'referencedContentItemIdentifier' ifAbsent: [
		self dataElementsDictionary at: 'referencedContentItemIdentifier' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedContentItemIdentifier' put: (self dataElementsDictionary removeKey: 'referencedContentItemIdentifier') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> referencedContentItemIdentifier: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedContentItemIdentifier' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedContentItemIdentifier.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'referencedContentItemIdentifier' put: dataElement.
			self dataElementsValues removeKey: 'referencedContentItemIdentifier' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedContentItemIdentifier' put: aULValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> referencedDateTime [

	^self dataElementsValues at: 'referencedDateTime' ifAbsent: [
		self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedDateTime' put: (self dataElementsDictionary removeKey: 'referencedDateTime') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> referencedDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'referencedDateTime' put: dataElement.
			self dataElementsValues removeKey: 'referencedDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedDateTime' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ContentSequenceItem >> referencedDatetime [

	^self dataElementsValues at: 'referencedDateTime' ifAbsent: [
		self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedDateTime' put: (self dataElementsDictionary removeKey: 'referencedDateTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ContentSequenceItem >> referencedDatetime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'referencedDateTime' put: dataElement.
			self dataElementsValues removeKey: 'referencedDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> referencedSOPSequence [

	^self dataElementsValues at: 'referencedSOPSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPSequence' put: (self dataElementsDictionary removeKey: 'referencedSOPSequence') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> referencedSOPSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedSOPSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> referencedSamplePositions [

	^self dataElementsValues at: 'referencedSamplePositions' ifAbsent: [
		self dataElementsDictionary at: 'referencedSamplePositions' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSamplePositions' put: (self dataElementsDictionary removeKey: 'referencedSamplePositions') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> referencedSamplePositions: aULValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSamplePositions' ifPresent: [:aDataElement | aDataElement value: aULValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSamplePositions.
			dataElement encoder: self encoder.
			dataElement value: aULValue.
			self dataElementsDictionary at: 'referencedSamplePositions' put: dataElement.
			self dataElementsValues removeKey: 'referencedSamplePositions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSamplePositions' put: aULValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> referencedTimeOffsets [

	^self dataElementsValues at: 'referencedTimeOffsets' ifAbsent: [
		self dataElementsDictionary at: 'referencedTimeOffsets' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedTimeOffsets' put: (self dataElementsDictionary removeKey: 'referencedTimeOffsets') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> referencedTimeOffsets: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedTimeOffsets' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedTimeOffsets.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'referencedTimeOffsets' put: dataElement.
			self dataElementsValues removeKey: 'referencedTimeOffsets' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedTimeOffsets' put: aDSValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> relationshipType [

	^self dataElementsValues at: 'relationshipType' ifAbsent: [
		self dataElementsDictionary at: 'relationshipType' ifPresent: [:dataElement |
			self dataElementsValues at: 'relationshipType' put: (self dataElementsDictionary removeKey: 'relationshipType') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> relationshipType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'relationshipType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #relationshipType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'relationshipType' put: dataElement.
			self dataElementsValues removeKey: 'relationshipType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'relationshipType' put: aCSValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> temporalRangeType [

	^self dataElementsValues at: 'temporalRangeType' ifAbsent: [
		self dataElementsDictionary at: 'temporalRangeType' ifPresent: [:dataElement |
			self dataElementsValues at: 'temporalRangeType' put: (self dataElementsDictionary removeKey: 'temporalRangeType') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> temporalRangeType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'temporalRangeType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #temporalRangeType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'temporalRangeType' put: dataElement.
			self dataElementsValues removeKey: 'temporalRangeType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'temporalRangeType' put: aCSValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> textValue [

	^self dataElementsValues at: 'textValue' ifAbsent: [
		self dataElementsDictionary at: 'textValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'textValue' put: (self dataElementsDictionary removeKey: 'textValue') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> textValue: aUTValue [

	| dataElement |

	(self dataElementsDictionary at: 'textValue' ifPresent: [:aDataElement | aDataElement value: aUTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #textValue.
			dataElement encoder: self encoder.
			dataElement value: aUTValue.
			self dataElementsDictionary at: 'textValue' put: dataElement.
			self dataElementsValues removeKey: 'textValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'textValue' put: aUTValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> time [

	^self dataElementsValues at: 'time' ifAbsent: [
		self dataElementsDictionary at: 'time' ifPresent: [:dataElement |
			self dataElementsValues at: 'time' put: (self dataElementsDictionary removeKey: 'time') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> time: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'time' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #time.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'time' put: dataElement.
			self dataElementsValues removeKey: 'time' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'time' put: aTMValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> uID [

	^self dataElementsValues at: 'uID' ifAbsent: [
		self dataElementsDictionary at: 'uID' ifPresent: [:dataElement |
			self dataElementsValues at: 'uID' put: (self dataElementsDictionary removeKey: 'uID') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> uID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'uID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #uID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'uID' put: dataElement.
			self dataElementsValues removeKey: 'uID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'uID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ContentSequenceItem >> valueType [

	^self dataElementsValues at: 'valueType' ifAbsent: [
		self dataElementsDictionary at: 'valueType' ifPresent: [:dataElement |
			self dataElementsValues at: 'valueType' put: (self dataElementsDictionary removeKey: 'valueType') value.
		]
	]

]

{ #category : #accessing }
ContentSequenceItem >> valueType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'valueType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #valueType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'valueType' put: dataElement.
			self dataElementsValues removeKey: 'valueType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'valueType' put: aCSValue
		]
	].

]
