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
		<form id="reviewForm" action="submit_review" method="post">
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
					<td>  
						<div id="rateYo"></div> <input id="rating" type="hidden"
						name="rating" /> <input type="hidden" name="bookId"
						value="${book.bookId}" /> <br> <input type="text"
						name="headline" size="60" placeholder="Headline (required)" /> <br>
						<br> <textarea name="comment" cols="70" rows="10"
							placeholder="Write a review..."></textarea>
					</td>
				</tr>
			</table>
			<br> <br> <input type="submit" value="Save">&nbsp;&nbsp;&nbsp;
			<a href="view_book?id=${book.bookId}"><input type="button"
				value="Cancel"></a>
		</form>
	</div>
	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#reviewForm").validate({
				rules : {

					headline : "required",
					comment : "required",
					rating : "required",
				},

				messages : {

					headline : "Please enter a headline.",
					comment : "Please enter a comment.",
					rating : "Please enter a rating.",
				}
			});

			$("#rateYo").rateYo({
				starWidth : "30px",
				fullStar : true,
				multiColor : {
					"startColor" : "#FF0000", //RED
					"endColor" : "#00FF00" //GREEN
				},
				onSet : function(rating, rateYoInstance) {

					$("#rating").val(rating);
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