<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout page</title>
</head>
<body>



<%
if (session.getAttribute("Email") != null) 
{  
    session.invalidate();
    response.sendRedirect("jsp/login.jsp");
} 

if(session==null)
{
	response.sendRedirect("jsp/login.jsp");
}
%>





</body>
</html>