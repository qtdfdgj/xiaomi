package com.xiaomi.dao.vo;

import java.util.Date;

public class Cart {

	private String cid;
	private String uid;
	private String gid;
	private int num;
	private Date created_time;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", uid=" + uid + ", gid=" + gid + ", num=" + num + ", created_time=" + created_time + "]";
	}
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	public Cart(String cid, String uid, String gid, int num, Date created_time) {
		super();
		this.cid = cid;
		this.uid = uid;
		this.gid = gid;
		this.num = num;
		this.created_time = created_time;
	}
	
}
