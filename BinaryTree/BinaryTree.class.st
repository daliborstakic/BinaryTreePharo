Class {
	#name : #BinaryTree,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #BinaryTree
}

{ #category : #accessing }
BinaryTree class >> setRoot: aBTNode [
	^ self new root: aBTNode; yourself
]

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
BinaryTree >> bfs: anObject [
	| q |
	self root ifNil: [ ^ nil ].
	q := LinkedList new.
	q addLast: self root.
	[ q isNotEmpty ]
		whileTrue: [ | node |
			node := q removeFirst.
			node info == anObject
				ifTrue: [ ^ node ].
			node left ifNotNil: [ :arg | q addLast: node left ].
			node right ifNotNil: [ :arg | q addLast: node right ] ].
	^ nil
]

{ #category : #public }
BinaryTree >> delete: anObject [
	self root: (self delete: anObject node: self root)
]

{ #category : #public }
BinaryTree >> delete: anObject node: aBTNode [
	| temp |
	temp := aBTNode.
	temp ifNil: [ ^ temp ].
	(anObject < temp info)
		ifTrue: [ temp left: (self delete: anObject node: temp left) ];
		ifFalse: [ (temp info > anObject)
					ifTrue: [ temp right: (self delete: anObject node: temp right) ];
					ifFalse: [ temp left ifNil: [ ^ temp right ].
							temp right ifNil: [ ^ temp left ].
							temp info: (self minValue: temp right).
							temp right: (self delete: anObject node: temp right) ] ].
	^ temp
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

{ #category : #'as yet unclassified' }
BinaryTree >> dfs: anObject [
	self root ifNil: [ ^ nil ].
	^ self dfs: anObject node: self root
]

{ #category : #accessing }
BinaryTree >> dfs: anObject node: aBTNode [
	| n |
	aBTNode info == anObject
		ifTrue: [ ^ aBTNode ].
	aBTNode left
		ifNotNil: [ :arg | 
			n := self dfs: anObject node: aBTNode left.
			n ifNotNil: [ :arg | ^ n ] ].
	aBTNode right
		ifNotNil: [ :arg | 
			n := self dfs: anObject node: aBTNode right.
			n ifNotNil: [ :arg | ^ n ] ].
	^ nil
]

{ #category : #testing }
BinaryTree >> isEmpty [ 
	^ self root isNil 
]

{ #category : #accessing }
BinaryTree >> minValue: aBTNode [
	| min temp |
	temp := aBTNode.
	min := temp info.
	[ temp left ] whileNotNil: [ 
		min := temp left info.
		 temp := temp left
	].

	^ min
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
