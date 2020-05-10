"
A B2Mat22Test is a test class for testing the behavior of B2Mat22
"
Class {
	#name : #B2Mat22Test,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2Mat22Test >> newMat22 [
	^ B2Mat22 new
]

{ #category : #test }
B2Mat22Test >> testAbs [
	| m n |
	m := self newMat22.
	m
		col1: -1 @ -2;
		col2: -3 @ -4.
	n := m abs.
	self assert: n col1 equals: 1 @ 2.
	self assert: n col2 equals: 3 @ 4
]

{ #category : #test }
B2Mat22Test >> testCol1 [
	| m |
	m := self newMat22.
	self assert: m col1 equals: 0 @ 0.
	m col1: 1 @ 2.
	self assert: m col1 equals: 1 @ 2
]

{ #category : #test }
B2Mat22Test >> testCol2 [
	| m |
	m := self newMat22.
	self assert: m col2 equals: 0 @ 0.
	m col2: 1 @ 2.
	self assert: m col2 equals: 1 @ 2
]

{ #category : #test }
B2Mat22Test >> testInitialize [
	| m |
	m := self newMat22.
	self assert: m col1 equals: 0 @ 0.
	self assert: m col2 equals: 0 @ 0
]

{ #category : #test }
B2Mat22Test >> testInvert [
	| m n |
	m := self newMat22.
	m col1: 1 @ 3.
	m col2: 2 @ 4.
	n := m invert.
	self assert: n col1 equals: -2 @ 1.5.
	self assert: n col2 equals: 1 @ -0.5
]

{ #category : #test }
B2Mat22Test >> testMultiplyMat22By [
	| m1 m2 n |
	m1 := self newMat22.
	m1
		col1: 1 @ 2;
		col2: 3 @ 4.
	m2 := self newMat22.
	m2
		col1: 5 @ 3;
		col2: 6 @ 7.
	n := m1 * m2.
	self assert: n col1 equals: 14 @ 22.
	self assert: n col2 equals: 27 @ 40
]

{ #category : #test }
B2Mat22Test >> testPlus [
	| m1 m2 n |
	m1 := self newMat22.
	m1
		col1: 1 @ 2;
		col2: 3 @ 4.
	m2 := self newMat22.
	m2
		col1: 5 @ 3;
		col2: 6 @ 7.
	n := m1 + m2.
	self assert: n col1 equals: 6 @ 5.
	self assert: n col2 equals: 9 @ 11
]

{ #category : #test }
B2Mat22Test >> testPrintOn [
	| m s |
	m := self newMat22.
	m col1: 1 @ 2.
	m col2: 3 @ 4.
	s := WriteStream on: String new.
	m printOn: s.
	self assert: s contents equals: 'B2Mat22[(1@2),(3@4)]'
]

{ #category : #test }
B2Mat22Test >> testSetRotation [
	| m |
	m := self newMat22.
	m setRotation: 30 degreesToRadians.
	self assert: (m col1 closeTo: (3 sqrt / 2) @ (1 / 2)).
	self assert: (m col2 closeTo: (-1 / 2) @ (3 sqrt / 2))
]

{ #category : #test }
B2Mat22Test >> testTranspose [
	| m n |
	m := self newMat22.
	m col1: 1 @ 2.
	m col2: 3 @ 4.
	n := m transpose.
	self assert: n col1 equals: 1 @ 3.
	self assert: n col2 equals: 2 @ 4
]
