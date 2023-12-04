package com.project.ecommerce.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;


public class Cart {

	private HashMap<String, Item> cartItems;

	public HashMap<String, Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<String, Item> cartItems) {
		this.cartItems = cartItems;
	}

	public Cart(HashMap<String, Item> cartItems) {
		super();
		this.cartItems = cartItems;
	}
	public Cart() {
		cartItems= new HashMap<>();
		
	}
	
	//insert to Cart
	 public void insertToCart(String id, Item item) {
		 boolean check  = cartItems.containsKey(id);
		 if(check) {
			 int quantity_old= item.getQuantity();
			 int unitInStock=item.getProduct().getQuantity();
			 if(quantity_old==unitInStock) {
				 return;
			 }
			 item.setQuantity(quantity_old+1);
			 
			 cartItems.put(id, item);
		 } else {
			 cartItems.put(id, item);
		 }	 
	 }
	 
	 //sub to cart
	 public void subToCart(String id, Item item) {
		 boolean check  = cartItems.containsKey(id);
		 if(check) {
			 int quantity_old= item.getQuantity();
			if(quantity_old==1) {
				return;
				
			} else {
				item.setQuantity(quantity_old-1);
				cartItems.put(id, item);
			}
	 }
}
	 //remove to Cart
	 public void removeToCart(String id) {
		 boolean check = cartItems.containsKey(id);
		 if(check) {
			 cartItems.remove(id);
		 }
	 }
	 
	 //count item
	 public int countItem() {
		 return cartItems.size();
	 }
	 
	 // sum total
	 public int totalCart() {
		 int count=0;
		 for (Map.Entry<String, Item> listMap : cartItems.entrySet()) {
			 if(listMap.getValue().getProduct().getPercent_promotion()>0) {
				int price_promotion=  listMap.getValue().getProduct().getPrice() - listMap.getValue().getProduct().getPrice()*listMap.getValue().getProduct().getPercent_promotion()/100;
				count+=listMap.getValue().getQuantity() *price_promotion;
			 } else {
			 count += listMap.getValue().getQuantity() * listMap.getValue().getProduct().getPrice();
			 }
			 
		 }
		 return count;
	 }
	 
	 
}
