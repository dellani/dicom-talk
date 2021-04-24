Class {
	#name : #SRDocumentGeneralIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SRDocumentGeneralIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the 
	DICOM SR Document General Information Object Module
	Dicom Standard Supplement 23 - Table C.17-2
	PRD, Charnovscki 13-12.2001"

	self resetDataElements.
	Name := 'SR Document General Information Object Module'.
	moduleName := 'srDocumentGeneralIOM'.
	self
		addDataElement:
			(ISDataElement
				newWith: #instanceNumber
				tag: #(16r0020 16r0013)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #completionFlag
				tag: #(16r0040 16rA491)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(LODataElement
				newWith: #completionFlagDescription
				tag: #(16r0040 16rA492)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #verificationFlag
				tag: #(16r0040 16rA493)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DADataElement
				newWith: #contentDate
				tag: #(16r0008 16r0023)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(TMDataElement
				newWith: #contentTime
				tag: #(16r0008 16r0033)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #verifyingObserverSequence
				tag: #(16r0040 16rA073)
				vm: '1'
				type: '1C'
				sequenceItemClass: VerifyingObserverSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #predecessorDocumentsSequence
				tag: #(16r0040 16rA360)
				vm: '1'
				type: '1C'
				sequenceItemClass: PredecessorDocumentsSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #identicalDocumentsSequence
				tag: #(16r0040 16rA525)
				vm: '1'
				type: '1C'
				sequenceItemClass: IdenticalDocumentsSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedRequestSequence
				tag: #(16r0040 16rA370)
				vm: '1'
				type: '1C'
				sequenceItemClass: ReferencedRequestSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #performedProcedureCodeSequence
				tag: #(16r0040 16rA372)
				vm: '1'
				type: '2'
				sequenceItemClass: PerformedProcedureCodeSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #currentRequestedProcedureEvidenceSequence
				tag: #(16r0040 16rA375)
				vm: '1'
				type: '1C'
				sequenceItemClass: CurrentRequestedProcedureEvidenceSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #pertinentOtherEvidenceSequence
				tag: #(16r0040 16rA385)
				vm: '1'
				type: '1C'
				sequenceItemClass: PertinentOtherEvidenceSequenceItem)
]

