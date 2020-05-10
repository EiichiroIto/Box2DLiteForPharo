"
A B2ClipVertexTest is a test class for testing the behavior of B2ClipVertex
"
Class {
	#name : #B2ClipVertexTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2ClipVertexTest >> newClipVertex [
	^ B2ClipVertex new
]

{ #category : #test }
B2ClipVertexTest >> testFp [
	| c |
	c := self newClipVertex.
	self assert: (c fp isKindOf: B2FeaturePair)
]

{ #category : #test }
B2ClipVertexTest >> testInEdge1 [
	| c |
	c := self newClipVertex.
	self assert: c inEdge1 equals: 0.
	c inEdge1: 2.
	self assert: c inEdge1 equals: 2
]

{ #category : #test }
B2ClipVertexTest >> testInEdge2 [
	| c |
	c := self newClipVertex.
	self assert: c inEdge2 equals: 0.
	c inEdge2: 2.
	self assert: c inEdge2 equals: 2
]

{ #category : #test }
B2ClipVertexTest >> testInitialize [
	self testFp
]

{ #category : #test }
B2ClipVertexTest >> testOutEdge1 [
	| c |
	c := self newClipVertex.
	self assert: c outEdge1 equals: 0.
	c outEdge1: 2.
	self assert: c outEdge1 equals: 2
]

{ #category : #test }
B2ClipVertexTest >> testOutEdge2 [
	| c |
	c := self newClipVertex.
	self assert: c outEdge2 equals: 0.
	c outEdge2: 2.
	self assert: c outEdge2 equals: 2
]

{ #category : #test }
B2ClipVertexTest >> testV [
	| c |
	c := self newClipVertex.
	self assert: c v isNil.
	c v: 2.
	self assert: c v equals: 2
]
