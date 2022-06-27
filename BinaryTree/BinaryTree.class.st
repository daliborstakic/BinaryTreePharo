Class {
	#name : #BinaryTree,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #BinaryTree
}

{ #category : #accessing }
BinaryTree >> root [
	^ root
]

{ #category : #accessing }
BinaryTree >> root: aBTNode [ 
	root := aBTNode
]
