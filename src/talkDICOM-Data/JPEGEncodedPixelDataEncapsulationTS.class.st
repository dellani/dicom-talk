"
Comments from the DICOM Standard: (PS 3.5-2001):

10.2 TRANSFER SYNTAX FOR A DICOM DEFAULT OF LOSSLESS JPEG COMPRESSION 

DICOM defines a default for lossless JPEG Image Compression, which uses a subset of coding 
Process 14 with a first-order prediction (Selection Value 1). It is identified by Transfer Syntax 
UID = ""1.2.840.10008.1.2.4.70"" and shall be supported by every DICOM implementation that 
chooses to support one or more of the lossless JPEG compression processes. This implies that: 

a) If an Application Entity issues an A-ASSOCIATE request where any offered Abstract Syntaxes 
is associated in one or more Presentation Context with a JPEG lossless compression Transfer 
Syntax, at least one of the Presentation Contexts which include this Abstract Syntax, shall
include the DICOM Default Lossless JPEG Compression Transfer Syntax and the DICOM Default 
Transfer Syntax (uncompressed). 
Note: Offering Abstract Syntax (AS1) in two Presentation Contexts with Transfer Syntaxes 
JPEG lossless (JL1) and (JL2) is not valid, but offering AS1-JL1, AS1-JL2, AS1-TSD, and 
AS1-JLD is valid because the DICOM Default JPEG Lossless Transfer Syntax (JLD) 
and the DICOM Default Transfer Syntax (TSD) are present in at least one of the Presentation 
Contexts which are based on Abstract Syntax (AS1). 

b) If an Application Entity that supports one or more lossless JPEG Transfer Syntax receives
an A-ASSOCIATE indication corresponding to a request which follows the requirements
specified in Section 10.2 a), every Presentation Context related to a given Abstract Syntax
cannot be rejected in an A-ASSOCIATE response for the reason that the DICOM Default
lossless JPEG Transfer Syntax is not supported.
"
Class {
	#name : #JPEGEncodedPixelDataEncapsulationTS,
	#superclass : #EncodedPixelDataEncapsulationTS,
	#category : #'talkDICOM-Data'
}

{ #category : #initialize }
JPEGEncodedPixelDataEncapsulationTS class >> initialize [
	UID := '1.2.840.10008.1.2.4.70'.	"DICOM Lossless JPEG Image Compression"
	self registerMyself
]
