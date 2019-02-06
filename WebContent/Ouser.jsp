<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<%@ include file="LogIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
  rs = stat.executeQuery("Select * from users where name = '"+user+"' and password = '"+pass+"'");
  if(rs.next()== false){
	 // request.setAttribute("loginResult", true);
	 %>
	 <script>
	 alert("Wong Combination of user name and password!!!");
	 </script>
	 <%
	  
	  }
  else if(user!=null){
		  session=request.getSession();
		  session.setAttribute("name",user);
		  RequestDispatcher rd =request.getRequestDispatcher("dashboard.jsp");
		  rd.forward(request,response);	  
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