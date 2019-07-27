package com.xiaomi.dao.vo;


public class User {

	private String uid;
	private String username;
	private String password;
	private String salt;
	private String phone;
	private int gender;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", salt=" + salt + ", phone="
				+ phone + ", gender=" + gender + "]";
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String uid, String username, String password, String salt, String phone, int gender) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.salt = salt;
		this.phone = phone;
		this.gender = gender;
	}
	
	
}
