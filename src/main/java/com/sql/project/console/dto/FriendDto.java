/**
 * 
 */
package com.sql.project.console.dto;

import com.sql.project.console.spring.constraint.DoubleConstraint;
import com.sql.project.console.spring.constraint.StringConstraint;

import java.util.Date;

/**
 * TODO
 * @author SQL
 *  
 * 2014-1-1 下午12:17:37
 */
public class FriendDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int studentId;
	private int frientId;
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
	
	
}
