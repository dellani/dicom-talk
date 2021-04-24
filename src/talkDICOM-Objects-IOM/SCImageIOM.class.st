Class {
	#name : #SCImageIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects-IOM'
}

{ #category : #'class initialization' }
SCImageIOM class >> initialize [
	"Initialize the dictionary of DICOM Data Elements for the DICOM SC Image Information Object Module
	PS 3.3-2001 Annex C.8.6.2 - PRD 05.2002"

	self resetDataElements.
	Name := 'SC Image Information Object Module'.
	moduleName := 'scImageIOM'.
	self
		addDataElement:
			(DADataElement
				newWith: #dataOfSecondaryCapture
				tag: #(16r0018 16r1012)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #timeOfSecondaryCapture
				tag: #(16r0018 16r1014)
				vm: '1'
				type: '3')
]

{ #category : #'accessing - talkDICOM names' }
SCImageIOM >> dataOfSecondaryCapture [

	^self dataElementsValues at: 'dateOfSecondaryCapture' ifAbsent: [
		self dataElementsDictionary at: 'dateOfSecondaryCapture' ifPresent: [:dataElement |
			self dataElementsValues at: 'dateOfSecondaryCapture' put: (self dataElementsDictionary removeKey: 'dateOfSecondaryCapture') value.
		]
	]

]

{ #category : #'accessing - talkDICOM names' }
SCImageIOM >> dataOfSecondaryCapture: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'dateOfSecondaryCapture' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dateOfSecondaryCapture.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'dateOfSecondaryCapture' put: dataElement.
			self dataElementsValues removeKey: 'dateOfSecondaryCapture' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dateOfSecondaryCapture' put: aDAValue
		]
	].

]

{ #category : #accessing }
SCImageIOM >> dateOfSecondaryCapture [

	^self dataElementsValues at: 'dateOfSecondaryCapture' ifAbsent: [
		self dataElementsDictionary at: 'dateOfSecondaryCapture' ifPresent: [:dataElement |
			self dataElementsValues at: 'dateOfSecondaryCapture' put: (self dataElementsDictionary removeKey: 'dateOfSecondaryCapture') value.
		]
	]

]

{ #category : #accessing }
SCImageIOM >> dateOfSecondaryCapture: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'dateOfSecondaryCapture' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dateOfSecondaryCapture.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'dateOfSecondaryCapture' put: dataElement.
			self dataElementsValues removeKey: 'dateOfSecondaryCapture' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dateOfSecondaryCapture' put: aDAValue
		]
	].

]

{ #category : #accessing }
SCImageIOM >> timeOfSecondaryCapture [

	^self dataElementsValues at: 'timeOfSecondaryCapture' ifAbsent: [
		self dataElementsDictionary at: 'timeOfSecondaryCapture' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeOfSecondaryCapture' put: (self dataElementsDictionary removeKey: 'timeOfSecondaryCapture') value.
		]
	]

]

{ #category : #accessing }
SCImageIOM >> timeOfSecondaryCapture: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeOfSecondaryCapture' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeOfSecondaryCapture.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'timeOfSecondaryCapture' put: dataElement.
			self dataElementsValues removeKey: 'timeOfSecondaryCapture' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeOfSecondaryCapture' put: aTMValue
		]
	].

]
