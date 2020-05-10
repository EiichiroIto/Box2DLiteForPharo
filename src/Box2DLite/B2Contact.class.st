Class {
	#name : #B2Contact,
	#superclass : #Object,
	#instVars : [
		'pn',
		'pt',
		'pnb',
		'feature',
		'massNormal',
		'massTangent',
		'separation',
		'bias',
		'r1',
		'r2',
		'normal',
		'position'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #accessing }
B2Contact >> bias [
	^ bias
]

{ #category : #accessing }
B2Contact >> bias: aFloat [
	bias := aFloat
]

{ #category : #accessing }
B2Contact >> feature [
	^ feature
]

{ #category : #accessing }
B2Contact >> feature: aFeaturePair [
	feature := aFeaturePair
]

{ #category : #initialization }
B2Contact >> initialize [
	pn := 0.0.
	pt := 0.0.
	pnb := 0.0
]

{ #category : #accessing }
B2Contact >> massNormal [
	^ massNormal
]

{ #category : #accessing }
B2Contact >> massNormal: aFloat [
	massNormal := aFloat
]

{ #category : #accessing }
B2Contact >> massTangent [
	^ massTangent
]

{ #category : #accessing }
B2Contact >> massTangent: aFloat [
	massTangent := aFloat
]

{ #category : #accessing }
B2Contact >> normal [
	^ normal
]

{ #category : #accessing }
B2Contact >> normal: aPoint [
	normal := aPoint
]

{ #category : #accessing }
B2Contact >> pn [
	^ pn
]

{ #category : #accessing }
B2Contact >> pn: aFloat [
	pn := aFloat
]

{ #category : #accessing }
B2Contact >> pnb [
	^ pnb
]

{ #category : #accessing }
B2Contact >> pnb: aFloat [
	pnb := aFloat
]

{ #category : #accessing }
B2Contact >> position [
	^ position
]

{ #category : #accessing }
B2Contact >> position: aPoint [
	position := aPoint
]

{ #category : #accessing }
B2Contact >> pt [
	^ pt
]

{ #category : #accessing }
B2Contact >> pt: aFloat [
	pt := aFloat
]

{ #category : #accessing }
B2Contact >> r1 [
	^ r1
]

{ #category : #accessing }
B2Contact >> r1: aPoint [
	r1 := aPoint
]

{ #category : #accessing }
B2Contact >> r2 [
	^ r2
]

{ #category : #accessing }
B2Contact >> r2: aPoint [
	r2 := aPoint
]

{ #category : #accessing }
B2Contact >> separation [
	^ separation
]

{ #category : #accessing }
B2Contact >> separation: aFloat [
	separation := aFloat
]
