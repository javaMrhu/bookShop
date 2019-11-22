package com.nyist.web.client;

import com.nyist.bean.Book;
import com.nyist.bean.Cart;
import com.nyist.service.BookService;
import com.nyist.service.serviceImpl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {

    private BookService service = new BookServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        Book book = service.findBook(bookid);

        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if(cart==null){
            cart = new Cart();
            request.getSession().setAttribute("cart",cart);
        }
        service.buyBook(cart,book);

        request.getRequestDispatcher("/client/listcart.jsp").forward(request,response);
    }
}
