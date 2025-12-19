Extension { #name : 'JSScript' }

{ #category : '*Javascript-Extras' }
JSScript >> fetch: aUrl then: thenString values: aCollection method: aString [

	| jsStream |

	jsStream := JSStream new.
	jsStream nextPutAll: 'fetch('; javascript: aUrl.
	aCollection isEmpty ifFalse: [jsStream nextPutAll: '+"="+'; javascript: aCollection; nextPutAll: '.toString()'].
	jsStream nextPutAll: ', {method: "'; nextPutAll: aString; nextPutAll: '" })'.
	thenString isNil ifFalse: [jsStream nextPutAll: '.then'; nextPutAll: thenString].

	self add: jsStream
]

{ #category : '*Javascript-Extras' }
JSScript >> fetchCallback: aBlock then: thenString values: aCollection method: aString [

	self 
		fetch: (self renderContext actionUrl withField: (self renderContext callbacks store: (WAActionCallback on: aBlock))) 
		then: thenString
		values: aCollection
		method: aString
]

{ #category : '*Javascript-Extras' }
JSScript >> fetchCallback: aBlock value: anObject method: aString [

	self fetchCallback: aBlock values: {anObject} method: aString
]

{ #category : '*Javascript-Extras' }
JSScript >> fetchCallback: aBlock values: aCollection method: aString [

	self 
		fetch: (self renderContext actionUrl withField: (self renderContext callbacks store: (WAActionCallback on: aBlock))) 
		then: nil
		values: aCollection
		method: aString
]
