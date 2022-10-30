package entities;

import java.io.Serializable;
import java.util.HashMap;

public class Cart implements Serializable{
	private static final long serialVersionUID = 1L;
	
	// Attribut
	private HashMap<String, ItemCart> cart;
	
	// Constructeur
	public Cart() {
		cart = new HashMap<String, ItemCart>();
	}

	public Cart(HashMap<String, ItemCart> cart) {
		this.cart = cart;
	}

	// Methode
	
	public void addItem(String key, ItemCart itemC){
		cart.put(key, itemC);		
	}
	
	public void removeItem(String key){
		cart.remove(key);
	}
	
	public boolean isEmpty(){
		return cart.size() == 0;
	}
	
	public double generateSubTotal(){
		double subTotal = 0;
		
		for (ItemCart itemC : cart.values()) 
	        subTotal += itemC.getPrice() *itemC.getQty();
		
		return subTotal;
	}
	
	public double generateShipCost(){
		double shipCost = 0;

		for (ItemCart itemC : cart.values()) 
			shipCost += 5 * itemC.getQty();
				
		return shipCost;
	}
	
	public double generateTotal(){
		return generateSubTotal() + generateShipCost();
	}
	
	// Getter / Setter
	
	public HashMap<String, ItemCart> getCart() {
		return cart;
	}

	public void setCart(HashMap<String, ItemCart> cart) {
		this.cart = cart;
	}

	public int getSize(){
		return cart.size();
	}
	
}
