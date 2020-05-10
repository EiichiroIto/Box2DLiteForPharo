Class {
	#name : #BaselineOfBox2DLite,
	#superclass : #BaselineOf,
	#category : #BaselineOfBox2DLite
}

{ #category : #baselines }
BaselineOfBox2DLite >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Box2DLite';
				package: 'Box2DLite-Tests'
					with: [ spec requires: #('Box2DLite') ] ]
]

{ #category : #accessing }
BaselineOfBox2DLite >> projectClass [
	^ MetacelloCypressBaselineProject
]
