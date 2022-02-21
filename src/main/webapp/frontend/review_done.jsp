<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write Review - ${book.title}</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="jquery.rateyo.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">

		<table class="normal" width="60%">
			<tr>
				<td><h2>Your Reviews</h2></td>
				<td>&nbsp;</td>
				<td><h2>${loggedCustomer.fullname}</h2></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td><span id="book-title">${book.title}</span><br> <br>
					<img class="book-large"
					src="data:image/jpg;base64,${book.base64Image}" /></td>
				<td colspan="2"> 
					<h2 style="color: green;">Your Review has been posted. Thank
						you for the review.</h2>  
				</td>
			</tr>
		</table>
		<div align="center">
		<a href="view_book?id=${book.bookId}" ><b>Go To Book</b></a><br><br>
		<a href=""><b>Homepage</b></a>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />

</body>

</html>