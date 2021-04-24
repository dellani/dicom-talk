Class {
	#name : #WaveformIdentificationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
WaveformIdentificationIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the 
	DICOM Waveform Identification Information Object Module
	PS 3.3-2000 Annex C.10-8 (Page 475) - GA 10-10.2001"

	self resetDataElements.
	Name := 'Waveform Identification Image Information Object Module'.
	moduleName := 'waveformIdentificationIOM'.
	self
		addDataElement:
			(ISDataElement
				newWith: #instanceNumber
				tag: #(16r0020 16r0013)
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
			(DTDataElement
				newWith: #acquisitionDatetime
				tag: #(16r0008 16r002A)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedInstanceSequence
				tag: #(16r0008 16r114A)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedInstanceSequenceItem)
]

{ #category : #accessing }
WaveformIdentificationIOM >> acquisitionDateTime [

	^self dataElementsValues at: 'acquisitionDateTime' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDateTime' put: (self dataElementsDictionary removeKey: 'acquisitionDateTime') value.
		]
	]

]

{ #category : #accessing }
WaveformIdentificationIOM >> acquisitionDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'acquisitionDateTime' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDateTime' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
WaveformIdentificationIOM >> acquisitionDatetime [

	^self dataElementsValues at: 'acquisitionDateTime' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDateTime' put: (self dataElementsDictionary removeKey: 'acquisitionDateTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
WaveformIdentificationIOM >> acquisitionDatetime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'acquisitionDateTime' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
WaveformIdentificationIOM >> contentDate [

	^self dataElementsValues at: 'contentDate' ifAbsent: [
		self dataElementsDictionary at: 'contentDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentDate' put: (self dataElementsDictionary removeKey: 'contentDate') value.
		]
	]

]

{ #category : #accessing }
WaveformIdentificationIOM >> contentDate: aDAValue [

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
WaveformIdentificationIOM >> contentTime [

	^self dataElementsValues at: 'contentTime' ifAbsent: [
		self dataElementsDictionary at: 'contentTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentTime' put: (self dataElementsDictionary removeKey: 'contentTime') value.
		]
	]

]

{ #category : #accessing }
WaveformIdentificationIOM >> contentTime: aTMValue [

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
WaveformIdentificationIOM >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
WaveformIdentificationIOM >> instanceNumber: aISValue [

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
WaveformIdentificationIOM >> referencedInstanceSequence [

	^self dataElementsValues at: 'referencedInstanceSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedInstanceSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedInstanceSequence' put: (self dataElementsDictionary removeKey: 'referencedInstanceSequence') value.
		]
	]

]

{ #category : #accessing }
WaveformIdentificationIOM >> referencedInstanceSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedInstanceSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedInstanceSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedInstanceSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedInstanceSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedInstanceSequence' put: aSQValue
		]
	].

]
