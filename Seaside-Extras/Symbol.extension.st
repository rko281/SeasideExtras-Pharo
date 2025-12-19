Extension { #name : 'Symbol' }

{ #category : '*Seaside-Extras' }
Symbol >> asHtmlTagId [

	"e.g. #oneThingOrAnother -> 'one-thing-or-another'"

	| out |

	out := (String new: self size + 4) writeStream.

	self writeAsHtmlTagIdOn: out.

	^out contents
]

{ #category : '*Seaside-Extras' }
Symbol >> writeAsHtmlTagIdOn: aStream [

	"e.g. #oneThingOrAnother -> 'one-thing-or-another'"

	| in first |

	in := self readStream.
	first:= true.
	[in atEnd] whileFalse: 
		[| next |
		next := in next.
		first ifTrue: 
			[ aStream nextPut: next asLowercase.
			first := false ]
		ifFalse: 
			[next isUppercase
				ifTrue: [aStream nextPut: $-; nextPut: next asLowercase]
				ifFalse: [aStream nextPut: next]]]
]
