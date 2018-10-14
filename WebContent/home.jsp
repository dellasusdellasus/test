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
    <title>IS - Home</title>
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




           
<br><br>
 <div class="container">   
<div class="jumbotron">
  <center><h2>Welcome to !nsta Store</h2> 
 </center>     
</div>
</div>




            
            <div class="container">
                <div class="row text-center" id="item_list">
                                <div class="col-sm-6">

                                        <div>    <!--remove thumbnail for removing borders-->
                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq8E3z9P13pDMJ-bIq5DGZzRLwX-9tufl4AeaA8xwyEAMsW31q" class="img-circle"  alt="Upload Image" >
                                               <div class="caption">
                                                <h3><a href="select.jsp">Upload Files</a></h3>
                                                <p>Upload any kind of media files</p>
                                         </div>
                                        </div> 

                                </div>
                    
                    
                    

                                <div class="col-sm-6">

                                        <div>
                                            <img src="https://www.seagate.com/www-content/services-software/apps/_shared/images/nas-os-apps-cat-icon-225x225.jpg" class="img-circle" alt="NSS Officer Image">
                                            <div class="caption">
                                                <h3><a href="view.jsp">View Files</a></h3>
                                                <p>Organize your files here</p>
                                                
                                            </div>
                                        </div> 

                                </div>
                    
                </div>
            </div>

 
<br><br><br><br>











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