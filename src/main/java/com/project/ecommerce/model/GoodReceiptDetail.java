package com.project.ecommerce.model;

public class GoodReceiptDetail {
 	private int id;
 	private String productID;
	private int goodReceiptID;
	private int price;
	private int quantity;
	public GoodReceiptDetail() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public GoodReceiptDetail(int id, String productID, int goodReceiptID, int price, int quantity) {
		super();
		this.id = id;
		this.productID = productID;
		this.goodReceiptID = goodReceiptID;
		this.price = price;
		this.quantity = quantity;
	}
	public int getGoodReceiptID() {
		return goodReceiptID;
	}
	public void setGoodReceiptID(int goodReceiptID) {
		this.goodReceiptID = goodReceiptID;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}

	
}
