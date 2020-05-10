"
A B2BodyTest is a test class for testing the behavior of B2Body
"
Class {
	#name : #B2BodyTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2BodyTest >> newBody [
	^ B2Body new
]

{ #category : #test }
B2BodyTest >> testAngularVelocity [
	| b |
	b := self newBody.
	self assert: b angularVelocity isNil.
	b angularVelocity: 123.
	self assert: b angularVelocity equals: 123
]

{ #category : #test }
B2BodyTest >> testForce [
	| b |
	b := self newBody.
	self assert: b force isNil.
	b force: 1 @ 3.
	self assert: b force equals: 1 @ 3
]

{ #category : #test }
B2BodyTest >> testFriction [
	| b |
	b := self newBody.
	self assert: b friction isNil.
	b friction: 123.
	self assert: b friction equals: 123
]

{ #category : #test }
B2BodyTest >> testHash [
	| b |
	b := self newBody.
	self assert: b hash equals: b id
]

{ #category : #test }
B2BodyTest >> testId [
	| b x b2 |
	b := self newBody.
	x := b id.
	self assert: x isNumber.
	b2 := self newBody.
	self assert: b2 id isNumber.
	self assert: b2 id ~= x
]

{ #category : #test }
B2BodyTest >> testInitialize [
	self testId
]

{ #category : #test }
B2BodyTest >> testInvI [
	| b |
	b := self newBody.
	self assert: b invI isNil.
	b setExtent: 1 @ 2 mass: Float fmax.
	self assert: b invI equals: 0.
	b setExtent: 1 @ 2 mass: 10.
	self assert: b invI equals: 12.0 / 50
]

{ #category : #test }
B2BodyTest >> testInvMass [
	| b |
	b := self newBody.
	self assert: b invMass isNil.
	b setExtent: 1 @ 2 mass: Float fmax.
	self assert: b invMass equals: 0.
	b setExtent: 1 @ 2 mass: 10.
	self assert: b invMass equals: 1.0 / 10
]

{ #category : #test }
B2BodyTest >> testLessThan [
	| b1 b2 |
	b1 := self newBody.
	b2 := self newBody.
	self assert: b1 < b2
]

{ #category : #test }
B2BodyTest >> testPosition [
	| b |
	b := self newBody.
	self assert: b position isNil.
	b position: 1 @ 2.
	self assert: b position equals: 1 @ 2
]

{ #category : #test }
B2BodyTest >> testRotation [
	| b |
	b := self newBody.
	self assert: b rotation isNil.
	b rotation: 123.
	self assert: b rotation equals: 123
]

{ #category : #test }
B2BodyTest >> testSetExtentMass [
	| b |
	b := self newBody.
	b setExtent: 1 @ 2 mass: 10.
	self assert: b position equals: 0 @ 0.
	self assert: b rotation equals: 0.
	self assert: b velocity equals: 0 @ 0.
	self assert: b angularVelocity equals: 0.
	self assert: b force equals: 0 @ 0.
	self assert: b torque equals: 0.
	self assert: b friction equals: 0.2.
	self assert: b width equals: 1 @ 2
]

{ #category : #test }
B2BodyTest >> testTorque [
	| b |
	b := self newBody.
	self assert: b torque isNil.
	b torque: 123.
	self assert: b torque equals: 123
]

{ #category : #test }
B2BodyTest >> testVelocity [
	| b |
	b := self newBody.
	self assert: b velocity isNil.
	b velocity: 1 @ 2.
	self assert: b velocity equals: 1 @ 2
]

{ #category : #test }
B2BodyTest >> testWidth [
	self testSetExtentMass
]
