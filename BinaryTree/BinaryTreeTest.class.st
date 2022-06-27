Class {
	#name : #BinaryTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'root'
	],
	#category : #'BinaryTree-Tests'
}

{ #category : #tests }
BinaryTreeTest >> testRoot [
	| c |
	c := BinaryTree new.
	c root: (BTNode with: 5).
	self assert: c root info equals: 5 
]
