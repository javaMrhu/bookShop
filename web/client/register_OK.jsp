<%--
  Created by IntelliJ IDEA.
  User: 胡
  Date: 2019/11/12
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
    <h1>恭喜您！注册账号成功...3秒后将跳转至登录页面，请稍等...</h1>
        <%response.setHeader("refresh","3;URL=login.jsp");%>
                <span><a href="../../out/artifacts/BookStore_war_exploded/login.jsp">直接去登录</a></span>
</body>
</html>
