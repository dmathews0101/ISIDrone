package entities;

public class SingleEntry<K, V> {
	private K key;
	private V value;
	
	public SingleEntry () {
	        super();
	}
	
	public SingleEntry(K key, V value) {
	        this.key = key;
	        this.value = value;
	}
	
	public K key() {
		return key;
	}
	
	public void setKey(K component1) {
		this.key = component1;
	}
	
	public V value() {
		return value;
	}
	
	public void setValue(V component2) {
		this.value = component2;
	}
	
	@Override
	public String toString() {
		return "<" + key + "," + value + ">";
	}
}
