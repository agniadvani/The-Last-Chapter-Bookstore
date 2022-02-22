<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<c:set var="cart" value="${sessionScope['cart']}" />
	<div align="center">
		<h2>
			My Cart - <i>${cart.totalItems} items</i>
		</h2>
		<c:if test="${message != null }">
			<div>
				<h4 id="msg-failed" align="center" style="color: red;">
					<i>${message}</i>
				</h4>
			</div>
		</c:if>

		<c:if test="${cart.totalItems == 0}">
			<h2>There are no items in your cart.</h2>
		</c:if>
		<c:if test="${cart.totalItems > 0}">
			<div>
				<br>
				<br>
				<br>
				<form action="">
					<table border="1">
						<tr>
							<th>No</th>
							<th colspan="2">Book</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Subtotal</th>
							<th><a href="" style="color: white;"><b>Clear</b></a>
						</tr>
						<c:forEach items="${cart.items}" var="item" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td><img class="book-small"
									src="data:image/jpg;base64,${item.key.base64Image}" /></td>
								<td><h3>${item.key.title}</h3></td>
								<td align="center"><strong style="font-size: 35px;"><a
										href="decrement_book?book_id=${item.key.bookId}">-</a></strong><strong
									style="font-size: 22px;"> ${item.value}</strong><strong
									style="font-size: 25px;"> <a
										href="add_to_cart?book_id=${item.key.bookId}">+</a>
								</strong></td>
								<td>Rs. ${item.key.price}</td>
								<td>Rs. ${item.value * item.key.price}</td>
								<td><a href="">Remove</a></td>
							</tr>

						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><b>${cart.totalQuantity} Book(s)</b></td>
							<td>Total:</td>
							<td colspan="2" align="center"><b>Rs.
									${cart.totalAmount}</b></td>
						</tr>

					</table>
				</form>
			</div>
		</c:if>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	setTimeout(function() {
		var msg = document.getElementById("msg-failed");
		msg.parentNode.removeChild(msg);
	}, 4000);
</script>
</html>