package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDao = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("diganth@gmail.com");
		customer.setfullname("Diganth S");
		customer.setCity("Bangalore");
		customer.setState("Karnataka");
		customer.setCountry("India");
		customer.setAddress("#11, Rajankunte");
		customer.setPassword("Diganth");
		customer.setPhone("9230221293");
		customer.setZipcode("560064");

		Customer savedCustomer = customerDao.create(customer);

		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId = 11;
		Customer customer = customerDao.get(customerId);

		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(11);
		String fullname = "Ramesh Reddy";
		customer.setfullname(fullname);
		customer.setPassword("ramesh");
		customer.setEmail("ramesh@gmail.com");

		Customer updatedCustomer = customerDao.update(customer);

		assertTrue(updatedCustomer.getfullname().equals(fullname));
	}

	@Test
	public void testDeleteCustomer() {
		Integer customerId = 11;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(customerId);

		assertNull(customer);

	}

	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();

		for (Customer customer : listCustomers) {
			System.out.println(customer.getfullname());
		}

		assertFalse(listCustomers.isEmpty());
	}

	@Test
	public void testCount() {
		long totalCustomers = customerDao.count();

		assertEquals(2, totalCustomers);

	}

	@Test
	public void testFindByEmail() {
		String email = "diganth@gmail.com";
		Customer customer = customerDao.findByEmail(email);

		assertNotNull(customer);

	}

	@Test
	public void testCheckLoginSuccess() {
		String email = "billy.jane@gmail.com";
		String password = "secret";

		Customer customer = customerDao.checkLogin(email, password);

		assertNotNull(customer);

	}

	@Test
	public void testCheckLoginFail() {
		String email = "abc@gmail.com";
		String password = "secret";

		Customer customer = customerDao.checkLogin(email, password);

		assertNull(customer);

	}
}
