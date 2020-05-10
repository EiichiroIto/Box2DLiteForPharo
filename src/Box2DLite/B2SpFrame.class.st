Class {
	#name : #B2SpFrame,
	#superclass : #SpPresenter,
	#instVars : [
		'stage',
		'demos',
		'display',
		'buttonAccumulateImpulses',
		'buttonWarmStarting',
		'buttonPositionCorrection'
	],
	#category : #'Box2DLite-Demo'
}

{ #category : #specs }
B2SpFrame class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #demos withConstraints: [ :c | c width: 100 ];
		add:
			(SpBoxLayout newVertical
				add:
					(SpBoxLayout newHorizontal
						add: #buttonAccumulateImpulses;
						add: #buttonPositionCorrection;
						add: #buttonWarmStarting;
						yourself)
					withConstraints: [ :c | c height: 30 ];
				add: #stage;
				yourself);
		yourself
]

{ #category : #private }
B2SpFrame class >> stageExtent [
	^ 800 @ 800
]

{ #category : #initialization }
B2SpFrame >> connectPresenters [
	demos
		display: [ :each | each asString ];
		whenSelectionChangedDo: [ :each | self setupDemo: each ].
	buttonAccumulateImpulses
		whenActivatedDo: [ B2World accumulateImpulses: true ];
		whenDeactivatedDo: [ B2World accumulateImpulses: false ].
	buttonPositionCorrection
		whenActivatedDo: [ B2World positionCorrection: true ];
		whenDeactivatedDo: [ B2World positionCorrection: false ].
	buttonWarmStarting
		whenActivatedDo: [ B2World warmStarting: true ];
		whenDeactivatedDo: [ B2World warmStarting: false ]
]

{ #category : #private }
B2SpFrame >> demoClasses [
	^ B2Demo subclasses
]

{ #category : #initialization }
B2SpFrame >> initializePresenters [
	buttonAccumulateImpulses := self newCheckBox.
	buttonAccumulateImpulses
		label: 'accumulate impulses';
		state: B2World accumulateImpulses.
	buttonWarmStarting := self newCheckBox.
	buttonWarmStarting
		label: 'warm starting';
		state: B2World warmStarting.
	buttonPositionCorrection := self newCheckBox.
	buttonPositionCorrection
		label: 'position correction';
		state: B2World positionCorrection.
	demos := self newList.
	demos beSingleSelection.
	demos items: self demoClasses.
	stage := self newMorph.
	self setupStage.
	self focusOrder
		add: demos;
		add: stage
]

{ #category : #initialization }
B2SpFrame >> initializeWindow: aWindow [
	aWindow initialExtent: self class stageExtent + (120 @ 70)
]

{ #category : #private }
B2SpFrame >> setupDemo: aSelection [
	| demo |
	demo := aSelection selectedItem new.
	display viewport: demo viewport.
	stage morph demo: demo restart
]

{ #category : #initialization }
B2SpFrame >> setupStage [
	| morph |
	display := B2Display extent: self class stageExtent.
	morph := B2DemoMorph new.
	morph display: display.
	stage morph: morph
]
