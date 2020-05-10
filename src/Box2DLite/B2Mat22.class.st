Class {
	#name : #B2Mat22,
	#superclass : #Object,
	#instVars : [
		'col1',
		'col2'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #'instance creation' }
B2Mat22 class >> col1: aPoint1 col2: aPoint2 [
	^ self new
		col1: aPoint1;
		col2: aPoint2;
		yourself
]

{ #category : #'instance creation' }
B2Mat22 class >> rotation: aFloat [
	^ self new
		setRotation: aFloat;
		yourself
]

{ #category : #arithmetic }
B2Mat22 >> * other [
	^ other multiplyMat22By: self
]

{ #category : #arithmetic }
B2Mat22 >> + other [
	^ self class col1: col1 + other col1 col2: col2 + other col2
]

{ #category : #arithmetic }
B2Mat22 >> abs [
	^ self class col1: col1 abs col2: col2 abs
]

{ #category : #accessing }
B2Mat22 >> col1 [
	^ col1
]

{ #category : #accessing }
B2Mat22 >> col1: aPoint [
	col1 := aPoint
]

{ #category : #accessing }
B2Mat22 >> col2 [
	^ col2
]

{ #category : #accessing }
B2Mat22 >> col2: aPoint [
	col2 := aPoint
]

{ #category : #initialization }
B2Mat22 >> initialize [
	col1 := 0 @ 0.
	col2 := 0 @ 0
]

{ #category : #api }
B2Mat22 >> invert [
	| a b c d det |
	a := col1 x.
	b := col2 x.
	c := col1 y.
	d := col2 y.
	det := a * d - (b * c).
	(det closeTo: 0)
		ifTrue: [ self error ].
	det := 1.0 / det.
	^ self class
		col1: (det * d) @ (det negated * c)
		col2: (det negated * b) @ (det * a)
]

{ #category : #arithmetic }
B2Mat22 >> multiplyMat22By: a [
	^ self class col1: a * self col1 col2: a * self col2
]

{ #category : #printing }
B2Mat22 >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $[;
		nextPutAll: col1 asString;
		nextPut: $,;
		nextPutAll: col2 asString;
		nextPut: $]
]

{ #category : #initialization }
B2Mat22 >> setRotation: aFloat [
	| c s |
	c := aFloat cos.
	s := aFloat sin.
	col1 := c @ s.
	col2 := s negated @ c
]

{ #category : #api }
B2Mat22 >> transpose [
	^ self class col1: col1 x @ col2 x col2: col1 y @ col2 y
]
