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
<title></title>
</head>
<body>
<% 
try 
{
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  String name = request.getParameter("user");
  session=request.getSession();
  session.setAttribute("name",name);
  String email = request.getParameter("mail");
  String fname = request.getParameter("reg_fname");
  String lname = request.getParameter("reg_lname");
  String prof = request.getParameter("profile");
  String course = request.getParameter("course");
  String pass = request.getParameter("password");
  Statement stat = con.createStatement();
  stat.executeUpdate("insert into S_register values('"+name+"','"+fname+"','"+lname+"','"+email+"','"+course+"','"+prof+"','"+pass+"')");
  stat.close();
  }catch(java.sql.SQLIntegrityConstraintViolationException e)
  {
      %>
      <script>
      alert("This user name is taken!!!");
      </script>
      
      <%
  }%> 
</body>
</html>