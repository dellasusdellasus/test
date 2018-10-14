<%@page import="com.google.cloud.storage.Acl.Role"%>
<%@page import="com.google.cloud.storage.Acl.User"%>
<%@page import="com.google.cloud.storage.Acl"%>
<%@page import="com.google.cloud.storage.BlobId"%>
<%@page import="com.google.cloud.storage.Blob"%>
<%@page import="com.google.cloud.storage.Bucket"%>
<%@page import="com.google.cloud.storage.StorageOptions"%>
<%@page import="com.google.cloud.storage.Storage"%>
<%@page import="static java.nio.charset.StandardCharsets.UTF_8"%>


<%
  String email = (String) session.getAttribute("email");
    
    if(email == null)
    {
    	
    	response.sendRedirect("index.jsp");
    	
    }

%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>IS - View</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link href="css/style.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
     
     
    
  </head>

    

    <body style="padding-top: 50px;">


        <!-- Header -->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="index.jsp">Hi <%=session.getAttribute("name") %></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                       <li><a href="update.jsp"><span class="glyphicon glyphicon-user"></span> My Profile</a></li>
                        <li><a href="logoutScript.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--Header end-->



  <div class="mytable table-responsive container">

                           <div class="page-header text-center">
                                <h2><b>Your files</b></h2>
                          </div>
                          
            <table class="table table-bordered table-hover  results ">
			  <thead>
			      <tr class="warning">
			      <th class=" col-xs-4 text-center">File Name</th>
			      <th class=" col-xs-2 text-center">File Size</th>
			      <th class=" col-xs-2 text-center">Content Type</th>
			      <th class=" col-xs-2 text-center">Download</th>
			      <th class=" col-xs-2 text-center">Delete</th>
			      </tr>
			      
            </thead>
             <tbody>


<%

//Credentials are inferred from the environment.
Storage storage = StorageOptions.getDefaultInstance().getService();


String bucketname =  (String)session.getAttribute("contact");
//get the bucket
Bucket bucket = storage.get(bucketname);



// List the blobs in a particular bucket

for (Blob currentBlob : bucket.list().iterateAll()) 
{
	
	  out.println("<tr>");
      out.println("<td class='text-center'>"+currentBlob.getName()+"</td>");
      out.println("<td class='text-center'>"+currentBlob.getSize()+" B</td>");
      out.println("<td class='text-center'>"+currentBlob.getContentType()+"</td>");
      
      
  
      BlobId blobId = BlobId.of(bucketname, currentBlob.getName(),currentBlob.getGeneration());
      Acl acl = storage.createAcl(blobId, Acl.of(User.ofAllUsers(), Role.READER));
      String downloadUrl =  "https://storage.googleapis.com/"+bucketname+"/"+currentBlob.getName();
      
     // out.println("<td class='text-center'><a href='download.jsp?filename="+currentBlob.getName()+"' ><span class='glyphicon glyphicon-download-alt'></span></a></td>");
      out.println("<td class='text-center'><a href='"+downloadUrl+"' target='_blank'><span class='glyphicon glyphicon-download-alt'></span></a></td>");
      out.println("<td class='text-center'><a href='delete.jsp?blobname="+currentBlob.getName()+"' style='color:red'><span class='glyphicon glyphicon-remove'></span></a></td>");
      out.println("</tr>");
      //System.out.println(currentBlob.getCreateTime());
      
      
     
     
}

%>

                                            
             </tbody>
             </table>
             </div>
             
           <br><br>           <br><br><br><br>           <br><br>    <br><br> <br><br> <br><br><br> <br><br>                                
      
        <!--Footer-->
        <footer>
            <div class="container">
                <center>
                    <p>Copyright &copy; !nsta Store. All Rights Reserved  |  Contact Us: +91 90000 00000</p>	
                </center>
            </div>
        </footer>
        <!--Footer end-->

    </body> 
</html>