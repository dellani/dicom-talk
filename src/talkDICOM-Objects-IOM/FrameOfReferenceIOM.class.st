Class {
	#name : #FrameOfReferenceIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
FrameOfReferenceIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM Frame of Reference Information Object Module
	PS 3.3-2000 Annex C.7.4.1 - PRD 04-06.2001"

	self resetDataElements.
	Name := 'DICOM Frame of Reference Information Object Module'.
	moduleName := 'frameOfReferenceIOM'.
	self
		addDataElement:
			(UIDataElement
				newWith: #frameOfReferenceUID
				tag: #(16r0020 16r0052)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(LODataElement
				newWith: #positionReferenceIndicator
				tag: #(16r0020 16r1040)
				vm: '1'
				type: '2')
]

{ #category : #accessing }
FrameOfReferenceIOM >> frameOfReferenceUID [

	^self dataElementsValues at: 'frameOfReferenceUID' ifAbsent: [
		self dataElementsDictionary at: 'frameOfReferenceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'frameOfReferenceUID' put: (self dataElementsDictionary removeKey: 'frameOfReferenceUID') value.
		]
	]

]

{ #category : #accessing }
FrameOfReferenceIOM >> frameOfReferenceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'frameOfReferenceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #frameOfReferenceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'frameOfReferenceUID' put: dataElement.
			self dataElementsValues removeKey: 'frameOfReferenceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'frameOfReferenceUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
FrameOfReferenceIOM >> positionReferenceIndicator [

	^self dataElementsValues at: 'positionReferenceIndicator' ifAbsent: [
		self dataElementsDictionary at: 'positionReferenceIndicator' ifPresent: [:dataElement |
			self dataElementsValues at: 'positionReferenceIndicator' put: (self dataElementsDictionary removeKey: 'positionReferenceIndicator') value.
		]
	]

]

{ #category : #accessing }
FrameOfReferenceIOM >> positionReferenceIndicator: aLOValue [

	| dataElement |

	(self dataElementsDictionary at: 'positionReferenceIndicator' ifPresent: [:aDataElement | aDataElement value: aLOValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #positionReferenceIndicator.
			dataElement encoder: self encoder.
			dataElement value: aLOValue.
			self dataElementsDictionary at: 'positionReferenceIndicator' put: dataElement.
			self dataElementsValues removeKey: 'positionReferenceIndicator' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'positionReferenceIndicator' put: aLOValue
		]
	].

]
