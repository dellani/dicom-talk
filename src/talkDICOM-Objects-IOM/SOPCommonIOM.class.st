Class {
	#name : #SOPCommonIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SOPCommonIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM SOP Common Information Object Module
	PS 3.3-2000 Annex C.12.1 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM SOP Common Information Object Module'.
	moduleName := 'sopCommonIOM'.
	self
		addDataElement:
			(UIDataElement
				newWith: #sopClassUID
				tag: #(16r0008 16r0016)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(UIDataElement
				newWith: #sopInstanceUID
				tag: #(16r0008 16r0018)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #specificCharacterSet
				tag: #(16r0008 16r0005)
				vm: '1-n'
				type: '1C').
	self
		addDataElement:
			(DADataElement
				newWith: #instanceCreationDate
				tag: #(16r0008 16r0012)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #instanceCreationTime
				tag: #(16r0008 16r0013)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(UIDataElement
				newWith: #instanceCreatorUID
				tag: #(16r0008 16r0014)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(SHDataElement
				newWith: #timezoneOffsetFromUTC
				tag: #(16r0008 16r0201)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(ISDataElement
				newWith: #instanceNumber
				tag: #(16r0020 16r0013)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(CSDataElement
				newWith: #sopInstanceStatus
				tag: #(16r0100 16r0410)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(DTDataElement
				newWith: #sopAuthorizationDateAndTime
				tag: #(16r0100 16r0420)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LTDataElement
				newWith: #sopAuthorizationComment
				tag: #(16r0100 16r0424)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(LODataElement
				newWith: #authorizationEquipmentCertificationNumber
				tag: #(16r0100 16r0426)
				vm: '1'
				type: '3').
	self addDataElement: (CSDataElement newWith: #instanceAvailability tag: #(16r0008 16r0056) vm: '1')
]

{ #category : #accessing }
SOPCommonIOM >> authorizationEquipmentCertificationNumber [

	^self dataElementsValues at: 'authorizationEquipmentCertificationNumber' ifAbsent: [
		self dataElementsDictionary at: 'authorizationEquipmentCertificationNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'authorizationEquipmentCertificationNumber' put: (self dataElementsDictionary removeKey: 'authorizationEquipmentCertificationNumber') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> authorizationEquipmentCertificationNumber: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'authorizationEquipmentCertificationNumber' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #authorizationEquipmentCertificationNumber.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'authorizationEquipmentCertificationNumber' put: dataElement.
			self dataElementsValues removeKey: 'authorizationEquipmentCertificationNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'authorizationEquipmentCertificationNumber' put: aLOValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> instanceAvailability [

	^self dataElementsValues at: 'instanceAvailability' ifAbsent: [
		self dataElementsDictionary at: 'instanceAvailability' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceAvailability' put: (self dataElementsDictionary removeKey: 'instanceAvailability') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> instanceAvailability: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceAvailability' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceAvailability.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'instanceAvailability' put: dataElement.
			self dataElementsValues removeKey: 'instanceAvailability' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceAvailability' put: aCSValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> instanceCreationDate [

	^self dataElementsValues at: 'instanceCreationDate' ifAbsent: [
		self dataElementsDictionary at: 'instanceCreationDate' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceCreationDate' put: (self dataElementsDictionary removeKey: 'instanceCreationDate') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> instanceCreationDate: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceCreationDate' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceCreationDate.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'instanceCreationDate' put: dataElement.
			self dataElementsValues removeKey: 'instanceCreationDate' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceCreationDate' put: aDAValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> instanceCreationTime [

	^self dataElementsValues at: 'instanceCreationTime' ifAbsent: [
		self dataElementsDictionary at: 'instanceCreationTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceCreationTime' put: (self dataElementsDictionary removeKey: 'instanceCreationTime') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> instanceCreationTime: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceCreationTime' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceCreationTime.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'instanceCreationTime' put: dataElement.
			self dataElementsValues removeKey: 'instanceCreationTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceCreationTime' put: aTMValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> instanceCreatorUID [

	^self dataElementsValues at: 'instanceCreatorUID' ifAbsent: [
		self dataElementsDictionary at: 'instanceCreatorUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceCreatorUID' put: (self dataElementsDictionary removeKey: 'instanceCreatorUID') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> instanceCreatorUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'instanceCreatorUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #instanceCreatorUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'instanceCreatorUID' put: dataElement.
			self dataElementsValues removeKey: 'instanceCreatorUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'instanceCreatorUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> instanceNumber [

	^self dataElementsValues at: 'instanceNumber' ifAbsent: [
		self dataElementsDictionary at: 'instanceNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'instanceNumber' put: (self dataElementsDictionary removeKey: 'instanceNumber') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> instanceNumber: aISValue [

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
SOPCommonIOM >> sOPAuthorizationComment [

	^self dataElementsValues at: 'sOPAuthorizationComment' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationComment' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationComment') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> sOPAuthorizationComment: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationComment.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'sOPAuthorizationComment' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationComment' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationComment' put: aLTValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> sOPAuthorizationDateTime [

	^self dataElementsValues at: 'sOPAuthorizationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationDateTime') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> sOPAuthorizationDateTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'sOPAuthorizationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: aDTValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> sOPClassUID [

	^self dataElementsValues at: 'sOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPClassUID' put: (self dataElementsDictionary removeKey: 'sOPClassUID') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> sOPClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> sOPInstanceStatus [

	^self dataElementsValues at: 'sOPInstanceStatus' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceStatus' put: (self dataElementsDictionary removeKey: 'sOPInstanceStatus') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> sOPInstanceStatus: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceStatus.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'sOPInstanceStatus' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceStatus' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceStatus' put: aCSValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> sOPInstanceUID [

	^self dataElementsValues at: 'sOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceUID' put: (self dataElementsDictionary removeKey: 'sOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> sOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopAuthorizationComment [

	^self dataElementsValues at: 'sOPAuthorizationComment' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationComment' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationComment') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopAuthorizationComment: aLTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationComment' ifPresent: [:aDataElement | aDataElement value: aLTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationComment.
			dataElement encoder: self encoder.
			dataElement value: aLTValue.
			self dataElementsDictionary at: 'sOPAuthorizationComment' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationComment' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationComment' put: aLTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopAuthorizationDateAndTime [

	^self dataElementsValues at: 'sOPAuthorizationDateTime' ifAbsent: [
		self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: (self dataElementsDictionary removeKey: 'sOPAuthorizationDateTime') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopAuthorizationDateAndTime: aDTValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPAuthorizationDateTime' ifPresent: [:aDataElement | aDataElement value: aDTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPAuthorizationDateTime.
			dataElement encoder: self encoder.
			dataElement value: aDTValue.
			self dataElementsDictionary at: 'sOPAuthorizationDateTime' put: dataElement.
			self dataElementsValues removeKey: 'sOPAuthorizationDateTime' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPAuthorizationDateTime' put: aDTValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopClassUID [

	^self dataElementsValues at: 'sOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPClassUID' put: (self dataElementsDictionary removeKey: 'sOPClassUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPClassUID' put: aUIValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopInstanceStatus [

	^self dataElementsValues at: 'sOPInstanceStatus' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceStatus' put: (self dataElementsDictionary removeKey: 'sOPInstanceStatus') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopInstanceStatus: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceStatus' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceStatus.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'sOPInstanceStatus' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceStatus' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceStatus' put: aCSValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopInstanceUID [

	^self dataElementsValues at: 'sOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'sOPInstanceUID' put: (self dataElementsDictionary removeKey: 'sOPInstanceUID') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SOPCommonIOM >> sopInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'sOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'sOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'sOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sOPInstanceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> specificCharacterSet [

	^self dataElementsValues at: 'specificCharacterSet' ifAbsent: [
		self dataElementsDictionary at: 'specificCharacterSet' ifPresent: [:dataElement |
			self dataElementsValues at: 'specificCharacterSet' put: (self dataElementsDictionary removeKey: 'specificCharacterSet') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> specificCharacterSet: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'specificCharacterSet' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #specificCharacterSet.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'specificCharacterSet' put: dataElement.
			self dataElementsValues removeKey: 'specificCharacterSet' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'specificCharacterSet' put: aCSValue
		]
	].

]

{ #category : #accessing }
SOPCommonIOM >> timezoneOffsetFromUTC [

	^self dataElementsValues at: 'timezoneOffsetFromUTC' ifAbsent: [
		self dataElementsDictionary at: 'timezoneOffsetFromUTC' ifPresent: [:dataElement |
			self dataElementsValues at: 'timezoneOffsetFromUTC' put: (self dataElementsDictionary removeKey: 'timezoneOffsetFromUTC') value.
		]
	]

]

{ #category : #accessing }
SOPCommonIOM >> timezoneOffsetFromUTC: aSHValue [

	| dataElement |

	(self dataElementsDictionary at: 'timezoneOffsetFromUTC' ifPresent: [:aDataElement | aDataElement value: aSHValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timezoneOffsetFromUTC.
			dataElement encoder: self encoder.
			dataElement value: aSHValue.
			self dataElementsDictionary at: 'timezoneOffsetFromUTC' put: dataElement.
			self dataElementsValues removeKey: 'timezoneOffsetFromUTC' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timezoneOffsetFromUTC' put: aSHValue
		]
	].

]
