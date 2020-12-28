package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyCon {
	

	public static  Connection dbcon() throws ClassNotFoundException, SQLException {
		
		Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/marketplace","root","xxxxxxxx");
	
	return con;

	}
}
