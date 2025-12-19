Extension { #name : 'JSFunction' }

{ #category : '*Javascript-Extras' }
JSFunction >> addExpression: aString [

	self add: (JSStream on: aString)
]

{ #category : '*Javascript-Extras' }
JSFunction class >> named: aString [

	^self named: aString arguments: #()
]

{ #category : '*Javascript-Extras' }
JSFunction >> named: aString [

	"Convert the receiver to a named function"

	^JSNamedFunction named: aString function: self
]

{ #category : '*Javascript-Extras' }
JSFunction class >> named: aString arguments: anArray [

	^JSNamedFunction new
		name: aString;
		arguments: anArray;
		yourself
]

{ #category : '*Javascript-Extras' }
JSFunction >> returnExpression: aString [

	self returnStatement: (JSStream on: aString)
]

{ #category : '*Javascript-Extras' }
JSFunction >> returnStatement: anObject [

	"Must be sent after all other statements have been added"

	self 
		return: true;
		add: anObject
]
