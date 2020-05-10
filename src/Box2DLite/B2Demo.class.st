"
B2Demo is a base class of Box2DLite demos.

Public API and Key Messages

- open
- asMorph
- asGifFileNamed:steps:

    B2Demo new open. ""open a Spec2 window to try all demos""
    B2Demo5 new asMorph openInWorld. ""create a morph for B2Demo5""
    B2Demo6 new asGifFileNamed: 'demo8.gif' steps: 1000.
        ""generate animated gif for B2Demo6 with 1000 steps""

Internal Representation and Key Implementation Points.

  Instance Variables
    extent:			<Point> ""demo extent""
    viewport:		<Point> ""demo viewport""
    world:			<B2World> ""Box2DLite world""

"
Class {
	#name : #B2Demo,
	#superclass : #Object,
	#instVars : [
		'world',
		'extent',
		'viewport'
	],
	#category : #'Box2DLite-Demo'
}

{ #category : #api }
B2Demo >> asGifFileNamed: aString steps: anInteger [ 
	| display recorder |
	display := B2Display extent: self extent.
	display viewport: self viewport.
	recorder := B2Recorder new.
	recorder delay: 20.
	recorder openFileNamed: aString.
	self restart.
	anInteger
		timesRepeat: [ self step.
			self drawOn: display.
			recorder writeForm: display form ].
	recorder close
]

{ #category : #api }
B2Demo >> asMorph [
	| display morph |
	display := B2Display extent: self extent.
	display viewport: self viewport.
	morph := B2DemoMorph new.
	morph demo: self restart.
	morph display: display.
	^ morph
]

{ #category : #private }
B2Demo >> defaultExtent [
	^ 400 @ 400
]

{ #category : #private }
B2Demo >> defaultViewport [
	^ -10 @ -5 corner: 10 @ 15
]

{ #category : #api }
B2Demo >> drawOn: aDisplay [
	aDisplay clear.
	world bodies do: [ :each | aDisplay drawBody: each ].
	world joints do: [ :each | aDisplay drawJoint: each ].
	world contacts do: [ :each | aDisplay drawContact: each ]
]

{ #category : #accessing }
B2Demo >> extent [
	^ extent
]

{ #category : #accessing }
B2Demo >> extent: aPoint [
	extent := aPoint
]

{ #category : #initialization }
B2Demo >> initialize [
	world := B2World new.
	world setGravity: 0.0 @ -10.0 iterations: 10.
	extent := self defaultExtent.
	viewport := self defaultViewport
]

{ #category : #api }
B2Demo >> launchBomb [
	| bomb |
	bomb := self newBody: 1.0 @ 1.0 mass: 50.0.
	bomb friction: 0.2.
	bomb position: (-15 to: 15) atRandom @ 15.0.
	bomb rotation: (-15 to: 15) atRandom / 10.
	bomb velocity: -1.5 * bomb position.
	bomb angularVelocity: (-20.0 to: 20.0) atRandom.
	world addBody: bomb
]

{ #category : #private }
B2Demo >> newBody: aPoint mass: aFloat [
	^ B2Body extent: aPoint mass: aFloat
]

{ #category : #private }
B2Demo >> newJointBody1: body1 body2: body2 anchor: anchor [
	^ B2Joint body1: body1 body2: body2 anchor: anchor
]

{ #category : #api }
B2Demo >> open [
	| presenter |
	presenter := B2SpFrame new.
	presenter openWithSpec.
	presenter window title: self class name.
	^ presenter
]

{ #category : #private }
B2Demo >> restart [
	world clear.
	self setup
]

{ #category : #private }
B2Demo >> setup [
	self subclassResponsibility
]

{ #category : #api }
B2Demo >> step [
	world step: self timeStep
]

{ #category : #private }
B2Demo >> timeStep [
	^ 1.0 / 60.0
]

{ #category : #accessing }
B2Demo >> viewport [
	^ viewport
]

{ #category : #accessing }
B2Demo >> viewport: aRectangle [
	viewport := aRectangle
]

{ #category : #accessing }
B2Demo >> world [
	^ world
]
