package com.nyist.dao.daoImpl;

import com.nyist.bean.Book;
import com.nyist.bean.Page;
import com.nyist.dao.PageDao;
import com.nyist.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class PageDaoImpl implements PageDao {
    private QueryRunner query = new QueryRunner(JDBCUtil.getDs());
    @Override
    public List<Book> getPageData(int start,int size) {
        String sql ="select * from book limit ?,?";
        //query.query(sql,);
        Object param[] = {start,size};
        try {
           return  query.query(sql, param, new BeanListHandler<>(Book.class));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public List<Book> getPageData(int start, int size, String categoryID) {

        String sql = "select * from book where category_id=? limit ?,?";
        Object params[] = {categoryID,start,size};
        try {
            return query.query(sql,params,new BeanListHandler<Book>(Book.class));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }


    }

    @Override
    public int getTotalCount() {
        String sql="select count(*) from book";
        long result = 0;
        try {
             result = (long) query.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (int)result;
    }

    @Override
    public int getTotalCount(String category_id) {
        String sql="select count(*) from book where category_id=?";
        long result = 0;

        try {
            result = (long) query.query(sql, category_id,new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (int)result;


    }
}
