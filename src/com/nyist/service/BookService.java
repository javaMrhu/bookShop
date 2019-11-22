package com.nyist.service;

import com.nyist.bean.Book;
import com.nyist.bean.Cart;

public interface BookService {
    Book findBook(String id);
    void buyBook(Cart cart,Book book);
}
