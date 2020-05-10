"
A B2ArbiterKeyTest is a test class for testing the behavior of B2ArbiterKey
"
Class {
	#name : #B2ArbiterKeyTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2ArbiterKeyTest >> newArbiterKey [
	^ B2ArbiterKey new
]

{ #category : #private }
B2ArbiterKeyTest >> newBody [
	^ B2Body new
]

{ #category : #test }
B2ArbiterKeyTest >> testBody1 [
	self testSetBody1Body2
]

{ #category : #test }
B2ArbiterKeyTest >> testBody2 [
	self testSetBody1Body2
]

{ #category : #test }
B2ArbiterKeyTest >> testSetBody1Body2 [
	| k b1 b2 |
	k := self newArbiterKey.
	self assert: k body1 isNil.
	self assert: k body2 isNil.
	b1 := self newBody.
	b2 := self newBody.
	k setBody1: b1 body2: b2.
	self assert: k body1 equals: b1.
	self assert: k body2 equals: b2.
	k setBody1: b2 body2: b1.
	self assert: k body1 equals: b1.
	self assert: k body2 equals: b2
]
