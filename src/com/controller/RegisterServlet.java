package com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.UserBean;
import com.dao.UserDaoImpl;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterServlet() {
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
		
		UserBean user = new UserBean(userName,mobileNo,dob,email,password);
		UserDaoImpl dao = new UserDaoImpl();
		
		String status = dao.registerUser(user);
		
		RequestDispatcher rd;
		
		
		if(status.equals("User Registered Successfully!"))
		{
			rd = request.getRequestDispatcher("signin1.jsp");
			request.setAttribute("message", status);
			rd.forward(request, response);
		}
		

		if(status.equals("Email Id Already Registered!") && status.equals("User Registration Failed!"))
		{
			rd = request.getRequestDispatcher("signup1.jsp");
			request.setAttribute("message", status);
			rd.forward(request, response);
		}
			
		
		
	
		doGet(request, response);
	}

}
