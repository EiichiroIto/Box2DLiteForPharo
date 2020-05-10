Class {
	#name : #B2ClipVertex,
	#superclass : #Object,
	#instVars : [
		'v',
		'fp'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #accessing }
B2ClipVertex >> fp [
	^ fp
]

{ #category : #accessing }
B2ClipVertex >> inEdge1 [
	^ fp inEdge1
]

{ #category : #accessing }
B2ClipVertex >> inEdge1: aFloat [
	fp inEdge1: aFloat
]

{ #category : #accessing }
B2ClipVertex >> inEdge2 [
	^ fp inEdge2
]

{ #category : #accessing }
B2ClipVertex >> inEdge2: aFloat [
	fp inEdge2: aFloat
]

{ #category : #initialization }
B2ClipVertex >> initialize [
	fp := B2FeaturePair new
]

{ #category : #accessing }
B2ClipVertex >> outEdge1 [
	^ fp outEdge1
]

{ #category : #accessing }
B2ClipVertex >> outEdge1: aFloat [
	fp outEdge1: aFloat
]

{ #category : #accessing }
B2ClipVertex >> outEdge2 [
	^ fp outEdge2
]

{ #category : #accessing }
B2ClipVertex >> outEdge2: aFloat [
	fp outEdge2: aFloat
]

{ #category : #accessing }
B2ClipVertex >> v [
	^ v
]

{ #category : #accessing }
B2ClipVertex >> v: aPoint [
	v := aPoint
]
