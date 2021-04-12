package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bean.ProductBean;
import com.dao.ProductDaoImpl;


public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    	public UpdateProductServlet() {
        	super();
    	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute("usertype");
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		if(userType== null || !userType.equals("admin")){
			
			response.sendRedirect("loginFirst.jsp");
			
		}
		
		else if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String prodId = request.getParameter("pid");
		String prodTitle = request.getParameter("name");
		String prodmetaTitle = request.getParameter("name");
		String prodSlug = request.getParameter("type");
		String prodSummary = request.getParameter("info");
		double prodPrice = Double.parseDouble(request.getParameter("price"));
		int prodDiscount = Integer.parseInt(request.getParameter("price"));
		int prodQuantity = Integer.parseInt(request.getParameter("quantity"));
		String prodShop = request.getParameter("info");
		
		ProductBean product = new ProductBean();
		product.setProdId(prodId);
		product.setProdTitle(prodTitle);
		product.setProdmetaTitle(prodmetaTitle);
		product.setProdSlug(prodSlug);
		product.setProdSummary(prodSummary);
		product.setProdPrice(prodPrice);
		product.setProdDiscount(prodDiscount);
		product.setProdQuantity(prodQuantity);
		product.setProdShop(prodShop);
		
		ProductDaoImpl dao = new ProductDaoImpl();
		String status = dao.updateProductWithoutImage(prodId, product);
		RequestDispatcher rd = request.getRequestDispatcher("updateProduct.jsp?prodid="+prodId+"");
		rd.include(request,response);
		pw.println("<script>document.getElementById('message').innerHTML='" + status +"'</script>");
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
