Class {
	#name : #TemporalCoordinatesMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
TemporalCoordinatesMacroItem class >> initialize [
	"DICOM Temporal Coordinates Macro Item - initialization method

	MKB Jan 25th, 2002"

	self resetDataElements.
	Name := 'DICOM Temporal Coordinates Macro Item'.
	SequenceName := 'temporalCoordinatesMacroItem'.
	self
		addDataElement:
			(CSDataElement
				newWith: #temporalRangeType
				tag: #(16r0040 16rA130)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ULDataElement
				newWith: #referencedSamplePositions
				tag: #(16r0040 16rA132)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(DSDataElement
				newWith: #referencedTimeOffsets
				tag: #(16r0040 16rA138)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(DTDataElement
				newWith: #referencedDatetime
				tag: #(16r0040 16rA13A)
				vm: '1-n'
				type: '1C')
]

{ #category : #accessing }
TemporalCoordinatesMacroItem >> referencedDateTime [

	^self dataElementsValues at: 'referencedDateTime' ifAbsent: [
		self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedDateTime' put: (self dataElementsDictionary removeKey: 'referencedDateTime') value.
		]
	]

]

{ #category : #accessing }
TemporalCoordinatesMacroItem >> referencedDateTime: aDTValue [

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
TemporalCoordinatesMacroItem >> referencedDatetime [

	^self dataElementsValues at: 'referencedDateTime' ifAbsent: [
		self dataElementsDictionary at: 'referencedDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedDateTime' put: (self dataElementsDictionary removeKey: 'referencedDateTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
TemporalCoordinatesMacroItem >> referencedDatetime: aDTValue [

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
TemporalCoordinatesMacroItem >> referencedSamplePositions [

	^self dataElementsValues at: 'referencedSamplePositions' ifAbsent: [
		self dataElementsDictionary at: 'referencedSamplePositions' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSamplePositions' put: (self dataElementsDictionary removeKey: 'referencedSamplePositions') value.
		]
	]

]

{ #category : #accessing }
TemporalCoordinatesMacroItem >> referencedSamplePositions: aULValue [

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
TemporalCoordinatesMacroItem >> referencedTimeOffsets [

	^self dataElementsValues at: 'referencedTimeOffsets' ifAbsent: [
		self dataElementsDictionary at: 'referencedTimeOffsets' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedTimeOffsets' put: (self dataElementsDictionary removeKey: 'referencedTimeOffsets') value.
		]
	]

]

{ #category : #accessing }
TemporalCoordinatesMacroItem >> referencedTimeOffsets: aDSValue [

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
TemporalCoordinatesMacroItem >> temporalRangeType [

	^self dataElementsValues at: 'temporalRangeType' ifAbsent: [
		self dataElementsDictionary at: 'temporalRangeType' ifPresent: [:dataElement |
			self dataElementsValues at: 'temporalRangeType' put: (self dataElementsDictionary removeKey: 'temporalRangeType') value.
		]
	]

]

{ #category : #accessing }
TemporalCoordinatesMacroItem >> temporalRangeType: aCSValue [

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
