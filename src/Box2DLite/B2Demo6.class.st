Class {
	#name : #B2Demo6,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo6 >> setup [
	| b1 b2 b3 b4 b5 j |
	b1 := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b1 position: 0.0 @ -0.5 * b1 width y.
	world addBody: b1.
	b2 := self newBody: 12.0 @ 0.25 mass: 100.0.
	b2 position: 0.0 @ 1.0.
	world addBody: b2.
	b3 := self newBody: 0.5 @ 0.5 mass: 25.0.
	b3 position: -5.0 @ 2.0.
	world addBody: b3.
	b4 := self newBody: 0.5 @ 0.5 mass: 25.0.
	b4 position: -5.5 @ 2.0.
	world addBody: b4.
	b5 := self newBody: 1.0 @ 1.0 mass: 100.0.
	b5 position: 5.5 @ 15.0.
	world addBody: b5.
	j := self newJointBody1: b1 body2: b2 anchor: 0.0 @ 1.0.
	world addJoint: j
]
