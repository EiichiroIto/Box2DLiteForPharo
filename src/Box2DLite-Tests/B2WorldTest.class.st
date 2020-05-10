"
A B2WorldTest is a test class for testing the behavior of B2World
"
Class {
	#name : #B2WorldTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2WorldTest >> newBody [
	^ B2Body new
]

{ #category : #private }
B2WorldTest >> newJoint [
	^ B2Joint new
]

{ #category : #private }
B2WorldTest >> newWorld [
	^ B2World new
]

{ #category : #test }
B2WorldTest >> testAddBody [
	| w b1 b2 |
	w := self newWorld.
	self assert: w bodies isEmpty.
	b1 := self newBody.
	b2 := self newBody.
	w addBody: b1.
	w addBody: b2.
	self assert: w bodies size equals: 2.
	self assert: w bodies first equals: b1.
	self assert: w bodies second equals: b2
]

{ #category : #test }
B2WorldTest >> testAddJoint [
	| w j1 j2 |
	w := self newWorld.
	self assert: w bodies isEmpty.
	j1 := self newJoint.
	j2 := self newJoint.
	w addJoint: j1.
	w addJoint: j2.
	self assert: w joints size equals: 2.
	self assert: w joints first equals: j1.
	self assert: w joints second equals: j2
]

{ #category : #test }
B2WorldTest >> testArbiters [
	| w |
	w := self newWorld.
	self assert: w arbiters isCollection.
	self assert: w arbiters isEmpty
]

{ #category : #test }
B2WorldTest >> testBodies [
	| w |
	w := self newWorld.
	self assert: w bodies isCollection.
	self assert: w bodies isEmpty
]

{ #category : #test }
B2WorldTest >> testClear [
	| w |
	w := self newWorld.
	w addBody: self newBody.
	w addBody: self newBody.
	w addJoint: self newJoint.
	self assert: w bodies size equals: 2.
	self assert: w joints size equals: 1.
	w clear.
	self assert: w bodies isEmpty.
	self assert: w joints isEmpty
]

{ #category : #test }
B2WorldTest >> testGravity [
	| w |
	w := self newWorld.
	self assert: w gravity isNil.
	w setGravity: 1 iterations: 2.
	self assert: w gravity equals: 1
]

{ #category : #test }
B2WorldTest >> testInitialize [
	self testSetGravityIterations
]

{ #category : #test }
B2WorldTest >> testIterations [
	| w |
	w := self newWorld.
	self assert: w iterations isNil.
	w setGravity: 1 iterations: 2.
	self assert: w iterations equals: 2
]

{ #category : #test }
B2WorldTest >> testJoints [
	| w |
	w := self newWorld.
	self assert: w joints isCollection.
	self assert: w joints isEmpty
]

{ #category : #test }
B2WorldTest >> testSetGravityIterations [
	| w |
	w := self newWorld.
	w setGravity: 1 iterations: 2.
	self assert: w gravity equals: 1.
	self assert: w iterations equals: 2
]
