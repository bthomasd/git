// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 2
// Description: Implement a generic Stack class and check a string for correct delimiters.

import java.util.*;

public class Check {
    public static void main(String[] args) {
	Scanner input = new Scanner(System.in);

	System.out.print("Please enter a string to test: ");
	String in = input.next();

	boolean correct = checkDelimiters(in);

	if (correct) {
	    System.out.println("The delimiters are properly matched.");
	} else {
	    System.out.println("The delimiters are mismatched.");
	}
    }
    
    public static boolean checkDelimiters(String str) {
	GenericStack<Character> charStack = new GenericStack<>(str.length());
	try {
	    for (int i = 0; i < str.length(); i++) {
		char ch1 = str.charAt(i); // Check character at ith position
		
		if (ch1 == '{' ||        // If ith character is a left-side delimiter,
		    ch1 == '[' ||        // push it onto the stack.
		    ch1 == '(') {
		    charStack.push(ch1);  
		}                         
	   
		if (ch1 == '}' ||        // If ith character is a right-side delimiter
		    ch1 == ']' ||        // test it against the character popped 
		    ch1 == ')') {        // off the stack. 
		    if (!charStack.isEmpty()) {
			char ch2 = charStack.pop();
			if ((ch1 == '}' && ch2 != '{') || // If the delimiter doesn't match
			    (ch1 == ']' && ch2 != '[') || // its corresponding one, return false.
			    (ch1 == ')' && ch2 != '(')) {
			    return false;
			}
		    } else {
			return false; // If you get a right-delimiter, but the stack is empty
		    }                 // return false
		}
	    }	    
	    if (!charStack.isEmpty()) {
		return false;           //If charStack still has elements after loop, return false
	    }	    
	} catch (Exception ex) {} // Just trying to satisfy the compiler.
      
	return true; // If program survives to this point, delimiters must match.
    }
}
