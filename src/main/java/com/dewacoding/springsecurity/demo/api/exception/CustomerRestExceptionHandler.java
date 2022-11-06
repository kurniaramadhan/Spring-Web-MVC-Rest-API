package com.dewacoding.springsecurity.demo.api.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomerRestExceptionHandler {
	
	// Handling for NotFoundException
	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> 
	handleException(CustomerNotFoundException exc) {
		CustomerErrorResponse errorResponse = new CustomerErrorResponse();
		
		errorResponse.setStatus(HttpStatus.NOT_FOUND.value());
		errorResponse.setMessage(exc.getMessage());
		errorResponse.setTimestamp(System.currentTimeMillis());
		
		return new ResponseEntity<CustomerErrorResponse>(errorResponse, HttpStatus.NOT_FOUND);
	}
	
	// Handling for BadRequest
	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> 
	handleException(Exception exc) {
		CustomerErrorResponse errorResponse = new CustomerErrorResponse();
		
		errorResponse.setStatus(HttpStatus.BAD_REQUEST.value());
		errorResponse.setMessage(exc.getMessage());
		errorResponse.setTimestamp(System.currentTimeMillis());
		
		return new ResponseEntity<CustomerErrorResponse>(errorResponse, HttpStatus.BAD_REQUEST);
	}
}
