Class {
	#name : #OverlayCurveActivationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
OverlayCurveActivationIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Overlay Curve Activation Information Object Module'.
	moduleName := 'overlayCurveActivationIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #curveActivationLayer
				tag: #(16r5000 16r1001)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(CSDataElement
				newWith: #overlayActivationLayer
				tag: #(16r6000 16r1001)
				vm: '1'
				type: '2C')
]

{ #category : #'accessing - talkDICOM names' }
OverlayCurveActivationIOM >> curveActivationLayer [

	^self dataElementsValues at: 'rETIRED_CurveActivationLayer' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveActivationLayer' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveActivationLayer' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveActivationLayer') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
OverlayCurveActivationIOM >> curveActivationLayer: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveActivationLayer' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveActivationLayer.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rETIRED_CurveActivationLayer' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveActivationLayer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveActivationLayer' put: aCSValue
		]
	].

]

{ #category : #accessing }
OverlayCurveActivationIOM >> overlayActivationLayer [

	^self dataElementsValues at: 'overlayActivationLayer' ifAbsent: [
		self dataElementsDictionary at: 'overlayActivationLayer' ifPresent: [:dataElement |
			self dataElementsValues at: 'overlayActivationLayer' put: (self dataElementsDictionary removeKey: 'overlayActivationLayer') value.
		]
	]

]

{ #category : #accessing }
OverlayCurveActivationIOM >> overlayActivationLayer: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'overlayActivationLayer' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #overlayActivationLayer.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'overlayActivationLayer' put: dataElement.
			self dataElementsValues removeKey: 'overlayActivationLayer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'overlayActivationLayer' put: aCSValue
		]
	].

]

{ #category : #accessing }
OverlayCurveActivationIOM >> rETIRED_CurveActivationLayer [

	^self dataElementsValues at: 'rETIRED_CurveActivationLayer' ifAbsent: [
		self dataElementsDictionary at: 'rETIRED_CurveActivationLayer' ifPresent: [:dataElement |
			self dataElementsValues at: 'rETIRED_CurveActivationLayer' put: (self dataElementsDictionary removeKey: 'rETIRED_CurveActivationLayer') value.
		]
	]

]

{ #category : #accessing }
OverlayCurveActivationIOM >> rETIRED_CurveActivationLayer: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'rETIRED_CurveActivationLayer' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #rETIRED_CurveActivationLayer.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'rETIRED_CurveActivationLayer' put: dataElement.
			self dataElementsValues removeKey: 'rETIRED_CurveActivationLayer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'rETIRED_CurveActivationLayer' put: aCSValue
		]
	].

]
