package com.dao;

import com.bean.UserBean;

public interface UserDao {
	
	public String registerUser(String userName,Long mobileNo,String dob,String emailId,String password);
	
	public String registerUser(UserBean user);
	
	public boolean isRegistered(String emailId);
		
	public String isValidCredential(String emailId, String password);
	
	public UserBean getUserDetails(String emailId,String password);
	
	public String getID(String emailId);
	
	public String getUserAddr(String userId);
	
	public String getFName(String emailId);
	
	public UserBean getDetails(String emailId);
	
	
}
