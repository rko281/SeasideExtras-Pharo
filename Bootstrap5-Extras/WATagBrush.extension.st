Extension { #name : 'WATagBrush' }

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> alignItemsCenter [

	self class: 'align-items-center'
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> class: aString magnitude: anInteger [

	"Private - Utility for setting classes of the form 'gx-2'
	In this case aString would be 'gx' (note the '-' tag is omitted)"

	| out |

	out := WriteStream on: (String new: 16).

	out 
		nextPutAll: aString;
		nextPut: $-;
		display: anInteger.

	self class: out contents
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> class: aString size: responsiveTag [

	"Private - Utility for setting classes of the form 'flex-md-grow-1'
	aString should contain % where the responsive tag is to inserted, e.g. 'flex%grow' (note the '-' either size of the tag are omitted).
	For clarity responsiveTag can either be a Bootstrap string value (one of 'xs' 'sm' 'md' 'lg' 'xl' 'xxl') or a descriptive Symbol (#extraSmall #small #medium #large #extraLarge #extraExtraLarge)"

	^self class: aString size: responsiveTag magnitude: nil
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> class: aString size: responsiveTag magnitude: anInteger [

	"Private - Utility for setting classes of the form 'flex-md-grow-1'
	aString should contain % where the responsive tag is to inserted, e.g. 'flex%grow' (note the '-' either size of the tag are omitted).
	For clarity responsiveTag can either be a Bootstrap string value (one of 'xs' 'sm' 'md' 'lg' 'xl' 'xxl') or a descriptive Symbol (#extraSmall #small #medium #large #extraLarge #extraExtraLarge) and may also be nil.
	anInteger will be appended preceeded by '-'. May be nil if no numeric size is specified"

	| in out |

	in := aString readStream.
	out := WriteStream on: (String new: 16).

	out nextPutAll: (in upTo: $%).
	(in atEnd not or: [aString last = $%]) ifTrue: 
		[responsiveTag isNil ifFalse: 
			[out 
				nextPut: $-; 
				nextPutAll: 
					((IdentityDictionary new
						at: #extraSmall put: 'xs';
						at: #small put: 'sm';
						at: #medium put: 'md';
						at: #large put: 'lg';
						at: #extraLarge put: 'xl';
						at: #extraExtraLarge put: 'xxl';
						yourself) at: responsiveTag ifAbsent: [responsiveTag])].
		in atEnd ifFalse: 
			[out	
				nextPut: $-;
				nextPutAll: in upToEnd]].

	anInteger isNil ifFalse: [out nextPut: $-; print: anInteger].

	self class: out contents
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> flexGrow: aNumber [

	self flexGrow: aNumber size: nil
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> flexGrow: aNumber size: aString [

	self class: 'flex%grow' size: aString magnitude: aNumber
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> gutter: aNumber [

	self gutter: aNumber size: nil
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> gutter: aNumber size: aString [

	self class: 'g' size: aString magnitude: aNumber
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> gutterX: aNumber [

	self gutterX: aNumber size: nil
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> gutterX: aNumber size: aString [

	self class: 'gx' size: aString magnitude: aNumber
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> gutterY: aNumber [

	self gutterY: aNumber size: nil
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> gutterY: aNumber size: aString [

	self class: 'gy' size: aString magnitude: aNumber
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> marginEnd: aNumber [

	self class: 'me-', aNumber asString
]

{ #category : '*Bootstrap5-Extras' }
WATagBrush >> marginStart: aNumber [

	self class: 'ms-', aNumber asString
]
