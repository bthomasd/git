// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 2
// Description: A recursive method that prints the binary form of a non-negative integer.

import java.util.*;

public class nPrint {
    public static StringBuilder binRep = new StringBuilder();
    
    public static void main(String[] args) {
	Scanner input = new Scanner(System.in);
	int n = 1;
	System.out.println("Welcome to the int-to-binary converter program.");
	do {
	    try {
		System.out.print("Please enter a non-negative integer or 0 to quit: ");
		n = input.nextInt();
		if (n == 0) {
		    System.out.printf("n = 0\tOutput: 0\n");
		} else {
		    System.out.print("n = " + n + "\tOutput: ");
		    binaryPrint(n);
		    binRep.setLength(0);
		}
	    } catch (InputMismatchException ex) {
		System.out.println("Wrong input type. Please try again.");
		input.next();
	    } catch (InvalidValueException ex) {}
	} while (n != 0);
	System.out.println("Good bye.");
    }
    
    public static void binaryPrint(int n) throws InvalidValueException {
	if (n < 0) {
	    throw new InvalidValueException("No negative numbers allowed.");
	} else if (n == 0) {
	    System.out.println(binRep.reverse());
	} else if (n % 2 == 0) {
	    binRep.append(0);
	    binaryPrint(n / 2);
	} else {
	    binRep.append(1);
	    binaryPrint(n / 2);	   
	}
    }
}

class InvalidValueException extends Exception {
    public InvalidValueException() {}

    public InvalidValueException(String s) {
	System.out.println("Exception: " + s);
    }
}
