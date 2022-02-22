<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${book.title}</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<div align="center">

		<table class="book">
			<tr>
				<td colspan="3" align="left"><p id="book-title">${book.title}</p>
					by <span id="author">${book.author}</span></td>
			</tr>
			<tr>
				<td rowspan="2"><img class="book-large"
					src="data:image/jpg;base64,${book.base64Image}" /></td>



				<td valign="top" align="left"><jsp:directive.include
						file="book_ratings.jsp" />&nbsp;<a href="#reviews">${fn:length(book.reviews)}
						<c:if test="${fn:length(book.reviews)==1}">Review</c:if> <c:if
							test="${fn:length(book.reviews)!=1}">Reviews</c:if>
				</a></td>
				<td valign="top" rowspan="2" width="20%"><h2>Rs.
						${book.price}</h2> <br /> <br />
					<button id="buttonAddToCart">Add to Cart</button></td>
			</tr>
			<tr >
				<td id="description">${book.description}</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><hr width="700%" style="background-color:gray;"></td>
			</tr>
			<tr>
				<td><h2>
						<a id="reviews">Customer Reviews</a>
					</h2></td>
				<td colspan="2" align="center">
					<button id="buttonWriteReview">Write a Review</button>
				</td>
			</tr>
			<tr>
				<td><br>
				<br>
				<br>
				<br>
				<br></td>
			</tr>
			<tr>
				<td colspan="3">
					<table style="border-style: none;" align="center" width="60%">
						<c:forEach items="${book.reviews}" var="review">

							<tr>
								<td><c:forTokens items="${review.stars}" delims=","
										var="star">
										<c:if test="${star eq 'on' }">
											<img src="images/rating_on.png" />
										</c:if>
										<c:if test="${star eq 'off' }">
											<img src="images/rating_off.png" />
										</c:if>
									</c:forTokens>- <b>${review.headline}</b></td>
							</tr>
							<tr>
								<td>by ${review.customer.fullname} on <fmt:formatDate
										pattern="dd-MM-yy" value='${review.reviewTime}' />
								</td>
							</tr>
							<tr>
								<td><i>${review.comment}</i></td>
							</tr>
							<tr>
								<td><hr width="50%"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								
							</tr>
							
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>

	</div>



	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#buttonWriteReview").click(function() {
				window.location = 'write_review?book_id=' + ${
					book.bookId
				}
				;
			});

			$("#buttonAddToCart").click(function() {
				window.location = 'add_to_cart?book_id=' + ${
					book.bookId
				}
				;
			});
		});
	</script>
</body>
</html>