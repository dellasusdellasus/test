<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  String email = (String) session.getAttribute("email");
    
    if(email != null)
    {
    	
    	response.sendRedirect("home.jsp");
    	
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>iS Login</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css2/login-sign-up.css">
</head>
<body>
<div class="logo-class" style="float:left;padding-left:300px">
<br><br><br><br><br><br><br><br><br><br>


<br>
      <div> <center><b>
      <%
        String error = request.getParameter("error");
      if(error != null)
      {
        out.println("<p style='color:red'>"+error+"</p>");
      }
      String success = request.getParameter("success");
      if(success != null)
      {
        out.println("<p style='color:green'>"+success+"</p>");
      }
      %></b>
      </center>
      </div>
    <br>




<center>
<h1> 
Insta Store
</h1>

<h5>
Your Instant Storage System
</h5>
</center>
</div>

<div class="login-form">
    
    <form action="loginScript.jsp" method="post">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
    	<h4 class="modal-title">Welcome</h4>
        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
        <div class="form-group small clearfix">
            <label class="checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="#" class="forgot-link">Forgot Password?</a>
        </div> 
        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">              
    </form>			
    <div class="text-center small">Don't have an account? <a href="signup.jsp">Sign up</a></div>
</div>



</body>
</html>                                		                            