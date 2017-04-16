<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>NewGen | Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		body{
			padding-top: 60px;
		}
		.panel-head-button{
			margin-top: -23px;
		}
	</style>
	<script type = "text/javascript" >
    history.pushState(null, null, '<%=request.getContextPath()%>/jsp/login.jsp');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, '<%=request.getContextPath()%>/jsp/login.jsp');
    });
    </script>
	
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"> User Login</h3>
						
						<a href="${pageContext.request.contextPath}/UserController?action=registerPage" class="btn btn-sm btn-primary pull-right panel-head-button">Register</a>
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
								<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/UserController?action=login">
									<div class="form-group">
										<label for="email" class="control-label col-sm-2">Email: </label>
										<div class="col-sm-10">
											<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email"/>
										</div>
									</div>
									
									<div class="form-group">
										<label for="pass" class="control-label col-sm-2">Password: </label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password"/>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
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