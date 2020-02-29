Class {
	#name : #USRegionCalibrationIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
USRegionCalibrationIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the 
	DICOM US Region Calibration Information Object Module
	PS 3.3-2001 Annex C.8.5.5 - PRD 05.2002"

	self resetDataElements.
	Name := 'DICOM US Region Calibration Information Object Module'.
	moduleName := 'usRegionCalibrationIOM'.
	self
		addDataElement:
			(SQDataElement
				newWith: #ultrasoundRegionsSequence
				tag: #(16r0018 16r6011)
				vm: '1'
				type: '1'
				sequenceItemClass: UltrasoundRegionsSequenceItem)
]

{ #category : #checking }
USRegionCalibrationIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
USRegionCalibrationIOM >> sequenceOfUltrasoundRegions [

	^self dataElementsValues at: 'sequenceOfUltrasoundRegions' ifAbsent: [
		self dataElementsDictionary at: 'sequenceOfUltrasoundRegions' ifPresent: [:dataElement |
			self dataElementsValues at: 'sequenceOfUltrasoundRegions' put: (self dataElementsDictionary removeKey: 'sequenceOfUltrasoundRegions') value.
		]
	]

]

{ #category : #accessing }
USRegionCalibrationIOM >> sequenceOfUltrasoundRegions: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'sequenceOfUltrasoundRegions' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sequenceOfUltrasoundRegions.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'sequenceOfUltrasoundRegions' put: dataElement.
			self dataElementsValues removeKey: 'sequenceOfUltrasoundRegions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sequenceOfUltrasoundRegions' put: aSQValue
		]
	].

]

{ #category : #'accessing - talkDICOM names' }
USRegionCalibrationIOM >> ultrasoundRegionsSequence [

	^self dataElementsValues at: 'sequenceOfUltrasoundRegions' ifAbsent: [
		self dataElementsDictionary at: 'sequenceOfUltrasoundRegions' ifPresent: [:dataElement |
			self dataElementsValues at: 'sequenceOfUltrasoundRegions' put: (self dataElementsDictionary removeKey: 'sequenceOfUltrasoundRegions') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
USRegionCalibrationIOM >> ultrasoundRegionsSequence: aSQValue [

	| dataElement |

	(self dataElementsDictionary at: 'sequenceOfUltrasoundRegions' ifPresent: [:aDataElement | aDataElement value: aSQValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #sequenceOfUltrasoundRegions.
			dataElement encoder: self encoder.
			dataElement value: aSQValue.
			self dataElementsDictionary at: 'sequenceOfUltrasoundRegions' put: dataElement.
			self dataElementsValues removeKey: 'sequenceOfUltrasoundRegions' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'sequenceOfUltrasoundRegions' put: aSQValue
		]
	].

]
