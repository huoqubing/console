package com.sql.project.console.dto;

import com.sql.project.console.spring.constraint.Email;
import com.sql.project.console.spring.constraint.Phone;
import com.sql.project.console.spring.constraint.StringConstraint;

import java.util.Date;

/**
 * 
 * TODO
 * @author SQL
 *  
 * 2013-12-31 下午9:07:34
 */
public class MobileUser extends BaseDto{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;//主键ID
	private String loginname;//用户名
	@StringConstraint(isMandatory=false,max=15)
	private String realname;//真实姓名
	@StringConstraint(max=32)
	private String password;//密码
	@Phone
	private String phone;//电话号码
	private String gender;// 性别:1 男 0 女
	@StringConstraint(isMandatory=false,max=128)
	private String avatar;// 头像url
	@Email(isMandatory=false,min=6,max=50)
	private String email;//邮件地址
	private Date createtime;//创建时间
	private Date updatetime;//更新时间
	private int version;//乐观锁
	
	public MobileUser(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
}
