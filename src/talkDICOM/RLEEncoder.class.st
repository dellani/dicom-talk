Class {
	#name : #RLEEncoder,
	#superclass : #Object,
	#category : #'talkDICOM-Data'
}

{ #category : #compressAByteArray }
RLEEncoder class >> byteSegment1: aValue bitsPerPixel: numBitsPerPixel [
"
	this method returns the most significate Byte from 32 bits pixel
	EAF 13.11.02
"
	| byteMostSign |

	(numBitsPerPixel = 8) 
		ifTrue: [byteMostSign:= (aValue bitAnd: 255)]
		ifFalse: [
			(numBitsPerPixel = 16)
				ifTrue: [byteMostSign:=(aValue bitShift: -8) bitAnd: 255]
				ifFalse: [
					(numBitsPerPixel = 24)
						ifTrue: [ byteMostSign:= (aValue bitShift: -16) bitAnd: 255.]                             
						ifFalse: [
							(numBitsPerPixel = 32)
								ifTrue:[ byteMostSign:= (aValue bitShift: -24) bitAnd: 255]
						]
				]
		].
	^byteMostSign
]

{ #category : #compressAByteArray }
RLEEncoder class >> byteSegment2: aValue bitsPerPixel: numBitsPerPixel [
"
	this method returns the most significate Byte from 24bits pixel
	 EAF 13.11.02
"
	| byteMostSign |

	(numBitsPerPixel = 16) 
		ifTrue: [byteMostSign:= (aValue bitAnd: 255)]
		ifFalse: [
			(numBitsPerPixel = 24)
				ifTrue: [byteMostSign:=(aValue bitShift: -8) bitAnd: 255]
				ifFalse: [
					(numBitsPerPixel = 32)
						ifTrue:[ byteMostSign:= (aValue bitShift: -16) bitAnd: 255]
				]
		].
	^byteMostSign
]

{ #category : #compressAByteArray }
RLEEncoder class >> byteSegment3: aValue bitsPerPixel: numBitsPerPixel [
"
	this method returns the most significate Byte from 16 bits pixel
	 EAF 13.11.02
"
	| byteMostSign |
	(numBitsPerPixel = 24)
		ifTrue: [byteMostSign:= (aValue bitAnd:255)]
		ifFalse: [
			(numBitsPerPixel = 32) ifTrue: [
				byteMostSign:=(aValue bitShift: -8) bitAnd: 255]
	].
	^byteMostSign
]

{ #category : #compressAByteArray }
RLEEncoder class >> byteSegment4: aValue bitsPerPixel: numBitsPerPixel [
"
	this method returns the most significate Byte from 8 bits pixel
	 EAF 13.11.02
"
	| byteMostSign |

	byteMostSign:= (aValue bitAnd:255).
	 ^byteMostSign
]

{ #category : #compressAByteArray }
RLEEncoder class >> compressAByteArray:aByteArray [
"
	returns a ByteArray RLE compressed
	EAF 13.11.02 
"
	| count count2 tempOc completeOc repeater compressedByteArray |

	completeOc:= OrderedCollection new: 5000.
	count2 := 1.
	[count2 < aByteArray size] whileTrue: [
		((aByteArray at: count2) = (aByteArray at: count2 + 1)) ifTrue: [
			tempOc:= self equalByteArrayRunning: count2 aByteArray: aByteArray. 
			repeater:= tempOc first.
			tempOc remove: repeater]
		ifFalse: [
			tempOc:= self difByteArrayRunning: count2 aByteArray: aByteArray.
			repeater:= tempOc first.
			tempOc remove: repeater].
		completeOc 
			add: repeater;
			addAll: tempOc.
		count2:= count2 +( repeater abs).
	].   
	(completeOc size = (aByteArray size -1)) 
		ifTrue:[ completeOc add: 1;  add: (aByteArray at: count2)].
	compressedByteArray := ByteArray new: (completeOc size).	 
	count := 1.
	completeOc do: [:each | 
		(each < 0) ifTrue: [
			compressedByteArray 
				at: count 
				put: ((each negated) bitXor: 255) +1]
		ifFalse:[compressedByteArray at: count put: each].
	count := count + 1].
	^compressedByteArray
]

{ #category : #compressAByteArray }
RLEEncoder class >> createByteArray:aCollection [
"
	this method returns a ByteArray from a OrderedCollection
	EAF 13.11.02
"
	| count singleByteArray |
	
	singleByteArray := ByteArray new: aCollection size.
    	count := 1. 
	aCollection do: [:each | 
		singleByteArray at: count put: each.
		count := count + 1].
      ^singleByteArray
]

{ #category : #compressAByteArray }
RLEEncoder class >> difByteArrayRunning: aPoint aByteArray: originalByteArray [
"
	this method returns a non-repetitive sequence of bytes (Literal Run) RLE encoded
	EAF 13.11.02
" 
	|  secPoint oc stPoint count count2 |
	
      stPoint:= aPoint.
      secPoint:= aPoint + 1.
      oc:= OrderedCollection new. 
      count:=0.
      count2:=0. 
      [count < 127] whileTrue: [
		(secPoint <= originalByteArray size) ifTrue: [
			((originalByteArray at: stPoint) ~= (originalByteArray at: secPoint)) ifTrue: [
				oc add: (originalByteArray at: stPoint).
				stPoint:= stPoint +1.
				secPoint:= secPoint + 1.
				count:= count + 1.
				count2:=count2 +1]
			ifFalse: [count:= 127]
		]
           ifFalse: [
			(count2 < 127) ifTrue: [
				count2 := count2 + 1.    
				oc add: (originalByteArray at: stPoint)
			].
			count := 127
		].            
	].
	oc addFirst: count2.
	^oc
]

{ #category : #compressAByteArray }
RLEEncoder class >> equalByteArrayRunning: aPoint aByteArray: originalByteArray [
"
	 this method returns a repetitive sequence of bytes (Replicate Run) RLE encoded
	EAF 13.11.02
" 
	|  secPoint oc stPoint count count2  |

      stPoint:= aPoint.
      secPoint:= aPoint + 1.
      count:= 1.
      count2:= 1. 
      oc:= OrderedCollection new. 
      [count < 128] whileTrue: [
		(secPoint <= originalByteArray size) ifTrue: [
			((originalByteArray at: stPoint) = (originalByteArray at: secPoint)) ifTrue: [
				count:=count + 1.
				count2:= count2 + 1.
				stPoint:= stPoint +1.
				secPoint:= secPoint + 1]
              	ifFalse: [ count:= 129].
		]
       	ifFalse: [ count:= 129].
	].
	oc add: (count2 negated).
	oc add: (originalByteArray at: stPoint).
	^oc
]

{ #category : #compressAByteArray }
RLEEncoder class >> getImage:originalImage bitsPerPixel: numBitsPerPixel [
"
	this method returns a dictinonary whith  Byte Segments sets - EAF 13.11.02 
"
	|  valuePixelImage dicStream stream1 stream2 stream3 stream4 tX tY byteArrayCompressed |
    
      tX:= originalImage  width.
      tY:= originalImage height. 
      "numBitsPerPixel:= originalImage bitsPerPixel."
       stream1:= OrderedCollection new.
       stream2:= OrderedCollection new.
       stream3:= OrderedCollection new.
       stream4:= OrderedCollection new.
       dicStream:= Dictionary new. 
       0 to: (tY -1) do: [:pY | 
	       0 to: (tX -1) do: [:pX |  
			valuePixelImage:=(originalImage atX: pX y: pY). 
                  valuePixelImage:= self byteSegment1: valuePixelImage 
									bitsPerPixel: numBitsPerPixel. 
			stream1 add: valuePixelImage.
			(numBitsPerPixel > 8) ifTrue: [
				valuePixelImage:=(originalImage atX: pX y: pY). 
				valuePixelImage:= self byteSegment2: valuePixelImage bitsPerPixel: numBitsPerPixel. 
				stream2 add: valuePixelImage].
			(numBitsPerPixel > 16) ifTrue: [
 				valuePixelImage:=(originalImage atX: pX y: pY). 
				valuePixelImage:= self byteSegment3: valuePixelImage bitsPerPixel: numBitsPerPixel. 
				stream3 add: valuePixelImage].
                                        
			(numBitsPerPixel = 32) ifTrue: [
				valuePixelImage:=(originalImage atX: pX y: pY). 
				valuePixelImage:= self byteSegment4: valuePixelImage bitsPerPixel: numBitsPerPixel. 
				stream4 add: valuePixelImage].
		]
	].
	dicStream at: 1 put: stream1.
	(numBitsPerPixel > 8) ifTrue: [dicStream at: 2 put: stream2.].
	(numBitsPerPixel > 16) ifTrue: [dicStream at: 3 put: stream3.]. 
	(numBitsPerPixel > 24) ifTrue: [dicStream at: 4 put: stream4.]. 
	byteArrayCompressed:= self mergeArrayCompressed: dicStream.  
	^byteArrayCompressed
]

{ #category : #uncompressAByteArray }
RLEEncoder class >> getOffSets: colCompress [

	| numSegs offsets start stop offsetValue |

	"O primeiro valor de 32 bits eh o numero de segmentos RLE."
	numSegs := self getValueFromByteArray: colCompress start: 1 stop: 4.
	"Array com os valores de offsets para os segmentos RLE
	O Array tem uma posicao a mais para guardar na ultima posicao o tamanho do byte array
	que eh utilizado posteriormente no processo de decompressao dos segmentos RLE"
	offsets := Array new: numSegs + 1.  
	"Ler os valores de offset para os segmentos RLE e guarda-los no Arra offsets"
	1 to: numSegs do: [:index |
		start := index * 4 + 1.
		stop := index * 4 + 4.
		offsetValue := self getValueFromByteArray: colCompress start: start stop: stop.
		offsets at: index put: offsetValue].
	offsets at: numSegs + 1 put: colCompress size.
	^offsets
]

{ #category : #uncompressAByteArray }
RLEEncoder class >> getOffSets: colCompress bitsPerPixel: numBitsPerPixel [ 

	| numSegs offsets start stop offsetValue |

	"O primeiro valor de 32 bits eh o numero de segmentos RLE."
	numSegs := self getValueFromByteArray: colCompress start: 1 stop: 4.
	"Array com os valores de offsets para os segmentos RLE
	O Array tem uma posicao a mais para guardar na ultima posicao o tamanho do byte array
	que eh utilizado posteriormente no processo de decompressao dos segmentos RLE"
	offsets := Array new: numSegs + 1.  
	"Ler os valores de offset para os segmentos RLE e guarda-los no Arra offsets"
	1 to: numSegs do: [:index |
		start := index * 4 + 1.
		stop := index * 4 + 4.
		offsetValue := self getValueFromByteArray: colCompress start: start stop: stop.
		offsets at: index put: offsetValue].
	offsets at: numSegs + 1 put: colCompress size.
	^offsets
]

{ #category : #'auxiliar methods' }
RLEEncoder class >> getValueFromByteArray: byteArray start: start stop: stop [
	"Convert the base256 representation of an Integer value from <start> to <stop>.
	Little Endian. PRD 02-05.2001, 06.2017"

	^ LittleEndianBitPolisher getValueFromByteArray: byteArray start: start stop: stop
]

{ #category : #compressAByteArray }
RLEEncoder class >> mergeArrayCompressed: originalImage [
"
	this method gets a Dictionary and returns a RLE compressed ByteArray 
	especified at Annex G.  PS 3.5-2000 page 75 - EAF 13.11.02
"
      | offSetCollection mergeCompressedByteArray compressByteArray singleByteArray 
	  tempMergeCompressedByteArray mergeCompressedCollection count offSet |
	
      offSetCollection:= OrderedCollection new.
      tempMergeCompressedByteArray:= ByteArray new.
      mergeCompressedCollection:= OrderedCollection new. 
	originalImage do: [:collection | 
		singleByteArray:= self createByteArray: collection.
		compressByteArray:= self compressAByteArray: singleByteArray. 
		tempMergeCompressedByteArray:=  tempMergeCompressedByteArray, compressByteArray.
		offSetCollection add: compressByteArray size]. 
      mergeCompressedCollection
		add: offSetCollection size; 
		add:0; 
		add: 0; 
		add:0; 
		add: 64; 
		add:0; 
		add: 0;
		add:0.
      offSet:= 64.
      offSetCollection remove: offSetCollection last.
      offSetCollection do: [:aValue | offSet:=offSet + aValue. 
		mergeCompressedCollection addAll: (self rleSegment: offSet)].
      (mergeCompressedCollection size < 64) 
		ifTrue: [64 - (mergeCompressedCollection size) timesRepeat:[
			mergeCompressedCollection add: 0]
	]. 
      mergeCompressedCollection addAll: tempMergeCompressedByteArray. 
      mergeCompressedByteArray:= ByteArray new: mergeCompressedCollection size.
      count:= 1.
      mergeCompressedCollection do: [:each |
		mergeCompressedByteArray at: count put: each.
		count:= count + 1].

	^mergeCompressedByteArray
]

{ #category : #uncompressAByteArray }
RLEEncoder class >> rebuildOriginalImage: aDictionary [ 
"
	this method gets a Dictionary with descompressed OrderedCollections and returns 
	their values alternatly in an other OrderedCollection - EAF 25.03.03
"
	| cont sizeEachCol writeStream |

	writeStream := WriteStream on: ByteArray new.
	cont:= 1.
	sizeEachCol := (aDictionary at: 1) size.
	sizeEachCol timesRepeat: [
		aDictionary do: [:each |
			writeStream nextPut: (each at: cont)].
		cont := cont + 1].
	^writeStream contents.
]

{ #category : #compressAByteArray }
RLEEncoder class >> rleSegment:aValue [
"
	this method creates the header to an RLE compressed image especified 
	at Annex G PS 3.5 page 76 -  EAF 13.11.02
"
	| initialRle |

	initialRle:= OrderedCollection new. 
	aValue < (2**8) ifTrue: [
		initialRle 	add: (aValue bitAnd: 255); 
					add: 0; add: 0; add: 0]
	ifFalse:[
		aValue < (2**16) ifTrue: [
			initialRle 	add: (aValue bitAnd: 255);
						add:  ((aValue bitShift: -8) bitAnd: 255);
						add: 0; 
						add:0]
		ifFalse: [
			aValue < (2**24) ifTrue: [
				initialRle 	add: (aValue bitAnd: 255);
                                     	add:  ((aValue bitShift: -8) bitAnd: 255);
                                     	add:  ((aValue bitShift: -16) bitAnd: 255);
                                     	add: 0]
			ifFalse: [
				aValue < (2**32) ifTrue: [
					initialRle 	add: (aValue bitAnd: 255);
								add:  ((aValue bitShift: -8) bitAnd: 255);
								add:  ((aValue bitShift: -16) bitAnd: 255);
								add:  ((aValue bitShift: -24) bitAnd: 255)
				]
			]
		]
	].
	^initialRle
]

{ #category : #uncompressAByteArray }
RLEEncoder class >> uncompress: colCompress bitsPerPixel: numBitsPerPixel [
"
	this method returns an uncompressed RLE ByteArray
  	EAF 13.11.02
"
	| pReader unCompressByteArray colOffSets dicUncompress cont writeStream n |

	dicUncompress := Dictionary new.
	cont := 1.
	"O ultimo valor de colOffSets e o tamanho em bytes de colCompress"
	colOffSets := self getOffSets: colCompress.
	1 to: colOffSets size - 1 do: [:index |
		pReader := (colOffSets at: index) + 1.
		writeStream := WriteStream on: ByteArray new.
		"enquanto nao chegarmos no proximo segmento RLE, descomprimir... "
		[pReader < (colOffSets at: index + 1)] whileTrue: [ 
			"le n"
			n := (colCompress at: pReader).
			(n >= 0) & (n <= 127) ifTrue: [
				"ok, ler os proximos n + 1 bytes"
				pReader:= pReader + 1.
				(n + 1) timesRepeat: [
					writeStream nextPut: (colCompress at: pReader).
					pReader := pReader + 1].
			]
			ifFalse: [
				"temos um valor negativo (complemento de 2). 
				Primeiro tem que 'descomplementa-lo'"
				n := ((n bitXor: 255) + 1) negated.
				
				n = -128 ifTrue: [
					"Se n = -128, nao fazer nada. Pular para o proximo byte apenas"
					pReader := pReader + 1]
				ifFalse: [
					"armazenar o proximo valor -n + 1 vezes"
					pReader:= pReader + 1.
					(n negated  + 1) timesRepeat: [
						writeStream nextPut: (colCompress at: pReader)].
					pReader := pReader + 1
				]
			].
		]. 
		dicUncompress at: cont put: writeStream contents.
		cont := cont + 1.
	].  
	unCompressByteArray := self createByteArray: (self rebuildOriginalImage: dicUncompress).
	^unCompressByteArray
]
