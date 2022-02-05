<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="center">
	<div>
		<a href="/website"><img
			src="${pageContext.request.contextPath}/images/BookStoreLogo.png"></a>
	</div>
	<br>
	<br>
	<div>
		<form action="search" method="get">
			<input type="text" name="keyword" size="50"
				placeholder="Search Books" /> <input type="submit" value="Search" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Login">Sign in</a> | <a
				href="register">Register</a> | <a href="view_cart">Cart</a>
		</form>
	</div>
	<div>&nbsp;</div>
	<div>
		<c:forEach var="category" items="${listCategory}" varStatus="status">
			<a href="view_category?id=${category.categoryId}"> <font
				size="+1"><b><c:out value="${category.name}" /></b></font>
			</a>
			<c:if test="${not status.last}">
			&nbsp; | &nbsp;
			</c:if>
		</c:forEach>
	</div>
</div>