Class {
	#name : #B2Arbiter,
	#superclass : #Object,
	#instVars : [
		'body1',
		'body2',
		'contacts',
		'friction'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #'instance creation' }
B2Arbiter class >> body1: b1 body2: b2 [
	^ self new
		setBody1: b1 body2: b2;
		yourself
]

{ #category : #api }
B2Arbiter >> applyImpulse [
	| dv vn dPn pn0 pn tangent vt dPt maxPt pt oldTangentImpulse |
	contacts
		do: [ :c | 
			c r1: c position - body1 position.
			c r2: c position - body2 position.
			dv := self calcDvR1: c r1 r2: c r2.
			vn := dv dotProduct: c normal.
			dPn := c massNormal * (vn negated + c bias).
			self world accumulateImpulses
				ifTrue: [ pn0 := c pn.
					c pn: (pn0 + dPn max: 0.0).
					dPn := c pn - pn0 ]
				ifFalse: [ dPn := dPn max: 0.0 ].
			pn := dPn * c normal.
			body1 applyImpulse: pn negated r: c r1.
			body2 applyImpulse: pn r: c r2.
			dv := self calcDvR1: c r1 r2: c r2.
			tangent := c normal cross: 1.0.
			vt := dv dotProduct: tangent.
			dPt := c massTangent * vt negated.
			self world accumulateImpulses
				ifTrue: [ maxPt := friction * c pn.
					oldTangentImpulse := c pt.
					c pt: (oldTangentImpulse + dPt min: maxPt max: maxPt negated).
					dPt := c pt - oldTangentImpulse ]
				ifFalse: [ maxPt := friction * dPn.
					dPt := dPt min: maxPt max: maxPt negated ].
			pt := dPt * tangent.
			body1 applyImpulse: pt negated r: c r1.
			body2 applyImpulse: pt r: c r2 ]
]

{ #category : #private }
B2Arbiter >> calcDvR1: r1 r2: r2 [
	^ body2 velocity + (r2 invCross: body2 angularVelocity)
		- body1 velocity - (r1 invCross: body1 angularVelocity)
]

{ #category : #private }
B2Arbiter >> calcMassR1: r1 r2: r2 c: c [
	| c1 c2 |
	c1 := r1 dotProduct: c.
	c2 := r2 dotProduct: c.
	^ body1 invI * ((r1 dotProduct: r1) - c1 squared)
		+ (body2 invI * ((r2 dotProduct: r2) - c2 squared))
]

{ #category : #accessing }
B2Arbiter >> contacts [
	^ contacts
]

{ #category : #private }
B2Arbiter >> newCollider [
	^ B2Collider new
]

{ #category : #accessing }
B2Arbiter >> numContacts [
	^ contacts size
]

{ #category : #api }
B2Arbiter >> preStep: invDt [
	| kAllowedPenetration kBiasFactor r1 r2 kNormal tangent kTangent |
	kAllowedPenetration := 0.01.
	kBiasFactor := self world positionCorrection
		ifTrue: [ 0.2 ]
		ifFalse: [ 0.0 ].
	contacts
		do: [ :c | 
			r1 := c position - body1 position.
			r2 := c position - body2 position.
			kNormal := body1 invMass + body2 invMass.
			kNormal := kNormal + (self calcMassR1: r1 r2: r2 c: c normal).
			c massNormal: 1.0 / kNormal.
			tangent := c normal cross: 1.0.
			kTangent := body1 invMass + body2 invMass.
			kTangent := kTangent + (self calcMassR1: r1 r2: r2 c: tangent).
			c massTangent: 1.0 / kTangent.
			c
				bias:
					kBiasFactor negated * invDt
						* (0.0 min: c separation + kAllowedPenetration).
			self world accumulateImpulses
				ifTrue: [ | p |
					p := c pn * c normal + (c pt * tangent).
					body1 applyImpulse: p negated r: r1.
					body2 applyImpulse: p r: r2 ] ]
]

{ #category : #initialization }
B2Arbiter >> setBody1: b1 body2: b2 [
	b1 < b2
		ifTrue: [ body1 := b1.
			body2 := b2 ]
		ifFalse: [ body1 := b2.
			body2 := b1 ].
	contacts := self newCollider collideContactsBody1: body1 body2: body2.
	friction := (body1 friction * body2 friction) sqrt
]

{ #category : #private }
B2Arbiter >> updateContacts: aCollection [
	| mergedContacts |
	mergedContacts := aCollection
		collect: [ :cNew | 
			| cOld c |
			cOld := contacts
				detect: [ :each | cNew feature = each feature ]
				ifNone: [ nil ].
			c := cNew copy.
			cOld
				ifNotNil: [ self world warmStarting
						ifTrue: [ c
								pn: cOld pn;
								pt: cOld pt;
								pnb: cOld pnb ]
						ifFalse: [ c
								pn: 0.0;
								pt: 0.0;
								pnb: 0.0 ] ].
			c ].
	contacts := mergedContacts
]

{ #category : #private }
B2Arbiter >> world [
	^ B2World
]
