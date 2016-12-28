// Test for doubly linked list.

public class DLLTest {
    public static void main(String[] args) {
	LList<Integer> dll = new LList<Integer>();
	dll.addFirst(10);
	dll.addFirst(34);
	dll.addFirst(56);
	dll.addFirst(364);
	dll.iterateForward();
	dll.removeFirst();
	dll.removeLast();
	dll.iterateBackward();
    }
}
