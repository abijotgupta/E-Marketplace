package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.bean.UserBean;
import com.utility.DBUtil;
import com.utility.MailMessage;

public class UserDaoImpl implements UserDao {

	@Override
	public String registerUser(String name, Long mobileNo, String dob, String emailId, String password) {
		
		
		UserBean user = new UserBean(name,mobileNo,dob,emailId,password);
		
		String status = registerUser(user);
		
		return status;
	}

	@Override
	public String registerUser(UserBean user) {
		
		String status = "User Registration Failed!";
		
		boolean isRegtd = isRegistered(user.getUserName());
		
		
		if(isRegtd) {
			status = "Email Id Already Registered!";
			return status;
		}
		Connection conn = DBUtil.provideConnection();
		PreparedStatement ps = null;
		if(conn != null) {
			System.out.println("Connected Successfully!");
		}
			
		try {
			
			ps = conn.prepareStatement("insert into accounts(name,number,dob,email,passwordHash) values(?,?,?,?,?)");
			
			ps.setString(1, user.getName());
			ps.setLong(2, user.getNumber());
			ps.setString(3, user.getDob());
			ps.setString(4, user.getUserName());
			ps.setString(5, user.getPassword());
			
			int k = ps.executeUpdate();
			
			if(k>0) {
				status = "User Registered Successfully!";
				MailMessage.registrationSuccess(user.getUserName(), user.getName().split(" ")[0]);
			}
			
		} catch (SQLException e) {
			status = "Error: "+e.getMessage();
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps);
		
		return status;
	}
	

	@Override
	public boolean isRegistered(String emailId) {
		boolean flag = false;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps =  null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from accounts where email=?");
			
			ps.setString(1, emailId);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				flag = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		return flag;
	}

	
	
	
	
	

	@Override
	public String isValidCredential(String emailId, String password) {
		String status = "Login Denied! Incorrect Username or Password";
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select * from accounts where email=? and passwordHash=?");
			
			ps.setString(1, emailId);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				status = "valid";
			
		} catch (SQLException e) {
			status = "Error: "+e.getMessage();
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		return status;
	}

	@Override
	public UserBean getUserDetails(String emailId, String password) {
		
		UserBean user = null;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from accounts where email=? and passwordHash=?");
			ps.setString(1, emailId);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new UserBean();
				user.setName(rs.getString("name"));
				user.setNumber(rs.getLong("number"));
				user.setDob(rs.getString("dob"));
				user.setUserName(rs.getString("email"));
				user.setPassword(rs.getString("passwordHash"));
				
				return user;
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		
		return user;
	}

@Override
	public String getID(String emailId) {
		String id = "";
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select user_id from accounts where email=?");
			ps.setString(1, emailId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				id = rs.getString(1);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return id;
	}


	@Override
	public String getFName(String emailId) {
		String fname = "";
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select name from accounts where email=?");
			ps.setString(1, emailId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				fname = rs.getString(1);
				
				fname = fname.split(" ")[0];
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return fname;
	}

	@Override
	public String getUserAddr(String userId) {
		String userAddr = "";
		
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select address from accounts where email=?");
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				userAddr = rs.getString(1);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return userAddr;
	}
	
	
	
	@Override
	public UserBean getDetails(String emailId) {
		
		UserBean user = null;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from accounts where email=?");
			ps.setString(1, emailId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new UserBean();
				user.setName(rs.getString("name"));
				user.setNumber(rs.getLong("number"));
				user.setDob(rs.getString("dob"));
				user.setUserName(rs.getString("email"));
				user.setPassword(rs.getString("passwordHash"));
				
				return user;
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		
		return user;
	}


	

}
