Class {
	#name : #BTNode,
	#superclass : #Object,
	#instVars : [
		'info',
		'left',
		'right'
	],
	#category : #BinaryTree
}

{ #category : #accessing }
BTNode >> info [
	^ info
]

{ #category : #'as yet unclassified' }
BTNode >> info: anObject [ 
	info := anObject
]

{ #category : #accessing }
BTNode >> left [
	^ left
]

{ #category : #accessing }
BTNode >> left: aBTNode [
	left := aBTNode
]

{ #category : #accessing }
BTNode >> right [
	^ right
]

{ #category : #accessing }
BTNode >> right: aBTNode [
	right := aBTNode
]