{ #category : #accessing }
SRDocumentGeneralIOM >> completionFlag [

	^self dataElementsValues at: 'completionFlag' ifAbsent: [
		self dataElementsDictionary at: 'completionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'completionFlag' put: (self dataElementsDictionary removeKey: 'completionFlag') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> completionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'completionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #completionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'completionFlag' put: dataElement.
			self dataElementsValues removeKey: 'completionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'completionFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> completionFlagDescription [

	^self dataElementsValues at: 'completionFlagDescription' ifAbsent: [
		self dataElementsDictionary at: 'completionFlagDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'completionFlagDescription' put: (self dataElementsDictionary removeKey: 'completionFlagDescription') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> completionFlagDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'completionFlagDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #completionFlagDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'completionFlagDescription' put: dataElement.
			self dataElementsValues removeKey: 'completionFlagDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'completionFlagDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> contentDate [

	^self dataElementsValues at: 'contentDate' ifAbsent: [
		self dataElementsDictionary at: 'contentDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentDate' put: (self dataElementsDictionary removeKey: 'contentDate') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> contentDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'contentDate' put: dataElement.
			self dataElementsValues removeKey: 'contentDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> contentTime [

	^self dataElementsValues at: 'contentTime' ifAbsent: [
		self dataElementsDictionary at: 'contentTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentTime' put: (self dataElementsDictionary removeKey: 'contentTime') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> contentTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'contentTime' put: dataElement.
			self dataElementsValues removeKey: 'contentTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> currentRequestedProcedureEvidenceSequence [

	^self dataElementsValues at: 'currentRequestedProcedureEvidenceSequence' ifAbsent: [
		self dataElementsDictionary at: 'currentRequestedProcedureEvidenceSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'currentRequestedProcedureEvidenceSequence' put: (self dataElementsDictionary removeKey: 'currentRequestedProcedureEvidenceSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> currentRequestedProcedureEvidenceSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'currentRequestedProcedureEvidenceSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #currentRequestedProcedureEvidenceSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'currentRequestedProcedureEvidenceSequence' put: dataElement.
			self dataElementsValues removeKey: 'currentRequestedProcedureEvidenceSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'currentRequestedProcedureEvidenceSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> identicalDocumentsSequence [

	^self dataElementsValues at: 'identicalDocumentsSequence' ifAbsent: [
		self dataElementsDictionary at: 'identicalDocumentsSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'identicalDocumentsSequence' put: (self dataElementsDictionary removeKey: 'identicalDocumentsSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> identicalDocumentsSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'identicalDocumentsSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #identicalDocumentsSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'identicalDocumentsSequence' put: dataElement.
			self dataElementsValues removeKey: 'identicalDocumentsSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'identicalDocumentsSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> instanceNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'instanceNumber' put: dataElement.
			self dataElementsValues removeKey: 'instanceNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> performedProcedureCodeSequence [

	^self dataElementsValues at: 'performedProcedureCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'performedProcedureCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'performedProcedureCodeSequence' put: (self dataElementsDictionary removeKey: 'performedProcedureCodeSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> performedProcedureCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'performedProcedureCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #performedProcedureCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'performedProcedureCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'performedProcedureCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'performedProcedureCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> pertinentOtherEvidenceSequence [

	^self dataElementsValues at: 'pertinentOtherEvidenceSequence' ifAbsent: [
		self dataElementsDictionary at: 'pertinentOtherEvidenceSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'pertinentOtherEvidenceSequence' put: (self dataElementsDictionary removeKey: 'pertinentOtherEvidenceSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> pertinentOtherEvidenceSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'pertinentOtherEvidenceSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pertinentOtherEvidenceSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'pertinentOtherEvidenceSequence' put: dataElement.
			self dataElementsValues removeKey: 'pertinentOtherEvidenceSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pertinentOtherEvidenceSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> predecessorDocumentsSequence [

	^self dataElementsValues at: 'predecessorDocumentsSequence' ifAbsent: [
		self dataElementsDictionary at: 'predecessorDocumentsSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'predecessorDocumentsSequence' put: (self dataElementsDictionary removeKey: 'predecessorDocumentsSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> predecessorDocumentsSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'predecessorDocumentsSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #predecessorDocumentsSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'predecessorDocumentsSequence' put: dataElement.
			self dataElementsValues removeKey: 'predecessorDocumentsSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'predecessorDocumentsSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> referencedRequestSequence [

	^self dataElementsValues at: 'referencedRequestSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedRequestSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedRequestSequence' put: (self dataElementsDictionary removeKey: 'referencedRequestSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> referencedRequestSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedRequestSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedRequestSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedRequestSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedRequestSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedRequestSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> verificationFlag [

	^self dataElementsValues at: 'verificationFlag' ifAbsent: [
		self dataElementsDictionary at: 'verificationFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'verificationFlag' put: (self dataElementsDictionary removeKey: 'verificationFlag') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> verificationFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'verificationFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verificationFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'verificationFlag' put: dataElement.
			self dataElementsValues removeKey: 'verificationFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verificationFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
SRDocumentGeneralIOM >> verifyingObserverSequence [

	^self dataElementsValues at: 'verifyingObserverSequence' ifAbsent: [
		self dataElementsDictionary at: 'verifyingObserverSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'verifyingObserverSequence' put: (self dataElementsDictionary removeKey: 'verifyingObserverSequence') value.
		]
	]

]

{ #category : #accessing }
SRDocumentGeneralIOM >> verifyingObserverSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'verifyingObserverSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verifyingObserverSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'verifyingObserverSequence' put: dataElement.
			self dataElementsValues removeKey: 'verifyingObserverSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verifyingObserverSequence' put: aSQValue
		]
	].

]
