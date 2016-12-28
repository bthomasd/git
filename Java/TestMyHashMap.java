// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 4
// Description: Program to test MyMap and MyHashMap classes.

import java.util.Scanner;

public class TestMyHashMap {
    public static void main(String[] args) {
	Scanner input = new Scanner(System.in);
	MyHashMap<Integer, String> myMap = new MyHashMap<Integer, String>(20);
	int key;
	int selection;
	String value;

	System.out.println("Welcome to the MyHashMap testing program.");
	do {
	    System.out.println("What would you like to do?");
	    System.out.println("1. Add a value to the Hash Map\n" +
			       "2. Remove a value from the Hash Map\n" +
			       "3. Get a value from the Hash Map\n" +
			       "4. Get the set of keys from the Hash Map\n" +
			       "5. Return a string that consists of all items in the Hash Map\n" +
			       "6. Exit");
	    selection = input.nextInt();
	    
	    switch (selection) {
	    case 1:
		System.out.print("Please enter an integer key: ");
		key = input.nextInt();
		System.out.print("Please enter a string value: ");
		value = input.next();
		myMap.add(key, value);
		break;
	    case 2:
		System.out.print("Please enter the key of the value you want to remove: ");
		key = input.nextInt();
		myMap.remove(key);
		break;
	    case 3:
		System.out.print("Please enter the key of the value you want to get: ");
		key = input.nextInt();
		System.out.println("\n" + myMap.get(key) + "\n");
		break;
	    case 4:
		System.out.println(myMap.keySet().toString());
		break;
	    case 5:
		System.out.println(myMap.toString());
		break;
	    case 6:
		System.out.println("Thank you for using the TestMyHashMap program.");
		break;
	    default:
		System.out.println("Please try another selection.");
		break;
	    }
	    
	} while (selection != 6);
    }
}
