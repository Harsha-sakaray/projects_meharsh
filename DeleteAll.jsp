
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapp","root","root");
			Statement st=c.createStatement();
			st.executeUpdate("truncate table addtask");
			response.sendRedirect("display");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
	
	%>
</body>
</html>