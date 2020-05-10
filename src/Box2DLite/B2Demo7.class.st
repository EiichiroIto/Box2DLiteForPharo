Class {
	#name : #B2Demo7,
	#superclass : #B2Demo,
	#category : #'Box2DLite-Demo'
}

{ #category : #private }
B2Demo7 >> setup [
	| b bs numPlanks mass j frequencyHz dampingRatio omega d k softness biasFactor |
	b := self newBody: 100.0 @ 20.0 mass: Float fmax.
	b friction: 0.2.
	b position: 0.0 @ -0.5 * b width y.
	b rotation: 0.0.
	world addBody: b.
	numPlanks := 15.
	mass := 50.0.
	bs := {b}
		,
			((0 to: numPlanks - 1)
				collect: [ :i | 
					b := self newBody: 1.0 @ 0.25 mass: mass.
					b friction: 0.2.
					b position: (-8.5 + (1.25 * i)) @ 5.0.
					world addBody: b.
					b ]).
	frequencyHz := 2.0.
	dampingRatio := 0.7.
	omega := 2.0 * (Float pi * frequencyHz).
	d := 2.0 * mass * dampingRatio * omega.
	k := mass * omega * omega.
	softness := 1.0 / (d + (self timeStep * k)).
	biasFactor := self timeStep * k / (d + (self timeStep * k)).
	0 to: numPlanks - 1 do: [ :i | 
		j := self
			newJointBody1: (bs at: i + 1)
			body2: (bs at: i + 2)
			anchor: (-9.125 + (1.25 * i)) @ 5.0.
		j softness: softness.
		j biasFactor: biasFactor.
		world addJoint: j ].
	j := self
		newJointBody1: bs last
		body2: bs first
		anchor: (-9.125 + (1.25 * numPlanks)) @ 5.0.
	j softness: softness.
	j biasFactor: biasFactor.
	world addJoint: j
]
