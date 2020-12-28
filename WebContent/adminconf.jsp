<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body background="backg.jpg">

 <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=conn.createStatement();
%> 
<% 
boolean flag = false; 

String n = request.getParameter ("id"); 
String pass = request.getParameter ("password"); 

%>

<% 
 
String sql = "SELECT * from admin1 where id=? And password =?"; 

try {  
ps = conn.prepareStatement (sql); 
ps.setString (1,n); 
ps.setString (2,pass); 
rs = ps.executeQuery (); 
if (rs.next ()) { 
//out.println (rs.getString ("name")); 
flag = true; 
session.setAttribute("id", n); 
} else { 
request.setAttribute("err", "user name or password error!"); 
}

rs.close (); 
ps.close (); 
conn.close ();

} catch (Exception e) { 
out.println (e); 
} 
%>


<% 

if (flag) { 

%>

<jsp:forward page="adminsuccess.jsp" />

<%

} 
else { 
%>

<jsp:forward page="adminfail.jsp"/> 
<% 
} 
%>
</body>
</html>