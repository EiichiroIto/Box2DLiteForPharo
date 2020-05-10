"
A B2JointTest is a test class for testing the behavior of B2Joint
"
Class {
	#name : #B2JointTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2JointTest >> newBody [
	^ B2Body new
]

{ #category : #private }
B2JointTest >> newJoint [
	^ B2Joint new
]

{ #category : #test }
B2JointTest >> testBiasFactor [
	| j |
	j := self newJoint.
	self assert: j biasFactor isNil.
	j biasFactor: 123.
	self assert: j biasFactor equals: 123
]

{ #category : #test }
B2JointTest >> testBody1 [
	| j b1 b2 |
	j := self newJoint.
	self assert: j body1 isNil.
	b1 := self newBody setExtent: 1 @ 1 mass: 1.
	b2 := self newBody setExtent: 2 @ 2 mass: Float fmax.
	j setBody1: b1 body2: b2 anchor: 1.
	self assert: j body1 equals: b1
]

{ #category : #test }
B2JointTest >> testBody2 [
	| j b1 b2 |
	j := self newJoint.
	self assert: j body2 isNil.
	b1 := self newBody setExtent: 1 @ 1 mass: 1.
	b2 := self newBody setExtent: 2 @ 2 mass: Float fmax.
	j setBody1: b1 body2: b2 anchor: 1.
	self assert: j body2 equals: b2
]

{ #category : #test }
B2JointTest >> testLocalAnchor1 [
	| j b1 b2 |
	j := self newJoint.
	self assert: j body1 isNil.
	b1 := self newBody setExtent: 1 @ 1 mass: 1.
	b2 := self newBody setExtent: 2 @ 2 mass: Float fmax.
	j setBody1: b1 body2: b2 anchor: 1.
	self assert: j localAnchor1 equals: 1 @ 1
]

{ #category : #test }
B2JointTest >> testLocalAnchor2 [
	| j b1 b2 |
	j := self newJoint.
	self assert: j body1 isNil.
	b1 := self newBody setExtent: 1 @ 1 mass: 1.
	b2 := self newBody setExtent: 2 @ 2 mass: Float fmax.
	j setBody1: b1 body2: b2 anchor: 2.
	self assert: j localAnchor2 equals: 2 @ 2
]

{ #category : #test }
B2JointTest >> testSoftness [
	| j |
	j := self newJoint.
	self assert: j softness isNil.
	j softness: 123.
	self assert: j softness equals: 123
]
