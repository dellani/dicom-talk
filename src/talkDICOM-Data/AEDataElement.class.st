Class {
	#name : #AEDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
AEDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
AEDataElement class >> valueRepresentationString [
	^ 'AE'
]

{ #category : #accessing }
AEDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type AE.

	 May 13 2021 - PRD"

	^ self encoder headerLengthAEDataElement + self dataBytes size
]

{ #category : #parsing }
AEDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomAEDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
AEDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromAEDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
AEDataElement >> validateValue: anAEValue [
	"Perform the validation of the value to be stored in a DICOM AE Data Element

	PRD 04.2001 - 06.2002"

	| dataString |
	dataString := (self stringPurify: anAEValue badChars: DefaultCharacterRepertoire control) trimBoth.
	dataString := self sizeString: dataString maxSize: 16r10.
	^ dataString
]

{ #category : #'field value storing' }
AEDataElement >> value: aValue [
"
	AE Application Entity
	A string of characters with leading and trailing spaces (20H) being non-significant.
	The value made of 16 spaces, meaning 'no application name specified', shall not be used. 
	Default Character Repertoire excluding control characters LF, FF, CR and ESC. 
	16 bytes maximum
	PS 3.5-2000 6.2
	PRD 05-09.2001, 02.2002

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 06-07.2002
"
	| dataString |

	dataString := String new.
	(aValue isKindOf: OrderedCollection) | (aValue isKindOf: Array)ifTrue: [
	"(aValue isKindOf: Core.SequenceableCollection) ifTrue: ["
		dataString := self multipleStringValuesFrom: aValue.
		dataString := self stringEvenner: dataString].
	(aValue isKindOf: String) ifTrue: [
		dataString := self validateValue: aValue.
		dataString := self stringEvenner: aValue].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)."
]
