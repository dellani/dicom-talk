Class {
	#name : #SpatialCoordinatesMacroItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects-SequenceItems'
}

{ #category : #'class initialization' }
SpatialCoordinatesMacroItem class >> initialize [
	"DICOM Spatial Coordinates Macro Item - initialization method

	RC - Feb 1st, 2001
	DICOM Structured Reporting"

	self resetDataElements.
	Name := 'DICOM Spatial Coordinates Macro Item'.
	SequenceName := 'spatialCoordinatesMacroItem'.
	"****************** Veja tabela Spatial Coordinates Macro C.18.6-1 *************************"
	self
		addDataElement:
			(FLDataElement
				newWith: #graphicData
				tag: #(16r0070 16r0022)
				vm: '2-2n'
				type: '1').
	self
		addDataElement:
			(CSDataElement
				newWith: #graphicType
				tag: #(16r0070 16r0023)
				vm: '1'
				type: '1')
]

{ #category : #accessing }
SpatialCoordinatesMacroItem >> graphicData [

	^self dataElementsValues at: 'graphicData' ifAbsent: [
		self dataElementsDictionary at: 'graphicData' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicData' put: (self dataElementsDictionary removeKey: 'graphicData') value.
		]
	]

]

{ #category : #accessing }
SpatialCoordinatesMacroItem >> graphicData: aFLValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicData' ifPresent: [:aDataElement | aDataElement value: aFLValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicData.
			dataElement encoder: self encoder.
			dataElement value: aFLValue.
			self dataElementsDictionary at: 'graphicData' put: dataElement.
			self dataElementsValues removeKey: 'graphicData' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicData' put: aFLValue
		]
	].

]

{ #category : #accessing }
SpatialCoordinatesMacroItem >> graphicType [

	^self dataElementsValues at: 'graphicType' ifAbsent: [
		self dataElementsDictionary at: 'graphicType' ifPresent: [:dataElement |
			self dataElementsValues at: 'graphicType' put: (self dataElementsDictionary removeKey: 'graphicType') value.
		]
	]

]

{ #category : #accessing }
SpatialCoordinatesMacroItem >> graphicType: aCSValue [

	| dataElement |

	(self dataElementsDictionary at: 'graphicType' ifPresent: [:aDataElement | aDataElement value: aCSValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #graphicType.
			dataElement encoder: self encoder.
			dataElement value: aCSValue.
			self dataElementsDictionary at: 'graphicType' put: dataElement.
			self dataElementsValues removeKey: 'graphicType' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'graphicType' put: aCSValue
		]
	].

]
