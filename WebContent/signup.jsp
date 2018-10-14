
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
    
    <form action="signupScript.jsp" method="post">
    	<h4 class="modal-title">Join Us</h4>
    	
		<div class="form-group">
                      <input class="form-control" placeholder="Name" name="name"  required>
        </div>
        
	  <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email Id" required="required">
        </div>


      <div class="form-group">
          <input type="password" class="form-control" placeholder="Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
      </div>
      <div class="form-group">
          <input type="text" class="form-control"  placeholder="Contact" maxlength="10" size="10" name="contact" pattern="[6789][0-9]{9}" title="Not a valid number"  required>
      </div>
      <div class="form-group">
          <input  type="text" class="form-control"  placeholder="City" name="city" required>
      </div>
      <div class="form-group">
          <input  type="text" class="form-control"  placeholder="Address" name="address" required>
      </div>



        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Signup">              
    </form>			
    <div class="text-center small">Have an account? <a href="index.jsp">Sign in</a></div>
</div>


</body>
</html>                                		                            