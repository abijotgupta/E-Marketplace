package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.ProductDaoImpl;


@MultipartConfig(maxFileSize = 16177215)

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String status = "Product Registration Failed!";
		
		String prodTitle = request.getParameter("title");
		String prodmetaTitle = request.getParameter("metaTitle");
		String prodSlug = request.getParameter("slug");
		String prodSummary = request.getParameter("summary");
		double prodPrice = Double.parseDouble(request.getParameter("price"));
		int prodDiscount = Integer.parseInt(request.getParameter("discount"));
		int prodQuantity = Integer.parseInt(request.getParameter("quantity"));
		String prodShop = request.getParameter("shop");
		
		InputStream inputStream = null;
		Part part = request.getPart("img");
		  if (part != null) 
		  {
	            // prints out some information for debugging
//	            System.out.println(part.getName());
//	            System.out.println(part.getSize());
//	            System.out.println(part.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = part.getInputStream();	
	       }
		 
		InputStream prodImage = inputStream;
		ProductDaoImpl product = new ProductDaoImpl();
		
		status = product.addProduct(prodTitle, prodmetaTitle, prodSlug, prodSummary, prodPrice, prodDiscount, prodQuantity, prodShop, prodImage);
		
		RequestDispatcher rd = request.getRequestDispatcher("addProduct.jsp");
		
		// getServletContext().getRequestDispatcher("/viewProducts.jsp").forward(request, response);
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
	
		rd.include(request, response);
		pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
