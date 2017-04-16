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
</head>
<body>
<% 
									if(session.getAttribute("Email")==null)
									{
									response.sendRedirect("../jsp/login.jsp");	
									}
									
									String msg=(String)request.getAttribute("msg"); 
									if(msg == null)
									{
									  msg = "";
									}
									String msg1=(String)request.getAttribute("msg1"); 
									if(msg1 == null)
									{
									  msg1 = "";
									}
								%>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"> Welcome</h3>
						
						<a href="${pageContext.request.contextPath}/UserController?action=logOut" class="btn btn-sm btn-primary pull-right panel-head-button">LogOut</a>
					</div>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/UserController?action=login">
									<div class="form-group">
										<label  class="control-label col-sm-3">Name: </label>
										<label  class="control-label col-sm-3"><%=msg %> </label>
										
									</div>
									<div class="form-group">
										<label  class="control-label col-sm-3">Email: </label>
										<label  class="control-label col-sm-3"><%=msg1 %></label>
										
									</div>
									</form>
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