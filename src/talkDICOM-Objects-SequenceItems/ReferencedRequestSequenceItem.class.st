Class {
	#name : #ReferencedRequestSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
ReferencedRequestSequenceItem class >> initialize [
	"DICOM Referenced Request Sequence Item - initialization method

	RC - Dec 14th, 2001
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Referenced Request Sequence Item'.
	SequenceName := 'referencedRequestSequenceItem'.
	self
		addDataElement:
			(UIDataElement
				newWith: #studyInstanceUID
				tag: #(16r0020 16r000D)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedStudySequence
				tag: #(16r0008 16r1110)
				vm: '1'
				type: '2'
				sequenceItemClass: ReferencedStudySequenceItem).
	self
		addDataElement:
			(SHDataElement
				newWith: #accessionNumber
				tag: #(16r0008 16r0050)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(LODataElement
				newWith: #placeOrderNumberImagingServiceRequest
				tag: #(16r0040 16r2016)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(LODataElement
				newWith: #fillerOrderNumberImagingServiceRequest
				tag: #(16r0040 16r2017)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SHDataElement
				newWith: #requestedProcedureID
				tag: #(16r0040 16r1001)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(LODataElement
				newWith: #requestedProcedureDescription
				tag: #(16r0032 16r1060)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(SQDataElement
				newWith: #requestedProcedureCodeSequence
				tag: #(16r0032 16r1064)
				vm: '1'
				type: '2'
				sequenceItemClass: RequestedProcedureCodeSequenceItem)
]

{ #category : #accessing }
ReferencedRequestSequenceItem >> accessionNumber [

	^self dataElementsValues at: 'accessionNumber' ifAbsent: [
		self dataElementsDictionary at: 'accessionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'accessionNumber' put: (self dataElementsDictionary removeKey: 'accessionNumber') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> accessionNumber: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'accessionNumber' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #accessionNumber.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'accessionNumber' put: dataElement.
			self dataElementsValues removeKey: 'accessionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'accessionNumber' put: aSHValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> fillerOrderNumberImagingServiceRequest [

	^self dataElementsValues at: 'fillerOrderNumberImagingServiceRequest' ifAbsent: [
		self dataElementsDictionary at: 'fillerOrderNumberImagingServiceRequest' ifPresent: [:dataElement |
			self dataElementsValues at: 'fillerOrderNumberImagingServiceRequest' put: (self dataElementsDictionary removeKey: 'fillerOrderNumberImagingServiceRequest') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> fillerOrderNumberImagingServiceRequest: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'fillerOrderNumberImagingServiceRequest' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #fillerOrderNumberImagingServiceRequest.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'fillerOrderNumberImagingServiceRequest' put: dataElement.
			self dataElementsValues removeKey: 'fillerOrderNumberImagingServiceRequest' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'fillerOrderNumberImagingServiceRequest' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
ReferencedRequestSequenceItem >> placeOrderNumberImagingServiceRequest [

	^self dataElementsValues at: 'placerOrderNumberImagingServiceRequest' ifAbsent: [
		self dataElementsDictionary at: 'placerOrderNumberImagingServiceRequest' ifPresent: [:dataElement |
			self dataElementsValues at: 'placerOrderNumberImagingServiceRequest' put: (self dataElementsDictionary removeKey: 'placerOrderNumberImagingServiceRequest') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
ReferencedRequestSequenceItem >> placeOrderNumberImagingServiceRequest: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'placerOrderNumberImagingServiceRequest' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #placerOrderNumberImagingServiceRequest.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'placerOrderNumberImagingServiceRequest' put: dataElement.
			self dataElementsValues removeKey: 'placerOrderNumberImagingServiceRequest' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'placerOrderNumberImagingServiceRequest' put: aLOValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> placerOrderNumberImagingServiceRequest [

	^self dataElementsValues at: 'placerOrderNumberImagingServiceRequest' ifAbsent: [
		self dataElementsDictionary at: 'placerOrderNumberImagingServiceRequest' ifPresent: [:dataElement |
			self dataElementsValues at: 'placerOrderNumberImagingServiceRequest' put: (self dataElementsDictionary removeKey: 'placerOrderNumberImagingServiceRequest') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> placerOrderNumberImagingServiceRequest: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'placerOrderNumberImagingServiceRequest' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #placerOrderNumberImagingServiceRequest.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'placerOrderNumberImagingServiceRequest' put: dataElement.
			self dataElementsValues removeKey: 'placerOrderNumberImagingServiceRequest' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'placerOrderNumberImagingServiceRequest' put: aLOValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> referencedStudySequence [

	^self dataElementsValues at: 'referencedStudySequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedStudySequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedStudySequence' put: (self dataElementsDictionary removeKey: 'referencedStudySequence') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> referencedStudySequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedStudySequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedStudySequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedStudySequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedStudySequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedStudySequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> requestedProcedureCodeSequence [

	^self dataElementsValues at: 'requestedProcedureCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'requestedProcedureCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestedProcedureCodeSequence' put: (self dataElementsDictionary removeKey: 'requestedProcedureCodeSequence') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> requestedProcedureCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'requestedProcedureCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #requestedProcedureCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'requestedProcedureCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'requestedProcedureCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'requestedProcedureCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> requestedProcedureDescription [

	^self dataElementsValues at: 'requestedProcedureDescription' ifAbsent: [
		self dataElementsDictionary at: 'requestedProcedureDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestedProcedureDescription' put: (self dataElementsDictionary removeKey: 'requestedProcedureDescription') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> requestedProcedureDescription: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'requestedProcedureDescription' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #requestedProcedureDescription.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'requestedProcedureDescription' put: dataElement.
			self dataElementsValues removeKey: 'requestedProcedureDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'requestedProcedureDescription' put: aLOValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> requestedProcedureID [

	^self dataElementsValues at: 'requestedProcedureID' ifAbsent: [
		self dataElementsDictionary at: 'requestedProcedureID' ifPresent: [:dataElement |
			self dataElementsValues at: 'requestedProcedureID' put: (self dataElementsDictionary removeKey: 'requestedProcedureID') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> requestedProcedureID: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'requestedProcedureID' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #requestedProcedureID.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'requestedProcedureID' put: dataElement.
			self dataElementsValues removeKey: 'requestedProcedureID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'requestedProcedureID' put: aSHValue
		]
	].

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> studyInstanceUID [

	^self dataElementsValues at: 'studyInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'studyInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'studyInstanceUID' put: (self dataElementsDictionary removeKey: 'studyInstanceUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedRequestSequenceItem >> studyInstanceUID: aUIValue [

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
