<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.*, com.bean.*, java.util.*, javax.servlet.ServletOutputStream, java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
	  <title>Shopping Cart</title>
	  <link rel="icon" href="images/logo original.jpg" type="image/jpg">
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	  <link rel="stylesheet" href="css/signINsignUPstyle.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>
<body>
	<%
	/* Checking the user credentials */
		String userName = (String)session.getAttribute("userName");
		String password = (String)session.getAttribute("password");
		UserBean user = new UserBean();
		request.setAttribute("phone", user.getNumber());
		if(userName == null || password==null){
	
			response.sendRedirect("signin1.jsp");
		}		
		String addS = request.getParameter("add");
		if(addS!=null){
			int add = Integer.parseInt(addS);
			String uid = request.getParameter("uid");
			String pid = request.getParameter("id");
			CartDaoImpl cart = new CartDaoImpl();
			if(add == 1){
				//Add Product into the cart
				cart.addProductToCart(uid, pid,1);
				
			}
			else if(add == 0){
				//Remove Product from the cart
				cart.removeProductFromCart(uid, pid);
			}
		}	
	%>
<jsp:include page="userHeader.jsp"></jsp:include>

<!-- Start of Product Items List -->
<div class="products" style="background-color: #E6F9E6;">

	<table class="table table-hover" >
		<thead style="background-color:red;color:white;font-size:20px;font-weight:bold;">
			<tr> 
     			 <th>Picture </th> <th> Products </th> <th>Price</th> <th>Quantity</th>   <th>Add</th><th>Remove</th><th style="background-color:green;">Amount</th>
     		</tr>
		</thead>
		<tbody style="background-color:white;font-size:20px;font-weight:bold;">		
		<%
    
			CartDaoImpl cart = new CartDaoImpl();
			List<CartBean> cartItems= new ArrayList<CartBean>();
			cartItems = cart.getAllCartItems(userName);
			double totAmount = 0;
			for(CartBean item : cartItems)
			{
				String prodId = item.getProdId();
				int prodQuantity = item.getQuantity();
				ProductBean product = new ProductDaoImpl().getProductDetails(prodId);
				double currAmount = product.getProdPrice()*prodQuantity;
				totAmount += currAmount;

				if(prodQuantity>0)
				{
		%>
  	
  	   	<tr> <td><img src="./img?id=<%=product.getProdId() %>"  style="width:50px;height:50px;"></td> <td><%=product.getProdTitle() %></td> 
     				<td><%=product.getProdPrice() %></td> 
     				<td><form method="post" action="./UpdateToCart">
     						<input type="number" name="pqty" value="<%= prodQuantity %>" style="max-width:70px;" min="0">
     						<input type="hidden" name="pid" value="<%= product.getProdId()%>">
     						<input type="submit" name="Update" value="Update" style="max-width:100px;">
     					</form></td> 
     				<td><a href="cartDetails.jsp?add=1&uid=<%=userName %>&id=<%= product.getProdId()%>"><i class="fa fa-plus"></i></a></td>
     				<td><a href="cartDetails.jsp?add=0&uid=<%=userName %>&id=<%= product.getProdId()%>"><i class="fa fa-minus"></i></a>
     				</td>
     				<td><%=currAmount %></td>
		</tr>  				
		<%
  		} 
			}
		%>
  
  	<tr style="background-color:grey;color:white;"><td colspan="6" style="text-align:center;">Total Amount to Pay (in Rupees)</td><td><%=totAmount %></td></tr>
    	<% if(totAmount !=0) {%>
    	<tr style="background-color:grey;color:white;"><td colspan="4" style="text-align:center;">	
    	<td><form method="post" action="index.jsp"><button style="background-color:black;color:white;">Cancel</button></form></td>
    	<td colspan="2" align="center"><form method="post" action="payment.jsp?amount=<%=totAmount%>"><button type="submit">Pay Now</button></form></td> 
    </tr>
    <%} %>
  </tbody>
</table>
</div>
<%@ include file="footer1.jsp" %>

</body>
</html>
