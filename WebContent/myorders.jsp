<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.*, com.bean.*, java.util.*, javax.servlet.ServletOutputStream, java.io.*, com.utility.DBUtil, java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		  <title>Shopping Cart</title>
		  <link rel="icon" href="images/logo original.jpg" type="image/jpg">
		  <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		  <link rel="stylesheet" href="css/signINsignUPstyle.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
	</head>
	<body>
		<header>
			<jsp:include page="header1.jsp"></jsp:include>
		</header>	
		<main>
			<center>
				<%
					if(session.getAttribute("uname")==null){
				%>
					<script type="text/javascript">
					function Redirect() {
					    window.location="index.jsp";
					}
					document.write("INVALID ACCESS!!!You will be redirected to main page in a few sec.");
					setTimeout('Redirect()', 5000);
					</script>
				<%
					}else{
				%>
				<%
					Connection con = DBUtil.provideConnection();
					PreparedStatement ps = null;
					ResultSet rs = null;
					String userName = (String)session.getAttribute("userName");
					String sql="select * from orders where cust_id="+userName+"order by transid desc";
					Statement st=con.createStatement(); 
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					if(!rs.next())
					{
				%>
					<h3>OOPS!!!!! Nothing Ordered Till Now!!!</h3>

				<% } else {
				%>
				<table border="1" cellspacing="0">
					<tr>
						<td width="66" align="center"><strong>ORDER ID</strong></td>
						<td width="400" align="center"><strong>Product Name</strong></td>
					</tr><%
					rs.previous();

				 while(rs.next()) {
				 %>
					<tr>
						<td height="75" align="center">APNI-DUKAAN-2020<%=rs.getString(1)%></td>
						<td align="center"><%=rs.getString(2)%></td>
					</tr>
				 <% } %>
				</table>
				<% } }	%>
			</center>	
		</main>
		<footer>
			<jsp:include page="footer1.jsp"></jsp:include>	
		</footer>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>
