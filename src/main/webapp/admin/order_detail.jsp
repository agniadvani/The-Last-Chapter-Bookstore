<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders Details - The Last Chapter Administration</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2 class="pageheading">Details of Order ID: ${order.orderId}</h2>
	</div>

	<c:if test="${message != null }">
		<div>
			<h4 id="msg-success" align="center" style="color: green;">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>

	<div align="center">
		<h2>Order Overview</h2>
		<table>
			<tr>
				<td><b>Order By:</b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td><b>Book Copies:</b></td>
				<td>${order.bookCopies}</td>
			</tr>
			<tr>
				<td><b>Total Amount:</b></td>
				<td>Rs. ${order.total}</td>
			</tr>
			<tr>
				<td><b>Recipient Name:</b></td>
				<td>${order.fullName}</td>
			</tr>
			<tr>
				<td><b>Recipient Phone:</b></td>
				<td>${order.phone}</td>
			</tr>
			<tr>
				<td><b>Payment Method:</b></td>
				<td>${order.paymentMethod}</td>
			</tr>
			<tr>
				<td><b>Shipping Address:</b></td>
				<td>${order.shippingAddress}</td>
			</tr>
			<tr>
				<td><b>Order Status:</b></td>
				<td>${order.status}</td>
			</tr>
			<tr>
				<td><b>Order Date:</b></td>
				<td>${order.orderDate}</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<h2>Ordered Books</h2>
		<table border="1">
			<tr>
				<th>Index</th>
				<th>Book Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
			</tr>
			<c:forEach items="${order.orderDetails}" var="orderDetail"
				varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td>${orderDetail.book.price}</td>
					<td>${orderDetail.quantity}</td>
					<td>Rs. ${orderDetail.subtotal}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right"><b>TOTAL:</b></td>
				<td><b>${order.bookCopies}</b></td>
				<td><b>Rs. ${order.total}</b></td>
			</tr>
		</table>
	</div>
	<br>
	<div align="center">
		<a href=""><b>Edit this Order</b></a> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <a
			href=""><b>Delete this Order</b></a>
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
																	orderId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm('Are you sure you want to delete the Order with ID '
																			+ orderId
																			+ '?')) {
																		window.location = 'delete_order?id='
																				+ orderId;
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