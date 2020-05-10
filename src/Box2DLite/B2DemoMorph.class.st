Class {
	#name : #B2DemoMorph,
	#superclass : #Morph,
	#instVars : [
		'demo',
		'display'
	],
	#category : #'Box2DLite-Demo'
}

{ #category : #accessing }
B2DemoMorph >> demo [
	^ demo
]

{ #category : #accessing }
B2DemoMorph >> demo: aDemo [
	demo := aDemo
]

{ #category : #accessing }
B2DemoMorph >> display: aDisplay [
	display := aDisplay.
	self extent: display form extent
]

{ #category : #drawing }
B2DemoMorph >> drawOn: aCanvas [
	aCanvas fillRectangle: self bounds color: Color gray.
	display ifNil: [ ^ self ].
	aCanvas drawImage: display form at: self topLeft
]

{ #category : #'event handling' }
B2DemoMorph >> handlesMouseDown: anEvent [
	^ true
]

{ #category : #'event handling' }
B2DemoMorph >> mouseDown: anEvent [
	demo ifNil: [ ^ self ].
	demo launchBomb
]

{ #category : #'stepping and presenter' }
B2DemoMorph >> step [
	demo ifNil: [ ^ self ].
	demo step.
	demo drawOn: display.
	self changed
]

{ #category : #stepping }
B2DemoMorph >> stepTime [
	^ 1000 // 60
]

{ #category : #'stepping and presenter' }
B2DemoMorph >> wantsSteps [
	^ true
]
