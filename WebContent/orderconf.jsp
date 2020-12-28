<!DOCTYPE html>
<html>
<head>
	<title>Welcome to AlgoKart</title>
<!--Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!--FONT Awesome CDN-->
<script src="https://kit.fontawesome.com/5feaab6567.js" crossorigin="anonymous"></script>

<!--Custom Stylesheet-->
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
         <%@ page import="javax.servlet.*" %>
         <%@ page import="javax.servlet.http.*" %>
         <%@ page import="java.io.*" %>
<%--          <%@ page import="com.oreilly.servlet.*" %> --%>
         <%@ page import="java.util.*" %>
         <%@ page import="javax.mail.*" %>
         <%@ page import="javax.mail.internet.*" %>
         <%@ page import="javax.activation.*" %>

	<!--header-->
	<header>
		<div class="container">
			<div class="row">
			<div class="col-md-4 col-sm-12 col-12">
				<div class="btn-group">
					<button class="btn border dropdown-toggle my-md-4 my-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">IND</button>

					<div class="dropdown-menu">
						<a href="#" class="dropdown-item">USD</a>
					</div>	
				</div>
			</div>	
			<div class="col-md-4 col-12 text-center linkss">
				<a href="./index.jsp" text-decoration="none"><h2 class="my-md-3 site-title text-white" >AlgoKart</h2></a>
			</div>
			<div class="col-md-4 col-12 text-right">
				<p class="my-md-4 header-links">
					<a href="./index.jsp" class="px-2">Home</a>

					<% if(session.getAttribute("uname")==null) {
			%>
					<a href="login.jsp" class="px-2">Login</a>
					<a href="register.jsp" class="px-2">Signup</a>
					<%} else {
				%>Hi,<%=session.getAttribute("uname")%>&nbsp;
                <a href="logout.jsp" class="px-2">Logout</a>
                <a href="myorders.jsp" class="px-2">My Orders</a>
                <%}%>
				</p>
			</div>
		</div>
		</div>

		<div class="container-fluid p-0">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
 
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
		        <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Samsung" /><input type="image" src="images/sam.png" /></form>
		      </li>
		     <li class="nav-item active">
		        <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Nokia" /><input type="image" src="images/nok.png" /></form>
		      </li>
		      <li class="nav-item active">
		       <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Sony" /><input type="image" src="images/son.png" /></form>
		      </li>
		     <li class="nav-item active">
		        <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Htc" /><input type="image" src="images/htc.png" /></form>
		      </li>
		      <li class="nav-item active">
		        <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="LG" /><input type="image" src="images/lg.png" /></form>
		      </li>
		    </ul>
		  </div>
		<form name="form1" method="post" action="search.jsp" >
		<input name="search" type="text" id="search" size="60" />
		<input class="nav-item border rounded-circle mx-2 search-icon" type="submit" name="submit" id="button" value="Search">
		</form>
		</nav>
				</div>
</header>
	<!--header-->
	<main>
		<%!
String pn;
String n1;
%>
<% 
       PreparedStatement ps,ps1;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=conn.createStatement();
		 String sql = "SELECT * from mtable where prod_id=?"; 
		 ps = conn.prepareStatement (sql);
		 ps.setString(1,(String)session.getAttribute("product"));
	 rs = ps.executeQuery ();
    String loc=(String)session.getAttribute("location");

	 while(rs.next())
	 {
    if(session.getAttribute("id")!=null){
    String sql1="insert into "+(String)session.getAttribute("id")+" values(seq_order.nextval,'"+rs.getString(2)+"','"+loc+"')";
    ps1 = conn.prepareStatement (sql1,new String[] { "o_id" });
    Long oid1=null;
    if (ps1.executeUpdate() > 0) {
    System.out.println("check1");

// getGeneratedKeys() returns result set of keys that were auto
// generated
// in our case student_id column

    ResultSet generatedKeys = ps1.getGeneratedKeys();
    System.out.println("check2");
// if resultset has data, get the primary key value
// of last inserted record
    if (null != generatedKeys && generatedKeys.next()) {
    System.out.println("check3");
// voila! we got student id which was generated from sequence
     // oid1 = generatedKeys.getLong(1);
      //System.out.println("check4");
      //String orderid=oid1+"";
      //session.setAttribute("oid","ASKRT-2019"+orderid);
      //System.out.println("check5");
}

}


  }else{
  System.out.println("check6");
    //String orderid=(String)request.getParameter("phone");
    //int ii=(int)(Math.random()*((1000-1)+1))+1;
    //String foid="ASKRT-2019"+orderid+"-"+ii;
    //session.setAttribute("oid",foid);

}

%>
<%
try{
String product=rs.getString(2);
String email=(String)session.getAttribute("email");
System.out.println("sendinmail to:"+email);
String order_id=(String)session.getAttribute("oid");
Properties props=new Properties();
	props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.socketFactory.port","465");
	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.auth","true");
	props.put("mail.smtp.port","465");
	String from="" ;//enter your mail id(WEBSITE's EMAIL-leaving a colon here so you can read this.)
	String pass=""; //enter the password for that gmail account.
Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from,pass);
            }
        };

	Session ss=Session.getInstance(props,auth);
			MimeMessage message=new MimeMessage(ss);
		message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
		String subject="ORDER CONFIRMATION--AlgoKart";
				message.setSubject(subject);
				Multipart body=new MimeMultipart();
				MimeBodyPart p1=new MimeBodyPart();
				String b="YOUR ORDER NUMBER "+order_id+" HAS BEEN PLACED SUCESSFULLY!! You've Purchased-"+product;
				p1.setText(b);
				body.addBodyPart(p1);
				message.setContent(body);
				Transport.send(message);
}catch(Exception ee){
	
%>
<script type="text/javascript">
function Redirect()
{
    window.location="./index.jsp";
}
document.write("Error Occured! You will be redirected to main page in a few sec.");
setTimeout('Redirect()', 5000);
</script>
<%
}





%>
<p> Order Confirmed: order id= <%=(String)session.getAttribute("oid")%></p>
<table width="992" border="1" cellspacing="0">
  <tr>
    <td width="66" align="center"><strong>Item ID</strong></td>
    <td width="354" align="center"><strong>Product Name &amp; Model</strong></td>
    <td width="153" align="center"><strong>Brand</strong></td>
    <td width="148" align="center"><strong>Shipping Charges</strong></td>
    <td width="237" align="center"><strong>Total Cost</strong></td>
  </tr>
  <tr>
    <td height="75" align="center"><%=rs.getString(1)%></td>
    <td align="center"><%=rs.getString(2)%></td>
    <td align="center"><%=rs.getString(3)%></td>
    <td align="center">Rs. 0</td>
    <td align="center">Rs. <%=rs.getString(4)%></td>
  </tr>
</table>
<%
}

%>
<p> Thanks for shopping with us. Your item will be delivered within 2-3 days.</p>
<p><strong> Happy Shopping! </strong></p>

		
	</main>
	<footer>
		
	</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</body>
</html>