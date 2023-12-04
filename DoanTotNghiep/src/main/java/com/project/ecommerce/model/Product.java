package com.project.ecommerce.model;


public class Product {
	private String id;
	private String name;
	private int price;
	private int quantity;
	private String image;
	private String description;
	private int new_product;
	private int percent_promotion;
	public Product(String id, String name, int price, int quantity, String image, String description, int new_product,
			int percent_promotion, int brandID) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
		this.description = description;
		this.new_product = new_product;
		this.percent_promotion = percent_promotion;
		this.brandID = brandID;
	}
	public int getPercent_promotion() {
		return percent_promotion;
	}
	public void setPercent_promotion(int percent_promotion) {
		this.percent_promotion = percent_promotion;
	}
	public int getNew_product() {
		return new_product;
	}
	public void setNew_product(int new_product) {
		this.new_product = new_product;
	}
	private int brandID;
	public Product() {
		super();
	}
	public Product(String id, String name, int price, int quantity, String image, String description, int new_product,
			int brandID) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
		this.description = description;
		this.new_product= new_product;
		this.brandID = brandID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getBrandID() {
		return brandID;
	}
	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

}
