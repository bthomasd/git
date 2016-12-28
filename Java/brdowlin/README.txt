Name: Bradley Dowling
CSU ID: 2657649
CIS 265: Assignment 5
Description: An implementation of an AVL Node and AVL Tree along with an interactive test program.

Compilation instructions: $ javac AVLNode.java
					 $ javac AVLTree.java
					 $ javac TestAVLTree.java

Running Instructions: $ java TestAVLTree
				   Enter a selection from the list for insertion, retrieval, and traversals of the tree.
				   Test toString() will the return an identical result as in-order traversal.

Known bugs: Depends on a global static StringBuilder for tree traversals.
      	    	     Had to instantiate the tree with a root value on assignment to get it to work, couldn't get the insert to work from a null root node.

