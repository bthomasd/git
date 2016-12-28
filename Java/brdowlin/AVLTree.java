// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 5
// Description: Implement an AVL tree with insert(), search(), traversal methods.

import java.util.*;

public class AVLTree<E extends Comparable<E>> {
    //private AVLNode<E> dummyRoot;
    private AVLNode<E> root;
    private static StringBuilder traversal; // Global for holding ordered tree traversals

    public AVLTree() {
	this.root = new AVLNode<E>();
	this.traversal = new StringBuilder();
    }

    public AVLTree(E data) {
	this.root = new AVLNode<E>(data);
	this.traversal = new StringBuilder();
    }

    public AVLNode<E> search(E data) {
	AVLNode<E> current = this.root;
	while (current != null) {
	    if (data.compareTo(current.getData()) == 0) {
		return current;
	    } else if (data.compareTo(current.getData()) < 0) {
		current = current.getLeftNode();
	    } else {
		current = current.getRightNode();
	    }
	}
	return null;
    }

    public void insert(E data) {
	// Helper method for insert
	this.insert(data, this.root);
    }

    public void insert(E data, AVLNode<E> node) {
	if (this.root == null) {
	    this.root = new AVLNode<E>(data);
	    return;
	}

	if (data.compareTo(node.getData()) < 0) {
	    if (node.getLeftNode() == null) {
		node.setLeftNode(new AVLNode<E>(data));
		return;
	    }
	    insert(data, node.getLeftNode());
	} else {
	    if (node.getRightNode() == null) {
		node.setRightNode(new AVLNode<E>(data));
		return;
	    }
	    insert(data, node.getRightNode());
	}

	if (node == this.root) {
	    this.rotate(node, this.root);
	}

	if (node.getLeftNode() != null) {
	    this.rotate(node.getLeftNode(), node);
	}

	if (node.getRightNode() != null) {
	    this.rotate(node.getRightNode(), node);
	}
    }

    public void rotate(AVLNode<E> node, AVLNode<E> localRoot) {
	int balance = node.balanceFactor();
	AVLNode<E> child = new AVLNode<E>(null);
	AVLNode<E> grandchild = new AVLNode<E>(null);
	
	if (Math.abs(balance) < 2) { // If balance factor is -1, 0, 1, do nothing
	    return;
	}

	if (balance < 0) { // Determine which child needs rotation
	    child = node.getLeftNode();
	} else {
	    child = node.getRightNode();
	}

	int childBalance = child.balanceFactor(); // Get balance factor for comparison

	// Rotation Cases
	
	if (balance < -1 && childBalance < 0) { // Left-Left Case
	    if (localRoot != this.root && localRoot.getRightNode() == node) {
		localRoot.setRightNode(child);
	    } else {
		localRoot.setLeftNode(child);
	    }
	    grandchild = child.getRightNode();
	    child.setRightNode(node);
	    node.setLeftNode(grandchild);
	    return;
	} else if (balance > 1 && childBalance > 0) { // Right-Right case
	    if (localRoot != this.root && localRoot.getRightNode() == node) {
		localRoot.setRightNode(child);
	    } else {
		localRoot.setLeftNode(child);
	    }
	    grandchild = child.getLeftNode();
	    child.setLeftNode(node);
	    node.setRightNode(grandchild);
	    return;
	} else if (balance < -1 && childBalance > 0) { // Right-Left double rotation case
	    grandchild = child.getRightNode();
	    node.setLeftNode(grandchild);
	    child.setRightNode(grandchild.getLeftNode());
	    grandchild.setLeftNode(child);
	    rotate(node, localRoot); // Recurse to rotate second time
	    return;
	} else if (balance < 0 && childBalance > 1) { // Left-Right double rotation case
	    grandchild = child.getLeftNode();
	    node.setRightNode(grandchild);
	    child.setLeftNode(grandchild.getRightNode());
	    grandchild.setRightNode(child);
	    rotate(node, localRoot); 
	    return;
	}
    }

    // helper methods for traversals
    
    public String inOrderTraversal() {
	this.traversal.setLength(0);
	return this.inOrderTraversal(this.root);
    }

    public String preOrderTraversal() {
	this.traversal.setLength(0);
 	return this.preOrderTraversal(this.root);
    }

    public String postOrderTraversal() {
	this.traversal.setLength(0);
	return this.postOrderTraversal(this.root);	
    }
    
    public String inOrderTraversal(AVLNode<E> node) {
	AVLNode<E> current = node;
	if (current != null) {
	    this.inOrderTraversal(current.getLeftNode());
	    this.traversal.append("Data: " + current.getData() + " Height: " + (current.getHeight() - 1) + "\n");
	    this.inOrderTraversal(current.getRightNode());
	}
	return traversal.toString();
    }

    public String preOrderTraversal(AVLNode<E> node) {
	AVLNode<E> current = node;
	if (current != null) {
	    this.traversal.append("Data: " + current.getData() + " Height: " + (current.getHeight() - 1) + "\n");
	    this.preOrderTraversal(current.getLeftNode());
	    this.preOrderTraversal(current.getRightNode());
	}
	return traversal.toString();
    }

    public String postOrderTraversal(AVLNode<E> node) {
	AVLNode<E> current = node;
	if (current != null) {
	    this.postOrderTraversal(current.getLeftNode());
	    this.postOrderTraversal(current.getRightNode());
	    this.traversal.append("Data: " + current.getData() + " Height: " + (current.getHeight() - 1) + "\n");
	}
	return traversal.toString();
    }

    @Override
    public String toString() {
        this.traversal.setLength(0);
	return this.inOrderTraversal(this.root);
    }
}
