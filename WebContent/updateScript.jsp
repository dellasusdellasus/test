<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    <%@page import="com.google.cloud.storage.Bucket" %>
    <%@page import="com.google.cloud.storage.BucketInfo" %>
    <%@page import="com.google.cloud.storage.Storage" %>
    <%@page import="com.google.cloud.storage.StorageOptions" %>
    
 
<%


 if(request.getMethod().equals("POST"))
 {
	     String name = request.getParameter("name");
		 String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		
		
		Connection connection = null;

			try {
				 Class.forName("com.mysql.jdbc.Driver");
				 connection = DriverManager.getConnection("jdbc:mysql://35.231.9.20/test?", "root", "root");
			
	    			 
				    Statement stmt=connection.createStatement();  
					String query = "update users set name='"+name+"',password='"+password+"',city='"+city+"',address='"+address+"' where email='"+email+"' and contact='"+contact+"'"; 
					int x = stmt.executeUpdate(query);
					
					if(x > 0)
					{
						String msg= "Profile Updated Successfully.Login to continue";
						response.sendRedirect("logoutScript.jsp?success="+msg); 
					}
					else
					{
						String msg = "Something went wrong ! Try again";
						response.sendRedirect("logoutScript.jsp?error="+msg); 
					}
					
	    			 
	    		}
	           catch(Exception e)
	    		{
	        	    String msg = "Something went wrong ! Try again";
					response.sendRedirect("logoutScript.jsp?error="+msg); 
					connection.close();
	    		}
				
		 
 }


%>