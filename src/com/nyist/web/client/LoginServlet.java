package com.nyist.web.client;

import com.nyist.bean.User;
import com.nyist.service.UserService;
import com.nyist.service.serviceImpl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private UserService service = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.获取用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //2.调用service
        User user = service.login(username, password);
        String message="用户名或密码错误！";
        //3.判断是否是null
        if(user==null){
           // request.setAttribute("message","用户名或密码错误！");


            request.setAttribute("message",message);
            request.getRequestDispatcher("login.jsp?message="+message+"").forward(request,response);
        }else{//登录成功返回首页，写入session，显示用户名
            request.getSession().setAttribute("user",user);
            message = "欢迎回来，"+username+"";
            request.getRequestDispatcher("index.jsp?message="+message+"").forward(request,response);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
