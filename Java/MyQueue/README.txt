Name: Bradley Dowling
CSU ID: 2657649
CIS 265: Assignment 2
Description: Binary Print and Checking Delimiters

To compile: At the terminal type "javac nPrint.java"
						    "javac GenericStack.java"
						    "javac Check.java"

Sample Test Run:

       Ada:brdowlin bradley$ java nPrint
       Welcome to the int-to-binary converter program.
       Please enter a non-negative integer or 0 to quit: 4
       n = 4	Output: 100
       Please enter a non-negative integer or 0 to quit: 5
       n = 5	Output: 101
       Please enter a non-negative integer or 0 to quit: 6
       n = 6	Output: 110
       Please enter a non-negative integer or 0 to quit: 27
       n = 27	Output: 11011
       Please enter a non-negative integer or 0 to quit: 300
       n = 300	Output: 100101100
       Please enter a non-negative integer or 0 to quit: 0
       n = 0	Output: 0
       Good bye.

       Ada:brdowlin bradley$ java Check
       Please enter a string to test: c[d]
       The delimiters are properly matched.

       Ada:brdowlin bradley$ java Check
       Please enter a string to test: a{b[c]d}e
       The delimiters are properly matched.

       Ada:brdowlin bradley$ java Check
       Please enter a string to test: a{b(c]d}e
       The delimiters are mismatched.

       Ada:brdowlin bradley$ java Check
       Please enter a string to test: a[b{c}d]e}
       The delimiters are mismatched.

       Ada:brdowlin bradley$ java Check
       Please enter a string to test: a{b(c)
       The delimiters are mismatched.

Existing Bugs: The binaryPrint method in the nPrint class currently relies
	       	       on a global static variable, which is not the best possible
		       solution in the long term.


						   


