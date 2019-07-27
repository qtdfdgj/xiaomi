package com.xiaomi.dao.vo;


import java.util.Date;

public class Goods {

	private String id;
	private String name;
	private String category_name;
	private String label;
	private String sell_point;
	private String image;
	private int status;
	private int priority;
	
	private Date created_time;
	private Date modified_time;
	private String created_user;
	private String modified_user;
	
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
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getSell_point() {
		return sell_point;
	}
	public void setSell_point(String sell_point) {
		this.sell_point = sell_point;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public Date getModified_time() {
		return modified_time;
	}
	public void setModified_time(Date modified_time) {
		this.modified_time = modified_time;
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
	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", category_name=" + category_name + ", label=" + label
				+ ", sell_point=" + sell_point + ", image=" + image + ", status=" + status + ", priority=" + priority
				+ ", created_time=" + created_time + ", modified_time=" + modified_time + ", created_user="
				+ created_user + ", modified_user=" + modified_user + "]";
	}
	
	public Goods() {
		// TODO Auto-generated constructor stub
	}
	public Goods(String id, String name, String category_name, String label, String sell_point, String image,
			int status, int priority, Date created_time, Date modified_time, String created_user,
			String modified_user) {
		super();
		this.id = id;
		this.name = name;
		this.category_name = category_name;
		this.label = label;
		this.sell_point = sell_point;
		this.image = image;
		this.status = status;
		this.priority = priority;
		this.created_time = created_time;
		this.modified_time = modified_time;
		this.created_user = created_user;
		this.modified_user = modified_user;
	}
	
	 
	
}
