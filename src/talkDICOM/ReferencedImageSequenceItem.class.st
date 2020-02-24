Class {
	#name : #ReferencedImageSequenceItem,
	#superclass : #SequenceItem,
	#category : #'talkDICOM-Objects'
}

{ #category : #'class initialization' }
ReferencedImageSequenceItem class >> initialize [
	self resetDataElements.
	Name := 'DICOM Referenced Image Sequence Item'.
	SequenceName := 'referencedIntanceSequenceItem'.
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPClassUID
				tag: #(16r0008 16r1150)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(UIDataElement
				newWith: #referencedSOPInstanceUID
				tag: #(16r0008 16r1155)
				vm: '1'
				type: '1C').
	self
		addDataElement:
			(ISDataElement
				newWith: #referencedFrameNumber
				tag: #(16r0008 16r1160)
				vm: '1-n'
				type: '3')
]

{ #category : #accessing }
ReferencedImageSequenceItem >> referencedFrameNumber [

	^self dataElementsValues at: 'referencedFrameNumber' ifAbsent: [
		self dataElementsDictionary at: 'referencedFrameNumber' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedFrameNumber' put: (self dataElementsDictionary removeKey: 'referencedFrameNumber') value.
		]
	]

]

{ #category : #accessing }
ReferencedImageSequenceItem >> referencedFrameNumber: aISValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedFrameNumber' ifPresent: [:aDataElement | aDataElement value: aISValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedFrameNumber.
			dataElement encoder: self encoder.
			dataElement value: aISValue.
			self dataElementsDictionary at: 'referencedFrameNumber' put: dataElement.
			self dataElementsValues removeKey: 'referencedFrameNumber' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedFrameNumber' put: aISValue
		]
	].

]

{ #category : #accessing }
ReferencedImageSequenceItem >> referencedSOPClassUID [

	^self dataElementsValues at: 'referencedSOPClassUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPClassUID' put: (self dataElementsDictionary removeKey: 'referencedSOPClassUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedImageSequenceItem >> referencedSOPClassUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPClassUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPClassUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPClassUID' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPClassUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPClassUID' put: aUIValue
		]
	].

]

{ #category : #accessing }
ReferencedImageSequenceItem >> referencedSOPInstanceUID [

	^self dataElementsValues at: 'referencedSOPInstanceUID' ifAbsent: [
		self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:dataElement |
			self dataElementsValues at: 'referencedSOPInstanceUID' put: (self dataElementsDictionary removeKey: 'referencedSOPInstanceUID') value.
		]
	]

]

{ #category : #accessing }
ReferencedImageSequenceItem >> referencedSOPInstanceUID: aUIValue [

	| dataElement |

	(self dataElementsDictionary at: 'referencedSOPInstanceUID' ifPresent: [:aDataElement | aDataElement value: aUIValue]) isNil ifTrue: [
		encoder notNil ifTrue: [
			dataElement := self newDataElementNamed: #referencedSOPInstanceUID.
			dataElement encoder: self encoder.
			dataElement value: aUIValue.
			self dataElementsDictionary at: 'referencedSOPInstanceUID' put: dataElement.
			self dataElementsValues removeKey: 'referencedSOPInstanceUID' ifAbsent: [nil].
		]
		ifFalse: [
			self dataElementsValues at: 'referencedSOPInstanceUID' put: aUIValue
		]
	].

]
