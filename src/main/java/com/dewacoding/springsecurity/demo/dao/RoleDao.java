package com.dewacoding.springsecurity.demo.dao;

import com.dewacoding.springsecurity.demo.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}
