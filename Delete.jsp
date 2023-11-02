
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<link rel="stylesheet" href="css/Delete.css">
</head>
<body>
<div class="main">
<div class="delete">
<h1>Delete the task</h1>
<br>
	<div class="del">
			<div>
			<form action="Delete.jsp">
				Enter ID:<input type="number" name="id">
				<input type="submit" value="submit">
			</form>
			</div>	
	</div>
	<%
		String id=request.getParameter("id");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapp","root","root");
			Statement st=c.createStatement();
			ResultSet rs=st.executeQuery("SELECT ROW_NUMBER() OVER() as rn,a.*  FROM addtask a");
			PreparedStatement ps=c.prepareStatement("delete from addtask where title=?");
			while(rs.next())
			{
				String rn=rs.getString(1);
				String title=rs.getString(2);
				String description=rs.getString(3);
				String targetdate=rs.getString(4);
				String status=rs.getString(5);
				
				if(rn.equals(id))
				{					
					out.print(rn);
					ps.setString(1,title);
					ps.executeUpdate();
					response.sendRedirect("display");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	%>
</div>
</div>

</body>
</html>