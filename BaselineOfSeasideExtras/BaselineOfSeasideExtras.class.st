Class {
	#name : 'BaselineOfSeasideExtras',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSeasideExtras',
	#package : 'BaselineOfSeasideExtras'
}

{ #category : 'baselines' }
BaselineOfSeasideExtras >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		self 
			bootstrap5: spec;
			seaside: spec.

		spec
			package: 'Seaside-Extras' with: [ spec requires: #('Seaside-Core') ];
			package: 'Javascript-Extras' with: [ spec requires: #('Javascript-Core') ];
			package: 'JQuery-Extras' with: [ spec requires: #('JQuery-Core') ];
			package: 'Bootstrap5-Extras' with: [ spec requires: #('Seaside-Core' 'Bootstrap5-Core') ].

		spec
			group: 'all' with: #('Seaside-Extras' 'Javascript-Extras' 'JQuery-Extras' 'Bootstrap5-Extras');
			group: 'Seaside' with: #('Seaside-Extras');
			group: 'Javascript' with: #('Seaside-Extras' 'Javascript-Extras');
			group: 'JQuery' with: #('Seaside-Extras' 'Javascript-Extras' 'JQuery-Extras');
			group: 'Bootstrap5' with: #('Seaside-Extras' 'Bootstrap5-Extras');
			group: 'default' with: #('all').
	]
]

{ #category : 'baselines' }
BaselineOfSeasideExtras >> bootstrap5: spec [

	spec
		baseline: 'Bootstrap5remote' with: [ spec repository: 'github://astares/Seaside-Bootstrap5:master/src' ];
		project: 'Bootstrap5-Core' copyFrom: 'Bootstrap5remote' with: [ spec loads: #( 'Core' ) ] 
]

{ #category : 'baselines' }
BaselineOfSeasideExtras >> seaside: spec [

	spec
		baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ];
		project: 'Seaside3-Core' copyFrom: 'Seaside3' with: [ spec loads: #( 'Core' ) ];
		project: 'Javascript-Core' copyFrom: 'Seaside3' with: [ spec loads: #( 'Javascript-Core' ) ];
		project: 'JQuery-Core' copyFrom: 'Seaside3' with: [ spec loads: #( 'JQuery-Core' ) ]
]
