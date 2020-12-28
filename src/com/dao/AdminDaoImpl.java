package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.bean.AdminBean;
import com.utility.DBUtil;
import com.utility.MailMessage;

public class AdminDaoImpl {

public String registerAdmin(String name, Long mobileNo, String dob, String emailId, String password) {
		AdminBean admin = new AdminBean(name,mobileNo,dob,emailId,password);
		String status = registerAdmin(admin);
		return status;
	}

	
	public String registerAdmin(AdminBean admin) {
		
		String status = "User Registration Failed!";
		boolean isRegtd = isRegistered(admin.getAdminName());
		
		
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
			
			ps = conn.prepareStatement("insert into admin(name,number,dob,email,passwordHash) values(?,?,?,?,?)");
			
			ps.setString(1, admin.getName());
			ps.setLong(2, admin.getNumber());
			ps.setString(3, admin.getDob());
			ps.setString(4, admin.getAdminName());
			ps.setString(5, admin.getPassword());
			
			int k = ps.executeUpdate();
			
			if(k>0) {
				status = "Admin Registered Successfully!";
				MailMessage.registrationSuccess(admin.getAdminName(), admin.getName().split(" ")[0]);
			}
			
		} catch (SQLException e) {
			status = "Error: "+e.getMessage();
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps);
		
		return status;
	}
	

	
	public boolean isRegistered(String emailId) {
		boolean flag = false;
		
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps =  null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from admin where email=?");
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

	
}
