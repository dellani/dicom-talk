"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifesttalkDicomData,
	#superclass : #PackageManifest,
	#category : #'talkDICOM-Data'
}

{ #category : #'code-critics' }
ManifesttalkDicomData class >> ruleGRGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MultipleStringValueDataElement #printValueOn: #false)) #'2021-04-06T15:36:58.970395+02:00') #(#(#RGClassDefinition #(#UNDataElement)) #'2021-04-06T16:52:30.20098+02:00') )
]

{ #category : #'code-critics' }
ManifesttalkDicomData class >> ruleRBGuardingClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MultipleStringValueDataElement #printValueOn: #false)) #'2021-04-06T15:37:01.760753+02:00') #(#(#RGMethodDefinition #(#UNDataElement #printValueOn: #false)) #'2021-04-06T16:52:23.913603+02:00') )
]
