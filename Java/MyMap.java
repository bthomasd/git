// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 4
// Description: An implementation of a Map data structure.

import java.util.*;

public class MyMap<K, V> {
    private int size;
    private MyEntry[] elements;
    private int count;

    public MyMap() {
	this(16);
    }
    
    public MyMap(int size) {
	this.size = size;
	elements = new MyEntry[size];
	count = 0;
    }
    
    public void add(K key, V value) {
	int index;
	index = key.hashCode() % size;
	if (elements[index] != null) {
	    return;
	} else {
	    elements[index] = new MyEntry(key, value);
	    count++;
	}
    }

    public void remove(K key) {
	int index = key.hashCode() % size;
	if (elements[index] == null) {
	    return;
	} else {
	    elements[index] = null;
	}
    }

    public V get(K key) {
	int index = key.hashCode() % size;
	V val = null;
	if (elements[index] == null) {
	    return null;
	} else {
	    val = (V)(Object)elements[index].getValue();
	    return val;
	}
    }

    public HashSet<String> keySet() {
	HashSet<String> set = new HashSet<>();
	for (int i = 0; i < size; i++) {
	    if (elements[i] != null) {
		set.add(elements[i].key.toString());
	    }
	}
	return set;
    }

    @Override
    public String toString() {
	String s = "";
	for (int i = 0; i < size; i++) {
	    if (elements[i] != null) {
		s += elements[i].getKey().toString() + "\t" + elements[i].getValue().toString() + "\n";
	    }
	}
	return s;
    }
    
    private class MyEntry<K, V> {
	final K key;
	V value;

	public MyEntry(K key, V value) {
	    this.key = key;
	    this.value = value;
	}

	public K getKey() {
	    if (key == null) {
		return null;
	    }
	    return this.key;
	}

	public V getValue() {
	    return this.value;
	}

	public void setValue(V value) {
	    this.value = value;
	}
    }
}
