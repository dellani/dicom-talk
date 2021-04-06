Class {
	#name : #ImagePlaneIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
ImagePlaneIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Image Plane Information Object Module
	PS 3.3-2000 Annex C.7.6.2 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM Image Plane Information Object Module'.
	moduleName := 'imagePlaneIOM'.
	self
		addDataElement:
			(DSDataElement
				newWith: #pixelSpacing
				tag: #(16r0028 16r0030)
				vm: '2'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #imageOrientationPatient
				tag: #(16r0020 16r0037)
				vm: '6'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #imagePositionPatient
				tag: #(16r0020 16r0032)
				vm: '3'
				type: '1').
	self
		addDataElement:
			(DSDataElement
				newWith: #sliceThickness
				tag: #(16r0018 16r0050)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(DSDataElement
				newWith: #sliceLocation
				tag: #(16r0020 16r1041)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
ImagePlaneIOM >> imageOrientationPatient [

	^self dataElementsValues at: 'imageOrientationPatient' ifAbsent: [
		self dataElementsDictionary at: 'imageOrientationPatient' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageOrientationPatient' put: (self dataElementsDictionary removeKey: 'imageOrientationPatient') value.
		]
	]

]

{ #category : #accessing }
ImagePlaneIOM >> imageOrientationPatient: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageOrientationPatient' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageOrientationPatient.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'imageOrientationPatient' put: dataElement.
			self dataElementsValues removeKey: 'imageOrientationPatient' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageOrientationPatient' put: aDSValue
		]
	].

]

{ #category : #accessing }
ImagePlaneIOM >> imagePositionPatient [

	^self dataElementsValues at: 'imagePositionPatient' ifAbsent: [
		self dataElementsDictionary at: 'imagePositionPatient' ifPresent: [:dataElement |
			self dataElementsValues at: 'imagePositionPatient' put: (self dataElementsDictionary removeKey: 'imagePositionPatient') value.
		]
	]

]

{ #category : #accessing }
ImagePlaneIOM >> imagePositionPatient: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imagePositionPatient' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imagePositionPatient.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'imagePositionPatient' put: dataElement.
			self dataElementsValues removeKey: 'imagePositionPatient' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imagePositionPatient' put: aDSValue
		]
	].

]

{ #category : #accessing }
ImagePlaneIOM >> pixelSpacing [

	^self dataElementsValues at: 'pixelSpacing' ifAbsent: [
		self dataElementsDictionary at: 'pixelSpacing' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelSpacing' put: (self dataElementsDictionary removeKey: 'pixelSpacing') value.
		]
	]

]

{ #category : #accessing }
ImagePlaneIOM >> pixelSpacing: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelSpacing' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelSpacing.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'pixelSpacing' put: dataElement.
			self dataElementsValues removeKey: 'pixelSpacing' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelSpacing' put: aDSValue
		]
	].

]

{ #category : #accessing }
ImagePlaneIOM >> sliceLocation [

	^self dataElementsValues at: 'sliceLocation' ifAbsent: [
		self dataElementsDictionary at: 'sliceLocation' ifPresent: [:dataElement |
			self dataElementsValues at: 'sliceLocation' put: (self dataElementsDictionary removeKey: 'sliceLocation') value.
		]
	]

]

{ #category : #accessing }
ImagePlaneIOM >> sliceLocation: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sliceLocation' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sliceLocation.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sliceLocation' put: dataElement.
			self dataElementsValues removeKey: 'sliceLocation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sliceLocation' put: aDSValue
		]
	].

]

{ #category : #accessing }
ImagePlaneIOM >> sliceThickness [

	^self dataElementsValues at: 'sliceThickness' ifAbsent: [
		self dataElementsDictionary at: 'sliceThickness' ifPresent: [:dataElement |
			self dataElementsValues at: 'sliceThickness' put: (self dataElementsDictionary removeKey: 'sliceThickness') value.
		]
	]

]

{ #category : #accessing }
ImagePlaneIOM >> sliceThickness: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sliceThickness' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sliceThickness.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'sliceThickness' put: dataElement.
			self dataElementsValues removeKey: 'sliceThickness' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sliceThickness' put: aDSValue
		]
	].

]
