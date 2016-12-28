// Implementation of a doubly linked list from scratch.

public class LList <E> {
    private Node head;
    private Node tail;
    private int count;

    public LList() {
	this.count = 0;
    }

    private class Node {
	E element;
	Node next;
	Node prev;

	public Node(E element, Node next, Node prev) {
	    this.element = element;
	    this.next = next;
	    this.prev = prev;
	}
    }

    public int getCount() {
	return count;
    }

    public boolean isEmpty() {
	return count == 0;
    }

    public void addFirst(E element) {
	Node temp = new Node(element, head, null);
	if (head != null) {
	    head.prev = temp;
	}
	
	head = temp;
	if (tail == null) {
	    tail = temp;
	}
	
	count++;
    }

    public void addLast(E element) {
	Node temp = new Node(element, null, tail);
	if (tail != null) {
	    tail.next = temp;
	}
	
	tail = temp;
	if (head == null) {
	    head = temp;
	}
	
	count++;
    }

    public E removeFirst() throws EmptyListException {
	if (count == 0) {
	    throw new EmptyListException("The list is empty!");
	}
	Node temp = tail;
	tail = tail.prev;
	tail.next = null;
	count--;
	System.out.println("deleted: " + temp.element);
	return temp.element;
    }

    public E removeLast() throws EmptyListException {
	if (count == 0) {
	    throw new EmptyListException("The list is empty!");
	}
        Node temp = tail;
	tail = tail.prev;
	tail.next = null;
	count--;
	return temp.element;
    }
}
	
class EmptyListException extends Exception {
    public EmptyListException(String message) {
	System.out.println("Exception: " + message);
    }
}
	    
