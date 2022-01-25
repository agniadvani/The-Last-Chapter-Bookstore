<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users - The Last Chapter Administration</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2>Users Management</h2>
		<h3>
			<a href="user_form.jsp">Create New User</a>
		</h3>
	</div>

	<c:if test="${message != null }">
	<div>
		<h4 id="msg-success" align="center" style="color: green;">
			<i>${message}</i>
		</h4>
	</div>
	</c:if>

	<div align="center">
		<table border="1" cellpadding="7">

			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>

			<c:forEach var="user" items="${listUsers}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${user.userId}</td>
					<td>${user.email}</td>
					<td>${user.fullName}</td>
					<td><a href="edit_user?id=${user.userId}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">Delete</a></td>
				</tr>
			</c:forEach>

		</table>
	</div>


	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		setTimeout(function() {
			var msg = document.getElementById("msg-success");
			msg.parentNode.removeChild(msg);
		}, 4000);
	</script>
</body>
</html>