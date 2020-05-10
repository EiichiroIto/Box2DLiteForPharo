Class {
	#name : #B2ArbiterKey,
	#superclass : #Object,
	#instVars : [
		'body1',
		'body2'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #'instance creation' }
B2ArbiterKey class >> body1: b1 body2: b2 [
	^ self new
		setBody1: b1 body2: b2;
		yourself
]

{ #category : #comparing }
B2ArbiterKey >> < other [
	body1 < other body1
		ifTrue: [ ^ true ].
	(body1 = other body1 and: [ body2 < other body2 ])
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #comparing }
B2ArbiterKey >> = other [
	^ body1 = other body1 and: [ body2 = other body2 ]
]

{ #category : #accessing }
B2ArbiterKey >> body1 [
	^ body1
]

{ #category : #accessing }
B2ArbiterKey >> body2 [
	^ body2
]

{ #category : #comparing }
B2ArbiterKey >> hash [
	^ (body1 hash hashMultiply + body2 hash) hashMultiply
]

{ #category : #printing }
B2ArbiterKey >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: body1 asString;
		nextPut: $,;
		nextPutAll: body1 asString;
		nextPut: $)
]

{ #category : #initialization }
B2ArbiterKey >> setBody1: b1 body2: b2 [
	b1 < b2
		ifTrue: [ body1 := b1.
			body2 := b2 ]
		ifFalse: [ body1 := b2.
			body2 := b1 ]
]
