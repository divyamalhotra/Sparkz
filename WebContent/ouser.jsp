<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<%@ include file="Home.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<title></title>
</head>
<body>
<% 
try 
{
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  String user = request.getParameter("l_user");
  String pass = request.getParameter("l_pass");
  Statement stat= con.createStatement();
  ResultSet rs= null;
  rs = stat.executeQuery("Select * from s_register where name = '"+user+"' and password = '"+pass+"'");
  if(rs.next()== false){
	  %>
	  <script>
	  alert("Wrong combination of user name and password!!!");
	  </script>
	  <%
	  }
  else if(rs.next()){
		  session=request.getSession();
		  session.setAttribute("name",user);
	  }
  stat.close();
  rs.close();
}catch(Exception e)
{
    out.println(e.getLocalizedMessage());
}
%>
</body>
</html>