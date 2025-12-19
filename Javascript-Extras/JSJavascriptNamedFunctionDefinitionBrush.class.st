Class {
	#name : 'JSJavascriptNamedFunctionDefinitionBrush',
	#superclass : 'JSJavascriptFunctionDefinitionBrush',
	#instVars : [
		'name'
	],
	#category : 'Javascript-Extras',
	#package : 'Javascript-Extras'
}

{ #category : 'accessing' }
JSJavascriptNamedFunctionDefinitionBrush >> name [

	^ name
]

{ #category : 'accessing' }
JSJavascriptNamedFunctionDefinitionBrush >> name: anObject [

	name := anObject
]

{ #category : 'private' }
JSJavascriptNamedFunctionDefinitionBrush >> openBrush [
	self document nextPutAll: 'function '; nextPutAll: self name; nextPutAll: '('.
	arguments isNil ifFalse: [
		arguments do: [ :each | self document identifier: each ]
		separatedBy: [ self document nextPut: $, ].].
	self document nextPut: $).
	self document openBlock
]
