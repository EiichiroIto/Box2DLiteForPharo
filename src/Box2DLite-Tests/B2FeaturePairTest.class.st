"
A B2FeaturePairTest is a test class for testing the behavior of B2FeaturePair
"
Class {
	#name : #B2FeaturePairTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2FeaturePairTest >> newFeaturePair [
	^ B2FeaturePair new
]

{ #category : #test }
B2FeaturePairTest >> testFlip [
	| f |
	f := self newFeaturePair.
	f inEdge1: 1.
	f inEdge2: 2.
	f outEdge1: 3.
	f outEdge2: 4.
	f flip.
	self assert: f inEdge1 equals: 2.
	self assert: f inEdge2 equals: 1.
	self assert: f outEdge1 equals: 4.
	self assert: f outEdge2 equals: 3
]

{ #category : #test }
B2FeaturePairTest >> testInEdge1 [
	| f |
	f := self newFeaturePair.
	self assert: f inEdge1 equals: 0.
	f inEdge1: 2.
	self assert: f inEdge1 equals: 2
]

{ #category : #test }
B2FeaturePairTest >> testInEdge2 [
	| f |
	f := self newFeaturePair.
	self assert: f inEdge2 equals: 0.
	f inEdge2: 2.
	self assert: f inEdge2 equals: 2
]

{ #category : #test }
B2FeaturePairTest >> testInitialize [
	| f |
	f := self newFeaturePair.
	self assert: f inEdge1 equals: 0.
	self assert: f inEdge2 equals: 0.
	self assert: f outEdge1 equals: 0.
	self assert: f outEdge2 equals: 0
]

{ #category : #test }
B2FeaturePairTest >> testOutEdge1 [
	| f |
	f := self newFeaturePair.
	self assert: f outEdge1 equals: 0.
	f outEdge1: 2.
	self assert: f outEdge1 equals: 2
]

{ #category : #test }
B2FeaturePairTest >> testOutEdge2 [
	| f |
	f := self newFeaturePair.
	self assert: f outEdge2 equals: 0.
	f outEdge2: 2.
	self assert: f outEdge2 equals: 2
]
