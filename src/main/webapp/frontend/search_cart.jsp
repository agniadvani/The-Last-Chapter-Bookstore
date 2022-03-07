<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results for ${keyword}</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<jsp:directive.include file="header.jsp" />
	<div class="center">
		<br /> <br />
		<c:if test="${fn:length(result)==0}">
			<h2>Could Not Find "${keyword}" in Cart</h2>
		</c:if>
		<c:if test="${fn:length(result)>0}">
			<div class="book_group">
				<center>
					<h2>
						Results for <b>"${keyword}"</b> in Cart:
					</h2>
				</center>
				<br>
				<c:forEach items="${result}" var="book">
					<div>
						<div id="search-image">

							<div align="left">
								<a href="view_book?id=${book.bookId}"><img
									class="book-small"
									src="data:image/jpg;base64,${book.base64Image}" /></a>
							</div>
						</div>

						<div id="search-description">
							<div>
								<a href="view_book?id=${book.bookId}"><h2>
										<b>${book.title}</b>
									</h2></a>
							</div>
							<div><jsp:directive.include file="book_ratings.jsp" /></div>
							<div>
								<i>by ${book.author}</i>
							</div>
							<div>
								<p>${fn:substring(book.description, 0,100)}...</p>
							</div>
						</div>
						<div id="search-price">
							<h3>
								<b>Rs. ${book.price}</b>
							</h3>
							<h3>
								<a href="">Add To Cart</a>
							</h3>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>

			<br />
			<br />
		</c:if>
	</div>

	<jsp:directive.include file="footer.jsp" />

</body>
</html>