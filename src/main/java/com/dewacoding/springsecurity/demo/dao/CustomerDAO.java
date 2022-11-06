package com.dewacoding.springsecurity.demo.dao;

import java.util.List;

import com.dewacoding.springsecurity.demo.entity.Customer;


public interface CustomerDAO {
	public List<Customer> getCustomers(int theSortField);
    public void saveCustomer(Customer customer);
    public void updateCustomer(Customer customer);
    public void deleteCustomer(int id);
    public Customer getCustomer(int id);
	public List<Customer> searchCustomers(String theSearchName);
	public List<Customer> getCustomers();
	
}
