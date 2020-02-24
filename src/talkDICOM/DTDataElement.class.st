Class {
	#name : #DTDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
DTDataElement class >> initialize [

	self dataElementClasses at: self valueRepresentationString put: self
]

{ #category : #accessing }
DTDataElement class >> valueRepresentationString [

	^'DT'
]

{ #category : #'field bytes' }
DTDataElement >> bsonValue [
	
	^self encoder 
		bsonRepresentationFromDTDataElement: self
]

{ #category : #'instance creation' }
DTDataElement >> createInstanceFrom: pdvStream transferSyntax: transferSyntaxEncoder [
	
	^transferSyntaxEncoder 
				dicomDTDataElementFrom: pdvStream 
				definition: self.
]

{ #category : #accessing }
DTDataElement >> dataElementLength [
	"Data Length of the message field in bytes

	PRD 04-10.2001"

	^ self encoder headerLengthDTDataElement + self dataBytes size
]

{ #category : #'field bytes' }
DTDataElement >> dataElementValueFrom: bsonDTDataElementValue [

	^self encoder 
		dicomDTDataElementValueFrom: bsonDTDataElementValue
]

{ #category : #'field bytes' }
DTDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromDTDataElement: self on: aByteStream
]

{ #category : #printing }
DTDataElement >> printValueOn: aStream [
"
	Print the Dicom Data Element Value to 'aStream' 
	PRD January 10th, 2003 - August 20th, 2015
"
	| elementValue |

	((elementValue := self value) isKindOf: DateAndTime) 
		ifTrue: [aStream nextPutAll: elementValue printString]
]

{ #category : #'field value retrieving' }
DTDataElement >> value [
	" VR = Date Time - PRD 04.2001, 02-07.2002, 02.2017 "

	| aString index year month day hour minute second secondsFraction offsetFromUTC aDateAndTime sign |
	aDateAndTime := nil.
	self dataBytes size > 0
		ifTrue: 
			[aString := ''.
			year := 1900.
			month := 1.
			day := 1.
			hour := 0.
			minute := 0.
			second := 0.
			secondsFraction := 0.
			offsetFromUTC := Duration days: 0 hours: 0 minutes: 0 seconds: 0.
			index := 0.
			self dataBytes do: 
					[:each |
					aString := aString , (Character value: each) asSymbol.
					index := index + 1.
					index = 4
						ifTrue: 
							[year := aString asNumber.
							aString := ''].
					index = 6
						ifTrue: 
							[month := aString asNumber.
							aString := ''].
					index = 8
						ifTrue: 
							[day := aString asNumber.
							aString := ''].
					index = 10
						ifTrue: 
							[hour := aString asNumber.
							aString := ''].
					index = 12
						ifTrue: 
							[minute := aString asNumber.
							aString := ''].
					index = 14
						ifTrue: 
							[second := aString asNumber.
							aString := ''].
					index = 15
						ifTrue: 
							["secondsFraction := aString squeezeOutNumber."
							aString := ''].

					index = 21
						ifTrue: 
							[secondsFraction := aString squeezeOutNumber * 1000.
							aString := ''].
					index = 22
						ifTrue: 
							[sign := aString.
							aString := ''].
					index = 24
						ifTrue: 
							[offsetFromUTC := Duration 
															days: 0 
															hours: aString asNumber 
															minutes: 0
															seconds: 0.
							aString := ''].
					index = 26
						ifTrue: 
							[offsetFromUTC := Duration 
															days: 0 
															hours: offsetFromUTC hours
															minutes: aString asNumber
															seconds: 0.
							aString := ''].

					index = 26
						ifTrue: 
							[sign = $- ifTrue: [  offsetFromUTC := offsetFromUTC negated]].
			].
			aDateAndTime := DateAndTime 
				year: year 
				month: month 
				day: day
				hour: hour
				minute: minute
				second: second 
				nanoSecond: secondsFraction
				offset: offsetFromUTC.
	].
	^aDateAndTime
]

{ #category : #'field value storing' }
DTDataElement >> value: aDTValue [
	"DT Date Time
	The Date Time common data type. Indicates a concatenated date-time ASCII 
	string in the format: YYYYMMDDHHMMSS.FFFFFF&ZZZZ The components of 
	this string, from left to right, are YYYY = Year, MM = Month, DD = Day, HH = Hour, 
	MM = Minute, SS = Second, FFFFFF = Fractional Second, & =  +  or  - , and 
	ZZZZ = Hours and Minutes of offset. &ZZZZ is an optional suffix for plus/minus offset 
	from Coordinated Universal Time. A component that is omitted from the string is termed 
	a null component. Trailing null components of Date Time are ignored. Non-trailing null 
	components are prohibited, given that the optional suffix is not considered as a component. 
	Note: For reasons of backward compatibility with versions of this standard prior to V3.0, 
	many existing DICOM Data Elements use the separate DA and TM VRs. Standard and 
	Private Data Elements defined in the future should use DT, when appropriate, to be more 
	compliant with ANSI HISPP MSDS. 
	'0'-'9', '+', '-', '.' of Default Character Repertoire
	26 bytes maximum
	PS 3.5-2000 6.2 - PRD 05.2001, 02.2002

	Bug Fixed (The 'StringEvenner' instance method calling was missing) - PRD 04.2002"

	| aStream dateTimeString |
	(aDTValue isKindOf: DateAndTime)
		ifTrue: [ aStream := WriteStream on: String new.
			aDTValue printDICOMDTOn: aStream.
			dateTimeString := self stringEvenner: aStream contents.
			self copyString: dateTimeString maxSize: 16r1A ].
	self length: self dataBytes size
]
