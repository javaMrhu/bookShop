package com.nyist.dao;

import com.nyist.bean.User;

public interface UserDao {
    void addUser(User user);
    User findByName(String name);
    User findUserByNameAndPassword(String username,String password);
}
