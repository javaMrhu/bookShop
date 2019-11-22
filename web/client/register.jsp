<%--
  Created by IntelliJ IDEA.
  User: 胡
  Date: 2019/11/10
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style>
        *{
            background-color: #AAEEEE;
        }
    </style>
</head>
<body>
<div class="rg_layout">
    <div class="rg_form clearfix">
        <div class="rg_form_left">
            <h1>新用户注册</h1>
            <h2>USER REGISTER</h2>
        </div>
        <div class="rg_form_center">
            <div id="errorMsg"></div>
            <!--注册表单-->
            <form id="${pageContext.request.contextPath}/registerForm" action="register" method="get">
                <!--提交处理请求的标识符-->
                <input type="hidden" name="action" value="register">
                <table style="margin-top: 25px;">
                    <tr>
                        <td class="td_left">
                            <label for="username">用户名</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="username" name="username" placeholder="请输入用户名" autocapitalize="off">
                        </td>
                        <td>
                             <font color="#CF415E">用户名不能为空</font>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="password">密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password" name="password" placeholder="请输入密码" autocapitalize="off">
                        </td>
                        <td>
                            <font color="#CF415E">密码设置至少6位</font>
                        </td>

                    </tr>


                    <tr>
                        <td class="td_left">
                            <label for="address">收货地址</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="address" name="address" placeholder="请输入您的地址" autocapitalize="off">
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            <label for="phone">手机号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="phone" name="phone" placeholder="请输入您的手机号">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <lable for="Code">验证码：</lable>
                        </td>
                        <td>
                            <input type="text" id="Code" name="Code" style="width: 80px;height: 30px;">
                            <span><img src="${pageContext.request.contextPath}/checkCode" alt="验证码" style="width: 80px;height: 30px" onclick="changeCheckCode(this)"></span>
                        </td>
                        <script type="text/javascript">
                            //图片点击事件
                            function changeCheckCode(img) {
                                img.src = "${pageContext.request.contextPath}/checkCode?" + new Date().getTime();
                            }
                        </script>
                    </tr>
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right check">
                            <input type="submit" class="submit" value="注册" style="height: 30px;width:70px;color: yellow;background-color: turquoise">

                        </td>
                    </tr>
                </table>
                <div style="width: 100px; height: 35px;" >
                    <span id="msg" style="color:red">
                        ${param.message};
                    </span>
                </div>
            </form>
        </div>

    </div>
</div>


</body>
</html>
