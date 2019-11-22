package com.nyist.dao;

import com.nyist.bean.Book;


import java.util.List;

public interface PageDao {
    List getPageData(int start,int size);
    List<Book> getPageData(int start, int size, String categoryID);
    int getTotalCount();
    int getTotalCount(String category_id);
}
