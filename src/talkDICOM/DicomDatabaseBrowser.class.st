Class {
	#name : #DicomDatabaseBrowser,
	#superclass : #Object,
	#instVars : [
		'browser'
	],
	#category : #'talkDICOM-Browser'
}

{ #category : #building }
DicomDatabaseBrowser >> buildBrowser [
	| tmp2 tmp4 tmp6 tmp8 |
	browser := GLMTabulator new.
	browser
		act: [ :arg1 | arg1 inspect ]
			on: $/
			entitled: 'Global action with shortcut';
		act: [ :arg2 | arg2 inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			entitled: 'Action with icon'.
	tmp2 := browser.
	tmp2
		row: #patients;
		row: #studies;
		row: #series;
		row: #images.
	tmp4 := browser transmit.
	tmp4
		to: #patients;
		andShow: [ :arg3 | self patientsIn: arg3 ].
	tmp6 := browser transmit.
	tmp6
		from: #patients;
		to: #studies;
		andShow: [ :arg4 | self studiesOf: arg4 ].
	tmp8 := browser transmit.
	tmp8
		from: #studies;
		to: #series;
		andShow: [ :arg5 | self seriesOf: arg5 ].
	^ browser
]
