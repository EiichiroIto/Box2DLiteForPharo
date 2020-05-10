Class {
	#name : #B2Body,
	#superclass : #Object,
	#instVars : [
		'position',
		'rotation',
		'velocity',
		'angularVelocity',
		'force',
		'torque',
		'friction',
		'width',
		'invMass',
		'invI',
		'id'
	],
	#classVars : [
		'NextId'
	],
	#category : #'Box2DLite-Core'
}

{ #category : #'instance creation' }
B2Body class >> extent: aPoint mass: aFloat [
	^ self basicNew initialize
		setExtent: aPoint mass: aFloat;
		yourself
]

{ #category : #accessing }
B2Body class >> nextId [
	NextId ifNil: [ NextId := 0 ].
	NextId := NextId + 1.
	^ NextId
]

{ #category : #accessing }
B2Body class >> reset [
	NextId := nil
]

{ #category : #comparing }
B2Body >> < other [
	^ id < other id
]

{ #category : #accessing }
B2Body >> angularVelocity [
	^ angularVelocity
]

{ #category : #accessing }
B2Body >> angularVelocity: aFloat [
	angularVelocity := aFloat
]

{ #category : #api }
B2Body >> applyImpulse: impulse r: r [
	velocity := velocity + (invMass * impulse).
	angularVelocity := angularVelocity
		+ (invI * (r crossProduct: impulse))
]

{ #category : #accessing }
B2Body >> force [
	^ force
]

{ #category : #accessing }
B2Body >> force: aPoint [
	force := aPoint
]

{ #category : #accessing }
B2Body >> friction [
	^ friction
]

{ #category : #accessing }
B2Body >> friction: aFloat [
	friction := aFloat
]

{ #category : #comparing }
B2Body >> hash [
	^ id
]

{ #category : #accessing }
B2Body >> id [
	^ id
]

{ #category : #initialization }
B2Body >> initialize [
	id := self class nextId
]

{ #category : #api }
B2Body >> integrateForcesGravity: gravity dt: dt [
	(invMass closeTo: 0.0)
		ifTrue: [ ^ self ].
	velocity := velocity + (dt * (gravity + (invMass * force))).
	angularVelocity := angularVelocity + (dt * invI * torque)
]

{ #category : #accessing }
B2Body >> invI [
	^ invI
]

{ #category : #accessing }
B2Body >> invMass [
	^ invMass
]

{ #category : #api }
B2Body >> massMatrixR: r [
	^ B2Mat22
		col1: (invI * r y * r y) @ (invI * r x * r y) negated
		col2: (invI * r x * r y) negated @ (invI * r x * r x)
]

{ #category : #accessing }
B2Body >> position [
	^ position
]

{ #category : #accessing }
B2Body >> position: aPoint [
	position := aPoint
]

{ #category : #printing }
B2Body >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: width asString;
		nextPut: $)
]

{ #category : #accessing }
B2Body >> rotation [
	^ rotation
]

{ #category : #accessing }
B2Body >> rotation: aNumber [ 
	rotation := aNumber
]

{ #category : #initialization }
B2Body >> setExtent: aPoint mass: aFloat [
	| i |
	position := 0.0 @ 0.0.
	rotation := 0.0.
	velocity := 0.0 @ 0.0.
	angularVelocity := 0.0.
	force := 0.0 @ 0.0.
	torque := 0.0.
	friction := 0.2.
	width := aPoint.
	aFloat < Float fmax
		ifTrue: [ invMass := 1.0 / aFloat.
			i := aFloat * (width x squared + width y squared) / 12.0.
			invI := 1.0 / i ]
		ifFalse: [ invMass := 0.0.
			invI := 0.0 ]
]

{ #category : #api }
B2Body >> stepBy: dt [
	position := position + (dt * velocity).
	rotation := rotation + (dt * angularVelocity).
	force := 0.0 @ 0.0.
	torque := 0.0
]

{ #category : #accessing }
B2Body >> torque [
	^ torque
]

{ #category : #accessing }
B2Body >> torque: aFloat [
	torque := aFloat
]

{ #category : #accessing }
B2Body >> velocity [
	^ velocity
]

{ #category : #accessing }
B2Body >> velocity: aPoint [
	velocity := aPoint
]

{ #category : #accessing }
B2Body >> width [
	^ width
]
