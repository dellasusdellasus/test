<%@page import="com.google.cloud.storage.Blob"%>
<%@page import="com.google.cloud.storage.BlobId"%>
<%@page import="com.google.cloud.storage.BlobInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    <%@page import="com.google.cloud.storage.Bucket" %>
    <%@page import="com.google.cloud.storage.BucketInfo" %>
    <%@page import="com.google.cloud.storage.Storage" %>
    <%@page import="com.google.cloud.storage.StorageOptions" %>
    <%@page import="static java.nio.charset.StandardCharsets.UTF_8" %>
    
 
<%


 if(request.getMethod().equals("POST"))
 {
	     String name = request.getParameter("name");
		 String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		
	//	System.out.print(email);
	
	        /*     try{

					   Storage storage = StorageOptions.getDefaultInstance().getService();
				      String bucketName = contact;// "my-new-bucket";
				      Bucket bucket = storage.create(BucketInfo.of(bucketName));
	    			 
	    					  		
				    }
			    	catch(Exception e)
		    		{
		        	   //e.printStackTrace();
		        	   String msg = "Contact number already exists ! Try with different no";
						response.sendRedirect("signup.jsp?error="+msg); 
		    		} */
	
	
	
	
		

			try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection connection = DriverManager.getConnection("jdbc:mysql://104.154.50.175/test?", "root", "root");
			
				   
	    			Statement st = connection.createStatement();
	    			String query2 = "select * from users where email='"+email+"' or contact='"+contact+"'";
	    			ResultSet rs = st.executeQuery(query2);
	    			if(rs.next())
	    			{
	    			 
	    				String msg= "Email/Contact Already Exists";
						response.sendRedirect("signup.jsp?error="+msg); 
					
	    		    }
	    			else
	    			{
	    				   
	    				//create bucket
	  					   Storage storage = StorageOptions.getDefaultInstance().getService();
	  				       String bucketName = contact;// "my-new-bucket";
	  				       Bucket bucket = storage.create(BucketInfo.of(bucketName));
	  	    			   		
	  				    
						   Statement stmt=connection.createStatement();  
						   String query = "insert into users values('"+name+"','"+email+"','"+password+"','"+contact+"','"+city+"','"+address+"')"; 
						   int x = stmt.executeUpdate(query);
						
							if(x > 0)
							{
								
								String msg= "Sign Up successful :) Login to continue";
								response.sendRedirect("index.jsp?success="+msg); 
							}
							else
							{
								String msg = "Something went wrong ! Try again";
								response.sendRedirect("signup.jsp?error="+msg); 
							}
						
	    			} 
				
	           
				
				connection.close();
				
			}
		    catch (Exception e)
		    {
				e.printStackTrace();
				String msg = "Unable to establish database connection";
				response.sendRedirect("signup.jsp?error="+msg);		
		    }
	 
	 
 }


 

%>