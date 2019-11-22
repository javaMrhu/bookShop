package com.nyist.service;

import com.nyist.bean.User;

public interface UserService {
    boolean addUser(User user);
    User login(String username,String password);
}
