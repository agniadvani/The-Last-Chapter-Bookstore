<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Customer</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="js/jquery-input-mask-phone-number.min.js"></script>

</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2 class="pageheading">Edit My Profile</h2>
	</div>

	<div align="center">

		<form action="update_profile" method="post" id="customerForm">
			<table class="form">
				<tr>
					<td align="right">Email:</td>
					<td align="left"><input type="text"
						value="${loggedCustomer.email}" size="45" disabled></td>
				</tr>
				<tr>
					<td align="right">Full Name:</td>
					<td align="left"><input type="text" id="fullName"
						name="fullName" size="45" value="${loggedCustomer.fullname}" /></td>
				</tr>

				<tr>
					<td align="right">Phone Number:</td>
					<td align="left"><input type="text" id="phone" name="phone"
						size="45" value="${loggedCustomer.phone}" /></td>
				</tr>
				<tr>
					<td align="right">Address:</td>
					<td align="left"><input type="text" id="address"
						name="address" size="45" value="${loggedCustomer.address}" /></td>
				</tr>
				<tr>
					<td align="right">City:</td>
					<td align="left"><input type="text" id="city" name="city"
						size="45" value="${loggedCustomer.city}" /></td>
				</tr>
				<tr>
					<td align="right">State:</td>
					<td align="left"><input type="text" id="state" name="state"
						size="45" value="${loggedCustomer.state}" /></td>
				</tr>
				<tr>
					<td align="right">Zip Code:</td>
					<td align="left"><input type="text" id="zipcode"
						name="zipcode" size="45" value="${loggedCustomer.zipcode}" /></td>
				</tr>
				<tr>
					<td align="right">Country:</td>
					<td align="left"><input type="text" id="country"
						name="country" size="45" value="${loggedCustomer.country}" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">(<i>Leave Password fields blank
							if you do not wish to update password</i>)
					</td>
				</tr>
				<tr>
					<td align="right">Password:</td>
					<td align="left"><input type="password" id="password"
						name="password" size="45" /></td>
				</tr>
				<tr>
					<td align="right">Confirm Password:</td>
					<td align="left"><input type="password" id="confirmPassword"
						name="confirmPassword" size="45" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
			<br> <br> <input type="submit" value="Save">&nbsp;&nbsp;&nbsp;
			<a href="list_customer"><input type="button" value="Cancel"></a>

		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			$('#phone').usPhoneFormat({
				format : '(xxx) xxx-xxxx'
			});

		});

		$("#customerForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},

				fullName : "required",
				password : {
					equalTo : "#confirmPassword",
				},
				confirmPassword : {
					equalTo : "#password",
				},
				phone : "required",
				address : "required",
				city : "required",
				state : "required",
				zipcode : "required",
				country : "required",
			},

			messages : {
				email : {
					required : "Please enter email",
					email : "Please enter a valid email address"
				},

				fullName : "Please enter full name",
				password : {

					equalTo : "Passwords do not match"
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				},
				phone : "Please enter phone number",
				address : "Please enter address",
				city : "Please enter city",
				state : "Please enter state",
				zipcode : "Please enter zipcode",
				country : "Please enter country",
			},
		});
	});
</script>
</html>