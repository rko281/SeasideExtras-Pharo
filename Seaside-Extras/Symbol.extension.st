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

	| in |

	in := self readStream.
	[in atEnd] whileFalse: 
		[| next |
		next := in next.
		next isUppercase
			ifTrue: [aStream nextPut: $-; nextPut: next asLowercase]
			ifFalse: [aStream nextPut: next]]
]
