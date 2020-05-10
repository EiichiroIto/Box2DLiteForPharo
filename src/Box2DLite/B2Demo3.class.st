Class {
	#name : #B2Demo3,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo3 >> setup [
	| b |
	b := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b position: 0.0 @ (-0.5 * b width y).
	world addBody: b.
	b := self newBody: 13.0 @ 0.25 mass: Float fmax.
	b position: -2.0 @ 11.0.
	b rotation: -0.25.
	world addBody: b.
	b := self newBody: 0.25 @ 1.0 mass: Float fmax.
	b position: 5.25 @ 9.5.
	world addBody: b.
	b := self newBody: 13.0 @ 0.25 mass: Float fmax.
	b position: 2.0 @ 7.0.
	b rotation: 0.25.
	world addBody: b.
	b := self newBody: 0.25 @ 1.0 mass: Float fmax.
	b position: -5.25 @ 5.5.
	world addBody: b.
	b := self newBody: 13.0 @ 0.25 mass: Float fmax.
	b position: -2.0 @ 3.0.
	b rotation: -0.25.
	world addBody: b.
	#(0.75 0.5 0.35 0.1 0.0)
		withIndexDo: [ :each :i | 
			b := self newBody: 0.5 @ 0.5 mass: 25.0.
			b friction: each.
			b position: (-7.5 + (2.0 * (i - 1))) @ 14.0.
			world addBody: b ]
]
