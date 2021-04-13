<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin Home</title>
   	<link rel="icon" href="images/logo original.jpg" type="image/jpg">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
   	<link rel="stylesheet" href="css/signINsignUPstyle.css">
    </head> 
    <body>
    <jsp:include page="header1.jsp"></jsp:include>
    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script> 
  	<div class="products" style="background-color: #E6F9E6;">
		<div class="tab" align="center">
			<form>
			<button type="submit" class="btn btn-info" formaction="viewProducts.jsp">View products</button>
			<button type="submit" class="btn btn-success" formaction="addProduct.jsp">Add products</button>
			<button type="submit" class="btn btn-danger" formaction="removeProduct.jsp">Remove Products</button>
			<button type="submit" class="btn btn-success" formaction="updateProduct.jsp">Update Products</button>
			</form>
		</div>
	</div>
	<jsp:include page="footer1.jsp"></jsp:include>
    </body>
</html>
