<%@page import="java.sql.PreparedStatement"%>
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
		String title=request.getParameter("title");
		String description=request.getParameter("description");
		String targetdate=request.getParameter("targetdate");
		String status=request.getParameter("status");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapp","root","root");
			PreparedStatement ps=c.prepareStatement("insert into addtask values(?,?,?,?)");
			ps.setString(1,title);
			ps.setString(2,description);
			ps.setString(3,targetdate);
			ps.setString(4,status);
			
			ps.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		response.sendRedirect("Home.html");
	%>
</body>
</html>