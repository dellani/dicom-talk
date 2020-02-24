Class {
	#name : #NMDetectorIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
NMDetectorIOM class >> initialize [
	self resetDataElements.
	Name := 'NMDetectorIOM'.
	moduleName := 'nmDetectorIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(SQDataElement
				newWith: #detectorInformationSequence
				tag: #(16r54 16r22)
				vm: '1'
				type: '2'
				sequenceItemClass: DetectorInformationSequenceItem)
]

{ #category : #accessing }
NMDetectorIOM >> detectorInformationSequence [

	^self dataElementsValues at: 'detectorInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'detectorInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'detectorInformationSequence' put: (self dataElementsDictionary removeKey: 'detectorInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMDetectorIOM >> detectorInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'detectorInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #detectorInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'detectorInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'detectorInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'detectorInformationSequence' put: aSQValue
		]
	].

]
