package com.nyist.web.client;

import com.nyist.bean.Book;
import com.nyist.bean.Category;
import com.nyist.bean.Page;
import com.nyist.service.CategoryService;
import com.nyist.service.PageService;
import com.nyist.service.serviceImpl.CategoryServiceImpl;
import com.nyist.service.serviceImpl.PageServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {

    private CategoryService service = new CategoryServiceImpl();
    private PageService pageService = new PageServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        if(method.equalsIgnoreCase("getAll")){
             getAll(request,response);
        }else if(method.equalsIgnoreCase("listBookWithCategory")){
            listBookWithCategory(request,response);
        }


    }

    public void listBookWithCategory(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("category_id");

        List<Category> list = service.getAllCategory();
        request.setAttribute("categories",list);
        String pagenum = request.getParameter("pagenum");//获取当前页。
        //分页操作，返回分页对象，然后转发到首页展示。

        Page page = pageService.getPageData(pagenum,id);
        request.setAttribute("page",page);
        try {
            request.getRequestDispatcher("/client/body.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getAll(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Category> list = service.getAllCategory();
        request.setAttribute("categories",list);
        String pagenum = request.getParameter("pagenum");//获取当前页。
        Page page = pageService.getPageData(pagenum);

        request.setAttribute("page",page);

        try {
            request.getRequestDispatcher("/client/body.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }


}
