// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignement 2
// Description: A generic Stack class.

public class GenericStack <E> {
    private E[] elements;
    private final int size;
    private int top;

    public GenericStack() {
	this(10);
    }

    public GenericStack(int s) {
	size = s > 0 ? s : 10;
	elements = (E[])new Object[size];
	top = -1;
    }

    public void push(E e) throws FullStackException {
	if (this.isFull()) {
	    throw new FullStackException("Stack is full!");
	} else {
	    top++;
	    elements[top] = e;
	}
    }

    public E pop() throws EmptyStackException {
	if (this.isEmpty()) {
	    throw new EmptyStackException("Stack is empty!");
	} else {
	    return elements[top--];
	}
    }

    public E peek() throws EmptyStackException {
	if (this.isEmpty()) {
	    throw new EmptyStackException("Stack is empty!");
	} else {
	    return elements[top];
	}
    }

    public int getSize() {
	return size;
    }

    public boolean isFull() {
	if (top == size - 1) {
	    return true;
	} else {
	    return false;
	}
    }

    public boolean isEmpty() {
	if (top == -1) {
	    return true;
	} else {
	    return false;
	}
    }	
}

class FullStackException extends Exception {
    public FullStackException() {}

    public FullStackException(String message) {
	System.out.println("Exception: " + message);
    }
}

class EmptyStackException extends Exception {
    public EmptyStackException() {}

    public EmptyStackException(String message) {
	System.out.println("Exception: " + message);
    }
}
	
