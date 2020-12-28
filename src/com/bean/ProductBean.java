package com.bean;

import java.io.InputStream;
import java.io.Serializable;

public class ProductBean implements Serializable{

	private static final long serialVersionUID = 1L;


	public ProductBean() {}
	
	private String prodId;
	private String prodTitle;
	private String prodmetaTitle;
	private String prodSlug;
	private String prodSummary;
	private double prodPrice;
	private int prodDiscount;
	private int prodQuantity;
	private String prodShop;
	private InputStream prodImage;
	
	
	public ProductBean(String prodId, String prodTitle, String prodmetaTitle, String prodSlug, String prodSummary, double prodPrice, int prodDiscount, 
			int prodQuantity, String prodShop, InputStream prodImage)
	{
		super();
		this.prodId = prodId;
		this.prodTitle = prodTitle;
		this.prodmetaTitle = prodmetaTitle;
		this.prodSlug = prodSlug;
		this.prodSummary = prodSummary;
		this.prodPrice = prodPrice;
		this.prodDiscount = prodDiscount;
		this.prodQuantity = prodQuantity;
		this.prodShop = prodShop;
		this.prodImage = prodImage;
	}


	public String getProdId() {
		return prodId;
	}


	public void setProdId(String prodId) {
		this.prodId = prodId;
	}


	public String getProdTitle() {
		return prodTitle;
	}


	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}


	public String getProdmetaTitle() {
		return prodmetaTitle;
	}


	public void setProdmetaTitle(String prodmetaTitle) {
		this.prodmetaTitle = prodmetaTitle;
	}


	public String getProdSlug() {
		return prodSlug;
	}


	public void setProdSlug(String prodSlug) {
		this.prodSlug = prodSlug;
	}

	
	public String getProdSummary() {
		return prodSummary;
	}


	public void setProdSummary(String prodSummary) {
		this.prodSummary = prodSummary;
	}

	public double getProdPrice() {
		return prodPrice;
	}


	public void setProdPrice(double prodPrice) {
		this.prodPrice = prodPrice;
	}


	public int getProdDiscount() {
		return prodDiscount;
	}


	public void setProdDiscount(int prodDiscount) {
		this.prodDiscount = prodDiscount;
	}


	public int getProdQuantity() {
		return prodQuantity;
	}


	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}


	public String getProdShop() {
		return prodShop;
	}


	public void setProdShop(String prodShop) {
		this.prodShop = prodShop;
	}


	public InputStream getProdImage() {
		return prodImage;
	}


	public void setProdImage(InputStream prodImage) {
		this.prodImage = prodImage;
	}
	
}
