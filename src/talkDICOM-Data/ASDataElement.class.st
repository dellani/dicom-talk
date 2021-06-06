Class {
	#name : #ASDataElement,
	#superclass : #MultipleStringValueDataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'class initialization' }
ASDataElement class >> initialize [
	DicomRegistry registerDataElementClass: self
]

{ #category : #accessing }
ASDataElement class >> valueRepresentationString [
	^ 'AS'
]

{ #category : #accessing }
ASDataElement >> dataElementLength [
	"Lenght of the message field in bytes for data element of type AS.

	 13 May 2021: New implementation - PRD"

	^ self encoder headerLengthASDataElement + self dataBytes size
]

{ #category : #parsing }
ASDataElement >> parseDataBytesFrom: pdvStream transferSyntax: transferSyntaxCodec [
	^ transferSyntaxCodec
		parseDicomASDataElementDataBytesFrom: pdvStream
		for: self
]

{ #category : #'field bytes' }
ASDataElement >> pdvBytes: aByteStream [
"
	Put the byte-coding of this DICOM Data Element in to a ByteStream
	PRD - February 07th, 2003
"
	self encoder pdvBytesFromASDataElement: self on: aByteStream
]

{ #category : #'field value storing' }
ASDataElement >> validateValue: anASValue [
	"Validate 'anASValue' according to the rules for DICOM Age String Data Elements.
	 A string of characters with one of the following formats -- nnnD, nnnW, nnnM, 
	 nnnY; where nnn shall contain the number of days for D, weeks for W, months 
	 for M, or years for Y.
	 4 bytes fixed size.
	 PS 3.5-2000 6.2

	 23 February 2017: Pharo 5.0 implementation;
        06 June 2021: New implementation - Paulo R. Dellani"

	^ String
		new: 10
		streamContents: [ :ageStream | 
			anASValue size = 4
				ifTrue: [ (anASValue copyFrom: 1 to: 3) asInteger
						printOn: ageStream
						base: 10
						length: 3
						padded: true.
					(#(16r44 16r4D 16r57 16r59) includes: (anASValue at: 4) asInteger)
						ifTrue: [ ageStream nextPut: (anASValue at: 4) ]
						ifFalse: [ ageStream nextPut: 16r44 asCharacter ] ] ]
]

{ #category : #'field value storing' }
ASDataElement >> value: anASValue [
"
	AS Age String
	A string of characters with one of the following formats -- nnnD, nnnW, nnnM, nnnY; where nnn 
	shall contain the number of days for D, weeks for W, months for M, or years for Y.  4 bytes fixed size.
	PS 3.5-2000 6.2
	PRD 05-12.2001 - 02.2002

	Code changed in order to correctly handle multiplicity values different than 1
	PRD 07.2002
"
	| dataString |

	dataString := String new.
	(anASValue isKindOf: OrderedCollection) | (anASValue isKindOf: Array)ifTrue: [
		dataString := self multipleStringValuesFrom: anASValue.
		dataString := self stringEvenner: dataString].
	(anASValue isKindOf: String) ifTrue: [
		dataString := self validateValue: anASValue].
	self dataBytes: dataString asByteArray.
	self length: self dataBytes size.
	"self dataElementLength: self length + (self encoder dataElementHeaderLenght: self)."
]
