Extension { #name : 'SBSHtmlCanvas' }

{ #category : '*Bootstrap5-Extras' }
SBSHtmlCanvas >> columnUnits: anInteger [
	
	"Convenience for creating and configuring Bootstrap columns in a single message"

	^self columnUnits: anInteger size: nil
]

{ #category : '*Bootstrap5-Extras' }
SBSHtmlCanvas >> columnUnits: anInteger size: aString [
	
	"Convenience for creating and configuring Bootstrap columns in a single message"

	^self column 
		units: anInteger size: aString;
		yourself
]
