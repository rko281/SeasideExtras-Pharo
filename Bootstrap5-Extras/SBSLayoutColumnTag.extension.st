Extension { #name : 'SBSLayoutColumnTag' }

{ #category : '*Bootstrap5-Extras' }
SBSLayoutColumnTag >> units: anInteger [

	self units: anInteger size: nil
]

{ #category : '*Bootstrap5-Extras' }
SBSLayoutColumnTag >> units: anInteger size: aString [

	self class: 'col%' size: aString magnitude: anInteger
]
