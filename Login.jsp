<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapp","root","root");
			PreparedStatement ps=c.prepareStatement("select username,password from users where username=? and password=?");
			
			ps.setString(1,username);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				response.sendRedirect("Home.html");
			}
			else
			{
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.print("<h1 style='color:red; text-align:center'>Incorrect Email or password</h1>");
				
				RequestDispatcher rd=request.getRequestDispatcher("Login.html");
				rd.include(request, response);
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>