package com.nyist.service;

import com.nyist.bean.Category;

import java.util.List;

public interface CategoryService {
    //查询所有分类
    List<Category> getAllCategory();
    //按id查找类别
    Category findCategory(String id);

    //添加分类
    void addCategory(Category category);
}
