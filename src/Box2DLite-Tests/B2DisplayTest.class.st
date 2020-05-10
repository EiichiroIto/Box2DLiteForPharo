"
A B2DisplayTest is a test class for testing the behavior of B2Display
"
Class {
	#name : #B2DisplayTest,
	#superclass : #TestCase,
	#category : #'Box2DLite-Tests'
}

{ #category : #private }
B2DisplayTest >> newDisplay [
	^ B2Display new
]

{ #category : #test }
B2DisplayTest >> testCanvas [
	| d |
	d := self newDisplay.
	self assert: d canvas isNil.
	d setExtent: 10 @ 10.
	self assert: (d canvas isKindOf: FormCanvas)
]

{ #category : #test }
B2DisplayTest >> testForm [
	| d |
	d := self newDisplay.
	self assert: d form isNil.
	d setExtent: 10 @ 10.
	self assert: (d form isKindOf: Form)
]

{ #category : #test }
B2DisplayTest >> testSetExtent [
	| d |
	d := self newDisplay.
	self assert: d form isNil.
	d setExtent: 10 @ 20.
	self assert: (d form isKindOf: Form).
	self assert: d form extent equals: 10 @ 20
]

{ #category : #test }
B2DisplayTest >> testViewingTransform [
	| d p |
	d := self newDisplay.
	d setExtent: 100 @ 200.
	d viewport: ((-10 @ -10) corner: (10 @ 10)).
	p := d viewingTransform: 0 @ 0.
	self assert: p equals: 50 @ 100.
	p := d viewingTransform: -20 @ -20.
	self assert: p equals: 0 @ 200.
	p := d viewingTransform: 20 @ 20.
	self assert: p equals: 100 @ 0
]

{ #category : #test }
B2DisplayTest >> testViewport [
	| d |
	d := self newDisplay.
	self assert: d viewport isNil.
	d viewport: (-10 @ -10 corner: 10 @ 10).
	self assert: d viewport equals: (-10 @ -10 corner: 10 @ 10)
]
