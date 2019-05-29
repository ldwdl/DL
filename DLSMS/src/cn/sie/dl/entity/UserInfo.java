package cn.sie.dl.entity;

import java.util.Date;

public class UserInfo {
	private Integer id;
	private String name;
	private String truename;
	private String sex;
	private String email;
	private String remark;
	private Date creatdata;
	private String password;
	
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public UserInfo(String name, String truename, String sex,String email, String remark,
			Date creatdata,String password) {
		this.name = name;
		this.truename = truename;
		this.sex = sex;
		this.email = email;
		this.remark = remark;
		this.creatdata = creatdata;
		this.password = password;
	}
	public UserInfo(Integer id, String name, String password) {
		this.id = id;
		this.name = name;
		this.password = password;
	}
	
	public UserInfo(String name, String password) {
		this.name = name;
		this.password = password;
	}
	
	
	public Date getCreatdata() {
		return creatdata;
	}



	public void setCreatdata(Date creatdata) {
		this.creatdata = creatdata;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTruename() {
		return truename;
	}



	public void setTruename(String username) {
		this.truename = username;
	}



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		this.sex = sex;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getRemark() {
		return remark;
	}



	public void setRemark(String remark) {
		this.remark = remark;
	}
}
