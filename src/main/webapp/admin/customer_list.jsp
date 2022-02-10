<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users - The Last Chapter Administration</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2 class="pageheading">Customer Management</h2>
		<h3>
			<a href="customer_form.jsp">Create New Customer</a>
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
				<th>E-mail</th>
				<th>Full Name</th>
				<th>City</th>
				<th>Country</th>
				<th>Registered date</th>
				<th>Actions</th>
			</tr>

			<c:forEach var="customer" items="${listCustomer}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${customer.customerId}</td>
					<td>${customer.email}</td>
					<td>${customer.fullname}</td>
					<td>${customer.city}</td>
					<td>${customer.country}</td>
					<td>${customer.registerDate}</td>

					<td><a href="edit_customer?id=${customer.customerId}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:void(0);" class="deleteLink"
						id="${customer.customerId}">Delete</a>
				</tr>

			</c:forEach>

		</table>
	</div>


	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(".deleteLink")
									.each(
											function() {
												$(this)
														.on(
																"click",
																function() {
																	customerId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm('Are you sure you want to delete the Customer with ID '
																			+ customerId
																			+ '?')) {
																		window.location = 'delete_customer?id='
																				+ customerId;
																	}
																});
											});
						});
		setTimeout(function() {
			var msg = document.getElementById("msg-success");
			msg.parentNode.removeChild(msg);
		}, 4000);
	</script>
</body>
</html>