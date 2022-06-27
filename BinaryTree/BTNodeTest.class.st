Class {
	#name : #BTNodeTest,
	#superclass : #TestCase,
	#category : #'BinaryTree-Tests'
}

{ #category : #tests }
BTNodeTest >> testInfo [ 
	| c |
	c := BTNode new.
	c info: 5.
	^ self assert: c info equals: 5
]

{ #category : #tests }
BTNodeTest >> testLeft [ 
	| c |
	c := BTNode new.
	c left: (BTNode new info: 5).
	^ self assert: c left info equals: 5
]

{ #category : #tests }
BTNodeTest >> testRight [
	| c |
	c := BTNode new.
	c right: (BTNode new info: 5).
	^ self assert: c right info equals: 5
]
