Class {
	#name : #B2Demo9,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo9 >> setup [
	| b b1 j y mass frequencyHz dampingRatio omega d k softness biasFactor |
	b1 := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b1 friction: 0.2.
	b1 position: 0.0 @ -0.5 * b1 width y.
	b1 rotation: 0.0.
	world addBody: b1.
	mass := 10.0.
	frequencyHz := 4.0.
	dampingRatio := 0.7.
	omega := 2.0 * Float pi * frequencyHz.
	d := 2.0 * mass * dampingRatio * omega.
	k := mass * omega * omega.
	softness := 1.0 / (d + (self timeStep * k)).
	biasFactor := self timeStep * k / (d + (self timeStep * k)).
	y := 12.0.
	0 to: 14 do: [ :i | 
		| x |
		x := (0.5 + i) @ y.
		b := self newBody: 0.75 @ 0.25 mass: mass.
		b friction: 0.2.
		b position: x.
		b rotation: 0.0.
		world addBody: b.
		j := self newJointBody1: b1 body2: b anchor: i @ y.
		j softness: softness.
		j biasFactor: biasFactor.
		world addJoint: j.
		b1 := b ]
]
