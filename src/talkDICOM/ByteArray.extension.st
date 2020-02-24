Extension { #name : #ByteArray }

{ #category : #'*talkDICOM' }
ByteArray >> swapByteAt: index1 with: index2 [
	| byte1 |
	byte1 := self byteAt: index1.
	self byteAt: index1 put: (self byteAt: index2).
	self byteAt: index2 put: byte1
]
