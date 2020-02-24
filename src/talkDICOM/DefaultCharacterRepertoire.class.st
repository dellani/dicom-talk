Class {
	#name : #DefaultCharacterRepertoire,
	#superclass : #Object,
	#classInstVars : [
		'letters',
		'upperCase',
		'lowerCase',
		'digit',
		'symbol',
		'control',
		'characterRepertoire'
	],
	#category : #'talkDICOM-Data'
}

{ #category : #'as yet unclassified' }
DefaultCharacterRepertoire class >> _initCharacterRepertoire [
"
	No Comments. Really!!!!!
	PRD 05.2001
"

	characterRepertoire := Dictionary new.
	control 		associationsDo: [: each | characterRepertoire at: each key put: each value. ].
	symbol 		associationsDo: [: each | characterRepertoire at: each key put: each value. ].
	digit 		associationsDo: [: each | characterRepertoire at: each key put: each value. ].
	upperCase 	associationsDo: [: each | characterRepertoire at: each key put: each value. ].
	lowerCase 	associationsDo: [: each | characterRepertoire at: each key put: each value. ].
]

{ #category : #'as yet unclassified' }
DefaultCharacterRepertoire class >> _initControl [
"
	No Comments. Really!!!!!
	PRD 05.2001
"

	control := Dictionary new.
	control 	at: 16r000A put: Character lf;
			at: 16r000C put: Character newPage;
			at: 16r000D put: Character cr;
			at: 16r001B put: Character escape.
]

{ #category : #'as yet unclassified' }
DefaultCharacterRepertoire class >> _initDigit [
"
	No Comments. Really!!!!!
	PRD 05.2001
"

	digit := Dictionary new.
	digit at: 16r30 put: 16r30 asCharacter;
		 at: 16r31 put: 16r31 asCharacter;
		 at: 16r32 put: 16r32 asCharacter;
		 at: 16r33 put: 16r33 asCharacter;
		 at: 16r34 put: 16r34 asCharacter;
		 at: 16r35 put: 16r35 asCharacter;
		 at: 16r36 put: 16r36 asCharacter;
		 at: 16r37 put: 16r37 asCharacter;
		 at: 16r38 put: 16r38 asCharacter;
		 at: 16r39 put: 16r39 asCharacter.
]

{ #category : #'as yet unclassified' }
DefaultCharacterRepertoire class >> _initLowerCase [
"
	No Comments. Really!!!!!
	PRD 05.2001
"
	lowerCase := Dictionary new.
	lowerCase	at: 16r61 put: 16r61 asCharacter;
				at: 16r62 put: 16r62 asCharacter;
				at: 16r63 put: 16r63 asCharacter;
				at: 16r64 put: 16r64 asCharacter;
				at: 16r65 put: 16r65 asCharacter;
				at: 16r66 put: 16r66 asCharacter;
				at: 16r67 put: 16r67 asCharacter;
				at: 16r68 put: 16r68 asCharacter;
				at: 16r69 put: 16r69 asCharacter;
				at: 16r6A put: 16r6A asCharacter;
				at: 16r6B put: 16r6B asCharacter;
				at: 16r6C put: 16r6C asCharacter;
				at: 16r6D put: 16r6D asCharacter;
				at: 16r6E put: 16r6E asCharacter;
				at: 16r6F put: 16r6F asCharacter;
				at: 16r70 put: 16r70 asCharacter;
				at: 16r71 put: 16r71 asCharacter;
				at: 16r72 put: 16r72 asCharacter;
				at: 16r73 put: 16r73 asCharacter;
				at: 16r74 put: 16r74 asCharacter;
				at: 16r75 put: 16r75 asCharacter;
				at: 16r76 put: 16r76 asCharacter;
				at: 16r77 put: 16r77 asCharacter;
				at: 16r78 put: 16r78 asCharacter;
				at: 16r79 put: 16r79 asCharacter;
				at: 16r7A put: 16r7A asCharacter.
]

{ #category : #'as yet unclassified' }
DefaultCharacterRepertoire class >> _initSymbol [
"
	No Comments. Really!!!!!
	PRD 05.2001
"

	symbol := Dictionary new.
	symbol 	at: 16r0020 put: Character space;
			at: 16r0021 put: $!;
			at: 16r0022 put: $";
			at: 16r0023 put: $#;
			at: 16r0024 put: $$;
			at: 16r0025 put: $%;
			at: 16r0026 put: $&;
			at: 16r0027 put: $';
			at: 16r0028 put: $(;
			at: 16r0029 put: $);
			at: 16r002A put: $*;
			at: 16r002B put: $+;
			at: 16r002C put: $,;
			at: 16r002D put: $-;
			at: 16r002E put: $.;
			at: 16r002F put: $/;
			at: 16r003A put: $:;
			at: 16r003B put: $;;
			at: 16r003C put: $<;
			at: 16r003D put: $=;
			at: 16r003E put: $>;
			at: 16r003F put: $?;
			at: 16r0040 put: $@;
			at: 16r005B put: $[;
			at: 16r005C put: $\;
			at: 16r005D put: $];
			at: 16r005E put: $^;
			at: 16r005F put: $_;
			at: 16r0060 put: $`;
			at: 16r007B put: ${;
			at: 16r007C put: $|;
			at: 16r007D put: $};
			at: 16r007E put: $~.
]

{ #category : #'as yet unclassified' }
DefaultCharacterRepertoire class >> _initUpperCase [
"
	No Comments. Really!!!!!
	PRD 05.2001
"

	upperCase := Dictionary new.
	upperCase	at: 16r41 put: 16r41 asCharacter;
				at: 16r42 put: 16r42 asCharacter;
				at: 16r43 put: 16r43 asCharacter;
				at: 16r44 put: 16r44 asCharacter;
				at: 16r45 put: 16r45 asCharacter;
				at: 16r46 put: 16r46 asCharacter;
				at: 16r47 put: 16r47 asCharacter;
				at: 16r48 put: 16r48 asCharacter;
				at: 16r49 put: 16r49 asCharacter;
				at: 16r4A put: 16r4A asCharacter;
				at: 16r4B put: 16r4B asCharacter;
				at: 16r4C put: 16r4C asCharacter;
				at: 16r4D put: 16r4D asCharacter;
				at: 16r4E put: 16r4E asCharacter;
				at: 16r4F put: 16r4F asCharacter;
				at: 16r50 put: 16r50 asCharacter;
				at: 16r51 put: 16r51 asCharacter;
				at: 16r52 put: 16r52 asCharacter;
				at: 16r53 put: 16r53 asCharacter;
				at: 16r54 put: 16r54 asCharacter;
				at: 16r55 put: 16r55 asCharacter;
				at: 16r56 put: 16r56 asCharacter;
				at: 16r57 put: 16r57 asCharacter;
				at: 16r58 put: 16r58 asCharacter;
				at: 16r59 put: 16r59 asCharacter;
				at: 16r5A put: 16r5A asCharacter.
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> control [
	^ control isNil
		ifTrue: [ self initControl ]
		ifFalse: [ control ]
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> digit [
	^ digit isNil
		ifTrue: [ self initDigit ]
		ifFalse: [ digit ]
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initCharacterRepertoire [
	"No Comments. Really!!!!!

	PRD 05.2001"

	characterRepertoire := CharacterSet new.
	characterRepertoire
		addAll: self control;
		addAll: self symbol;
		addAll: self digit;
		addAll: self upperCase;
		addAll: self lowerCase
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initControl [
	"No Comments. Really!!!!!

	PRD 05.2001"

	control := CharacterSet
		with: Character lf
		with: Character newPage
		with: Character cr
		with: Character escape.
	^ control
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initDigit [
	"No Comments. Really!!!!!
	PRD 05.2001, 03.2017"

	digit := CharacterSet new.
	16r30 to: 16r39 do: [ :i | digit add: i asCharacter ].
	^ digit
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initLowerCase [
	"No Comments. Really!!!!!

	PRD 05.2001"

	lowerCase := CharacterSet new.
	16r61 to: 16r7A do: [ :i | lowerCase add: i asCharacter ].
	^ lowerCase
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initSymbol [
	"No Comments. Really!!!!!

	PRD 05.2001"

	symbol := CharacterSet new
		add: Character space;
		add: $!;
		add: $";
		add: $#;
		add: $$;
		add: $%;
		add: $&;
		add: $';
		add: $(;
		add: $);
		add: $*;
		add: $+;
		add: $,;
		add: $-;
		add: $.;
		add: $/;
		add: $:;
		add: $;;
		add: $<;
		add: $=;
		add: $>;
		add: $?;
		add: $@;
		add: $[;
		add: $\;
		add: $];
		add: $^;
		add: $_;
		add: $`;
		add: ${;
		add: $|;
		add: $};
		add: $~;
		yourself.
	^ symbol
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initUpperCase [
	"No Comments. Really!!!!!

	PRD 05.2001"

	upperCase := CharacterSet new.
	16r41 to: 16r5A do: [ :i | upperCase add: i asCharacter ].
	^ upperCase
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initialize [
	"	DICOM default character repertoire initialization. This code 
	is for Day 4 movie host computer compatibility/portability.

	PRD 05.2001"

	control := nil.
	digit := nil.
	lowerCase := nil.
	symbol := nil.
	upperCase := nil.


	self initCharacterRepertoire
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> lowerCase [
	^ lowerCase isNil
		ifTrue: [ self initLowerCase ]
		ifFalse: [ lowerCase ]
]

{ #category : #'instance creation' }
DefaultCharacterRepertoire class >> new [

	^super new initialize.
]

{ #category : #characters }
DefaultCharacterRepertoire class >> space [

	^16r20 asCharacter.
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> symbol [
	^ symbol isNil
		ifTrue: [ self initSymbol ]
		ifFalse: [ symbol ]
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> upperCase [
	^ upperCase isNil
		ifTrue: [ self initUpperCase ]
		ifFalse: [ upperCase ]
]

{ #category : #initialize }
DefaultCharacterRepertoire >> initialize [
]
