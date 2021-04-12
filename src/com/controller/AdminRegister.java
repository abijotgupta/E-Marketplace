package com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.AdminBean;
import com.dao.AdminDaoImpl;

public class AdminRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	public AdminRegister() {
        	super();
    	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String userName = request.getParameter("name");
		Long mobileNo = Long.parseLong(request.getParameter("number"));
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		
		AdminBean admin = new AdminBean(userName,mobileNo,dob,email,password);
		AdminDaoImpl dao = new AdminDaoImpl();
		
		String status = dao.registerAdmin(admin);
		
		RequestDispatcher rd;
		if(status.equals("Admin Registered Successfully!"))
		{
			rd = request.getRequestDispatcher("adminLogin.jsp");
			request.setAttribute("message", status);
			rd.forward(request, response);
		}
		if(status.equals("Email Id Already Registered!") && status.equals("Admin Registration Failed!"))
		{
			rd = request.getRequestDispatcher("adminSignup.jsp");
			request.setAttribute("message", status);
			rd.forward(request, response);
		}
		doGet(request, response);
	}
}
