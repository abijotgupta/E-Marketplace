package com.bean;

public class AdminBean {

	private String name;
	private Long number;
    private String dob;
    private String userName;
    private String password;
    
    
    
	public AdminBean() {
	}


	public AdminBean(String name, Long number, String dob, String userName, String password) {
		super();
		this.name = name;
		this.number = number;
		this.dob = dob;
		this.userName = userName;
		this.password = password;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getNumber() {
		return number;
	}
	public void setNumber(Long number) {
		this.number = number;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAdminName() {
		return userName;
	}
	public void setAdminName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
    
    
	
}
