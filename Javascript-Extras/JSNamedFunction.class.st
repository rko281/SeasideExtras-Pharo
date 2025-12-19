Class {
	#name : 'JSNamedFunction',
	#superclass : 'JSFunction',
	#instVars : [
		'name'
	],
	#category : 'Javascript-Extras',
	#package : 'Javascript-Extras'
}

{ #category : 'instance creation' }
JSNamedFunction class >> named: aString function: aJSFunction [

	"Private - Answer an instance of the receiver named aString with the same internals as aJSFunction"

	| instance |

	instance := self new.
	instance name: aString.
	1 to: JSFunction instSize do: 
		[ :index || val |
		val := aJSFunction instVarAt: index.
		val == aJSFunction
			ifTrue: [instance instVarAt: index put: instance]
			ifFalse: [instance instVarAt: index put: val]].
	^instance
]

{ #category : 'printing' }
JSNamedFunction >> javascriptContentOn: aRenderer [
	aRenderer defineNamedFunction 
		name: self name; 
		arguments: self arguments;
		with:
		[ statements isEmpty ifFalse:
			[self return 
			ifTrue:
				[ statements allButLast do:
					[ :each | 
					aRenderer render: each.
					aRenderer document separator].
					aRenderer return: statements last ]
			ifFalse: 
				[ statements do:
					[ :each | 
					aRenderer render: each.
					aRenderer document separator] ]]]
]

{ #category : 'accessing' }
JSNamedFunction >> name [

	^ name
]

{ #category : 'accessing' }
JSNamedFunction >> name: anObject [

	name := anObject
]
