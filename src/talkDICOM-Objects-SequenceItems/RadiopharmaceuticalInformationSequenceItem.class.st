Class {
	#name : #RadiopharmaceuticalInformationSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
RadiopharmaceuticalInformationSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'Radiopharmaceutical Information Sequence Item'.
	SequenceName := 'radiopharmaceuticalInformationSequenceItem'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(LODataElement
				newWith: #radiopharmaceutical
				tag: #(16r18 16r31)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #radiopharmaceuticalRoute
				tag: #(16r18 16r1070)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #radiopharmaceuticalVolume
				tag: #(16r18 16r1071)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #radiopharmaceuticalStartTime
				tag: #(16r18 16r1072)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #radiopharmaceuticalStopTime
				tag: #(16r18 16r1073)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #radionuclideTotalDose
				tag: #(16r18 16r1074)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #radionuclideCodeSequence
				tag: #(16r54 16r300)
				vm: '1'
				type: '2C'
				sequenceItemClass: RadionuclideCodeSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #administrationRouteCodeSequence
				tag: #(16r54 16r302)
				vm: '1'
				type: '3'
				sequenceItemClass: AdministrationRouteCodeSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #radiopharmaceuticalCodeSequence
				tag: #(16r54 16r304)
				vm: '1'
				type: '3'
				sequenceItemClass: RadiopharmaceuticalCodeSequenceItem).
	self
		addDataElement:
			(SQDataElement
				newWith: #calibrationDataSequence
				tag: #(16r54 16r306)
				vm: '1'
				type: '3'
				sequenceItemClass: CalibrationDataSequenceItem)
]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> administrationRouteCodeSequence [

	^self dataElementsValues at: 'administrationRouteCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'administrationRouteCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'administrationRouteCodeSequence' put: (self dataElementsDictionary removeKey: 'administrationRouteCodeSequence') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> administrationRouteCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'administrationRouteCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #administrationRouteCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'administrationRouteCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'administrationRouteCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'administrationRouteCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> calibrationDataSequence [

	^self dataElementsValues at: 'calibrationDataSequence' ifAbsent: [
		self dataElementsDictionary at: 'calibrationDataSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'calibrationDataSequence' put: (self dataElementsDictionary removeKey: 'calibrationDataSequence') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> calibrationDataSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'calibrationDataSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #calibrationDataSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'calibrationDataSequence' put: dataElement.
			self dataElementsValues removeKey: 'calibrationDataSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'calibrationDataSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radionuclideCodeSequence [

	^self dataElementsValues at: 'radionuclideCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'radionuclideCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'radionuclideCodeSequence' put: (self dataElementsDictionary removeKey: 'radionuclideCodeSequence') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radionuclideCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'radionuclideCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radionuclideCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'radionuclideCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'radionuclideCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radionuclideCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radionuclideTotalDose [

	^self dataElementsValues at: 'radionuclideTotalDose' ifAbsent: [
		self dataElementsDictionary at: 'radionuclideTotalDose' ifPresent: [:dataElement |
			self dataElementsValues at: 'radionuclideTotalDose' put: (self dataElementsDictionary removeKey: 'radionuclideTotalDose') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radionuclideTotalDose: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'radionuclideTotalDose' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radionuclideTotalDose.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'radionuclideTotalDose' put: dataElement.
			self dataElementsValues removeKey: 'radionuclideTotalDose' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radionuclideTotalDose' put: aDSValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceutical [

	^self dataElementsValues at: 'radiopharmaceutical' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceutical' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceutical' put: (self dataElementsDictionary removeKey: 'radiopharmaceutical') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceutical: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceutical' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceutical.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'radiopharmaceutical' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceutical' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceutical' put: aLOValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalCodeSequence [

	^self dataElementsValues at: 'radiopharmaceuticalCodeSequence' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceuticalCodeSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceuticalCodeSequence' put: (self dataElementsDictionary removeKey: 'radiopharmaceuticalCodeSequence') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalCodeSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceuticalCodeSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceuticalCodeSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'radiopharmaceuticalCodeSequence' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceuticalCodeSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceuticalCodeSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalRoute [

	^self dataElementsValues at: 'radiopharmaceuticalRoute' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceuticalRoute' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceuticalRoute' put: (self dataElementsDictionary removeKey: 'radiopharmaceuticalRoute') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalRoute: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceuticalRoute' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceuticalRoute.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'radiopharmaceuticalRoute' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceuticalRoute' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceuticalRoute' put: aLOValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalStartTime [

	^self dataElementsValues at: 'radiopharmaceuticalStartTime' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceuticalStartTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceuticalStartTime' put: (self dataElementsDictionary removeKey: 'radiopharmaceuticalStartTime') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalStartTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceuticalStartTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceuticalStartTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'radiopharmaceuticalStartTime' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceuticalStartTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceuticalStartTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalStopTime [

	^self dataElementsValues at: 'radiopharmaceuticalStopTime' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceuticalStopTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceuticalStopTime' put: (self dataElementsDictionary removeKey: 'radiopharmaceuticalStopTime') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalStopTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceuticalStopTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceuticalStopTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'radiopharmaceuticalStopTime' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceuticalStopTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceuticalStopTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalVolume [

	^self dataElementsValues at: 'radiopharmaceuticalVolume' ifAbsent: [
		self dataElementsDictionary at: 'radiopharmaceuticalVolume' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiopharmaceuticalVolume' put: (self dataElementsDictionary removeKey: 'radiopharmaceuticalVolume') value.
		]
	]

]

{ #category : #accessing }
RadiopharmaceuticalInformationSequenceItem >> radiopharmaceuticalVolume: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiopharmaceuticalVolume' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiopharmaceuticalVolume.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'radiopharmaceuticalVolume' put: dataElement.
			self dataElementsValues removeKey: 'radiopharmaceuticalVolume' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiopharmaceuticalVolume' put: aDSValue
		]
	].

]
