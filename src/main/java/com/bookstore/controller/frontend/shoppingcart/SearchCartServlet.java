package com.bookstore.controller.frontend.shoppingcart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;

@WebServlet("/search_cart")
public class SearchCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		Object cartObject = request.getSession().getAttribute("cart");
		ShoppingCart shoppingCart = (ShoppingCart) cartObject;
		List<Book> searchResult = shoppingCart.searchItem(keyword);
		request.setAttribute("result", searchResult);
		request.setAttribute("keyword", keyword);

		RequestDispatcher rd = request.getRequestDispatcher("frontend/search_cart.jsp");
		rd.forward(request, response);
	}
}
