package com.project.ecommerce.model;

public class Order_detail {
	private int id;
	private int orderID;
	private String productID;
	private int quantity;
	public Order_detail(int id, int orderID, String productID, int quantity, int price) {
		super();
		this.id = id;
		this.orderID = orderID;
		this.productID = productID;
		this.quantity = quantity;
		this.price = price;
	}
	public Order_detail() {
		super();
	}
	private int price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
