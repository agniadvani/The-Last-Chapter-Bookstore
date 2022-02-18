<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write Review - ${book.title}</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<form>
			<table class="normal">
				<tr>
					<td><h2>Your Reviews</h2></td>
					<td><h2>${loggedCustomer.fullname}</h2></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:directive.include file="footer.jsp" />
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
</body>

</html>