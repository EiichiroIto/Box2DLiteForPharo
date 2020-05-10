Class {
	#name : #B2Collider,
	#superclass : #Object,
	#instVars : [
		'hA',
		'hB',
		'posA',
		'posB',
		'rotA',
		'rotB',
		'dA',
		'dB',
		'faceA',
		'faceB',
		'normal',
		'frontNormal',
		'front',
		'sideNormal',
		'negSide',
		'posSide',
		'negEdge',
		'posEdge'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #private }
B2Collider >> absoluteTol [
	^ 0.01
]

{ #category : #private }
B2Collider >> clipSegmentToLine: vIn normal: normal2 offset: offset clipEdge: clipEdge [
	| vOut distance0 distance1 |
	vOut := OrderedCollection new.
	distance0 := (normal2 dotProduct: (vIn at: 1) v) - offset.
	distance1 := (normal2 dotProduct: (vIn at: 2) v) - offset.
	distance0 <= 0
		ifTrue: [ vOut add: (vIn at: 1) copy ].
	distance1 <= 0
		ifTrue: [ vOut add: (vIn at: 2) copy ].
	distance0 * distance1 < 0
		ifTrue: [ | interp item |
			interp := distance0 / (distance0 - distance1).
			item := B2ClipVertex new.
			item v: (vIn at: 1) v + (interp * ((vIn at: 2) v - (vIn at: 1) v)).
			distance0 > 0
				ifTrue: [ item outEdge1: (vIn at: 1) outEdge1.
					item outEdge2: (vIn at: 1) outEdge2.
					item inEdge1: clipEdge.
					item inEdge2: self noEdge ]
				ifFalse: [ item inEdge1: (vIn at: 2) inEdge1.
					item inEdge2: (vIn at: 2) inEdge2.
					item outEdge1: clipEdge.
					item outEdge2: self noEdge ].
			vOut add: item ].
	^ vOut
]

{ #category : #api }
B2Collider >> collideContactsBody1: body1 body2: body2 [
	| incidentEdge clipPoints axis |
	(self setupBodyA: body1 bodyB: body2)
		ifFalse: [ ^ #() ].
	axis := self findBestAxis.
	incidentEdge := self computeClippingLinesByAxis: axis.
	clipPoints := self
		clipSegmentToLine: incidentEdge
		normal: sideNormal negated
		offset: negSide
		clipEdge: negEdge.
	clipPoints size < 2
		ifTrue: [ ^ #() ].
	clipPoints := self
		clipSegmentToLine: clipPoints
		normal: sideNormal
		offset: posSide
		clipEdge: posEdge.
	clipPoints size < 2
		ifTrue: [ ^ #() ].
	^ self generateContactsFrom: clipPoints axis: axis
]

{ #category : #private }
B2Collider >> computeClippingLinesAX [
	| side |
	frontNormal := normal.
	front := (posA dotProduct: frontNormal) + hA x.
	sideNormal := rotA col2.
	side := posA dotProduct: sideNormal.
	negSide := side negated + hA y.
	posSide := side + hA y.
	negEdge := self edge3.
	posEdge := self edge1.
	^ self
		computeIncidentEdgeH: hB
		pos: posB
		rot: rotB
		normal: frontNormal
]

{ #category : #private }
B2Collider >> computeClippingLinesAY [
	| side |
	frontNormal := normal.
	front := (posA dotProduct: frontNormal) + hA y.
	sideNormal := rotA col1.
	side := posA dotProduct: sideNormal.
	negSide := side negated + hA x.
	posSide := side + hA x.
	negEdge := self edge2.
	posEdge := self edge4.
	^ self
		computeIncidentEdgeH: hB
		pos: posB
		rot: rotB
		normal: frontNormal
]

{ #category : #private }
B2Collider >> computeClippingLinesBX [
	| side |
	frontNormal := normal negated.
	front := (posB dotProduct: frontNormal) + hB x.
	sideNormal := rotB col2.
	side := posB dotProduct: sideNormal.
	negSide := side negated + hB y.
	posSide := side + hB y.
	negEdge := self edge3.
	posEdge := self edge1.
	^ self
		computeIncidentEdgeH: hA
		pos: posA
		rot: rotA
		normal: frontNormal
]

{ #category : #private }
B2Collider >> computeClippingLinesBY [
	| side |
	frontNormal := normal negated.
	front := (posB dotProduct: frontNormal) + hB y.
	sideNormal := rotB col1.
	side := posB dotProduct: sideNormal.
	negSide := side negated + hB x.
	posSide := side + hB x.
	negEdge := self edge2.
	posEdge := self edge4.
	^ self
		computeIncidentEdgeH: hA
		pos: posA
		rot: rotA
		normal: frontNormal
]

{ #category : #private }
B2Collider >> computeClippingLinesByAxis: axis [
	axis = #faceAX
		ifTrue: [ ^ self computeClippingLinesAX ].
	axis = #faceAY
		ifTrue: [ ^ self computeClippingLinesAY ].
	axis = #faceBX
		ifTrue: [ ^ self computeClippingLinesBX ].
	axis = #faceBY
		ifTrue: [ ^ self computeClippingLinesBY ].
	self error
]

{ #category : #private }
B2Collider >> computeIncidentEdgeH: h pos: pos rot: rot normal: normal2 [
	| c0 c1 rotT n nAbs |
	c0 := B2ClipVertex new.
	c1 := B2ClipVertex new.
	rotT := rot transpose.
	n := (rotT * normal2) negated.
	nAbs := n abs.
	nAbs x > nAbs y
		ifTrue: [ n x > 0
				ifTrue: [ c0 v: h x @ h y negated.
					c0 inEdge2: self edge3.
					c0 outEdge2: self edge4.
					c1 v: h x @ h y.
					c1 inEdge2: self edge4.
					c1 outEdge2: self edge1 ]
				ifFalse: [ c0 v: h x negated @ h y.
					c0 inEdge2: self edge1.
					c0 outEdge2: self edge2.
					c1 v: h x negated @ h y negated.
					c1 inEdge2: self edge2.
					c1 outEdge2: self edge3 ] ]
		ifFalse: [ n y > 0
				ifTrue: [ c0 v: h x @ h y.
					c0 inEdge2: self edge4.
					c0 outEdge2: self edge1.
					c1 v: h x negated @ h y.
					c1 inEdge2: self edge1.
					c1 outEdge2: self edge2 ]
				ifFalse: [ c0 v: h x negated @ h y negated.
					c0 inEdge2: self edge2.
					c0 outEdge2: self edge3.
					c1 v: h x @ h y negated.
					c1 inEdge2: self edge3.
					c1 outEdge2: self edge4 ] ].
	c0 v: pos + (rot * c0 v).
	c1 v: pos + (rot * c1 v).
	^ {c0.
	c1}
]

{ #category : #private }
B2Collider >> edge1 [
	^ 1
]

{ #category : #private }
B2Collider >> edge2 [
	^ 2
]

{ #category : #private }
B2Collider >> edge3 [
	^ 3
]

{ #category : #private }
B2Collider >> edge4 [
	^ 4
]

{ #category : #private }
B2Collider >> findBestAxis [
	| axis separation |
	axis := #faceAX.
	separation := faceA x.
	normal := dA x > 0.0
		ifTrue: [ rotA col1 ]
		ifFalse: [ rotA col1 negated ].
	faceA y > (self relativeTol * separation + (self absoluteTol * hA y))
		ifTrue: [ axis := #faceAY.
			separation := faceA y.
			normal := dA y > 0.0
				ifTrue: [ rotA col2 ]
				ifFalse: [ rotA col2 negated ] ].
	faceB x > (self relativeTol * separation + (self absoluteTol * hB x))
		ifTrue: [ axis := #faceBX.
			separation := faceB x.
			normal := dB x > 0.0
				ifTrue: [ rotB col1 ]
				ifFalse: [ rotB col1 negated ] ].
	faceB y > (self relativeTol * separation + (self absoluteTol * hB y))
		ifTrue: [ axis := #faceBY.
			separation := faceB y.
			normal := dB y > 0.0
				ifTrue: [ rotB col2 ]
				ifFalse: [ rotB col2 negated ] ].
	^ axis
]

{ #category : #private }
B2Collider >> generateContactsFrom: aCollection axis: axis [
	| contacts |
	contacts := OrderedCollection new.
	(aCollection copyFrom: 1 to: 2)
		do: [ :each | 
			| separation2 contact |
			separation2 := (frontNormal dotProduct: each v) - front.
			separation2 <= 0
				ifTrue: [ contact := B2Contact new.
					contact separation: separation2.
					contact normal: normal.
					contact position: each v - (separation2 * frontNormal).
					contact feature: each fp copy.
					(axis = #faceBX or: [ axis = #faceBY ])
						ifTrue: [ contact feature flip ].
					contacts add: contact ] ].
	^ contacts
]

{ #category : #private }
B2Collider >> noEdge [
	^ 0
]

{ #category : #private }
B2Collider >> relativeTol [
	^ 0.95
]

{ #category : #private }
B2Collider >> setupBodyA: bodyA bodyB: bodyB [
	| rotAT rotBT dp c absC absCT |
	hA := 0.5 * bodyA width.
	hB := 0.5 * bodyB width.
	posA := bodyA position.
	posB := bodyB position.
	rotA := B2Mat22 rotation: bodyA rotation.
	rotB := B2Mat22 rotation: bodyB rotation.
	rotAT := rotA transpose.
	rotBT := rotB transpose.
	dp := posB - posA.
	dA := rotAT * dp.
	dB := rotBT * dp.
	c := rotAT * rotB.
	absC := c abs.
	absCT := absC transpose.
	faceA := dA abs - hA - (absC * hB).
	(faceA x > 0.0 or: [ faceA y > 0.0 ])
		ifTrue: [ ^ false ].
	faceB := dB abs - (absCT * hA) - hB.
	(faceB x > 0.0 or: [ faceB y > 0.0 ])
		ifTrue: [ ^ false ].
	^ true
]
