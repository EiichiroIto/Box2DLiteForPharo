Extension { #name : #Point }

{ #category : #'*Box2DLite' }
Point >> cross: aFloat [
	^ (aFloat * self y) @ (aFloat negated * self x)
]

{ #category : #'*Box2DLite' }
Point >> invCross: aFloat [
	^ (aFloat negated * self y) @ (aFloat * self x)
]

{ #category : #'*Box2DLite' }
Point >> multiplyMat22By: mat [
	| x1 y1 |
	x1 := (mat col1 x * self x) + (mat col2 x * self y).
	y1 := (mat col1 y * self x) + (mat col2 y * self y).
	^ x1 @ y1
]
