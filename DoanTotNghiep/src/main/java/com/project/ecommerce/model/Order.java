package com.project.ecommerce.model;

public class Order {
	private int id; 
	private int customerID;
	private int employeeID;
	private String create_date;
	private int total;
	private int status;
	private String address;
	private String name;
	private String time;
	public Order(int customerID, String create_date, int total, String address, String name, String time,
			String phone) {
		super();
		this.customerID = customerID;
		this.create_date = create_date;
		this.total = total;
		this.address = address;
		this.name = name;
		this.time = time;
		this.phone = phone;
	}
	private int shipperID;
	public Order() {
		super();
	}
	public Order(int id, int customerID, int employeeID, String create_date, int total, int status, String address,
			String name, String time, String phone,int shipperID) {
		super();
		this.id = id;
		this.customerID = customerID;
		this.employeeID = employeeID;
		this.create_date = create_date;
		this.total = total;
		this.status = status;
		this.address = address;
		this.name = name;
		this.time = time;
		this.phone = phone;
		this.shipperID = shipperID;	
	}
	public int getShipperID() {
		return shipperID;
	}
	public void setShipperID(int shipperID) {
		this.shipperID = shipperID;
	}
	private String phone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
