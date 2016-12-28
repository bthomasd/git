// Lecture

public class PriorityQueue <E extends Comparable<E>> {
    private E[] elements;
    private int head;
    private int tail;
    private int size;
    private int count;

    public PriorityQueue() {
	this(10);
    }

    public PriorityQueue(int s) {
	size = s;
	count = 0;
	head = 0;
	tail = 0;
	elements = (E[])new Object[size];
    }

    public void enqueue(E item) throws QueueFullException {
	if ((tail + 1) % size == head) {
	    throw new QueueFullException("Queue is full.");
	} else {
	    int index = tail;
	    while (item.compareTo(elements[index]) < 0) {
		if (index == 0) {
		    index = size - 1;
		} else if (index == head) {
		    break;
		} else {
		    index--;
		}
	    }
	    int i = tail;
	    do {
		elements[(i + 1) % size] = elements[i];
		if (i == 0) {
		    i = size - 1;
		} else {
		    i--;
		}
	    } while (i != index);
	    elements[index] = item;
	    tail = (tail + 1) % size;
	    count++;
	}
    }

    public E dequeue() throws QueueEmptyException {
	if (head == tail) {
	    throw new QueueEmptyException("Queue is empty.");
	} else {
	    E temp = elements[head];
	    elements[head] = null;
	    head = (head + 1) % size;
	    return temp;
	}
    }

    public E peek() throws QueueEmptyException {
	if (head == tail) {
	    throw new QueueEmptyException("Queue is empty.");
	} else {
	    return elements[head];
	}
    }
}

class QueueEmptyException extends Exception {
    public QueueEmptyException(String s) {
	System.out.println("Exception: " + s);
    }
}

class QueueFullException extends Exception {
    public QueueFullException(String s) {
	System.out.println("Exception: " + s);
    }
}
