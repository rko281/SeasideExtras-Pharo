Extension { #name : 'JSJavascriptCanvas' }

{ #category : '*Javascript-Extras' }
JSJavascriptCanvas >> defineNamedFunction [
	^ self brush: (JSJavascriptNamedFunctionDefinitionBrush new)
]
