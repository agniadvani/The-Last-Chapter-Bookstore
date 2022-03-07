package com.bookstore.controller.frontend.shoppingcart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.bookstore.entity.Book;

public class ShoppingCart {
	private Map<Book, Integer> cart = new HashMap<>();

	public void addItem(Book book) {
		if (cart.containsKey(book)) {
			Integer quantity = cart.get(book) + 1;
			cart.put(book, quantity);
		} else {
			cart.put(book, 1);
		}
	}

	public void decrementItem(Book book) {
		int quantity = 0;
		if (cart.get(book) > 1) {
			quantity = cart.get(book) - 1;
		} else {
			quantity = 1;
		}
		cart.put(book, quantity);
	}

	public void removeItem(Book book) {
		cart.remove(book);
	}

	public int getTotalQuantity() {
		int total = 0;

		Iterator<Book> iterator = cart.keySet().iterator();

		while (iterator.hasNext()) {
			Book next = iterator.next();
			Integer quantity = cart.get(next);
			total += quantity;
		}

		return total;
	}

	public float getTotalAmount() {
		float total = 0.0f;

		Iterator<Book> iterator = cart.keySet().iterator();

		while (iterator.hasNext()) {
			Book book = iterator.next();
			Integer quantity = cart.get(book);
			double subTotal = quantity * book.getPrice();
			total += subTotal;
		}

		return total;
	}

	public List<Book> searchItem(String keyword) {
		Set<Book> setBooks = cart.keySet();
		List<Book> result = new ArrayList<Book>();
		Iterator<Book> itr = setBooks.iterator();
		while (itr.hasNext()) {
			
			Book nextBook = itr.next();
			if (itr.next().getTitle().contains(keyword)) {
				result.add(nextBook);
			}
		}
		return result;
	}

	public void updateCart(int[] bookIds, int[] quantities) {
		for (int i = 0; i < bookIds.length; i++) {
			Book key = new Book(bookIds[i]);
			Integer value = quantities[i];
			cart.put(key, value);
		}
	}

	public void clear() {
		cart.clear();
	}

	public int getTotalItems() {
		return cart.size();
	}

	public Map<Book, Integer> getItems() {
		return this.cart;
	}

}
