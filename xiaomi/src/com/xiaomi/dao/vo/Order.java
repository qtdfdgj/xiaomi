package com.xiaomi.dao.vo;

import java.util.Date;


public class Order {
	private String oid;
	private String uid;
	private String gid;
	private String title;
	private String image;
	
	private float price;
	private int num;
	private String name;
	private String phone;
	private String address;
	
	private float total_price;
	private int state;
	private	Date order_time;
	private Date pay_time;
	private Date created_time;
	
	private String created_user;
	private String modified_user;
	private Date modified_time;
	
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", uid=" + uid + ", gid=" + gid + ", title=" + title + ", image=" + image
				+ ", price=" + price + ", num=" + num + ", name=" + name + ", phone=" + phone + ", address=" + address
				+ ", total_price=" + total_price + ", state=" + state + ", order_time=" + order_time + ", pay_time="
				+ pay_time + ", created_time=" + created_time + ", created_user=" + created_user + ", modified_user="
				+ modified_user + ", modified_time=" + modified_time + "]";
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getTotal_price() {
		return total_price;
	}
	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getCreated_user() {
		return created_user;
	}
	public void setCreated_user(String created_user) {
		this.created_user = created_user;
	}
	public String getModified_user() {
		return modified_user;
	}
	public void setModified_user(String modified_user) {
		this.modified_user = modified_user;
	}
	public Date getModified_time() {
		return modified_time;
	}
	public void setModified_time(Date modified_time) {
		this.modified_time = modified_time;
	}
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public Order(String oid, String uid, String gid, String title, String image, float price, int num, String name,
			String phone, String address, float total_price, int state, Date order_time, Date pay_time,
			Date created_time, String created_user, String modified_user, Date modified_time) {
		super();
		this.oid = oid;
		this.uid = uid;
		this.gid = gid;
		this.title = title;
		this.image = image;
		this.price = price;
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.total_price = total_price;
		this.state = state;
		this.order_time = order_time;
		this.pay_time = pay_time;
		this.created_time = created_time;
		this.created_user = created_user;
		this.modified_user = modified_user;
		this.modified_time = modified_time;
	}
	public Order(String uid, String gid, float price, int num, String name, String phone, String address) {
		super();
		this.uid = uid;
		this.gid = gid;
		this.price = price;
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.address = address;
	}
	
}
