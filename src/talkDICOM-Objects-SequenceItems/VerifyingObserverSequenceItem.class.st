Class {
	#name : #VerifyingObserverSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
VerifyingObserverSequenceItem class >> initialize [
	"DICOM Verifying Observer Sequence Item - initialization method

	RC - Dec 14th, 2001
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Verifying Observer Sequence Item'.
	SequenceName := 'verifyingObserverSequenceItem'.
	self
		addDataElement:
			(PNDataElement
				newWith: #verifyingObserverName
				tag: #(16r0040 16rA075)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(SQDataElement
				newWith: #verifyingObserverIdentificationCodeSequence
				tag: #(16r0040 16rA088)
				vm: '1'
				type: '2'
				sequenceItemClass: VerifyingObserverIdentificationCodeSequenceItem).
	self
		addDataElement:
			(LODataElement
				newWith: #verifyingOrganization
				tag: #(16r0040 16rA027)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DTDataElement
				newWith: #verificationDateTime
				tag: #(16r0040 16rA030)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verificationDateTime [

	^self dataElementsValues at: 'verificationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'verificationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'verificationDateTime' put: (self dataElementsDictionary removeKey: 'verificationDateTime') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verificationDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'verificationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verificationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'verificationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'verificationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verificationDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verifyingObserverIdentificationCodeSequence [

	^self dataElementsValues at: 'verifyingObserverIdentificationCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'verifyingObserverIdentificationCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'verifyingObserverIdentificationCodeSequence' put: (self dataElementsDictionary removeKey: 'verifyingObserverIdentificationCodeSequence') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verifyingObserverIdentificationCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'verifyingObserverIdentificationCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verifyingObserverIdentificationCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'verifyingObserverIdentificationCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'verifyingObserverIdentificationCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verifyingObserverIdentificationCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verifyingObserverName [

	^self dataElementsValues at: 'verifyingObserverName' ifAbsent: [
		self dataElementsDictionary at: 'verifyingObserverName' ifPresent: [:dataElement |
			self dataElementsValues at: 'verifyingObserverName' put: (self dataElementsDictionary removeKey: 'verifyingObserverName') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verifyingObserverName: aPNValue [

	| dataElement |

	(self dataElementsDictionary at: 'verifyingObserverName' ifPresent: [:aDataElement | aDataElement value: aPNValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verifyingObserverName.
			dataElement encoder: self encoder.
			dataElement value: aPNValue.
			self dataElementsDictionary at: 'verifyingObserverName' put: dataElement.
			self dataElementsValues removeKey: 'verifyingObserverName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verifyingObserverName' put: aPNValue
		]
	].

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verifyingOrganization [

	^self dataElementsValues at: 'verifyingOrganization' ifAbsent: [
		self dataElementsDictionary at: 'verifyingOrganization' ifPresent: [:dataElement |
			self dataElementsValues at: 'verifyingOrganization' put: (self dataElementsDictionary removeKey: 'verifyingOrganization') value.
		]
	]

]

{ #category : #accessing }
VerifyingObserverSequenceItem >> verifyingOrganization: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'verifyingOrganization' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verifyingOrganization.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'verifyingOrganization' put: dataElement.
			self dataElementsValues removeKey: 'verifyingOrganization' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verifyingOrganization' put: aLOValue
		]
	].

]
