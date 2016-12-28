// Build my own implementation of Linked List

public class MyLinkedList<E> {
    private Node<E> head;
    private Node<E> tail;
    private int size;
    
    public MyLinkedList() {
	this.head = null;
	this.tail = null;
	size = 0;
    }

    public E getFirst() {
	if (size == 0) {
	    return null;
	} else {
	    return head.getData();
	}
    }

    public E getLast() {
	if (size == 0) {
	    return null;
	} else {
	    return tail.getData();
	}
    }

    public E get(int index) {
	if (index == 0) {
	    this.getFirst();
	} else if (index == size - 1) {
	    this.getLast();
	}
	Node<E> current = head;
	for (int i = 1; i < index; i++) {
	    current = current.next;
	}
	return current.getData();	
    }	

    public void addFirst (E element) {
	Node<E> newNode = new Node<>(element); // create a new node
	newNode.next = head;
	head = newNode;
	size++;

	if (tail == null) { // the new node is the only node in the list
	    tail = head;
	}
    }

    public void addLast (E element) {
	Node<E> newNode = new Node<>(element);

	if (tail == null) {
	    head = tail = newNode; // the only node in the list
	} else {
	    tail.next = newNode; // link the new node with the last node
	    tail = tail.next;    // tail now points to the last node
	}

	size++; // increase size
    }

    public void add(int index, E element) {
	if (index == 0) {
	    addFirst(element); // Insert first
	} else if (index >= size) {
	    addLast(element);
	} else {
	    Node<E> current = head;
	    for (int i = 1; i < index; i++) {
		current = current.next;
	    }
	    Node<E> temp = current.next;
	    current.next = new Node<E>(element);
	    (current.next).next = temp;
	    size++;
	}
    }

    public E removeFirst() {
	if (size == 0) {
	    return null;
	} else {
	    Node<E> temp = head;
	    head = head.next;
	    size--;
	    if (head == null) {
		tail = null;
	    }
	    return temp.getData();
	}
    }

    public E removeLast() {
	if (size == 0) {
	    return null;
	} else if (size == 1) {
	    Node<E> temp = head;
	    head = tail = null;
	    size = 0;
	    return temp.getData();
	} else {
	    Node<E> current = head;
	    for (int i = 0; i < size - 2; i++) {
		current = current.next;
	    }

	    Node<E> temp = tail;
	    tail = current;
	    tail.next = null;
	    size--;
	    return temp.getData();
	}
    }

    public E remove(int index) {
	if (index < 0 || index >= size) {
	    return null;
	} else if (index == 0) {
	    return this.removeFirst();
	} else if (index == size - 1) {
	    return this.removeLast();
	} else {
	    Node<E> previous = head;

	    for (int i = 1; i < index; i++) {
		previous = previous.next;
	    }

	    Node<E> current = previous.next;
	    previous.next = current.next;
	    size--;
	    return current.getData();
	}
    }
		    
    public int getSize() {
	return size;
    }
    
    public boolean isEmpty() {
	if (head == null && tail == null) {
	    return true;
	} else {
	    return false;
	}
    }

    private class Node<E> {
	private E data;
	private Node<E> next;
	private Node<E> prev;

	public Node(E data) {
	    this.data = data;
	}

	public Node(E data, Node<E> next, Node<E> prev) {
	    this.data = data;
	    this.next = next;
	    this.prev = prev;
	}

	public Node<E> getNext() {
	    return next;
	}

	public Node<E> getPrev() {
	    return prev;
	}

	public E getData() {
	    return data;
	}

	public void setData(E data) {
	    this.data = data;
	}

	public void setNext(Node<E> next) {
	    this.next = next;
	}

	public void setPrev(Node<E> prev) {
	    this.prev = prev;
	}
    }
}
