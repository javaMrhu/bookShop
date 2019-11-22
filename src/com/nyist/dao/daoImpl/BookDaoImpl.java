package com.nyist.dao.daoImpl;

import com.nyist.bean.Book;
import com.nyist.dao.BookDao;
import com.nyist.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class BookDaoImpl implements BookDao {

    private QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDs());
    @Override
    public Book findBook(String id) {
        String sql = "select * from book where id = ?";
        try {
            return queryRunner.query(sql,id,new BeanHandler<>(Book.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void add(Book book) {

        try {

            String sql = "insert into book(id,name,author,price,image,description,category_id) values(?,?,?,?,?,?,?)";
            Object params[] = {book.getId(), book.getName(), book.getAuthor(), book.getPrice(), book.getImg(), book.getDescription(), book.getCategory_id()};
            queryRunner.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }
}
