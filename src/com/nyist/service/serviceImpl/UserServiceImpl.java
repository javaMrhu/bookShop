package com.nyist.service.serviceImpl;

import com.nyist.bean.User;
import com.nyist.dao.UserDao;
import com.nyist.dao.daoImpl.UserDaoImpl;
import com.nyist.service.UserService;

public class UserServiceImpl implements UserService {


    private UserDao dao = new UserDaoImpl();
    @Override
    public boolean addUser(User user) {
        User name = dao.findByName(user.getUsername());
        if(name!=null){
            return false;
        }else {
            dao.addUser(user);
            return true;
        }


    }

    @Override
    public User login(String username,String password) {

        User user = dao.findUserByNameAndPassword(username, password);

        return user;
    }
}
