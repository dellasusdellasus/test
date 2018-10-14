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
    <title>IS - Select</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link href="css/style.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
     <style>
     
.input-file-container {
  position: relative;
  width: 225px;
} 
.js .input-file-trigger {
  display: block;
  padding: 14px 45px;
  background: #39D2B4;
  color: #fff;
  font-size: 1em;
  transition: all .4s;
  cursor: pointer;
}
.js .input-file {
  position: absolute;
  top: 0; left: 0;
  width: 225px;
  opacity: 0;
  padding: 14px 0;
  cursor: pointer;
}
.js .input-file:hover + .input-file-trigger,
.js .input-file:focus + .input-file-trigger,
.js .input-file-trigger:hover,
.js .input-file-trigger:focus {
  background: #34495E;
  color: #39D2B4;
}

.file-return {
  margin: 0;
}
.file-return:not(:empty) {
  margin: 1em 0;
}
.js .file-return {
  font-style: italic;
  font-size: .9em;
  font-weight: bold;
}
.js .file-return:not(:empty):before {
  content: "Selected file: ";
  font-style: normal;
  font-weight: normal;
}






/* Useless styles, just for demo styles */

body {
  font-family: "Open sans", "Segoe UI", "Segoe WP", Helvetica, Arial, sans-serif;
  color: #7F8C9A;
  background: #FCFDFD;
}
h1, h2 {
  margin-bottom: 5px;
  font-weight: normal;
  text-align: center;
  color:#aaa;
}
h2 {
  margin: 5px 0 2em;
  color: #1ABC9C;
}
form {
  width: 225px;
  margin: 0 auto;
  text-align:center;
}
h2 + P {
  text-align: center;
}
.txtcenter {
  margin-top: 4em;
  font-size: .9em;
  text-align: center;
  color: #aaa;
}
.copy {
  margin-top: 2em;
}
.copy a {
  text-decoration: none;
  color: #1ABC9C;
}


     </style>
    
    
    <script>
    
    document.querySelector("html").classList.add('js');

    var fileInput  = document.querySelector( ".input-file" ),  
        button     = document.querySelector( ".input-file-trigger" ),
        the_return = document.querySelector(".file-return");
          
    button.addEventListener( "keydown", function( event ) {  
        if ( event.keyCode == 13 || event.keyCode == 32 ) {  
            fileInput.focus();  
        }  
    });
    button.addEventListener( "click", function( event ) {
       fileInput.focus();
       return false;
    });  
    fileInput.addEventListener( "change", function( event ) {  
        the_return.innerHTML = this.value;  
    });  
    
    </script>
    
    
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




  
<div class="container">

<div class="page-header">
  <h3><center>Upload your files</center></h3>
</div>


    
    <%
     String success = request.getParameter("success");
  if(success != null)
  {
	  out.println("<center><b><p style='color:green'>"+success+"</p></b></center>");
	  out.println("<center><a href='view.jsp' class='btn btn-warning' role='button'>View Files</a></center><br>");
  }
  %>
<br><br>
<form method="post" action="UploadServlet"
        enctype="multipart/form-data">
  <div class="input-file-container">  
    <input class="input-file" id="my-file" type="file" name="photo">
    <label tabindex="0" for="my-file" class="input-file-trigger">Select a file...</label>
  </div>
  
  <div><p class="file-return"></p></div>
  <br><br>
  <div> <input type="submit" class="btn btn-info" value="Upload"></div>
</form>




</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br>




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