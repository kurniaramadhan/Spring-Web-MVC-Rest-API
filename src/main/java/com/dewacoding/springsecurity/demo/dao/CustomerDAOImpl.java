package com.dewacoding.springsecurity.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dewacoding.springsecurity.demo.entity.Customer;
import com.dewacoding.springsecurity.demo.utils.SortUtils;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> getCustomers(int theSortField) {

		// Get the hibernate current session
		Session currentSession = sessionFactory.getCurrentSession();

		// Determine sort field
		String theFieldName = null;

		switch (theSortField) {
		case SortUtils.FIRST_NAME:
			theFieldName = "firstName";
			break;
		case SortUtils.LAST_NAME:
			theFieldName = "lastName";
			break;
		case SortUtils.EMAIL:
			theFieldName = "email";
			break;
		default:
			// if nothing matches the default to sort by firstName
			theFieldName = "firstName";
		}

		// create a query
		String queryString = "from Customer order by " + theFieldName;
		Query<Customer> theQuery = currentSession.createQuery(queryString, Customer.class);

		// execute query and get result list
		List<Customer> customers = theQuery.getResultList();

		// return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer customer) {
		// Get the hibernate current session
		Session currentSession = sessionFactory.getCurrentSession();

		// Save or update the customer
		currentSession.saveOrUpdate(customer);

	}

	@Override
	public void updateCustomer(Customer customer) {
		// Auto-generated method stub

	}

	@SuppressWarnings("rawtypes")
	@Override
	public void deleteCustomer(int id) {
		// Get the hibernate current session
		Session currentSession = sessionFactory.getCurrentSession();

		// Delete object with the primary key
		Query theQuery = currentSession.createQuery("delete from Customer where id=:customerId");

		theQuery.setParameter("customerId", id);

		theQuery.executeUpdate();
	}

	@Override
	public Customer getCustomer(int id) {
		// Get the hibernate current session
		Session currentSession = sessionFactory.getCurrentSession();

		// Get the customer from database using id
		Customer thecustomer = currentSession.get(Customer.class, id);

		return thecustomer;
	}

	@Override
	public List<Customer> searchCustomers(String theSearchName) {
		// Get the hibernate current session
		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings("rawtypes")
		Query theQuery = null;

		// only search by name if theSearchName is not empty
		if (theSearchName != null && theSearchName.trim().length() > 0) {
			// search for firstName or lastName ... case insensitive
			theQuery = currentSession.createQuery(
					"from Customer where lower(firstName) like :theName or lower(lastName) like :theName",
					Customer.class);
			theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
		} else {
			// theSearchName is empty ... so just get all customers
			theQuery = currentSession.createQuery("from Customer", Customer.class);
			System.out.println("Data kosong: " + theQuery);
		}

		// Execute query and get result list
		@SuppressWarnings("unchecked")
		List<Customer> customers = theQuery.getResultList();

		return customers;
	}

	@Override
	public List<Customer> getCustomers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create a query
		Query<Customer> theQuery = currentSession.createQuery("from Customer", Customer.class);

		// execute query and get result list
		List<Customer> customers = theQuery.getResultList();

		// return the results
		return customers;
	}

}
