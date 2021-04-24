Class {
	#name : #ModalityLUTIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
ModalityLUTIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Modality LUT Information Object Module
	PS 3.3-2000 Annex C.11.2 (Page 487) - PRD 04-06.2001"

	self resetDataElements.
	Name := 'Modality LUT Information Object Module'.
	moduleName := 'modalityLUTIOM'.
	self
		addDataElement:
			(SQDataElement
				newWith: #modalityLUTSequence
				tag: #(16r0028 16r3000)
				vm: '1'
				type: '3'
				sequenceItemClass: ModalityLUTSequenceItem).
	self
		addDataElement:
			(DSDataElement
				newWith: #rescaleIntercept
				tag: #(16r0028 16r1052)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #rescaleSlope
				tag: #(16r0028 16r1053)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(LODataElement
				newWith: #rescaleType
				tag: #(16r0028 16r1054)
				vm: '1'
				type: '1C')
]

{ #category : #accessing }
ModalityLUTIOM >> modalityLUTSequence [

	^self dataElementsValues at: 'modalityLUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'modalityLUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'modalityLUTSequence' put: (self dataElementsDictionary removeKey: 'modalityLUTSequence') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTIOM >> modalityLUTSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'modalityLUTSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #modalityLUTSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'modalityLUTSequence' put: dataElement.
			self dataElementsValues removeKey: 'modalityLUTSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'modalityLUTSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
ModalityLUTIOM >> rescaleIntercept [

	^self dataElementsValues at: 'rescaleIntercept' ifAbsent: [
		self dataElementsDictionary at: 'rescaleIntercept' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleIntercept' put: (self dataElementsDictionary removeKey: 'rescaleIntercept') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTIOM >> rescaleIntercept: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rescaleIntercept' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rescaleIntercept.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rescaleIntercept' put: dataElement.
			self dataElementsValues removeKey: 'rescaleIntercept' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rescaleIntercept' put: aDSValue
		]
	].

]

{ #category : #accessing }
ModalityLUTIOM >> rescaleSlope [

	^self dataElementsValues at: 'rescaleSlope' ifAbsent: [
		self dataElementsDictionary at: 'rescaleSlope' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleSlope' put: (self dataElementsDictionary removeKey: 'rescaleSlope') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTIOM >> rescaleSlope: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rescaleSlope' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rescaleSlope.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'rescaleSlope' put: dataElement.
			self dataElementsValues removeKey: 'rescaleSlope' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rescaleSlope' put: aDSValue
		]
	].

]

{ #category : #accessing }
ModalityLUTIOM >> rescaleType [

	^self dataElementsValues at: 'rescaleType' ifAbsent: [
		self dataElementsDictionary at: 'rescaleType' ifPresent: [:dataElement |
			self dataElementsValues at: 'rescaleType' put: (self dataElementsDictionary removeKey: 'rescaleType') value.
		]
	]

]

{ #category : #accessing }
ModalityLUTIOM >> rescaleType: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'rescaleType' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rescaleType.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'rescaleType' put: dataElement.
			self dataElementsValues removeKey: 'rescaleType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rescaleType' put: aLOValue
		]
	].

]
