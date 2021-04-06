Class {
	#name : #GeneralImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
GeneralImageIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM General Image Information Object Module
	PS 3.3-2000 Annex C.7.6.1 - PRD 04-10.2001"

	self resetDataElements.
	Name := 'DICOM General Image Information Object Module'.
	moduleName := 'generalImageIOM'.
	self
		addDataElement:
			(ISDataElement
				newWith: #instanceNumber
				tag: #(16r0020 16r0013)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(CSDataElement
				newWith: #patientOrientation
				tag: #(16r0020 16r0020)
				vm: '2'
				type: '2C').
	self
		addDataElement:
			(DADataElement
				newWith: #contentDate
				tag: #(16r0008 16r0023)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(TMDataElement
				newWith: #contentTime
				tag: #(16r0008 16r0033)
				vm: '1'
				type: '2C').
	self
		addDataElement:
			(CSDataElement
				newWith: #imageType
				tag: #(16r0008 16r0008)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #acquisitionNumber
				tag: #(16r0020 16r0012)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DADataElement
				newWith: #acquisitionDate
				tag: #(16r0008 16r0022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #acquisitionTime
				tag: #(16r0008 16r0032)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DTDataElement
				newWith: #acquisitionDateTime
				tag: #(16r0008 16r002A)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #referencedImageSequence
				tag: #(16r0008 16r1140)
				vm: '1'
				type: '3'
				sequenceItemClass: ReferencedImageSequenceItem).
	self
		addDataElement:
			(STDataElement
				newWith: #derivationDescription
				tag: #(16r0008 16r2111)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SQDataElement
				newWith: #sourceImageSequence
				tag: #(16r0008 16r2112)
				vm: '1'
				type: '3'
				sequenceItemClass: SourceImageSequenceItem).
	self
		addDataElement:
			(ISDataElement
				newWith: #imagesInAcquisition
				tag: #(16r0020 16r1002)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LTDataElement
				newWith: #imageComments
				tag: #(16r0020 16r4000)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #qualityControlImage
				tag: #(16r0028 16r0300)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #burnedInAnnotation
				tag: #(16r0028 16r0301)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #lossyImageCompression
				tag: #(16r0028 16r2110)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #lossyImageCompressionRatio
				tag: #(16r0028 16r2112)
				vm: '1-n'
				type: '3')
]

