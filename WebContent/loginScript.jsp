<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%


 if(request.getMethod().equals("POST"))
 {
	 
	    String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		

			try {
				 Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://104.154.50.175/test?", "root", "root");
			
		/* 	 	String jdbcUrl = String.format(
					    "jdbc:mysql://google/%s?cloudSqlInstance=%s"
					        + "&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false",
					    "test",
					    "gcp-webapp-218812:us-central1:mysql-demo");
				
					Connection connection = DriverManager.getConnection(jdbcUrl, "root", "root"); */ 
				
				
				Statement stmt=connection.createStatement();  
				String query = "select * from users where email='"+email+"' and password='"+password+"'"; 
				ResultSet  rs = stmt.executeQuery(query);
				
				if(rs.next())
				{
					//out.println("Valid");
					session.setAttribute("email", email);
					session.setAttribute("contact",rs.getString("contact"));
					session.setAttribute("name",rs.getString("name"));
					session.setAttribute("city", rs.getString("city"));
					session.setAttribute("address", rs.getString("address"));
					response.sendRedirect("home.jsp"); 
				}
				else
				{
					String msg = "Wrong Credentials";
					response.sendRedirect("index.jsp?error="+msg); 
				}
					 
				connection.close();
				
			} catch (Exception e) {
			  System.out.println(e);
				String msg = "Unable to establish database connection";
				response.sendRedirect("index.jsp?error="+msg); 
			}
	 
	 
 }


 

%>