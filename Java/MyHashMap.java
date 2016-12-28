// Name: Bradley Dowling
// CSU ID: 2657649
// CIS 265: Assignment 4
// Description: An implementation of a hash map.

import java.util.*;

public class MyHashMap<K, V> {
    private int size;
    private int count;
    private MyEntry[] elements;

    public MyHashMap() {
	this(16);
    }

    public MyHashMap(int s) {
	this.size = s;
	elements = new MyEntry[size];
	count = 0;
    }

    public void add(K key, V value) {
	int index;
	int i = 1;
	index = key.hashCode() % size;
	if (elements[index] != null) {
	    while (elements[index] != null) {
		index = (key.hashCode() + (i * i)) % size; // quadratic probing collision handler
		i++;
	    }
	    elements[index] = new MyEntry(key, value);
	    count++;
	} else {
	    elements[index] = new MyEntry(key, value);
	    count++;
	}
    }

    public void remove(K key) {
	int index = key.hashCode() % size;
	if (elements[index] == null) {
	    for (int i = 0; i < size; i++) {
		index = (key.hashCode() + (i * i)) % size;
		if (elements[index] != null) {
		    elements[index] = null;
		    break;
		}
	    }
	} else {
	    elements[index] = null;
	}
    }

    public V get(K key) {
	int index = key.hashCode() % size;
	V val = null;
	if (elements[index] == null) {
	    for (int i = 0; i < size; i++) {
		index = (key.hashCode() + (i * i)) % size;
		if (elements[index] != null) {
		    val = (V)(Object)elements[index].value;
		    return val;
		}
	    }
	    return null;
	} else {
	    val = (V)(Object)elements[index].value;
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
		s += elements[i].key.toString() + "\t" +
		    elements[i].value.toString() + "\n";
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
    }	
}

    
