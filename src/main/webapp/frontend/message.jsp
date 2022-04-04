<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Last Chapter</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		
		<c:if test="${fn:startsWith(message, 'Could')}">
			<h3 style="color: red;">${message}</h3>
		</c:if>
		<c:if test="${fn:startsWith(message, 'You')}">
		<h3 style="color: green;">${message}</h3>
		</c:if>
		<c:if test="${isSuccessMessage}">
		<h3 style="color: green;">${message}</h3>
		</c:if>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
</html>