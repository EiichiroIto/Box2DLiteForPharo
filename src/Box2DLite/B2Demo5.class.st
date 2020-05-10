Class {
	#name : #B2Demo5,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo5 >> setup [
	| b x y |
	b := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b friction: 0.2.
	b position: 0.0 @ (-0.5 * b width y).
	b rotation: 0.0.
	world addBody: b.
	x := -6.0 @ 0.75.
	0 to: 11 do: [ :i | 
		y := x.
		i to: 11 do: [ :j | 
			b := self newBody: 1.0 @ 1.0 mass: 10.0.
			b friction: 0.2.
			b position: y.
			world addBody: b.
			y := y + (1.125 @ 0.0) ].
		x := x + (0.5625 @ 2.0) ]
]
