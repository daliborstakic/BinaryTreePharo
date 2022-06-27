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

{ #category : #'instance creation' }
BTNode class >> with: anObject [
	^ self new info: anObject; yourself
]

{ #category : #'as yet unclassified' }
BTNode class >> with: anObject leftNode: aBTNodeL rightNode: aBTNodeR [
	^ self new info: anObject; left: aBTNodeL; right: aBTNodeR; yourself
]

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
