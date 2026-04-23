Extension { #name : 'SBSButtonTag' }

{ #category : '*Bootstrap5-Extras' }
SBSButtonTag >> beOutline [

	self beOutlineIf: true
]

{ #category : '*Bootstrap5-Extras' }
SBSButtonTag >> beOutlineIf: aBlock [
	"Creates an outline type button if aBlock is true."

	self class: self contextStyle, self modifierString, '-outline' if: aBlock value
]
