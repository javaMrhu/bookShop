package com.nyist.service.serviceImpl;

import com.nyist.bean.Book;
import com.nyist.bean.Cart;
import com.nyist.dao.BookDao;
import com.nyist.dao.daoImpl.BookDaoImpl;
import com.nyist.service.BookService;

public class BookServiceImpl implements BookService {
    private BookDao dao = new BookDaoImpl();
    @Override
    public Book findBook(String id) {

        return dao.findBook(id);

    }

    @Override
    public void buyBook(Cart cart, Book book) {

        cart.addCart(book);
    }
}
