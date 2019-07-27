package com.xiaomi.dao.vo;


public class Good_version {
	private String id;
	private String good_id;
	private int num;
	private float price;
	private String version;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGood_id() {
		return good_id;
	}
	public void setGood_id(String good_id) {
		this.good_id = good_id;
	}
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "Good_version [id=" + id + ", good_id=" + good_id + ", num=" + num + ", price=" + price + ", version="
				+ version + "]";
	}
	public Good_version() {
		// TODO Auto-generated constructor stub
	}
	public Good_version(String id, String good_id, int num, float price, String version, String color) {
		super();
		this.id = id;
		this.good_id = good_id;
		this.num = num;
		this.price = price;
		this.version = version;
	}
	
	
}
