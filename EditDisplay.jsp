<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Task</title>
<link rel="stylesheet" href="css/EditDisplay1.css">
</head>
<body>
<div class="main">

<div class="editdisplay1">
<h1>Edit the task</h1>
<div class="enterid">
	<div>
		<form action="EditDisplay.jsp">
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
			
			
			out.print("<html><body>");
			out.print("<br>");
			out.print("<table border=1><tr>"+"<th>ID</th>"+
					"<th>Title</th>"+"<th>description</th>"+
					"<th>targetdate</th>"+"<th>status</th>"+"</tr>");
			while(rs.next())
			{
				String rn=rs.getString(1);
				String title=rs.getString(2);
				String description=rs.getString(3);
				String targetdate=rs.getString(4);
				String status=rs.getString(5);
				
				if(rn.equals(id))
				{					
					out.print("<tr>"+"<td>"+rn+"</td>"+
							"<td>"+title+"</td>"+
							"<td>"+description+"</td>"+
							"<td>"+targetdate+"</td>"+
							"<td>"+status+"</td>"+"</tr>");
				}else{
					
				}

			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
	<div class="changes">
	<div>
			<h2>Enter changes</h2>
			<form action="EditDisplay2.jsp">
			Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="id" required><br>
			Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" required><br>
			Description:<input type="text" name="description" required><br>
			Target Date:<input type="date" name="targetdate" required><br>
			Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="status">
			<option value="">--select--</option>
			<option value="completed">completed</option>
			<option value="pending">pending</option>
			<option value="started">started</option>
			</select> <br><br>
			<input type="submit" value="Update">
			</form>
	</div>
		</div>
	<br><br>
	<h2>Given id row in table is:</h2>

</div>

</div>
	
</body>
</html>