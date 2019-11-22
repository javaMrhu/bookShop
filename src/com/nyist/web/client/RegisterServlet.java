package com.nyist.web.client;

import com.nyist.bean.User;
import com.nyist.service.UserService;
import com.nyist.service.serviceImpl.UserServiceImpl;
import com.nyist.utils.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取注册表中的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        //2.封装对象
        User user = new User();
        user.setAddress(address);
        user.setPassword(password);
        user.setPhone(phone);
        user.setUsername(username);
        //调用工具类，获得id;
        String id = WebUtil.makeID();
        user.setId(id);

        String message = "";
        String code = request.getParameter("Code");
        HttpSession session1 = request.getSession();
        String checkCode = (String) session1.getAttribute("CHECKCODE_SERVER");
        //校验验证码是否正确
        if(code.equalsIgnoreCase(checkCode)==false){
            message = "验证码输入错误！";
            request.getRequestDispatcher("register.jsp?message="+message+"").forward(request,response);
            return;
        }


        //3.调用service
        UserService service = new UserServiceImpl();
        boolean b = service.addUser(user);
        if(b){//如果添加成功,

            request.getRequestDispatcher("register_OK.jsp").forward(request,response);
        }else{//添加失败，提示信息用户名重复
            message="注册失败！用户名重复，换个用户名吧";
            request.getRequestDispatcher("register.jsp?message="+message+"").forward(request,response);

        }
        //



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
