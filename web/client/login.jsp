
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page  isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <style>
        .login form {
            position: relative;
            top: 200px;
            left: 200px;
            width: 570px;
            height: 160px;
            background-color: #FFFBBB;
        }
        .login_tab{
            padding-top: 20px;
            padding-left: 150px;
        }
    </style>
</head>
<body>
<div class="login">
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <table class="login_tab">
            <tr style="border: 1px solid black">
                <td>用户名：</td>
                <td><input type="text" name="username" placeholder="请输入用户名" class="username"></td>
            </tr>
            <tr style="border: 1px solid black">
                <td>密码：</td>
                <td><input type="password" name="password" placeholder="请输入密码" class="password"></td>
            </tr>
            <tr style="height: 20px;"></tr>
            <tr style="border: 1px solid black">
                <td></td>

                <td style="left: 200px;">
                    <input type="submit" value="登录" style="background-color: deepskyblue">
                </td>
            </tr>
        </table>

        <div style="width: 100px;height: 20px;margin-left:200px">
            <span style="color: red;font-size: 16px">
                ${param.message}

            </span>
        </div>
    </form>


</div>

</body>
</html>
