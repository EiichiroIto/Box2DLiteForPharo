Class {
	#name : #B2Demo1,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo1 >> setup [
	| body |
	body := self newBody: 100.0 @ 20 mass: Float fmax.
	body position: 0.0 @ (-0.5 * body width y).
	world addBody: body.
	body := self newBody: 1.0 @ 1.0 mass: 200.0.
	body position: 0.0 @ 4.0.
	world addBody: body
]
