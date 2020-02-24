Extension { #name : #DateAndTime }

{ #category : #'*talkDICOM' }
DateAndTime >> printDICOMDTOn: aStream [
	"Print in the format defined by the DICOM standard for Date and Time common
	data elements. Indicates a concatenated date-time ASCII string in the format:
	YYYYMMDDHHMMSS.FFFFFF&ZZZZ
	
	The components of this string, from left to right, are YYYY = Year, MM = Month, 
	DD = Day, HH = Hour, MM = Minute, SS = Second, FFFFFF = Fractional Second,
	& =  +  or  - , and ZZZZ = Hours and Minutes of offset. &ZZZZ is an optional suffix
	for plus/minus offset from Coordinated Universal Time. A component that is omitted
	from the string is termed a null component. Trailing null components of Date Time
	are ignored. Non-trailing null components are prohibited, given that the optional
	suffix is not considered as a component. Note: For reasons of backward compatibility
	with versions of this standard prior to V3.0, 	many existing DICOM Data Elements use
	the separate DA and TM VRs. Standard and Private Data Elements defined in the future
	should use DT, when appropriate, to be more compliant with ANSI HISPP MSDS. 
	
	PRD 05.2001 - 02.2017"

	| year month day |
	self dayMonthYearDo: [ :d :m :y | year := y. month := m. day := d ].

	year abs printOn: aStream base: 10 length: 4 padded: true.
	month printOn: aStream base: 10 length: 2 padded: true.
	day printOn: aStream base: 10 length: 2 padded: true.
	self hour 					printOn: aStream base: 10 length: 2 padded: true.
	self minute 					printOn: aStream base: 10 length: 2 padded: true.
	self second 					printOn: aStream base: 10 length: 2 padded: true.
	aStream nextPut: $..
	self nanoSecond / 1000 	printOn: aStream base: 10 length: 6 padded: true.
	aStream nextPut: (self offset positive ifTrue: [ $+ ] ifFalse: [ $- ]).
	self offset hours 			printOn: aStream base: 10 length: 2 padded: true.
	self offset minutes 		printOn: aStream base: 10 length: 2 padded: true.
]

{ #category : #'*talkDICOM' }
DateAndTime >> printDICOMTMOn: aStream [
	"Print in the format defined by the DICOM standard for Time data elements.

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
	PS 3.5-2000 6.2

	PRD 05.2001 - 02.2017"

	self hour 					printOn: aStream base: 10 length: 2 padded: true.
	self minute 					printOn: aStream base: 10 length: 2 padded: true.
	self second 					printOn: aStream base: 10 length: 2 padded: true.
	aStream nextPut: $..
	self nanoSecond / 1000 	printOn: aStream base: 10 length: 6 padded: true.
]
