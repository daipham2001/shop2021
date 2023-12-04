package com.project.ecommerce.model;

public class Seri {
	private String id;
	private String productID;
	private int goodReceipt_detailID;
	private int orderDetailID;
	private int status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public int getGoodReceipt_detailID() {
		return goodReceipt_detailID;
	}
	public void setGoodReceipt_detailID(int goodReceipt_detailID) {
		this.goodReceipt_detailID = goodReceipt_detailID;
	}
	public int getOrderDetailID() {
		return orderDetailID;
	}
	public void setOrderDetailID(int orderDetailID) {
		this.orderDetailID = orderDetailID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Seri() {
		super();
	}
	public Seri(String id, String productID, int goodReceipt_detailID, int orderDetailID, int status) {
		super();
		this.id = id;
		this.productID = productID;
		this.goodReceipt_detailID = goodReceipt_detailID;
		this.orderDetailID = orderDetailID;
		this.status = status;
	}
}
