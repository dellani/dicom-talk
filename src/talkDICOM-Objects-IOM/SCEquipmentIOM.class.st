Class {
	#name : #SCEquipmentIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SCEquipmentIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM SC Equipment Information Object Module
	PS 3.3-2001 Annex C.8.6.1 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM SC Equipment Information Object Module'.
	moduleName := 'scEquipmentIOM'.
	self
		addDataElement:
			(CSDataElement
				newWith: #conversionType
				tag: #(16r0008 16r0064)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #modality
				tag: #(16r0008 16r0060)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #secondaryCaptureDeviceID
				tag: #(16r0018 16r1010)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #secondaryCaptureDeviceManufacturer
				tag: #(16r0018 16r1016)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #secondaryCaptureDeviceManufacturersModelName
				tag: #(16r0018 16r1018)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #secondaryCaptureDeviceSoftwareVersions
				tag: #(16r0018 16r1019)
				vm: '1-n'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #videoImageFormatAcquired
				tag: #(16r0018 16r1022)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #digitalImageFormatAcquired
				tag: #(16r0018 16r1023)
				vm: '1'
				type: '3')
]

{ #category : #accessing }
SCEquipmentIOM >> conversionType [

	^self dataElementsValues at: 'conversionType' ifAbsent: [
		self dataElementsDictionary at: 'conversionType' ifPresent: [:dataElement |
			self dataElementsValues at: 'conversionType' put: (self dataElementsDictionary removeKey: 'conversionType') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> conversionType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'conversionType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #conversionType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'conversionType' put: dataElement.
			self dataElementsValues removeKey: 'conversionType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'conversionType' put: aCSValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> digitalImageFormatAcquired [

	^self dataElementsValues at: 'digitalImageFormatAcquired' ifAbsent: [
		self dataElementsDictionary at: 'digitalImageFormatAcquired' ifPresent: [:dataElement |
			self dataElementsValues at: 'digitalImageFormatAcquired' put: (self dataElementsDictionary removeKey: 'digitalImageFormatAcquired') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> digitalImageFormatAcquired: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'digitalImageFormatAcquired' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #digitalImageFormatAcquired.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'digitalImageFormatAcquired' put: dataElement.
			self dataElementsValues removeKey: 'digitalImageFormatAcquired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'digitalImageFormatAcquired' put: aLOValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> modality [

	^self dataElementsValues at: 'modality' ifAbsent: [
		self dataElementsDictionary at: 'modality' ifPresent: [:dataElement |
			self dataElementsValues at: 'modality' put: (self dataElementsDictionary removeKey: 'modality') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> modality: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'modality' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #modality.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'modality' put: dataElement.
			self dataElementsValues removeKey: 'modality' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'modality' put: aCSValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceID [

	^self dataElementsValues at: 'secondaryCaptureDeviceID' ifAbsent: [
		self dataElementsDictionary at: 'secondaryCaptureDeviceID' ifPresent: [:dataElement |
			self dataElementsValues at: 'secondaryCaptureDeviceID' put: (self dataElementsDictionary removeKey: 'secondaryCaptureDeviceID') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceID: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'secondaryCaptureDeviceID' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #secondaryCaptureDeviceID.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'secondaryCaptureDeviceID' put: dataElement.
			self dataElementsValues removeKey: 'secondaryCaptureDeviceID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'secondaryCaptureDeviceID' put: aLOValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceManufacturer [

	^self dataElementsValues at: 'secondaryCaptureDeviceManufacturer' ifAbsent: [
		self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturer' ifPresent: [:dataElement |
			self dataElementsValues at: 'secondaryCaptureDeviceManufacturer' put: (self dataElementsDictionary removeKey: 'secondaryCaptureDeviceManufacturer') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceManufacturer: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturer' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #secondaryCaptureDeviceManufacturer.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturer' put: dataElement.
			self dataElementsValues removeKey: 'secondaryCaptureDeviceManufacturer' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'secondaryCaptureDeviceManufacturer' put: aLOValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceManufacturerModelName [

	^self dataElementsValues at: 'secondaryCaptureDeviceManufacturerModelName' ifAbsent: [
		self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturerModelName' ifPresent: [:dataElement |
			self dataElementsValues at: 'secondaryCaptureDeviceManufacturerModelName' put: (self dataElementsDictionary removeKey: 'secondaryCaptureDeviceManufacturerModelName') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceManufacturerModelName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturerModelName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #secondaryCaptureDeviceManufacturerModelName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturerModelName' put: dataElement.
			self dataElementsValues removeKey: 'secondaryCaptureDeviceManufacturerModelName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'secondaryCaptureDeviceManufacturerModelName' put: aLOValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SCEquipmentIOM >> secondaryCaptureDeviceManufacturersModelName [

	^self dataElementsValues at: 'secondaryCaptureDeviceManufacturerModelName' ifAbsent: [
		self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturerModelName' ifPresent: [:dataElement |
			self dataElementsValues at: 'secondaryCaptureDeviceManufacturerModelName' put: (self dataElementsDictionary removeKey: 'secondaryCaptureDeviceManufacturerModelName') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SCEquipmentIOM >> secondaryCaptureDeviceManufacturersModelName: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturerModelName' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #secondaryCaptureDeviceManufacturerModelName.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'secondaryCaptureDeviceManufacturerModelName' put: dataElement.
			self dataElementsValues removeKey: 'secondaryCaptureDeviceManufacturerModelName' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'secondaryCaptureDeviceManufacturerModelName' put: aLOValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceSoftwareVersions [

	^self dataElementsValues at: 'secondaryCaptureDeviceSoftwareVersions' ifAbsent: [
		self dataElementsDictionary at: 'secondaryCaptureDeviceSoftwareVersions' ifPresent: [:dataElement |
			self dataElementsValues at: 'secondaryCaptureDeviceSoftwareVersions' put: (self dataElementsDictionary removeKey: 'secondaryCaptureDeviceSoftwareVersions') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> secondaryCaptureDeviceSoftwareVersions: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'secondaryCaptureDeviceSoftwareVersions' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #secondaryCaptureDeviceSoftwareVersions.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'secondaryCaptureDeviceSoftwareVersions' put: dataElement.
			self dataElementsValues removeKey: 'secondaryCaptureDeviceSoftwareVersions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'secondaryCaptureDeviceSoftwareVersions' put: aLOValue
		]
	].

]

{ #category : #accessing }
SCEquipmentIOM >> videoImageFormatAcquired [

	^self dataElementsValues at: 'videoImageFormatAcquired' ifAbsent: [
		self dataElementsDictionary at: 'videoImageFormatAcquired' ifPresent: [:dataElement |
			self dataElementsValues at: 'videoImageFormatAcquired' put: (self dataElementsDictionary removeKey: 'videoImageFormatAcquired') value.
		]
	]

]

{ #category : #accessing }
SCEquipmentIOM >> videoImageFormatAcquired: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'videoImageFormatAcquired' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #videoImageFormatAcquired.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'videoImageFormatAcquired' put: dataElement.
			self dataElementsValues removeKey: 'videoImageFormatAcquired' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'videoImageFormatAcquired' put: aSHValue
		]
	].

]
