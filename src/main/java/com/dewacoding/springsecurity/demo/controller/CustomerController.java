package com.dewacoding.springsecurity.demo.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dewacoding.springsecurity.demo.entity.Customer;
import com.dewacoding.springsecurity.demo.service.CustomerService;
import com.dewacoding.springsecurity.demo.utils.SortUtils;

@Controller
@RequestMapping("/systems/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public String listCustomer(Model theModel, @RequestParam(required = false) String sort) {
		
		// Get customers from CustomerDAO
		List<Customer> theCustomers = null;
		
		// Check the sort fields
		if (sort != null) {
			int theSortField = Integer.parseInt(sort);
			theCustomers = customerService.getCustomers(theSortField);
		} else {
			// No sort field provided, default to sorting by first name
			theCustomers = customerService.getCustomers(SortUtils.FIRST_NAME);
		}
		
		// Add customers to the model
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customers";
	}
	
	@GetMapping("/addCustomer")
	public String addCustomer(Model theModel) {
		
		// Create object customer
		Customer customer = new Customer();
		
		// Add object customer to the model to bind form data
		theModel.addAttribute(customer);
		
		return "add-customer";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "add-customer";
		} else {
			customerService.saveCustomer(customer);
			return "redirect:/systems/customer/list";
		}
	}
	
	@GetMapping("/editCustomer")
	public String editCustomer(@RequestParam("customerId") int customerId, Model theModel) {
		
		// Get customer from our service
		Customer theCustomer = customerService.getCustomer(customerId);
		
		// Set customer as model attribute to pre-populate the form
		theModel.addAttribute("customer", theCustomer);
		
		// Send over to our form
		return "add-customer";
	}
	
	@GetMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam("customerId") int customerId, Model theModel) {
		
		// Delete the customer
		customerService.deleteCustomer(customerId);
		
		return "redirect:/systems/customer/list";
	}
	
	@GetMapping("/search")
	public String searchCustomer(@RequestParam(required = false, name = "theSearchName") String theSearchName, Model theModel) {
		List<Customer> theCustomers = null;
		
		// Check if customer name is not null
		// get customers by name from the service or get all customer 
		// from the service
		if (theSearchName != null) {
			theCustomers = customerService.searchCustomers(theSearchName);
		} else {
			theCustomers = customerService.getCustomers();
		}
		
		// Add customers to the model
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customers";
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
}
