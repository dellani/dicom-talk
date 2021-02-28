"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifesttalkDICOMObjectsIOD,
	#superclass : #PackageManifest,
	#category : #'talkDICOM-Objects-IOD-Manifest'
}

{ #category : #'code-critics' }
ManifesttalkDICOMObjectsIOD class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DicomIOD #populateIOMDictionaries: #false)) #'2021-02-28T17:59:33.751863+01:00') )
]
