package com.project.ecommerce.model;

public class GoodReceipt {
	private int id;
	private int employeeID;
	private String created_date;
	private int total;
	public GoodReceipt() {
		super();
	}
	public GoodReceipt(int id, int employeeID, String created_date, int total) {
		super();
		this.id = id;
		this.employeeID = employeeID;
		this.created_date = created_date;
		this.total = total;
	}
	public int getId() {
		return id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
}
