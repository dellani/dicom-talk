Class {
	#name : #VRMLIOM,
	#superclass : #DicomIOM,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
VRMLIOM class >> initialize [
	self resetDataElements.
	Name := 'DICOM VRML Information Object Module'.
	moduleName := 'vrmlIOM'.
	self
		addDataElement:
			(UTDataElement
				newWith: #dataOfVRMLText
				tag: #(16r9993 16r1012)
				vm: '1'
				type: '1').
	self
		addDataElement:
			(DADataElement
				newWith: #dateOfVRML
				tag: #(16r9993 16r1014)
				vm: '1'
				type: '3').
	self
		addDataElement:
			(TMDataElement
				newWith: #timeOfVRML
				tag: #(16r9993 16r1016)
				vm: '1'
				type: '3')
]

{ #category : #checking }
VRMLIOM >> checkIOM [
"
	Do some basic checking in the IOM data
	PRD 01.2002
"

	^true.
]

{ #category : #accessing }
VRMLIOM >> dataOfVRMLText [

	^self dataElementsValues at: 'dataOfVRMLText' ifAbsent: [
		self dataElementsDictionary at: 'dataOfVRMLText' ifPresent: [:dataElement |
			self dataElementsValues at: 'dataOfVRMLText' put: (self dataElementsDictionary removeKey: 'dataOfVRMLText') value.
		]
	]

]

{ #category : #accessing }
VRMLIOM >> dataOfVRMLText: aUTValue [

	| dataElement |

	(self dataElementsDictionary at: 'dataOfVRMLText' ifPresent: [:aDataElement | aDataElement value: aUTValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dataOfVRMLText.
			dataElement encoder: self encoder.
			dataElement value: aUTValue.
			self dataElementsDictionary at: 'dataOfVRMLText' put: dataElement.
			self dataElementsValues removeKey: 'dataOfVRMLText' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dataOfVRMLText' put: aUTValue
		]
	].

]

{ #category : #accessing }
VRMLIOM >> dateOfVRML [

	^self dataElementsValues at: 'dateOfVRML' ifAbsent: [
		self dataElementsDictionary at: 'dateOfVRML' ifPresent: [:dataElement |
			self dataElementsValues at: 'dateOfVRML' put: (self dataElementsDictionary removeKey: 'dateOfVRML') value.
		]
	]

]

{ #category : #accessing }
VRMLIOM >> dateOfVRML: aDAValue [

	| dataElement |

	(self dataElementsDictionary at: 'dateOfVRML' ifPresent: [:aDataElement | aDataElement value: aDAValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #dateOfVRML.
			dataElement encoder: self encoder.
			dataElement value: aDAValue.
			self dataElementsDictionary at: 'dateOfVRML' put: dataElement.
			self dataElementsValues removeKey: 'dateOfVRML' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'dateOfVRML' put: aDAValue
		]
	].

]

{ #category : #accessing }
VRMLIOM >> timeOfVRML [

	^self dataElementsValues at: 'timeOfVRML' ifAbsent: [
		self dataElementsDictionary at: 'timeOfVRML' ifPresent: [:dataElement |
			self dataElementsValues at: 'timeOfVRML' put: (self dataElementsDictionary removeKey: 'timeOfVRML') value.
		]
	]

]

{ #category : #accessing }
VRMLIOM >> timeOfVRML: aTMValue [

	| dataElement |

	(self dataElementsDictionary at: 'timeOfVRML' ifPresent: [:aDataElement | aDataElement value: aTMValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #timeOfVRML.
			dataElement encoder: self encoder.
			dataElement value: aTMValue.
			self dataElementsDictionary at: 'timeOfVRML' put: dataElement.
			self dataElementsValues removeKey: 'timeOfVRML' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'timeOfVRML' put: aTMValue
		]
	].

]
