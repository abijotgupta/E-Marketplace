package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bean.UserBean;
import com.dao.UserDaoImpl;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userName = request.getParameter("userName");
		String password = request.getParameter("pass");
		//String userType = request.getParameter("usertype");
		
		PrintWriter pw = response.getWriter();
		
		response.setContentType("text/html");
		
		String status = "Login Denied! Invalid Username or password.";		
	
		UserDaoImpl udao = new UserDaoImpl();
		
		status = udao.isValidCredential(userName, password);
			 
		if(status.equalsIgnoreCase("valid")) {
				 //valid user
				 
			UserBean user = udao.getUserDetails(userName, password);
				 
			HttpSession session = request.getSession();
			session.setAttribute("userdata", user);
			session.setAttribute("userName", userName);
			session.setAttribute("password", password);
			// session.setAttribute("usertype", userType);
				 
				 
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				 
			rd.forward(request, response);
				 
		}
			 else {
				 //invalid user;
				 
				RequestDispatcher rd = request.getRequestDispatcher("signin1.jsp");
					
				rd.include(request, response);
				
				pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
				 
				 
			 }
			
		
		
	}
}