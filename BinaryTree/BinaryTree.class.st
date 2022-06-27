Class {
	#name : #BinaryTree,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #BinaryTree
}

{ #category : #adding }
BinaryTree >> add: anObject [
	self isEmpty
		ifTrue: [ ^ self root: (self add: anObject node: self root) ].
	^ self add: anObject node: self root
]

{ #category : #adding }
BinaryTree >> add: anObject node: aBTNode [
	aBTNode ifNil: [ ^ BTNode with: anObject ].
	anObject < aBTNode info
		ifTrue: [ ^ aBTNode left: (self add: anObject node: aBTNode left) ].
	anObject > aBTNode info
		ifTrue: [ ^ aBTNode right: (self add: anObject node: aBTNode right) ].
	anObject == aBTNode info
		ifTrue: [ self error: 'key already exists' ]
]

{ #category : #accessing }
BinaryTree >> depth [
	self root ifNil: [ ^ -1 ].
	^ self depth: self root
]

{ #category : #accessing }
BinaryTree >> depth: aBTNode [
	| leftDepth rightDepth |
	leftDepth := -1.
	rightDepth := -1.
	aBTNode left
		ifNotNil: [ :arg | leftDepth := self depth: aBTNode left ].
	aBTNode right
		ifNotNil: [ :arg | rightDepth := self depth: aBTNode right ].
	leftDepth > rightDepth
		ifTrue: [ ^ leftDepth + 1 ]
		ifFalse: [ ^ rightDepth + 1 ]
]

{ #category : #testing }
BinaryTree >> isEmpty [ 
	^ self root isNil 
]

{ #category : #accessing }
BinaryTree >> root [
	^ root
]

{ #category : #accessing }
BinaryTree >> root: aBTNode [ 
	root := aBTNode
]

{ #category : #accessing }
BinaryTree >> size [
	self root ifNil: [ ^ 0 ].
	^ self size: self root
]

{ #category : #accessing }
BinaryTree >> size: aBTNode [ 
	| leftSize rightSize |
	leftSize := 0.
	rightSize := 0.
	
	aBTNode left isNotNil ifTrue: [ leftSize := (self size: aBTNode left) ].
	aBTNode right isNotNil ifTrue: [ rightSize := (self size: aBTNode right) ].
	
	^ 1 + leftSize + rightSize
]
