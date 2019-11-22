package com.nyist.dao;

import com.nyist.bean.Book;

public interface BookDao {
    Book findBook(String id);
    void add(Book book);
}
