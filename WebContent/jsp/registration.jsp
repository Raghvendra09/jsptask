<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Newgen payment task </title>


<script type="text/javascript">

  function checkForm()                //   Client Side validation
  {
	  name = document.forms["form"].name.value;
	  email = document.forms["form"].email.value;
	  password = document.forms["form"].password.value;
	  re_pass = document.forms["form"].re_pass.value;
	  
	  
	 
    if(name == "") {
      alert("Error: Username cannot be blank!");
      form.username.focus();
      return false;
    }
    
    if(password != "" && form.password.value == form.re_pass.value) {
      if(password.length < 8) {
        alert("Error: Password too short .. make it length of 8 or greater !");
        form.password.focus();
        return false;
      }
     
      
      re = /[0-9]/;
      if(!re.test(password)) {
        alert("Error: password must contain at least one numeric digit!");
        form.password.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(password)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        form.password.focus();
        return false;
      }
      re = /(?=.*[!@#$%^&*])/;
      if(!re.test(password)) {
        alert("Error: password must contain a special character !");
        form.password.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(password)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        form.password.focus();
        return false;
      }
    } else {
      alert("Error: passsword and re-enter pasaswords are different!");
      form.password.focus();
      return false;
    }
    return true;
  }

</script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		body{
			padding-top: 60px;
		}
		.panel-head-button{
			margin-top: -23px;
		}
	</style>
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"> Register Here</h3>
						
						<a href="${pageContext.request.contextPath}/UserController?action=loginPage" class="btn btn-sm btn-primary pull-right panel-head-button">Login</a>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-12">
							
								<% 
									String msg=(String)request.getAttribute("msg"); 
									if(msg != null)
									{
								%>
										<div class="alert alert-danger" role="alert">
											<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
										  	<span class="sr-only">Error:</span>
										  	<%= msg %>
										</div>
								<%
									}
								%>
								<form class="form-horizontal" name="form" action="${pageContext.request.contextPath}/UserController?action=signup" method="POST" onsubmit=" return checkForm();">
									<div class="form-group">
										<label for="name" class="control-label col-sm-3">Name: </label>
										<div class="col-sm-9">
											<input type="name" class="form-control" id="name" name="name" placeholder="Enter Name"/>
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="control-label col-sm-3">Email: </label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email"/>
										</div>
									</div>
									
									<div class="form-group">
										<label for="password" class="control-label col-sm-3">Password: </label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password"/>
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="control-label col-sm-3">Confirm Password: </label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="re_pass" name="re_pass" placeholder="Re-Enter Password"/>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<button type="submit" class="btn btn-sm btn-success">Sign In</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
 
</body>
</html>