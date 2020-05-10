Class {
	#name : #B2FeaturePair,
	#superclass : #Object,
	#instVars : [
		'inEdge1',
		'outEdge1',
		'inEdge2',
		'outEdge2'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #comparing }
B2FeaturePair >> = other [
	inEdge1 = other inEdge1
		ifFalse: [ ^ false ].
	inEdge2 = other inEdge2
		ifFalse: [ ^ false ].
	outEdge1 = other outEdge1
		ifFalse: [ ^ false ].
	outEdge2 = other outEdge2
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #api }
B2FeaturePair >> flip [
	| tmp |
	tmp := inEdge1.
	inEdge1 := inEdge2.
	inEdge2 := tmp.
	tmp := outEdge1.
	outEdge1 := outEdge2.
	outEdge2 := tmp
]

{ #category : #accessing }
B2FeaturePair >> inEdge1 [
	^ inEdge1
]

{ #category : #accessing }
B2FeaturePair >> inEdge1: anObject [
	inEdge1 := anObject
]

{ #category : #accessing }
B2FeaturePair >> inEdge2 [
	^ inEdge2
]

{ #category : #accessing }
B2FeaturePair >> inEdge2: anObject [
	inEdge2 := anObject
]

{ #category : #initialization }
B2FeaturePair >> initialize [
	inEdge1 := 0.
	outEdge1 := 0.
	inEdge2 := 0.
	outEdge2 := 0
]

{ #category : #accessing }
B2FeaturePair >> outEdge1 [
	^ outEdge1
]

{ #category : #accessing }
B2FeaturePair >> outEdge1: anObject [
	outEdge1 := anObject
]

{ #category : #accessing }
B2FeaturePair >> outEdge2 [
	^ outEdge2
]

{ #category : #accessing }
B2FeaturePair >> outEdge2: anObject [
	outEdge2 := anObject
]
