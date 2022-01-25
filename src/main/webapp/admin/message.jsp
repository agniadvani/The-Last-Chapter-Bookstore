<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Last Chapter Administration</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h3 style="color: red;">${message}</h3>
	</div>
	<h4 align="center">
		<a href="user_form.jsp">Create New User</a>
	</h4>

	<jsp:directive.include file="footer.jsp" />
</body>
</html>