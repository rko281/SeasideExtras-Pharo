Extension { #name : 'WARequest' }

{ #category : '*Seaside-Extras' }
WARequest >> noResponse [
	self response status: WAResponse statusNoContent.
	self respond
]
