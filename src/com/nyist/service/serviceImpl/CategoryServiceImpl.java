package com.nyist.service.serviceImpl;

import com.nyist.bean.Category;
import com.nyist.service.CategoryService;
import com.nyist.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CategoryServiceImpl implements CategoryService {

    QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDs());
    @Override
    public List<Category> getAllCategory() {
        String sql = "select * from category";
        List<Category> list=new ArrayList<>();

        try {
            list = queryRunner.query(sql, new BeanListHandler<>(Category.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Category findCategory(String id) {
        String sql = "select * from category where id = ?";

        try {
            return queryRunner.query(sql,id, new BeanHandler<>(Category.class));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }


    }

    @Override
    public void addCategory(Category category) {
            String sql = "insert into category values(?,?,?)";
            Object param[]={category.getId(),category.getName(),category.getDescription()};
        try {
            queryRunner.update(sql,param);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
