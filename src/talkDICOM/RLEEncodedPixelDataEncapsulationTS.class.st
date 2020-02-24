Class {
	#name : #RLEEncodedPixelDataEncapsulationTS,
	#superclass : #EncodedPixelDataEncapsulationTS,
	#category : #'talkDICOM-Data'
}

{ #category : #initialize }
RLEEncodedPixelDataEncapsulationTS class >> initialize [
	UID := '1.2.840.10008.1.2.5'.		"RLE Compression"
	self registerMyself.
]
