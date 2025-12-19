Extension { #name : 'JQueryInstance' }

{ #category : '*JQuery-Extras' }
JQueryInstance >> as: aJQueryInstanceSubclass [

	^aJQueryInstanceSubclass fromJQueryInstance: self
]

{ #category : '*JQuery-Extras' }
JQueryInstance class >> fromJQueryInstance: aJQueryInstance [

	| instance |

	instance := self new.
	1 to: JQueryInstance instSize do: [ :index | instance instVarAt: index put: (aJQueryInstance instVarAt: index)].
	^instance
]

{ #category : '*JQuery-Extras' }
JQueryInstance >> newCopy [

	"Answer a new, undecorated, copy of the receiver ready for a new statement"

	^self copy
		resetDecoration;
		yourself
]

{ #category : '*JQuery-Extras' }
JQueryInstance >> resetDecoration [

	decoration := self
]
