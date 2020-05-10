Class {
	#name : #B2Display,
	#superclass : #Object,
	#instVars : [
		'form',
		'canvas',
		'viewport'
	],
	#category : #'Box2DLite-Demo'
}

{ #category : #'instance creation' }
B2Display class >> extent: aPoint [
	^ self new
		setExtent: aPoint;
		yourself
]

{ #category : #accessing }
B2Display >> canvas [
	^ canvas
]

{ #category : #api }
B2Display >> clear [
	canvas ifNil: [ ^ self ].
	canvas fillRectangle: ((0 @ 0) extent: form extent) color: Color black
]

{ #category : #api }
B2Display >> drawBody: aBody [
	| r p h v1 v2 v3 v4 |
	canvas ifNil: [ ^ self ].
	r := B2Mat22 rotation: aBody rotation.
	p := aBody position.
	h := 0.5 * aBody width.
	v1 := p + (r * (h x negated @ h y negated)).
	v2 := p + (r * (h x @ h y negated)).
	v3 := p + (r * (h x @ h y)).
	v4 := p + (r * (h x negated @ h y)).
	canvas
		drawPolygon:
			{self viewingTransform: v1.
			self viewingTransform: v2.
			self viewingTransform: v3.
			self viewingTransform: v4}
		color: Color black
		borderWidth: 1
		borderColor: Color white
]

{ #category : #api }
B2Display >> drawContact: aContact [
	| p rect |
	canvas ifNil: [ ^ self ].
	p := self viewingTransform: aContact position.
	rect := Rectangle center: p extent: 4 @ 4.
	canvas fillRectangle: rect color: Color red
]

{ #category : #api }
B2Display >> drawJoint: aJoint [
	| b1 b2 r1 r2 x1 p1 x2 p2 |
	b1 := aJoint body1.
	b2 := aJoint body2.
	r1 := B2Mat22 rotation: b1 rotation.
	r2 := B2Mat22 rotation: b2 rotation.
	x1 := b1 position.
	p1 := x1 + (r1 * aJoint localAnchor1).
	x2 := b2 position.
	p2 := x2 + (r2 * aJoint localAnchor2).
	{"(self viewingTransform: x1)."
	(self viewingTransform: p1).
	(self viewingTransform: x2).
	(self viewingTransform: p2)}
		overlappingPairsDo: [ :a :b | 
			canvas
				line: a
				to: b
				width: 1
				color: Color lightBlue ]
]

{ #category : #accessing }
B2Display >> form [
	^ form
]

{ #category : #private }
B2Display >> setExtent: aPoint [
	form := Form extent: aPoint depth: 32.
	canvas := FormCanvas on: form.
	canvas fillColor: Color black
]

{ #category : #private }
B2Display >> viewingTransform: aPoint [
	| x y |
	form ifNil: [ ^ 0 @ 0 ].
	x := aPoint x min: viewport right max: viewport left.
	y := aPoint y min: viewport bottom max: viewport top.
	x := 0 interpolateTo: form width at: (x - viewport left) / viewport width.
	y := form height interpolateTo: 0 at: (y - viewport top) / viewport height.
	^ x @ y
]

{ #category : #accessing }
B2Display >> viewport [
	^ viewport
]

{ #category : #accessing }
B2Display >> viewport: aRectangle [
	viewport := aRectangle
]
