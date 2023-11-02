<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	String id=request.getParameter("id");
	String title=request.getParameter("title");
	String description=request.getParameter("description");
	String targetdate=request.getParameter("targetdate");
	String status=request.getParameter("status");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapp","root","root");
		Statement st2=c.createStatement();
		ResultSet rs2=st2.executeQuery("SELECT ROW_NUMBER() OVER() as rn,a.*  FROM addtask a");
		PreparedStatement ps2=c.prepareStatement("UPDATE addtask SET title = ?, description = ?,targetdate=?,status=? WHERE title=?");
		while(rs2.next())
		{
			String rn=rs2.getString(1);
			String title1=rs2.getString(2);
			
			if(rn.equals(id))
			{		
				ps2.setString(1,title );
				ps2.setString(2, description);
				ps2.setString(3, targetdate);
				ps2.setString(4, status);
				ps2.setString(5, title1);
				ps2.executeUpdate();
				response.sendRedirect("display");
			}
			else{
				
			}
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	%>
</body>
</html>