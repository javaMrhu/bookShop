package com.nyist.service;

import com.nyist.bean.Page;

public interface PageService {
    Page getPageData(String pagenum);
    Page getPageData(String pagenum,String categoryID);

}
