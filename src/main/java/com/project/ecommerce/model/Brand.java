package com.project.ecommerce.model;

public class Brand {
	private int id;
	private int idcategory;
	private String name;
	
	public Brand() {
		
	}
	public Brand(int id, int idcategory, String name) {
		super();
		this.id = id;
		this.name = name;
		this.idcategory = idcategory;
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
	public int getIdcategory() {
		return idcategory;
	}
	public void setIdcategory(int idcategory) {
		this.idcategory = idcategory;
	}
}
