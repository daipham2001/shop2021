package com.project.ecommerce.model;

public class Comment {
	private int id;
	private String productID;
	private int customerID;
	private int rating;
	private String comment;
	public Comment() {
		super();
	}
	public Comment(int id, String productID, int customerID, int rating, String comment) {
		super();
		this.id = id;
		this.productID = productID;
		this.customerID = customerID;
		this.rating = rating;
		this.comment = comment;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

}
