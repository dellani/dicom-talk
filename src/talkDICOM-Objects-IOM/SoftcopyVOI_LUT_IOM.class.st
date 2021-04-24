Class {
	#name : #'SoftcopyVOI_LUT_IOM',
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SoftcopyVOI_LUT_IOM class >> initialize [
	self resetDataElements.
	Name := 'Softcopy VOI LUT Information Object Module'.
	moduleName := 'softcopyVOI_LUT_IOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #SoftcopyVOI_LUT_Sequence
				tag: #(16r28 16r3110)
				vm: '1'
				type: '1'
				sequenceItemClass: SoftcopyVOILUTSequenceItem)
]

{ #category : #'accessing - talkDICOM names' }
SoftcopyVOI_LUT_IOM >> SoftcopyVOI_LUT_Sequence [

	^self dataElementsValues at: 'softcopyVOILUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'softcopyVOILUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'softcopyVOILUTSequence' put: (self dataElementsDictionary removeKey: 'softcopyVOILUTSequence') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SoftcopyVOI_LUT_IOM >> SoftcopyVOI_LUT_Sequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'softcopyVOILUTSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #softcopyVOILUTSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'softcopyVOILUTSequence' put: dataElement.
			self dataElementsValues removeKey: 'softcopyVOILUTSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'softcopyVOILUTSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
SoftcopyVOI_LUT_IOM >> softcopyVOILUTSequence [

	^self dataElementsValues at: 'softcopyVOILUTSequence' ifAbsent: [
		self dataElementsDictionary at: 'softcopyVOILUTSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'softcopyVOILUTSequence' put: (self dataElementsDictionary removeKey: 'softcopyVOILUTSequence') value.
		]
	]

]

{ #category : #accessing }
SoftcopyVOI_LUT_IOM >> softcopyVOILUTSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'softcopyVOILUTSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #softcopyVOILUTSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'softcopyVOILUTSequence' put: dataElement.
			self dataElementsValues removeKey: 'softcopyVOILUTSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'softcopyVOILUTSequence' put: aSQValue
		]
	].

]
