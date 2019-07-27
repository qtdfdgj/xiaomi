package com.xiaomi.dao.vo;

public class Address {
	
	private String aid;
	private String uid;
	private String name;
	private String address;//地址
	private String phone;//电话
	private String tel;//固话
	private String tag;//地址类型比如学校，家
	private int is_default;//是否默认1代表默认，0代表非默认
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getIs_default() {
		return is_default;
	}
	public void setIs_default(int is_default) {
		this.is_default = is_default;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", uid=" + uid + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", tel=" + tel + ", tag=" + tag + ", is_default=" + is_default + "]";
	}
	public Address(String aid, String uid, String name, String address, String phone, String tel, String tag,
			int is_default) {
		super();
		this.aid = aid;
		this.uid = uid;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.tel = tel;
		this.tag = tag;
		this.is_default = is_default;
	}
	
	public Address(String uid, String name, String address, String phone, String tel, String tag, int is_default) {
		super();
		this.uid = uid;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.tel = tel;
		this.tag = tag;
		this.is_default = is_default;
	}
	public Address() {
		// TODO Auto-generated constructor stub
	}
}
