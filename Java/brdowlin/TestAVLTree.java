// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 5
// Description: A test program for the AVLTree/AVLNode classes

import java.util.Scanner;

public class TestAVLTree {
    public static void main(String[] args) {
	AVLTree<Integer> avlTree = new AVLTree<Integer>(10);
	Scanner input = new Scanner(System.in);
       	int userInput = 0;

	System.out.println("Welcome to the AVLTree test program.");
	System.out.println("This AVLTree is using Integer type and is rooted with a value of 10.");
	do {
	    System.out.println("Please enter a selection.");
	    System.out.print("1) Insert an item into the tree.\n" +
			     "2) Search for an item in the tree.\n" +
			     "3) Get in-order traversal of tree.\n" +
			     "4) Get pre-order traversal of tree.\n" +
			     "5) Get post-order traversal of tree.\n" +
			     "6) Test toString().\n" +
			     "7) Quit\n" +
			     ">>> ");
	    try {
		userInput = input.nextInt();	

	    if (userInput == 1) {
		System.out.print("Please enter an integer value to insert: ");
		userInput = input.nextInt();
		avlTree.insert(userInput);
		System.out.println("Inserted " + userInput + " into the AVL tree.");
	    }
	    else if (userInput == 2) {
		System.out.print("Please enter the integer you want to locate: ");
		AVLNode<Integer> temp = avlTree.search(input.nextInt());
		if (temp == null) {
		    System.out.println("Element not found.");
		} else {
		    System.out.println(temp);
		}
	    }
	    else if (userInput == 3) {
		System.out.println(avlTree.inOrderTraversal());
	    }
	    else if (userInput == 4) {
		System.out.println(avlTree.preOrderTraversal());
	    }
	    else if (userInput == 5) {
		System.out.println(avlTree.postOrderTraversal());
	    }
	    else if (userInput == 6) {
		System.out.println(avlTree.toString());
	    }
	    else if (userInput == 7) {
		System.out.println("Thank you for using the test program.");
	    }
	    else {
		System.out.println("Please try another selection.");
	    }
	    
	    } catch (Exception ex) {
		System.out.println("An error occurred.");
		input.next();
	    }
	} while (userInput != 7);

	System.out.println("Good bye.");
    }
}
