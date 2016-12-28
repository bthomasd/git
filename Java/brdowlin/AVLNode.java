// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignement 5
// Description: An implementation of a node for an AVL Tree.

public class AVLNode <E extends Comparable<E>> {
    private AVLNode<E> left;
    private AVLNode<E> right;
    private E data;
    private int height;

    // Constructors

    public AVLNode() {
	this(null);
    }

    public AVLNode(E data) {
	this.data = data;
	this.left = null;
	this.right = null;
	this.height = 0;
    }

    // Mutators, Accessors
    
    public E getData() {
	return data;
    }

    public AVLNode<E> getLeftNode() {
	return left;
    }

    public AVLNode<E> getRightNode() {
	return right;
    }

    public void setLeftNode(AVLNode<E> node) {
	this.left = node;
    }

    public void setRightNode(AVLNode<E> node) {
	this.right = node;
    }

    // Height and Balance Factor methods

    public int getHeight() {
	int leftHeight;
	int rightHeight;

	if (left == null) {
	    leftHeight = 0;
	} else {
	    leftHeight = left.getHeight();
	}

	if (right == null) {
	    rightHeight = 0;
	} else {
	    rightHeight = right.getHeight();
	}

	this.height = (Math.max(leftHeight, rightHeight) + 1);
	return height;
    }

    public int balanceFactor() {
	int leftHeight;
	int rightHeight;

	if (left == null) {
	    leftHeight = 0;
	} else {
	    leftHeight = left.getHeight();
	}

	if (right == null) {
	    rightHeight = 0;
	} else {
	    rightHeight = right.getHeight();
	}

	return (rightHeight - leftHeight);
    }

    @Override
    public String toString() {
	StringBuilder info = new StringBuilder();
	info.append("AVL Node: \n");
	if (this.data != null) {
	    info.append("Data:\t" + this.data.toString() + "\n");
	} else {
	    info.append("Data:\tNo data.\n");
	}
	if (this.left != null) {
	    info.append("Left Child:\t" + this.left.data.toString() + "\n");
	} else {
	    info.append("Left Child:\tNone.\n");
	}
	if (this.right != null) {
	    info.append("Right Child:\t" + this.right.data.toString() + "\n");
	} else {
	    info.append("Right Child:\tNone.\n");
	}
	info.append("Height:\t" + (this.getHeight() - 1) + "\n");
	info.append("Balance Factor:\t" + this.balanceFactor() + "\n");

	return info.toString();
    }
}
	    
	
	
	    
    
    
