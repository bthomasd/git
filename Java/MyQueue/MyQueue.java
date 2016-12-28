// Queue from lecture

public class MyQueue<E> {
    private E[] elements;
    private int head;
    private int tail;
    private final int size;
    
    public MyQueue() {
	this(10) // Just invoke overloaded constructor with 10 as default.
    }

    public MyQueue(int s) {
	this.size = s;
	elements = (E[])new Object[size];
	this.head = 0;
	this.tail = 0;
    }

    public void enqueue throws QueueFullException (E e) {
	// Inserts element into the queue.
	if (!this.isFull()) {
	    elements[tail] = e;
	    tail = (tail + 1) % size; // Makes sure the tail stays in range
	} else {
	    throw new QueueFullException();
	}
    }

    public E dequeue throws QueueEmptyException (E e) {
	if (!this.isEmpty()) {
	    E item = elements[head];
	    elements[head] = null;
	    head = (head + 1) % size;
	    return item;
	} else {
	    throw new QueueEmptyException();
	}
    }

    public E peek() throws QueueEmptyException {
	if (!this.isEmpty()) {
	    return elements[head];
	} else {
	    throw new QueueEmptyException();
	}
    }

    public int queueSize() {
	// return number of elements enqueued
	return (tail + size - head) % size;
    }
    
    public int getSize() {
	return size;
    }

    public boolean isFull() {
        return (tail + 1) % size == head;
    }

    public isEmpty() {
        return head == tail;
    }
}

class QueueEmptyException extends Exception {
    public QueueEmptyException() {
	System.out.println("Queue is empty.");
    }
}

class QueueFullException extends Exception {
    public QueueFullException() {
	System.out.println("Queue is full.");
    }
}
