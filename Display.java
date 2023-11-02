import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/display")
public class Display extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapp","root","root");
			Statement st=c.createStatement();
			
			ResultSet rs=st.executeQuery("select * from addtask");
			PrintWriter pw= resp.getWriter();
			resp.setContentType("text/html");
			pw.print("<html><head><link rel='stylesheet' href='css/Display.css'>");
			pw.print("</head>");
			pw.print("<body>");
			pw.print("<div class='main'>");
			pw.print("<div class='display'><h1>Task Details</h1>");
			pw.print("<form action='AddTask.html'><input type='submit' value='ADD New TASk'></form>");
			pw.print("<form action='DeleteAll.jsp'><input type='submit' value='DELETE ALL Task'></form>");
			pw.print("<br>");
			pw.print("<div class='tab'><table border=1><tr>"+"<th>ID</th>"+
			"<th>Title</th>"+"<th>description</th>"+
					"<th>targetdate</th>"+"<th>status</th>"+"<th>Action</th>"+"</tr>");
			int i=1;
			while(rs.next())
			{
				String title=rs.getString(1);
				String description=rs.getString(2);
				String targetdate=rs.getString(3);
				String status=rs.getString(4);
				
				pw.print("<tr>"+"<td>"+i+"</td>"+
						"<td>"+title+"</td>"+
						"<td>"+description+"</td>"+
						"<td>"+targetdate+"</td>"+
						"<td>"+status+"</td>"+"<td><a href='EditDisplay.jsp'>Edit</a>&nbsp;<a href='Delete.jsp'>Delete</a></td>"+"</tr>");
				i++;
			}
			pw.print("</table></div></div></div>"+"</body></html>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
