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
		<h2 class="pageheading">Books Management</h2>
		<h3>
			<a href="new_book">Create New Book</a>
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
				<th>Image</th>
				<th>Title</th>
				<th>Author</th>
				<th>Category</th>
				<th>Price</th>
				<th>Last Updated</th>
				<th>Actions</th>
			</tr>

			<c:forEach var="book" items="${listBooks}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${book.bookId}</td>
					<td><img src="data:image/jpg;base64,${book.base64Image}"
						width="84" height="110" /></td>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.category.name}</td>
					<td>Rs. ${book.price}</td>
					<td style="text-align: center;"><fmt:formatDate
							pattern="MM/dd/yy" value='${book.lastUpdateTime}' /></td>

					<td><a href="edit_book?id=${book.bookId}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:void(0);" class="deleteLink"
						id="${book.bookId}">Delete</a>
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
																	bookId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm('Are you sure you want to delete the book with ID '
																			+ bookId
																			+ '?')) {
																		window.location = 'delete_book?id='
																				+ bookId;
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