Extension { #name : 'WATagBrush' }

{ #category : '*Seaside-Extras' }
WATagBrush >> includesClass: aString [

	^(self attributeAt: 'class' ifAbsent: [nil])
	ifNil: 
		[false]
	ifNotNil:
		[ :value | 
		value isConcatenatedHtmlAttributeValue
			ifTrue: [value includes: aString]
			ifFalse: [value = aString]]
]

{ #category : '*Seaside-Extras' }
WATagBrush >> textCenter [

	self class: 'text-center'
]

{ #category : '*Seaside-Extras' }
WATagBrush >> textEnd [

	self class: 'text-end'
]

{ #category : '*Seaside-Extras' }
WATagBrush >> textStart [

	self class: 'text-start'
]
