package com.bookstore.controller.frontend.shoppingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;

@WebServlet("/decrement_book")
public class DecrementBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DecrementBookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("book_id"));

		Object cartObject = request.getSession().getAttribute("cart");

		ShoppingCart shoppingCart = (ShoppingCart) cartObject;
		Book book = new Book(bookId);
		shoppingCart.decrementItem(book);
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}
}
