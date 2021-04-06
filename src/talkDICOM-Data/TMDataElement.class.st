Class {
	#name : #TMDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
TMDataElement class >> initialize [
	
	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
TMDataElement class >> valueRepresentationString [

	^'TM'
]

{ #category : #'instance creation' }
TMDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomTMDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
TMDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthTMDataElement + self dataBytes size
]

{ #category : #'field bytes' }
TMDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromTMDataElement: self on: aByteStream
]

{ #category : #printing }
TMDataElement >> printValueOn: aStream [
	"August 20, 2015: Print the time that I store to aStream - PRD"

	| elementValue |
	((elementValue := self value) isKindOf: Time)
		ifTrue: [ aStream nextPutAll: elementValue printString ]
		ifFalse: [ aStream nextPutAll: '#!TIME' ]
]

{ #category : #'field value retrieving' }
TMDataElement >> value [
" VR = Time - PRD 04.2001 - 01.2002"

	| index aString hour minute second time microsecond |

	time := nil.
	self dataBytes size >= 2 ifTrue: [
		aString := ''.
		hour := minute := second := microsecond := 0.
		index := 0.
		self dataBytes do: [:each |
			(Character value: each) = $.
				ifFalse: [aString := aString copyWith: (Character value: each)].
		
			index := index  + 1.
			(index = 2) ifTrue:[ hour := aString asNumber. aString := ''].
			(index = 4) ifTrue: [ minute := aString asNumber. aString := ''].
			(index = 6) ifTrue: [ second := aString asNumber. aString := ''.].
		].
		aString notEmpty ifTrue: [microsecond := aString asNumber].
		"time := Time readFrom: (hour, ':', minute, ':', second, (milisecond notEmpty ifTrue: ['.', milisecond] ifFalse: [''])) readStream."
		time := (DateAndTime 
					year: 1970
					month: 1
					day: 1
					hour: hour
					minute: minute
					second: second
					nanoSecond: microsecond * 1000
					offset: 0 asDuration) asTime

	].
	^time
]

{ #category : #'field value storing' }
TMDataElement >> value: aTime [
"
	TM (Time): A string of characters of the format hhmmss.frac; where hh contains hours 
	(range '00' - '23'), mm contains minutes (range '00' - '59'), ss contains 
	seconds (range '00' - '59'), and frac contains a fractional part of a second as 
	small as 1 millionth of a second (range  000000  -  999999 ). A 24 hour clock is 
	assumed. Midnight can be represented by only  0000  since  2400  would violate 
	the hour range. The string may be padded with trailing spaces. Leading and embedded 
	spaces are not allowed. One or more of the components mm, ss, or frac may be unspecified 
	as long as every component to the right of an unspecified component is also unspecified. 
	If frac is unspecified the preceding  .  may not be included. Frac shall be held to six decimal 
	places or less to ensure its format conforms to the ANSI HISPP MSDS Time common data type. 
	Examples: 
	1.  070907.0705   represents a time of 7 hours, 9 minutes and 7.0705 seconds. 
	2.  1010  represents a time of 10 hours, and 10 minutes. 
	3.  021   is an invalid value. 
	Notes: 
	1. For reasons of backward compatibility with versions of this standard prior to V3.0, it is 
	recommended that implementations also support a string of characters of the format hh:mm:ss.frac 
	for this VR. 
	2. See also DT VR in this table. 
	'0 - 9 ,  .' of Default Character Repertoire
	16 bytes maximum
	PS 3.5-2000 6.2 - PRD 05.2001
"
	| timeString aStream |

	dataBytes := ByteArray new.
	(aTime isKindOf: Time) | (aTime isKindOf: DateAndTime) ifTrue: [
		aStream := WriteStream on: String new.
		aTime asDateAndTime printDICOMTMOn: aStream.
		timeString := self stringEvenner: aStream contents.
		self copyString: timeString maxSize: 16r10].

	(aTime isKindOf: String) ifTrue: [
		timeString := self stringEvenner: aTime.
		self copyString: timeString maxSize: 16r10].

	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)."
]
