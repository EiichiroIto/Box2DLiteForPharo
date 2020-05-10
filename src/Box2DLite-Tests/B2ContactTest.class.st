"
A B2ContactTest is a test class for testing the behavior of B2Contact
"
Class {
	#name : #B2ContactTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2ContactTest >> newContact [
	^ B2Contact new
]

{ #category : #private }
B2ContactTest >> newFeaturePair [
	^ B2FeaturePair new
]

{ #category : #test }
B2ContactTest >> testBias [
	| c |
	c := self newContact.
	self assert: c bias isNil.
	c bias: 123.
	self assert: c bias equals: 123
]

{ #category : #test }
B2ContactTest >> testFeature [
	| c fp |
	c := self newContact.
	self assert: c feature isNil.
	fp := self newFeaturePair.
	c feature: fp.
	self assert: c feature equals: fp
]

{ #category : #test }
B2ContactTest >> testInitialize [
	| c |
	c := self newContact.
	self assert: c pn equals: 0.
	self assert: c pt equals: 0.
	self assert: c pnb equals: 0
]

{ #category : #test }
B2ContactTest >> testMassNormal [
	| c |
	c := self newContact.
	self assert: c massNormal isNil.
	c massNormal: 123.
	self assert: c massNormal equals: 123
]

{ #category : #test }
B2ContactTest >> testMassTangent [
	| c |
	c := self newContact.
	self assert: c massTangent isNil.
	c massTangent: 123.
	self assert: c massTangent equals: 123
]

{ #category : #test }
B2ContactTest >> testNormal [
	| c |
	c := self newContact.
	self assert: c normal isNil.
	c normal: 1 @ 3.
	self assert: c normal equals: 1 @ 3
]

{ #category : #test }
B2ContactTest >> testPn [
	| c |
	c := self newContact.
	self assert: c pn equals: 0.
	c pn: 123.
	self assert: c pn equals: 123
]

{ #category : #test }
B2ContactTest >> testPnb [
	| c |
	c := self newContact.
	self assert: c pnb equals: 0.
	c pnb: 123.
	self assert: c pnb equals: 123
]

{ #category : #test }
B2ContactTest >> testPosition [
	| c |
	c := self newContact.
	self assert: c position isNil.
	c position: 1 @ 3.
	self assert: c position equals: 1 @ 3
]

{ #category : #test }
B2ContactTest >> testPt [
	| c |
	c := self newContact.
	self assert: c pt equals: 0.
	c pt: 123.
	self assert: c pt equals: 123
]

{ #category : #test }
B2ContactTest >> testR1 [
	| c |
	c := self newContact.
	self assert: c r1 isNil.
	c r1: 1 @ 3.
	self assert: c r1 equals: 1 @ 3
]

{ #category : #test }
B2ContactTest >> testR2 [
	| c |
	c := self newContact.
	self assert: c r2 isNil.
	c r2: 1 @ 3.
	self assert: c r2 equals: 1 @ 3
]

{ #category : #test }
B2ContactTest >> testSeparation [
	| c |
	c := self newContact.
	self assert: c separation isNil.
	c separation: 123.
	self assert: c separation equals: 123
]
