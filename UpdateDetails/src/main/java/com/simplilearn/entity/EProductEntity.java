package com.simplilearn.entity;

import java.math.BigDecimal;
import java.util.Date;

public class EProductEntity {
	
	private int id;
	private String name;
	private int price;
	private String dateAdded;
	
	public EProductEntity() {
		// TODO Auto-generated constructor stub
	}

	public EProductEntity(String name, int price, String dateAdded) {
		super();
		this.name = name;
		this.price = price;
		this.dateAdded = dateAdded;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}

	@Override
	public String toString() {
		return "EProductEntity [id=" + id + ", name=" + name + ", price=" + price + ", dateAdded=" + dateAdded + "]";
	}
	
	

}