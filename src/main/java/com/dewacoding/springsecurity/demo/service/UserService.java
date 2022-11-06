package com.dewacoding.springsecurity.demo.service;

import com.dewacoding.springsecurity.demo.entity.User;
import com.dewacoding.springsecurity.demo.user.CrmUser;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(CrmUser crmUser);
}
