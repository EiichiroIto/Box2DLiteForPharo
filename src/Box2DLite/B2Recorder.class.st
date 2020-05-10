Class {
	#name : #B2Recorder,
	#superclass : #Object,
	#instVars : [
		'writer',
		'delay'
	],
	#category : #'Box2DLite-Demo'
}

{ #category : #api }
B2Recorder >> close [
	self isOpen
		ifFalse: [ ^ self ].
	writer close.
	writer := nil
]

{ #category : #accessing }
B2Recorder >> delay [
	^ delay ifNil: [ 1 ]
]

{ #category : #accessing }
B2Recorder >> delay: anInteger [
	delay := anInteger
]

{ #category : #testing }
B2Recorder >> isOpen [
	^ writer notNil
]

{ #category : #api }
B2Recorder >> openFileNamed: aString [
	self close.
	writer := GIFReadWriter on: aString asFileReference binaryWriteStream
]

{ #category : #api }
B2Recorder >> writeForm: aForm [
	| frame |
	self isOpen
		ifFalse: [ ^ self ].
	frame := AnimatedImageFrame new
		delay: self delay;
		form: aForm as8BitColorForm.
	writer nextPutFrame: frame
]
