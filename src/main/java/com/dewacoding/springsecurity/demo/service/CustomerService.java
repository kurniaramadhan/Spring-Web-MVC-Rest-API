package com.dewacoding.springsecurity.demo.service;

import java.util.List;

import com.dewacoding.springsecurity.demo.entity.Customer;


public interface CustomerService {
	public List<Customer> getCustomers(int theSortField);

	public void saveCustomer(Customer customer);
	
	public Customer getCustomer(int id);

	public void deleteCustomer(int customerId);

	public List<Customer> searchCustomers(String theSearchName);

	public List<Customer> getCustomers();

	
}
