Class {
	#name : #DisplayShutterIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
DisplayShutterIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Display Shutter IOM'.
	moduleName := 'displayShutterIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #shutterShape
				tag: #(16r18 16r1600)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(ISDataElement
				newWith: #shutterLeftVerticalEdge
				tag: #(16r18 16r1602)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #shutterRightVerticalEdge
				tag: #(16r18 16r1604)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #shutterUpperHorizontalEdge
				tag: #(16r18 16r1606)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #shutterLowerHorizontalEdge
				tag: #(16r18 16r1608)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #centerOfCircularShutter
				tag: #(16r18 16r1610)
				vm: '2'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #radiusOfCircularShutter
				tag: #(16r18 16r1612)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #verticesOfThePolygonalShutter
				tag: #(16r18 16r1620)
				vm: '2-2n'
				type: '1C').
	self
		addDataElement:
			(USDataElement
				newWith: #shutterPresentationValue
				tag: #(16r18 16r1622)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
DisplayShutterIOM >> centerOfCircularShutter [

	^self dataElementsValues at: 'centerOfCircularShutter' ifAbsent: [
		self dataElementsDictionary at: 'centerOfCircularShutter' ifPresent: [:dataElement |
			self dataElementsValues at: 'centerOfCircularShutter' put: (self dataElementsDictionary removeKey: 'centerOfCircularShutter') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> centerOfCircularShutter: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'centerOfCircularShutter' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #centerOfCircularShutter.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'centerOfCircularShutter' put: dataElement.
			self dataElementsValues removeKey: 'centerOfCircularShutter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'centerOfCircularShutter' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> radiusOfCircularShutter [

	^self dataElementsValues at: 'radiusOfCircularShutter' ifAbsent: [
		self dataElementsDictionary at: 'radiusOfCircularShutter' ifPresent: [:dataElement |
			self dataElementsValues at: 'radiusOfCircularShutter' put: (self dataElementsDictionary removeKey: 'radiusOfCircularShutter') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> radiusOfCircularShutter: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'radiusOfCircularShutter' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #radiusOfCircularShutter.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'radiusOfCircularShutter' put: dataElement.
			self dataElementsValues removeKey: 'radiusOfCircularShutter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'radiusOfCircularShutter' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> shutterLeftVerticalEdge [

	^self dataElementsValues at: 'shutterLeftVerticalEdge' ifAbsent: [
		self dataElementsDictionary at: 'shutterLeftVerticalEdge' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterLeftVerticalEdge' put: (self dataElementsDictionary removeKey: 'shutterLeftVerticalEdge') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> shutterLeftVerticalEdge: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterLeftVerticalEdge' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterLeftVerticalEdge.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'shutterLeftVerticalEdge' put: dataElement.
			self dataElementsValues removeKey: 'shutterLeftVerticalEdge' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterLeftVerticalEdge' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> shutterLowerHorizontalEdge [

	^self dataElementsValues at: 'shutterLowerHorizontalEdge' ifAbsent: [
		self dataElementsDictionary at: 'shutterLowerHorizontalEdge' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterLowerHorizontalEdge' put: (self dataElementsDictionary removeKey: 'shutterLowerHorizontalEdge') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> shutterLowerHorizontalEdge: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterLowerHorizontalEdge' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterLowerHorizontalEdge.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'shutterLowerHorizontalEdge' put: dataElement.
			self dataElementsValues removeKey: 'shutterLowerHorizontalEdge' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterLowerHorizontalEdge' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> shutterPresentationValue [

	^self dataElementsValues at: 'shutterPresentationValue' ifAbsent: [
		self dataElementsDictionary at: 'shutterPresentationValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterPresentationValue' put: (self dataElementsDictionary removeKey: 'shutterPresentationValue') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> shutterPresentationValue: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterPresentationValue' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterPresentationValue.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'shutterPresentationValue' put: dataElement.
			self dataElementsValues removeKey: 'shutterPresentationValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterPresentationValue' put: aUSValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> shutterRightVerticalEdge [

	^self dataElementsValues at: 'shutterRightVerticalEdge' ifAbsent: [
		self dataElementsDictionary at: 'shutterRightVerticalEdge' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterRightVerticalEdge' put: (self dataElementsDictionary removeKey: 'shutterRightVerticalEdge') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> shutterRightVerticalEdge: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterRightVerticalEdge' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterRightVerticalEdge.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'shutterRightVerticalEdge' put: dataElement.
			self dataElementsValues removeKey: 'shutterRightVerticalEdge' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterRightVerticalEdge' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> shutterShape [

	^self dataElementsValues at: 'shutterShape' ifAbsent: [
		self dataElementsDictionary at: 'shutterShape' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterShape' put: (self dataElementsDictionary removeKey: 'shutterShape') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> shutterShape: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterShape' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterShape.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'shutterShape' put: dataElement.
			self dataElementsValues removeKey: 'shutterShape' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterShape' put: aCSValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> shutterUpperHorizontalEdge [

	^self dataElementsValues at: 'shutterUpperHorizontalEdge' ifAbsent: [
		self dataElementsDictionary at: 'shutterUpperHorizontalEdge' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterUpperHorizontalEdge' put: (self dataElementsDictionary removeKey: 'shutterUpperHorizontalEdge') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> shutterUpperHorizontalEdge: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterUpperHorizontalEdge' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterUpperHorizontalEdge.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'shutterUpperHorizontalEdge' put: dataElement.
			self dataElementsValues removeKey: 'shutterUpperHorizontalEdge' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterUpperHorizontalEdge' put: aISValue
		]
	].

]

{ #category : #accessing }
DisplayShutterIOM >> verticesOfThePolygonalShutter [

	^self dataElementsValues at: 'verticesOfThePolygonalShutter' ifAbsent: [
		self dataElementsDictionary at: 'verticesOfThePolygonalShutter' ifPresent: [:dataElement |
			self dataElementsValues at: 'verticesOfThePolygonalShutter' put: (self dataElementsDictionary removeKey: 'verticesOfThePolygonalShutter') value.
		]
	]

]

{ #category : #accessing }
DisplayShutterIOM >> verticesOfThePolygonalShutter: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'verticesOfThePolygonalShutter' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #verticesOfThePolygonalShutter.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'verticesOfThePolygonalShutter' put: dataElement.
			self dataElementsValues removeKey: 'verticesOfThePolygonalShutter' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'verticesOfThePolygonalShutter' put: aISValue
		]
	].

]
