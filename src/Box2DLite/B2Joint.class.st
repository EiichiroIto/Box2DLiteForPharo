Class {
	#name : #B2Joint,
	#superclass : #Object,
	#instVars : [
		'body1',
		'body2',
		'p',
		'biasFactor',
		'softness',
		'localAnchor1',
		'localAnchor2',
		'r1',
		'r2',
		'm',
		'bias'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #'instance creation' }
B2Joint class >> body1: body1 body2: body2 anchor: anchor [
	^ self basicNew initialize
		setBody1: body1 body2: body2 anchor: anchor;
		yourself
]

{ #category : #api }
B2Joint >> applyImpulse [
	| dv impulse |
	dv := body2 velocity + (r2 invCross: body2 angularVelocity)
		- body1 velocity - (r1 invCross: body1 angularVelocity).
	impulse := m * (bias - dv - (softness * p)).
	body1 applyImpulse: impulse negated r: r1.
	body2 applyImpulse: impulse r: r2.
	p := p + impulse
]

{ #category : #accessing }
B2Joint >> biasFactor [
	^ biasFactor
]

{ #category : #accessing }
B2Joint >> biasFactor: aFloat [
	biasFactor := aFloat
]

{ #category : #accessing }
B2Joint >> body1 [
	^ body1
]

{ #category : #accessing }
B2Joint >> body2 [
	^ body2
]

{ #category : #accessing }
B2Joint >> localAnchor1 [
	^ localAnchor1
]

{ #category : #accessing }
B2Joint >> localAnchor2 [
	^ localAnchor2
]

{ #category : #api }
B2Joint >> preStep: invDt [
	| rot1 rot2 k1 k2 k3 k p1 p2 dp |
	rot1 := B2Mat22 rotation: body1 rotation.
	rot2 := B2Mat22 rotation: body2 rotation.
	r1 := rot1 * localAnchor1.
	r2 := rot2 * localAnchor2.
	k1 := B2Mat22
		col1: (body1 invMass + body2 invMass) @ 0.0
		col2: 0.0 @ (body1 invMass + body2 invMass).
	k2 := body1 massMatrixR: r1.
	k3 := body2 massMatrixR: r2.
	k := k1 + k2 + k3.
	k := k + (B2Mat22 col1: softness @ 0 col2: 0 @ softness).
	m := k invert.
	p1 := body1 position + r1.
	p2 := body2 position + r2.
	dp := p2 - p1.
	bias := self world positionCorrection
		ifTrue: [ biasFactor negated * invDt * dp ]
		ifFalse: [ 0.0 @ 0.0 ].
	self world warmStarting
		ifTrue: [ body1 applyImpulse: p negated r: r1.
			body2 applyImpulse: p r: r2 ]
		ifFalse: [ p := 0.0 @ 0.0 ]
]

{ #category : #initialization }
B2Joint >> setBody1: b1 body2: b2 anchor: anchor [
	| rot1 rot2 rot1t rot2t |
	body1 := b1.
	body2 := b2.
	rot1 := B2Mat22 rotation: body1 rotation.
	rot2 := B2Mat22 rotation: body2 rotation.
	rot1t := rot1 transpose.
	rot2t := rot2 transpose.
	localAnchor1 := rot1t * (anchor - body1 position).
	localAnchor2 := rot2t * (anchor - body2 position).
	p := 0.0 @ 0.0.
	softness := 0.0.
	biasFactor := 0.2
]

{ #category : #accessing }
B2Joint >> softness [
	^ softness
]

{ #category : #accessing }
B2Joint >> softness: aFloat [
	softness := aFloat
]

{ #category : #private }
B2Joint >> world [
	^ B2World
]
