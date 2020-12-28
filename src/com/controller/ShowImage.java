package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDaoImpl;


public class ShowImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ShowImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prodId = request.getParameter("id");
		ProductDaoImpl dao = new ProductDaoImpl();
		byte[] image = dao.getImage(prodId);

		response.getOutputStream().write(image);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