{ #category : #accessing }
GeneralImageIOM >> acquisitionDate [

	^self dataElementsValues at: 'acquisitionDate' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDate' put: (self dataElementsDictionary removeKey: 'acquisitionDate') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'acquisitionDate' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionDateTime [

	^self dataElementsValues at: 'acquisitionDateTime' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionDateTime' put: (self dataElementsDictionary removeKey: 'acquisitionDateTime') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'acquisitionDateTime' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionNumber [

	^self dataElementsValues at: 'acquisitionNumber' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionNumber' put: (self dataElementsDictionary removeKey: 'acquisitionNumber') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'acquisitionNumber' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionTime [

	^self dataElementsValues at: 'acquisitionTime' ifAbsent: [
		self dataElementsDictionary at: 'acquisitionTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'acquisitionTime' put: (self dataElementsDictionary removeKey: 'acquisitionTime') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> acquisitionTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'acquisitionTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #acquisitionTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'acquisitionTime' put: dataElement.
			self dataElementsValues removeKey: 'acquisitionTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'acquisitionTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> burnedInAnnotation [

	^self dataElementsValues at: 'burnedInAnnotation' ifAbsent: [
		self dataElementsDictionary at: 'burnedInAnnotation' ifPresent: [:dataElement |
			self dataElementsValues at: 'burnedInAnnotation' put: (self dataElementsDictionary removeKey: 'burnedInAnnotation') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> burnedInAnnotation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'burnedInAnnotation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #burnedInAnnotation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'burnedInAnnotation' put: dataElement.
			self dataElementsValues removeKey: 'burnedInAnnotation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'burnedInAnnotation' put: aCSValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> contentDate [

	^self dataElementsValues at: 'contentDate' ifAbsent: [
		self dataElementsDictionary at: 'contentDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentDate' put: (self dataElementsDictionary removeKey: 'contentDate') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> contentDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'contentDate' put: dataElement.
			self dataElementsValues removeKey: 'contentDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> contentTime [

	^self dataElementsValues at: 'contentTime' ifAbsent: [
		self dataElementsDictionary at: 'contentTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'contentTime' put: (self dataElementsDictionary removeKey: 'contentTime') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> contentTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'contentTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #contentTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'contentTime' put: dataElement.
			self dataElementsValues removeKey: 'contentTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'contentTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> derivationDescription [

	^self dataElementsValues at: 'derivationDescription' ifAbsent: [
		self dataElementsDictionary at: 'derivationDescription' ifPresent: [:dataElement |
			self dataElementsValues at: 'derivationDescription' put: (self dataElementsDictionary removeKey: 'derivationDescription') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> derivationDescription: aSTValue [

	| dataElement |

	(self dataElementsDictionary at: 'derivationDescription' ifPresent: [:aDataElement | aDataElement value: aSTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #derivationDescription.
			dataElement encoder: self encoder.
			dataElement value: aSTValue.
			self dataElementsDictionary at: 'derivationDescription' put: dataElement.
			self dataElementsValues removeKey: 'derivationDescription' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'derivationDescription' put: aSTValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> imageComments [

	^self dataElementsValues at: 'imageComments' ifAbsent: [
		self dataElementsDictionary at: 'imageComments' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageComments' put: (self dataElementsDictionary removeKey: 'imageComments') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> imageComments: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageComments' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageComments.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'imageComments' put: dataElement.
			self dataElementsValues removeKey: 'imageComments' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageComments' put: aLTValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> imageType [

	^self dataElementsValues at: 'imageType' ifAbsent: [
		self dataElementsDictionary at: 'imageType' ifPresent: [:dataElement |
			self dataElementsValues at: 'imageType' put: (self dataElementsDictionary removeKey: 'imageType') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> imageType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'imageType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imageType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'imageType' put: dataElement.
			self dataElementsValues removeKey: 'imageType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imageType' put: aCSValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> imagesInAcquisition [

	^self dataElementsValues at: 'imagesInAcquisition' ifAbsent: [
		self dataElementsDictionary at: 'imagesInAcquisition' ifPresent: [:dataElement |
			self dataElementsValues at: 'imagesInAcquisition' put: (self dataElementsDictionary removeKey: 'imagesInAcquisition') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> imagesInAcquisition: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'imagesInAcquisition' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #imagesInAcquisition.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'imagesInAcquisition' put: dataElement.
			self dataElementsValues removeKey: 'imagesInAcquisition' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'imagesInAcquisition' put: aISValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> instanceNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'instanceNumber' put: dataElement.
			self dataElementsValues removeKey: 'instanceNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> lossyImageCompression [

	^self dataElementsValues at: 'lossyImageCompression' ifAbsent: [
		self dataElementsDictionary at: 'lossyImageCompression' ifPresent: [:dataElement |
			self dataElementsValues at: 'lossyImageCompression' put: (self dataElementsDictionary removeKey: 'lossyImageCompression') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> lossyImageCompression: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'lossyImageCompression' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lossyImageCompression.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'lossyImageCompression' put: dataElement.
			self dataElementsValues removeKey: 'lossyImageCompression' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lossyImageCompression' put: aCSValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> lossyImageCompressionRatio [

	^self dataElementsValues at: 'lossyImageCompressionRatio' ifAbsent: [
		self dataElementsDictionary at: 'lossyImageCompressionRatio' ifPresent: [:dataElement |
			self dataElementsValues at: 'lossyImageCompressionRatio' put: (self dataElementsDictionary removeKey: 'lossyImageCompressionRatio') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> lossyImageCompressionRatio: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'lossyImageCompressionRatio' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #lossyImageCompressionRatio.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'lossyImageCompressionRatio' put: dataElement.
			self dataElementsValues removeKey: 'lossyImageCompressionRatio' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'lossyImageCompressionRatio' put: aDSValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> patientOrientation [

	^self dataElementsValues at: 'patientOrientation' ifAbsent: [
		self dataElementsDictionary at: 'patientOrientation' ifPresent: [:dataElement |
			self dataElementsValues at: 'patientOrientation' put: (self dataElementsDictionary removeKey: 'patientOrientation') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> patientOrientation: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'patientOrientation' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #patientOrientation.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'patientOrientation' put: dataElement.
			self dataElementsValues removeKey: 'patientOrientation' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'patientOrientation' put: aCSValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> qualityControlImage [

	^self dataElementsValues at: 'qualityControlImage' ifAbsent: [
		self dataElementsDictionary at: 'qualityControlImage' ifPresent: [:dataElement |
			self dataElementsValues at: 'qualityControlImage' put: (self dataElementsDictionary removeKey: 'qualityControlImage') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> qualityControlImage: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'qualityControlImage' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #qualityControlImage.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'qualityControlImage' put: dataElement.
			self dataElementsValues removeKey: 'qualityControlImage' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'qualityControlImage' put: aCSValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> referencedImageSequence [

	^self dataElementsValues at: 'referencedImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedImageSequence' put: (self dataElementsDictionary removeKey: 'referencedImageSequence') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> referencedImageSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedImageSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedImageSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'referencedImageSequence' put: dataElement.
			self dataElementsValues removeKey: 'referencedImageSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedImageSequence' put: aSQValue
		]
	].

]

{ #category : #accessing }
GeneralImageIOM >> sourceImageSequence [

	^self dataElementsValues at: 'sourceImageSequence' ifAbsent: [
		self dataElementsDictionary at: 'sourceImageSequence' ifPresent: [:dataElement |
			self dataElementsValues at: 'sourceImageSequence' put: (self dataElementsDictionary removeKey: 'sourceImageSequence') value.
		]
	]

]

{ #category : #accessing }
GeneralImageIOM >> sourceImageSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'sourceImageSequence' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sourceImageSequence.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'sourceImageSequence' put: dataElement.
			self dataElementsValues removeKey: 'sourceImageSequence' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sourceImageSequence' put: aSQValue
		]
	].

]
