package entities;

import java.io.Serializable;

public class ItemCart extends Item implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int qty;
	
	
	// Constructeur
	public ItemCart(){}
	
	public ItemCart(Item item){
		setId(item.getId());
		setCategory(item.getCategory());
		setStock(item.getStock());
		setName(item.getName());
		setDescription(item.getDescription());
		setSerial(item.getSerial());
		setImage(item.getImage());
		setPrice(item.getPrice());
		setActive(item.isActive());
		
		qty = 0;
	}
	
	// Methode
	
	public boolean inStock(){
		return super.getStock() >= qty;
	}
		
	// Getter / Setter
	
	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}
