Class {
	#name : #B2Demo2,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo2 >> setup [
	| b1 b2 joint |
	b1 := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b1 friction: 0.2.
	b1 position: 0.0 @ -0.5 * b1 width y.
	b1 rotation: 0.0.
	world addBody: b1.
	b2 := self newBody: 1.0 @ 1.0 mass: 100.0.
	b2 friction: 0.2.
	b2 position: 9.0 @ 11.0.
	b2 rotation: 0.0.
	world addBody: b2.
	joint := self newJointBody1: b1 body2: b2 anchor: 0.0 @ 11.0.
	world addJoint: joint
]
