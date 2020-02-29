Extension { #name : #StandardFileStream }

{ #category : #'*talkDICOM-Core' }
StandardFileStream >> enableReadBuffering [

	collection ifNil: [
		buffer1 ifNotNil: [
			collection := self collectionSpecies new: 2048 ] ].
	readLimit := position := 0
]

{ #category : #'*talkDICOM-Core' }
StandardFileStream >> readOWDataElementDataBytes: dataElement [
	"primRead: id into: byteArray startingAt: startIndex count: count"

	"Read up to count bytes of data from this file into the given string or byte array starting at the given index. Answer the number of bytes actually read."

	| byteArray |
	"newDataElement := dataElementDefinition copy.
	self next: 2.	
	length := self getValueFromByteStream: pdvStream bytes: 4.
	newDataElement encoder: self.
	newDataElement length: length.
	newDataElement dataElementLength: length + 12."
	byteArray := ByteArray new: dataElement length.

	"Read up to count bytes of data from this file into the given string or byte array
	 starting at the given index. Answer the number of 	bytes actually read."
	self
		primRead: fileID
		into: byteArray
		startingAt: self position - 1
		count: dataElement length.
	^ byteArray
]
