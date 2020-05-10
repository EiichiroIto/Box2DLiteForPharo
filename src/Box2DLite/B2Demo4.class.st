Class {
	#name : #B2Demo4,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo4 >> setup [
	| b |
	b := B2Body new.
	b setExtent: 100.0 @ 20.0 mass: Float fmax.
	b friction: 0.2.
	b position: 0.0 @ -0.5 * b width y.
	b rotation: 0.0.
	world addBody: b.
	0 to: 9 do: [ :i | 
		| x |
		b := B2Body new.
		b setExtent: 1.0 @ 1.0 mass: 1.0.
		b friction: 0.2.
		x := (-100 to: 100) atRandom / 1000.0.
		b position: x @ (0.51 + (1.05 * i)).
		world addBody: b ]
]
