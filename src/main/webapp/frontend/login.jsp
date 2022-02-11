<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - The Last Chapter</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2>Customer Login</h2>
		<c:if test="${message != null }">
			<div>
				<h4 id="msg-failed" align="center" style="color: red;">
					<i>${message}</i>
				</h4>
			</div>
		</c:if>

		<form id="loginForm" action="login" method="post">
			<table>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" id="email" size="20" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" id="password"
						size="20" /></td>
				</tr>
			</table>
			<br> <br> <input type="submit" value="Login" />
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},

				password : "required",
			},

			messages : {
				email : {
					required : "Please enter email",
					email : "Please enter a valid email address"
				},

				password : "Please enter password"
			}
		});

	});
	setTimeout(function() {
		var msg = document.getElementById("msg-failed");
		msg.parentNode.removeChild(msg);
	}, 4000);
</script>
</html>