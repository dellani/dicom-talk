Class {
	#name : #'StudyRoot_Retrieval_RQ_Identifier',
	#superclass : #DicomObject,
	#category : #'talkDICOM-Interfaces'
}

{ #category : #'class initialization' }
StudyRoot_Retrieval_RQ_Identifier class >> initialize [
	self resetDataElements.
	self addDataElement: (CSDataElement newWith: #queryRetrieveLevel tag: #(16r0008 16r0052) vm: '1').
	self addDataElement: (LODataElement newWith: #patientID tag: #(16r0010 16r0020) vm: '1').
	self addDataElement: (UIDataElement newWith: #studyInstanceUID tag: #(16r0020 16r000D) vm: 'n').
	self addDataElement: (UIDataElement newWith: #seriesInstanceUID tag: #(16r0020 16r000E) vm: 'n').
	self addDataElement: (UIDataElement newWith: #sopInstanceUID tag: #(16r0008 16r0018) vm: 'n')
]

{ #category : #retrieveLevel }
StudyRoot_Retrieval_RQ_Identifier >> compositeObjectInstanceInformation [

	self queryRetrieveLevel: 'IMAGE'
]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> patientID [

	^self dataElementsValues at: 'patientID' ifAbsent: [
		self dataElementsDictionary at: 'patientID' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientID' put: (self dataElementsDictionary removeKey: 'patientID') value.
		]
	]

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> patientID: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientID' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientID.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'patientID' put: dataElement.
			self dataElementsValues removeKey: 'patientID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientID' put: aLOValue
		]
	].

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> queryRetrieveLevel [

	^self dataElementsValues at: 'queryRetrieveLevel' ifAbsent: [
		self dataElementsDictionary at: 'queryRetrieveLevel' ifPresent: [:dataElement |
			self dataElementsValues at: 'queryRetrieveLevel' put: (self dataElementsDictionary removeKey: 'queryRetrieveLevel') value.
		]
	]

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> queryRetrieveLevel: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'queryRetrieveLevel' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #queryRetrieveLevel.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'queryRetrieveLevel' put: dataElement.
			self dataElementsValues removeKey: 'queryRetrieveLevel' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'queryRetrieveLevel' put: aCSValue
		]
	].

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> sOPInstanceUID [

	^self dataElementsValues at: 'sOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceUID' put: (self dataElementsDictionary removeKey: 'sOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> sOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #retrieveLevel }
StudyRoot_Retrieval_RQ_Identifier >> seriesInformation [

	self queryRetrieveLevel: 'SERIES'
]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> seriesInstanceUID [

	^self dataElementsValues at: 'seriesInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'seriesInstanceUID' put: (self dataElementsDictionary removeKey: 'seriesInstanceUID') value.
		]
	]

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> seriesInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'seriesInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #seriesInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'seriesInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'seriesInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'seriesInstanceUID' put: aUIValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
StudyRoot_Retrieval_RQ_Identifier >> sopInstanceUID [

	^self dataElementsValues at: 'sOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceUID' put: (self dataElementsDictionary removeKey: 'sOPInstanceUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
StudyRoot_Retrieval_RQ_Identifier >> sopInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #retrieveLevel }
StudyRoot_Retrieval_RQ_Identifier >> studyInformation [

	self queryRetrieveLevel: 'STUDY'
]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
StudyRoot_Retrieval_RQ_Identifier >> studyInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #studyInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'studyInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'studyInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'studyInstanceUID' put: aUIValue
		]
	].

]
