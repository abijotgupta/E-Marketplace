package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bean.DemandBean;
import com.bean.ProductBean;
import com.dao.CartDaoImpl;
import com.dao.DemandDaoImpl;
import com.dao.ProductDaoImpl;

public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    	public AddToCart() {
        	super();
   	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String password = (String)session.getAttribute("password");
	
		if(userName == null || password==null){
	
			response.sendRedirect("signin1.jsp");
		}	
		String userId = userName;
		String prodId = request.getParameter("id");		
		int pQty = Integer.parseInt(request.getParameter("quantity")); //1
		CartDaoImpl cart = new CartDaoImpl();
		ProductDaoImpl productDao = new  ProductDaoImpl();
		ProductBean product= productDao.getProductDetails(prodId);
		int availableQty = product.getProdQuantity();
		int cartQty = 0;//cart.getProductCount(userId,prodId);
		pQty += cartQty;
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		if(availableQty < pQty ) {
			
			String status = null;
			if(availableQty == 0) {
				status = "Product is Out of Stock!";
			}
			else {
				cart.updateProductToCart(userId, prodId, availableQty);
				status = "Only "+availableQty+" no of "+product.getProdTitle()+" are available in the shop! So we are adding only "+availableQty+" products into Your Cart"
						+ "";
			}
			
			DemandBean demandBean = new DemandBean(userName,product.getProdId(),pQty-availableQty);
			DemandDaoImpl demand = new DemandDaoImpl();
			boolean flag = demand.addProduct(demandBean);
			
			if(flag)
				status += "<br/>Later, We Will Mail You when "+product.getProdTitle()+" will be available into the Store!";
			
			RequestDispatcher rd = request.getRequestDispatcher("cartDetails.jsp");
			rd.include(request, response);
			pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
			
		}
		else {
			String status = cart.updateProductToCart(userId, prodId, pQty);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
			pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}
