package com.nyist.service.serviceImpl;

import com.nyist.bean.Book;
import com.nyist.bean.Page;
import com.nyist.dao.PageDao;
import com.nyist.dao.daoImpl.PageDaoImpl;
import com.nyist.service.PageService;

import java.util.List;


public class PageServiceImpl implements PageService {
    private PageDao dao = new PageDaoImpl();

    @Override
    public Page getPageData(String pagenum) {
        int totalCount = dao.getTotalCount();
        Page page = null;
        if(pagenum==null){
            page = new Page(1,totalCount);

        }else{
            page = new Page(Integer.parseInt(pagenum),totalCount);
        }
        List<Book> list = dao.getPageData(page.getStartPage(), page.getPageSize());

        page.setList(list);
        return page;
    }

    @Override
    public Page getPageData(String pagenum, String categoryID) {
        int totalCount = dao.getTotalCount(categoryID);
        Page page = null;
        if(pagenum==null){
            page = new Page(1,totalCount);

        }else{
            page = new Page(Integer.parseInt(pagenum),totalCount);
        }
        List<Book> list = dao.getPageData(page.getStartPage(), page.getPageSize(),categoryID);
        page.setList(list);
        return page;
    }
}
