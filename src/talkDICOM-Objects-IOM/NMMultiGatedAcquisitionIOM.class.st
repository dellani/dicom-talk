Class {
	#name : #NMMultiGatedAcquisitionIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
NMMultiGatedAcquisitionIOM class >> initialize [
	self resetDataElements.
	Name := 'NM Multi Gated Acquisition IOM'.
	moduleName := 'nmMultiGatedAcquisitionIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #beatRejectionFlag
				tag: #(16r18 16r1080)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #pvcRejection
				tag: #(16r18 16r1085)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #skipBeats
				tag: #(16r18 16r1086)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #heartRate
				tag: #(16r18 16r1088)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #gatedInformationSequence
				tag: #(16r54 16r62)
				vm: '1'
				type: '2C'
				sequenceItemClass: GatedInformationSequenceItem)
]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> beatRejectionFlag [

	^self dataElementsValues at: 'beatRejectionFlag' ifAbsent: [
		self dataElementsDictionary at: 'beatRejectionFlag' ifPresent: [:dataElement |
			self dataElementsValues at: 'beatRejectionFlag' put: (self dataElementsDictionary removeKey: 'beatRejectionFlag') value.
		]
	]

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> beatRejectionFlag: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'beatRejectionFlag' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #beatRejectionFlag.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'beatRejectionFlag' put: dataElement.
			self dataElementsValues removeKey: 'beatRejectionFlag' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'beatRejectionFlag' put: aCSValue
		]
	].

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> gatedInformationSequence [

	^self dataElementsValues at: 'gatedInformationSequence' ifAbsent: [
		self dataElementsDictionary at: 'gatedInformationSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'gatedInformationSequence' put: (self dataElementsDictionary removeKey: 'gatedInformationSequence') value.
		]
	]

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> gatedInformationSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'gatedInformationSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #gatedInformationSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'gatedInformationSequence' put: dataElement.
			self dataElementsValues removeKey: 'gatedInformationSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'gatedInformationSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> heartRate [

	^self dataElementsValues at: 'heartRate' ifAbsent: [
		self dataElementsDictionary at: 'heartRate' ifPresent: [:dataElement |
			self dataElementsValues at: 'heartRate' put: (self dataElementsDictionary removeKey: 'heartRate') value.
		]
	]

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> heartRate: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'heartRate' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #heartRate.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'heartRate' put: dataElement.
			self dataElementsValues removeKey: 'heartRate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'heartRate' put: aISValue
		]
	].

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> pVCRejection [

	^self dataElementsValues at: 'pVCRejection' ifAbsent: [
		self dataElementsDictionary at: 'pVCRejection' ifPresent: [:dataElement |
			self dataElementsValues at: 'pVCRejection' put: (self dataElementsDictionary removeKey: 'pVCRejection') value.
		]
	]

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> pVCRejection: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'pVCRejection' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pVCRejection.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'pVCRejection' put: dataElement.
			self dataElementsValues removeKey: 'pVCRejection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pVCRejection' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
NMMultiGatedAcquisitionIOM >> pvcRejection [

	^self dataElementsValues at: 'pVCRejection' ifAbsent: [
		self dataElementsDictionary at: 'pVCRejection' ifPresent: [:dataElement |
			self dataElementsValues at: 'pVCRejection' put: (self dataElementsDictionary removeKey: 'pVCRejection') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
NMMultiGatedAcquisitionIOM >> pvcRejection: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'pVCRejection' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pVCRejection.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'pVCRejection' put: dataElement.
			self dataElementsValues removeKey: 'pVCRejection' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pVCRejection' put: aLOValue
		]
	].

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> skipBeats [

	^self dataElementsValues at: 'skipBeats' ifAbsent: [
		self dataElementsDictionary at: 'skipBeats' ifPresent: [:dataElement |
			self dataElementsValues at: 'skipBeats' put: (self dataElementsDictionary removeKey: 'skipBeats') value.
		]
	]

]

{ #category : #accessing }
NMMultiGatedAcquisitionIOM >> skipBeats: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'skipBeats' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #skipBeats.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'skipBeats' put: dataElement.
			self dataElementsValues removeKey: 'skipBeats' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'skipBeats' put: aISValue
		]
	].

]
