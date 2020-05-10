Class {
	#name : #B2World,
	#superclass : #Object,
	#instVars : [
		'gravity',
		'iterations',
		'bodies',
		'joints',
		'arbiters'
	],
	#classVars : [
		'AccumulateImpulses',
		'PositionCorrection',
		'WarmStarting'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #accessing }
B2World class >> accumulateImpulses [
	^ AccumulateImpulses ifNil: [ AccumulateImpulses := true ]
]

{ #category : #accessing }
B2World class >> accumulateImpulses: aBoolean [
	AccumulateImpulses := aBoolean
]

{ #category : #accessing }
B2World class >> positionCorrection [
	^ PositionCorrection ifNil: [ PositionCorrection := true ]
]

{ #category : #accessing }
B2World class >> positionCorrection: aBoolean [
	PositionCorrection := aBoolean
]

{ #category : #accessing }
B2World class >> warmStarting [
	^ WarmStarting ifNil: [ WarmStarting := true ]
]

{ #category : #accessing }
B2World class >> warmStarting: aBoolean [
	WarmStarting := aBoolean
]

{ #category : #api }
B2World >> addBody: body [
	bodies add: body
]

{ #category : #api }
B2World >> addJoint: joint [
	joints add: joint
]

{ #category : #accessing }
B2World >> arbiters [
	^ arbiters
]

{ #category : #accessing }
B2World >> bodies [
	^ bodies
]

{ #category : #api }
B2World >> broadPhase [
	| newArb key iter |
	bodies
		combinations: 2
		atATimeDo: [ :each | 
			| bi bj |
			bi := each first.
			bj := each second.
			((bi invMass closeTo: 0.0) and: [ bj invMass closeTo: 0.0 ])
				ifFalse: [ newArb := B2Arbiter body1: bi body2: bj.
					key := B2ArbiterKey body1: bi body2: bj.
					newArb numContacts > 0
						ifTrue: [ iter := arbiters at: key ifAbsent: [ nil ].
							iter
								ifNil: [ arbiters at: key put: newArb ]
								ifNotNil: [ iter updateContacts: newArb contacts ] ]
						ifFalse: [ arbiters removeKey: key ifAbsent: [  ] ] ] ]
]

{ #category : #api }
B2World >> clear [
	bodies := OrderedCollection new.
	joints := OrderedCollection new.
	arbiters := OrderedDictionary new
]

{ #category : #api }
B2World >> contacts [
	^ arbiters values flatCollect: [ :each | each contacts ]
]

{ #category : #accessing }
B2World >> gravity [
	^ gravity
]

{ #category : #initialization }
B2World >> initialize [
	self clear
]

{ #category : #accessing }
B2World >> iterations [
	^ iterations
]

{ #category : #accessing }
B2World >> joints [
	^ joints
]

{ #category : #initialization }
B2World >> setGravity: aPoint iterations: anInteger [
	gravity := aPoint.
	iterations := anInteger
]

{ #category : #api }
B2World >> step: dt [
	| invDt |
	invDt := dt > 0.0
		ifTrue: [ 1.0 / dt ]
		ifFalse: [ 0.0 ].
	self broadPhase.
	bodies do: [ :each | each integrateForcesGravity: gravity dt: dt ].
	arbiters do: [ :each | each preStep: invDt ].
	joints do: [ :each | each preStep: invDt ].
	iterations
		timesRepeat: [ arbiters do: [ :each | each applyImpulse ].
			joints do: [ :each | each applyImpulse ] ].
	bodies do: [ :each | each stepBy: dt ]
]
