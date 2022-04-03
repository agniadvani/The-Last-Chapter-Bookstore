<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Book Store</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery-input-mask-phone-number.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<br>
	<div align="center">
		<form action="search_cart" method="get">
			<input type="text" name="keyword" size="30" placeholder="Search Cart" />
			<input type="submit" value="Search" />
		</form>
	</div>

	<c:set var="cart" value="${sessionScope['cart']}" />
	<div align="center">
		<h2>
			My Cart - <i>${cart.totalItems} <c:if
					test="${cart.totalItems==1 }">item</c:if> <c:if
					test="${cart.totalItems>1 }">items</c:if></i>
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
				<h2>
					Review Your Order Details <a href="view_cart">Edit</a>
				</h2>
				<br> <br> <br>

				<table border="1">
					<tr>
						<th>No</th>
						<th colspan="2">Book</th>
						<th>Author</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>

					</tr>
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td><img class="book-small"
								src="data:image/jpg;base64,${item.key.base64Image}" /></td>
							<td><h3>${item.key.title}</h3></td>
							<td><h4>${item.key.author}</h4></td>
							<td>Rs. ${item.key.price}</td>
							<td>
								<center>
									<strong style="font-size: 22px;"> ${item.value}</strong>
								</center>
							</td>

							<td>Rs. ${item.value * item.key.price}</td>
						</tr>

					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><b>${cart.totalQuantity} Book(s)</b></td>
						<td>Total:</td>
						<td colspan="2" align="center"><b>Rs. ${cart.totalAmount}</b></td>
					</tr>
				</table>
				<h2>Your Shipping Information</h2>
				<form id="orderForm" action="place_order" method="post">
					<table>
						<tr>
							<td>Recipient Name:</td>
							<td><input type="text" name="recipientName"
								value="${loggedCustomer.fullname }"></td>
						</tr>
						<tr>
							<td>Recipient Phone:</td>
							<td><input type="text" name="recipientPhone"
								id="recipientPhone" value="${loggedCustomer.phone }"></td>
						</tr>
						<tr>
							<td>Street Address:</td>
							<td><input type="text" name="address"
								value="${loggedCustomer.address }"></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type="text" name="city"
								value="${loggedCustomer.city }"></td>
						</tr>
						<tr>
							<td>Zip Code:</td>
							<td><input type="text" name="zipcode"
								value="${loggedCustomer.zipcode }"></td>
						</tr>
						<tr>
							<td>Country:</td>
							<td><input type="text" name="country"
								value="${loggedCustomer.country }"></td>
						</tr>
					</table>
					<div>
						<h2>Payment</h2>
						Choose your payment method: &nbsp;&nbsp; <select
							name="paymentMethod">
							<option value="Cash On Delivery">Cash On Delivery</option>
						</select>
					</div>
					<div>
						<br> <br>
						<button type="submit">Place Order</button>
						&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}"><b>Continue
								Shopping</b></a>
					</div>
				</form>
			</div>

		</c:if>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			$('#recipientPhone').usPhoneFormat({
				format : '(xxx) xxx-xxxx'
			});

		});
		$("#orderForm").validate({
			rules : {
				recipientName : "required",
				recipientPhone : "required",
				address : "required",
				city : "required",
				zipcode : "required",
				country : "required",
			},
			messages : {
				recipientName : "Please enter Recipient Name",
				recipientPhone : "Please enter Phone Number",
				address : "Please enter Shipping Address",
				city : "Please enter City",
				zipcode : "Please enter Zip Code",
				country : "Please enter Country",
			}
		})
	})
</script>
</html>