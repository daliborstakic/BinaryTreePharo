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

{ #category : #tests }
BinaryTreeTest >> testSize [
	| c |
	c := BinaryTree new.
	c add: 5.
	c add: 2.
	self assert: c size equals: 2
]
