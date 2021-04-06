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

{ #category : #accessing }
DefaultCharacterRepertoire class >> control [
	^ control ifNil: [ self initControl ] ifNotNil: [ :arg | arg ]
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> digit [
	^ digit ifNil: [ self initDigit ] ifNotNil: [ :arg | arg ]
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initCharacterRepertoire [
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
	control := CharacterSet
		with: Character lf
		with: Character newPage
		with: Character cr
		with: Character escape.
	^ control
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initDigit [
	digit := CharacterSet new.
	16r30 to: 16r39 do: [ :i | digit add: i asCharacter ].
	^ digit
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initLowerCase [
	lowerCase := CharacterSet new.
	16r61 to: 16r7A do: [ :i | lowerCase add: i asCharacter ].
	^ lowerCase
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initSymbol [
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
	upperCase := CharacterSet new.
	16r41 to: 16r5A do: [ :i | upperCase add: i asCharacter ].
	^ upperCase
]

{ #category : #initialize }
DefaultCharacterRepertoire class >> initialize [
	"May 2001: DICOM default character repertoire initialization.
	This code is for Day 4 movie host computer compatibility/portability - PRD"

	control := nil.
	digit := nil.
	lowerCase := nil.
	symbol := nil.
	upperCase := nil.

	self initCharacterRepertoire
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> lowerCase [
	^ lowerCase ifNil: [ self initLowerCase ] ifNotNil: [ :arg | arg ]
]

{ #category : #'instance creation' }
DefaultCharacterRepertoire class >> new [
	^ super new initialize
]

{ #category : #characters }
DefaultCharacterRepertoire class >> space [
	^ 16r20 asCharacter
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> symbol [
	^ symbol ifNil: [ self initSymbol ] ifNotNil: [ :arg | arg ]
]

{ #category : #accessing }
DefaultCharacterRepertoire class >> upperCase [
	^ upperCase ifNil: [ self initUpperCase ] ifNotNil: [ :arg | arg ]
]

{ #category : #initialize }
DefaultCharacterRepertoire >> initialize [
]
