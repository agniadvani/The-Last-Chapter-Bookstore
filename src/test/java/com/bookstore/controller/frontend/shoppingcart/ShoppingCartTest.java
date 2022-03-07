package com.bookstore.controller.frontend.shoppingcart;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;

public class ShoppingCartTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void testAddItem() {
		fail("Not yet implemented");
	}

	@Test
	public void testDecrementItem() {
		fail("Not yet implemented");
	}

	@Test
	public void testRemoveItem() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTotalQuantity() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTotalAmount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSearchItem() {
		ShoppingCart cart = new ShoppingCart();
		Book book1 = new Book(7);
		
		cart.addItem(book1);
		List<Book> searchItem = cart.searchItem("Ramayan");

	
		fail("Not yet implemented");

	}

	@Test
	public void testUpdateCart() {
		fail("Not yet implemented");
	}

	@Test
	public void testClear() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTotalItems() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetItems() {
		fail("Not yet implemented");
	}

}
