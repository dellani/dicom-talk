"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifesttalkDICOMLightParsing,
	#superclass : #PackageManifest,
	#category : #'talkDICOM-LightParsing-Manifest'
}

{ #category : #'code-critics' }
ManifesttalkDICOMLightParsing class >> ruleRBImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'ExplicitVRTS class' #skipNextUTDataElement: #true)) #'2021-02-28T20:50:12.43292+01:00') )
]
