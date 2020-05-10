Class {
	#name : #B2Demo8,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo8 >> setup [
	| b1 b b2 b3 b4 b5 b6 j |
	b1 := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b1 position: 0.0 @ -0.5 * b1 width y.
	world addBody: b1.
	b := self newBody: 12.0 @ 0.5 mass: Float fmax.
	b position: -1.5 @ 10.0.
	world addBody: b.
	0 to: 9 do: [ :i | 
		b := self newBody: 0.2 @ 2.0 mass: 10.0.
		b position: (-6.0 + (1.0 * i)) @ 11.125.
		b friction: 0.1.
		world addBody: b ].
	b := self newBody: 14.0 @ 0.5 mass: Float fmax.
	b position: 1.0 @ 6.0.
	b rotation: 0.3.
	world addBody: b.
	b2 := self newBody: 0.5 @ 3.0 mass: Float fmax.
	b2 position: -7.0 @ 4.0.
	world addBody: b2.
	b3 := self newBody: 12.0 @ 0.25 mass: 20.0.
	b3 position: -0.9 @ 1.0.
	world addBody: b3.
	j := self newJointBody1: b1 body2: b3 anchor: -2.0 @ 1.0.
	world addJoint: j.
	b4 := self newBody: 0.5 @ 0.5 mass: 10.0.
	b4 position: -10.0 @ 15.0.
	world addBody: b4.
	j := self newJointBody1: b2 body2: b4 anchor: -7.0 @ 15.0.
	world addJoint: j.
	b5 := self newBody: 2.0 @ 2.0 mass: 20.0.
	b5 position: 6.0 @ 2.5.
	b5 friction: 0.1.
	world addBody: b5.
	j := self newJointBody1: b1 body2: b5 anchor: 6.0 @ 2.6.
	world addJoint: j.

	"b6 := self newBody: 0.2 @ 2.0 mass: 10.0.
	b6 position: 7.3 @ 1.6.
	world addBody: b6."

	b6 := self newBody: 2.0 @ 0.2 mass: 10.0.
	b6 position: 6.0 @ 3.6.
	world addBody: b6.
	j := self newJointBody1: b5 body2: b6 anchor: 7.0 @ 3.5.
	world addJoint: j
]
