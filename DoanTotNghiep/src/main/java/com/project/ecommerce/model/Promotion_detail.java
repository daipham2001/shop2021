package com.project.ecommerce.model;

public class Promotion_detail {
	public Promotion_detail(String productID, int promotionID, int percent_promotion, String dateStart, String dateEnd,
			String procductName) {
		super();
		this.productID = productID;
		this.promotionID = promotionID;
		this.percent_promotion = percent_promotion;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.procductName = procductName;
	}
	public Promotion_detail(String productID, int promotionID, int percent_promotion) {
		super();
		this.productID = productID;
		this.promotionID = promotionID;
		this.percent_promotion = percent_promotion;
	}
	private String productID;
	private int promotionID;
	public Promotion_detail() {
		super();
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public int getPromotionID() {
		return promotionID;
	}
	public void setPromotionID(int promotionID) {
		this.promotionID = promotionID;
	}
	public int getPercent_promotion() {
		return percent_promotion;
	}
	public void setPercent_promotion(int percent_promotion) {
		this.percent_promotion = percent_promotion;
	}
	public String getDateStart() {
		return dateStart;
	}
	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	public String getProcductName() {
		return procductName;
	}
	public void setProcductName(String procductName) {
		this.procductName = procductName;
	}
	private int percent_promotion;
	private String dateStart;
	private String dateEnd;
	private String procductName;
	
}
