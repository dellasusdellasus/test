<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>IS - Update</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link href="css/style.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
  </head>
    <body>
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
        
        <%
         String error = request.getParameter("error");
        if(error != null)
        {
           out.println("<center><b><p style='color:red'>"+error+"</p></b></center><br>");	
        }
        String success = request.getParameter("success");
        if(success != null)
        {
        	out.println("<center><b><p style='color:green'>"+success+"</p></b></center><br>");
        }
        %>
        <div class="container-fluid decor_bg" id="content">
            <div class="row">
                <div class="container">
                    <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3">
                        <h2>Update</h2>
                        <form  action="updateScript.jsp" method="POST">
                            <div class="form-group">
                                <input class="form-control" placeholder="Name" name="name"  value="<%=session.getAttribute("name") %>"required>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control"  placeholder="Email"  name="email" value="<%=session.getAttribute("email") %>" readonly="readonly" required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Old/New Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control"  placeholder="Contact" maxlength="10" size="10" name="contact" pattern="[6789][0-9]{9}" title="Not a valid number"   value="<%=session.getAttribute("contact") %>" readonly="readonly" required>
                            </div>
                            <div class="form-group">
                                <input  type="text" class="form-control"  placeholder="City" name="city"  value="<%=session.getAttribute("city") %>" required>
                            </div>
                            <div class="form-group">
                                <input  type="text" class="form-control"  placeholder="Address" name="address" value="<%=session.getAttribute("address") %>" required>
                            </div>
                            <button type="submit" name="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <center>
                    <p>Copyright &copy; !nsta Store. All Rights Reserved  |  Contact Us: +91 90000 00000</p>	
                </center>
            </div>
        </footer>
    </body>
</html>