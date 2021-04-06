Class {
	#name : #PrivateCreatorDataElement,
	#superclass : #DataElement,
	#category : #'talkDICOM-Data'
}

{ #category : #'instance creation' }
PrivateCreatorDataElement class >> fromGDCMTextLine: textLine [
	"# Each line represents an entry in the data dictionary.  
	
  {0x0009,0x0002,""PMTF INFORMATION DATA^10"",VR::SH,VM::VM1,""?"",false },
  {0x0011,0x0003,""PMTF INFORMATION DATA^10"",VR::US,VM::VM1,""?"",false },

	PrivateCreatorDataElement fromGDCMTextLine:  '{0x0011,0x0003,""PMTF INFORMATION DATA^10"",VR::US,VM::VM1,""?"",false },'

	PRD August 22 - September 13, 2017"

	| collection line inputStream token tag vr dataElementName vm dataElement |
	collection := OrderedCollection new.
	line := textLine reject: [ :character | character = ${ ].
	line := line reject: [ :character | character = $} ].
	inputStream := line readStream.

	token := inputStream upTo: $,.
	collection add: token.
	token := inputStream upTo: $,.	
	collection add: token.
	"Skip double quotatioin mark"
	inputStream next.
	token := inputStream upTo: $".	
	collection add: token.
	"Skip double quotatioin mark"
	inputStream next.

	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: $,.
			collection add: token ].
	"First and second tokens are group and element number, third token is the private creator name"
	tag := PrivateCreatorDataElementTag fromGDCMToken: collection.

	"Fourth token is the VR"
	vr := (collection at: 4) copyFrom: 5 to: 6.

	"Fifth Token is the VM"
	vm := (collection at: 5) copyFrom: 7 to: (collection at: 5) size.

	"Sixth toke is the data element name "
	dataElementName := (collection at: 6) reject: [ :character | character = $" ].
	"dataElementName = '?' ifTrue: [ dataElementName := 'unknownPrivateDataElement(', tag groupNumber printString, ',', tag elementNumber printString, ')' ]."
	dataElementName = '?'
		ifTrue: [ dataElementName := 'UnknownPrivateDataElement' ].
	dataElement := self newVR: vr trimBoth.
	dataElement
		name: dataElementName asSymbol;
		tag: tag;
		vm: vm.
	^ dataElement
]

{ #category : #'instance creation' }
PrivateCreatorDataElement class >> fromTextLine: textLine [
	"# Each line represents an entry in the data dictionary.  Each line
	# has 5 fields (Tag, VR, Name, VM, Version).  Entries need not be
	# in ascending tag order.
	#
	# Entries may override existing entries.
	#
	# Each field must be separated by a single tab.
	# The tag value may take one of two forms:
	#   (gggg,""CREATOR"",ee)
	#   (gggg,""CREATOR"",eeee) [eeee >= 1000]
	# The first form describes a private tag that may be used with different
	# element numbers as reserved by the private creator element.
	# The second form describes a private tag that may only occur with a
	# certain fixed element number.
	# In both cases, the tag values must be in hexadecimal.
	# Repeating groups are represented by indicating the range
	# (gggg-o-gggg,""CREATOR"",ee) or (gggg-o-gggg,""CREATOR"",eeee)
	# where ""-o-"" indicates that only odd group numbers match the definition.
	# The element part of the tag can also be a range.
	#
	# Comments have a '#' at the beginning of the line.
	#
	# Tag				VR	Name			VM	Version
	#
	(0019,""1.2.840.113681"",10)	ST	CRImageParamsCommon	1
	(0019,""1.2.840.113681"",11)	ST	CRImageIPParamsSingle	1
	.
	.
	.
	(7ff1,""TOSHIBA_MEC_CT_1.0"",0d)	US	Unknown	1-n
					
	PRD August 22 - September 12, 2017"

	| collection inputStream token tag vr dataElementName vm dataElement dataElements |
	collection := OrderedCollection new.
	inputStream := textLine readStream.
	[ inputStream atEnd ]
		whileFalse: [ token := inputStream upTo: Character tab.
			collection add: token ].

	"First Token is the data element Tag"
	tag := PrivateCreatorDataElementTag fromToken: collection first.

	"Second Token is the data element value representation"
	vr := collection at: 2.

	"Third Token is the data element name"
	dataElementName := collection at: 3.
	dataElementName at: 1 put: (dataElementName at: 1) asLowercase.

	"Fourth Token is the data element value multiplycity"
	vm := collection at: 4.
	OrderedCollection new.
	dataElements := tag
		collect: [ :dataElementTag | 
			dataElement := self newVR: vr trimBoth.
			dataElement
				name: dataElementName asSymbol;
				tag: dataElementTag;
				vm: vm ].

	"DSDataElement
				newWith: #pixelSpacing
				tag: #(16r0028 16r0030)
				vm: '2'
				type: '1'"
	^ dataElements
]

{ #category : #accessing }
PrivateCreatorDataElement class >> valueRepresentationString [
	^ self subclassResponsibility
]
