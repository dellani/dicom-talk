Class {
	#name : #GeneralEquipmentIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
GeneralEquipmentIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM General Equipment Information Object Module
	PS 3.3-2000 Annex C.7.5.1 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'General Equipment Information Object Module'.
	moduleName := 'generalEquipmentIOM'.
	self
		addDataElement:
			(LODataElement
				newWith: #manufacturer
				tag: #(16r0008 16r0070)
				vm: '1'
				type: '2').
	self
		addDataElement:
			(LODataElement
				newWith: #institutionName
				tag: #(16r0008 16r0080)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(STDataElement
				newWith: #institutionAddress
				tag: #(16r0008 16r0081)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #stationName
				tag: #(16r0008 16r1010)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #institutionalDepartmentName
				tag: #(16r0008 16r1040)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #manufacturersModelName
				tag: #(16r0008 16r1090)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #deviceSerialNumber
				tag: #(16r0018 16r1000)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #softwareVersions
				tag: #(16r0018 16r1020)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(DSDataElement
				newWith: #spatialResolution
				tag: #(16r0018 16r1050)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DADataElement
				newWith: #dateOfLastCalibration
				tag: #(16r0018 16r1200)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #timeOfLastCalibration
				tag: #(16r0018 16r1201)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SSDataElement
				newWith: #pixelPaddingValue
				tag: #(16r0028 16r0120)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
GeneralEquipmentIOM >> dateOfLastCalibration [

	^self dataElementsValues at: 'dateOfLastCalibration' ifAbsent: [
		self dataElementsDictionary at: 'dateOfLastCalibration' ifPresent: [:dataElement |
			self dataElementsValues at: 'dateOfLastCalibration' put: (self dataElementsDictionary removeKey: 'dateOfLastCalibration') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> dateOfLastCalibration: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'dateOfLastCalibration' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dateOfLastCalibration.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'dateOfLastCalibration' put: dataElement.
			self dataElementsValues removeKey: 'dateOfLastCalibration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dateOfLastCalibration' put: aDAValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> deviceSerialNumber [

	^self dataElementsValues at: 'deviceSerialNumber' ifAbsent: [
		self dataElementsDictionary at: 'deviceSerialNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'deviceSerialNumber' put: (self dataElementsDictionary removeKey: 'deviceSerialNumber') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> deviceSerialNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'deviceSerialNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #deviceSerialNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'deviceSerialNumber' put: dataElement.
			self dataElementsValues removeKey: 'deviceSerialNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'deviceSerialNumber' put: aLOValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> institutionAddress [

	^self dataElementsValues at: 'institutionAddress' ifAbsent: [
		self dataElementsDictionary at: 'institutionAddress' ifPresent: [:dataElement |
			self dataElementsValues at: 'institutionAddress' put: (self dataElementsDictionary removeKey: 'institutionAddress') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> institutionAddress: aSTValue [

	| dataElement |

	(self dataElementsDictionary at: 'institutionAddress' ifPresent: [:aDataElement | aDataElement value: aSTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #institutionAddress.
			dataElement encoder: self encoder.
			dataElement value: aSTValue.
			self dataElementsDictionary at: 'institutionAddress' put: dataElement.
			self dataElementsValues removeKey: 'institutionAddress' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'institutionAddress' put: aSTValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> institutionName [

	^self dataElementsValues at: 'institutionName' ifAbsent: [
		self dataElementsDictionary at: 'institutionName' ifPresent: [:dataElement |
			self dataElementsValues at: 'institutionName' put: (self dataElementsDictionary removeKey: 'institutionName') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> institutionName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'institutionName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #institutionName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'institutionName' put: dataElement.
			self dataElementsValues removeKey: 'institutionName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'institutionName' put: aLOValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> institutionalDepartmentName [

	^self dataElementsValues at: 'institutionalDepartmentName' ifAbsent: [
		self dataElementsDictionary at: 'institutionalDepartmentName' ifPresent: [:dataElement |
			self dataElementsValues at: 'institutionalDepartmentName' put: (self dataElementsDictionary removeKey: 'institutionalDepartmentName') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> institutionalDepartmentName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'institutionalDepartmentName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #institutionalDepartmentName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'institutionalDepartmentName' put: dataElement.
			self dataElementsValues removeKey: 'institutionalDepartmentName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'institutionalDepartmentName' put: aLOValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> manufacturer [

	^self dataElementsValues at: 'manufacturer' ifAbsent: [
		self dataElementsDictionary at: 'manufacturer' ifPresent: [:dataElement |
			self dataElementsValues at: 'manufacturer' put: (self dataElementsDictionary removeKey: 'manufacturer') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> manufacturer: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'manufacturer' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #manufacturer.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'manufacturer' put: dataElement.
			self dataElementsValues removeKey: 'manufacturer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'manufacturer' put: aLOValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> manufacturerModelName [

	^self dataElementsValues at: 'manufacturerModelName' ifAbsent: [
		self dataElementsDictionary at: 'manufacturerModelName' ifPresent: [:dataElement |
			self dataElementsValues at: 'manufacturerModelName' put: (self dataElementsDictionary removeKey: 'manufacturerModelName') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> manufacturerModelName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'manufacturerModelName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #manufacturerModelName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'manufacturerModelName' put: dataElement.
			self dataElementsValues removeKey: 'manufacturerModelName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'manufacturerModelName' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
GeneralEquipmentIOM >> manufacturersModelName [

	^self dataElementsValues at: 'manufacturerModelName' ifAbsent: [
		self dataElementsDictionary at: 'manufacturerModelName' ifPresent: [:dataElement |
			self dataElementsValues at: 'manufacturerModelName' put: (self dataElementsDictionary removeKey: 'manufacturerModelName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
GeneralEquipmentIOM >> manufacturersModelName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'manufacturerModelName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #manufacturerModelName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'manufacturerModelName' put: dataElement.
			self dataElementsValues removeKey: 'manufacturerModelName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'manufacturerModelName' put: aLOValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> pixelPaddingValue [

	^self dataElementsValues at: 'pixelPaddingValue' ifAbsent: [
		self dataElementsDictionary at: 'pixelPaddingValue' ifPresent: [:dataElement |
			self dataElementsValues at: 'pixelPaddingValue' put: (self dataElementsDictionary removeKey: 'pixelPaddingValue') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> pixelPaddingValue: aSSValue [

	| dataElement |

	(self dataElementsDictionary at: 'pixelPaddingValue' ifPresent: [:aDataElement | aDataElement value: aSSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #pixelPaddingValue.
			dataElement encoder: self encoder.
			dataElement value: aSSValue.
			self dataElementsDictionary at: 'pixelPaddingValue' put: dataElement.
			self dataElementsValues removeKey: 'pixelPaddingValue' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'pixelPaddingValue' put: aSSValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> softwareVersions [

	^self dataElementsValues at: 'softwareVersions' ifAbsent: [
		self dataElementsDictionary at: 'softwareVersions' ifPresent: [:dataElement |
			self dataElementsValues at: 'softwareVersions' put: (self dataElementsDictionary removeKey: 'softwareVersions') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> softwareVersions: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'softwareVersions' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #softwareVersions.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'softwareVersions' put: dataElement.
			self dataElementsValues removeKey: 'softwareVersions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'softwareVersions' put: aLOValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> spatialResolution [

	^self dataElementsValues at: 'spatialResolution' ifAbsent: [
		self dataElementsDictionary at: 'spatialResolution' ifPresent: [:dataElement |
			self dataElementsValues at: 'spatialResolution' put: (self dataElementsDictionary removeKey: 'spatialResolution') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> spatialResolution: aDSValue [

	| dataElement |

	(self dataElementsDictionary at: 'spatialResolution' ifPresent: [:aDataElement | aDataElement value: aDSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #spatialResolution.
			dataElement encoder: self encoder.
			dataElement value: aDSValue.
			self dataElementsDictionary at: 'spatialResolution' put: dataElement.
			self dataElementsValues removeKey: 'spatialResolution' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'spatialResolution' put: aDSValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> stationName [

	^self dataElementsValues at: 'stationName' ifAbsent: [
		self dataElementsDictionary at: 'stationName' ifPresent: [:dataElement |
			self dataElementsValues at: 'stationName' put: (self dataElementsDictionary removeKey: 'stationName') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> stationName: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'stationName' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #stationName.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'stationName' put: dataElement.
			self dataElementsValues removeKey: 'stationName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'stationName' put: aSHValue
		]
	].

]

{ #category : #accessing }
GeneralEquipmentIOM >> timeOfLastCalibration [

	^self dataElementsValues at: 'timeOfLastCalibration' ifAbsent: [
		self dataElementsDictionary at: 'timeOfLastCalibration' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeOfLastCalibration' put: (self dataElementsDictionary removeKey: 'timeOfLastCalibration') value.
		]
	]

]

{ #category : #accessing }
GeneralEquipmentIOM >> timeOfLastCalibration: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeOfLastCalibration' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeOfLastCalibration.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'timeOfLastCalibration' put: dataElement.
			self dataElementsValues removeKey: 'timeOfLastCalibration' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeOfLastCalibration' put: aTMValue
		]
	].

]
