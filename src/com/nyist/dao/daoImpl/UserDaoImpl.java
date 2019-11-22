package com.nyist.dao.daoImpl;


import com.nyist.bean.User;
import com.nyist.dao.UserDao;
import com.nyist.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;


import java.sql.Connection;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

    private QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDs());
    private Connection conn = null;

    @Override
    public void addUser(User user)  {

        String sql = "insert into user values(?,?,?,?,?)";


        Object params[] = {user.getUsername(),user.getPassword(),user.getId()
                ,user.getPhone(),user.getAddress()};
        try {
            queryRunner.update(sql,params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public User findByName(String name) {

        User user = new User();
        String sql = "select * from user where username=?";
        try {
             conn = JDBCUtil.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Object param = name;
        try {
             user = queryRunner.query(sql, name, new BeanHandler<>(User.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public User findUserByNameAndPassword(String username, String password) {
        User user = new User();
        String sql = "select * from user where username=? and password= ?";
        try {
            conn = JDBCUtil.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Object param[] = {username,password};
        try {
            user = queryRunner.query(sql, param, new BeanHandler<>(User.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
