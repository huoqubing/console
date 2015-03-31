package com.sql.project.console.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName:     AppVersion.java
 * @Description:   TODO
 * @author         FrankWong
 * @version        V1.0  
 * @Date           2013-12-11 下午10:44:07 
 */
public class Friend implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final Friend dao = new Friend();
	private int id;
	private int studentId;
	private int frientId;
	private String sname;	
	private String fname;
	private String phone;
	private String type;
	private Date createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getFrientId() {
		return frientId;
	}
	public void setFrientId(int frientId) {
		this.frientId = frientId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
