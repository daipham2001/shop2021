package com.project.ecommerce.model;

public class Customer {
	private int id;
	private String name;
	private String phone;
	private String email;
	private String password;
	private String address;
	public String getAddress() {
		return address;
	}

	public Customer(int id, String name, String phone, String email, String address) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Customer() {
		
	}
	
	public Customer(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public Customer(String name, String phone, String email, String password, String address) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.address = address;
	}

	public Customer(int id, String name, String phone, String email, String password, String address) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.address = address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}
