package com.dewacoding.springsecurity.demo.dao;

import com.dewacoding.springsecurity.demo.entity.User;

public interface UserDao {

    User findByUserName(String userName);
    
    void save(User user);
    
}
