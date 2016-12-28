// Linked LIst

public class MyLinkedList <E> {
    

    
    private class Node<E> {
	E element;
	Node<E> next;
	Node<E> prev;

	public Node(E element, Node<E> next, Node<E> prev) {
	    this.element = element;
	    this.next = next;
	    this.prev = prev;
	}
    }
}
