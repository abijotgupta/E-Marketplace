<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.*, com.bean.*, java.util.*, javax.servlet.ServletOutputStream,java.io.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
    	<title>Products</title>
    	<link rel="icon" href="images/logo original.jpg" type="image/jpg">
    	<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
    	<!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
       	<!-- Main css -->
       	<link rel="stylesheet" href="css/signINsignUPstyle.css">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body>
	<%
	/* Checking the user credentials */
		String userName = (String)session.getAttribute("userName");
		String password = (String)session.getAttribute("password");
		boolean isValidUser = true;
		if(userName == null || password==null){
			isValidUser = false;
		}		
	%>
	<%
		if(isValidUser) {
	%>
	<%@ include file="header1.jsp" %>
	<%
		}
		else{
	%>
	<%@ include file="header1.jsp" %>
	<%
		}
	%>
	<!-- Start of Product Items List -->
	<div class="products" style="background-color: #E6F9E6;">  
	<div class="row text-center" >
  	<%
  	ProductDaoImpl prodDao = new ProductDaoImpl(); 
  	List<ProductBean> products = new ArrayList<ProductBean>();
  	products = prodDao.getAllProducts();
  	
  	for(ProductBean product : products) {
  		String addToCartUrl = null;
  		String buyNowUrl = null;
  		if(isValidUser) {
  			addToCartUrl = "./cartDetails.jsp?uid="+userName+"&id="+product.getProdId()+"&quantity=1&add=1";//+product.getProdQuantity();
  		} else {
  			addToCartUrl = "signin1.jsp";
  		}
  	%>
	<div class="col-sm-4">
		<div class="thumbnail">
			<img src="./img?id=<%=product.getProdId() %>" alt="Product" style="height:200px; max-width:200px; max-width:300px;">
			<p class="productname"><%=product.getProdTitle() %></p>
			<p class="productinfo"><%=product.getProdSlug() %></p>
			<p class="priceProduct">&#8377 <%=product.getProdPrice() %> </p>
		       <form method="post"> 
				<button type="submit" method="post" formaction="<%=addToCartUrl%>">Add to Cart</button> 
			</form> 
	  	</div>
  	</div>
	  <%
		}
	  %>
</div>
</div>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
