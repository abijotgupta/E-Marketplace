package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.ProductDaoImpl;

public class RemoveProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RemoveProductServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductDaoImpl prodDao = new ProductDaoImpl(); 
	  
		String status = "Product Removal Failed!";
		String prodId = request.getParameter("prodid");
		status = prodDao.removeProduct(prodId);
		
		RequestDispatcher rd = request.getRequestDispatcher("removeProduct.jsp");
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		rd.include(request, response);
		pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
