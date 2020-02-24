Class {
	#name : #BitmapDisplayShutterIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
BitmapDisplayShutterIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM Bitmap Display Shutter Information Object Module'.
	moduleName := 'bitmapDisplayShutterIOM'.

	"***** Begin of data elements definition *******"
	self
		addDataElement:
			(CSDataElement
				newWith: #shutterShape
				tag: #(16r18 16r1600)
				vm: '1-3'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #shutterPresentationValue
				tag: #(16r18 16r1622)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(USDataElement
				newWith: #shutterOverlayGroup
				tag: #(16r18 16r1623)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
BitmapDisplayShutterIOM >> shutterOverlayGroup [

	^self dataElementsValues at: 'shutterOverlayGroup' ifAbsent: [
		self dataElementsDictionary at: 'shutterOverlayGroup' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterOverlayGroup' put: (self dataElementsDictionary removeKey: 'shutterOverlayGroup') value.
		]
	]

]

{ #category : #accessing }
BitmapDisplayShutterIOM >> shutterOverlayGroup: aUSValue [

	| dataElement |

	(self dataElementsDictionary at: 'shutterOverlayGroup' ifPresent: [:aDataElement | aDataElement value: aUSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #shutterOverlayGroup.
			dataElement encoder: self encoder.
			dataElement value: aUSValue.
			self dataElementsDictionary at: 'shutterOverlayGroup' put: dataElement.
			self dataElementsValues removeKey: 'shutterOverlayGroup' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'shutterOverlayGroup' put: aUSValue
		]
	].

]

{ #category : #accessing }
BitmapDisplayShutterIOM >> shutterPresentationValue [

	^self dataElementsValues at: 'shutterPresentationValue' ifAbsent: [
		self dataElementsDictionary at: 'shutterPresentationValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterPresentationValue' put: (self dataElementsDictionary removeKey: 'shutterPresentationValue') value.
		]
	]

]

{ #category : #accessing }
BitmapDisplayShutterIOM >> shutterPresentationValue: aUSValue [

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
BitmapDisplayShutterIOM >> shutterShape [

	^self dataElementsValues at: 'shutterShape' ifAbsent: [
		self dataElementsDictionary at: 'shutterShape' ifPresent: [:dataElement |
			self dataElementsValues at: 'shutterShape' put: (self dataElementsDictionary removeKey: 'shutterShape') value.
		]
	]

]

{ #category : #accessing }
BitmapDisplayShutterIOM >> shutterShape: aCSValue [

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
