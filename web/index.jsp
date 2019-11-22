<%--
  Created by IntelliJ IDEA.
  User: 胡
  Date: 2019/11/8
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false" %>
<html>
  <head>
      <script src="js/jquery-1.11.3.min.js"></script>
      <script src="js/bootstrap.js"></script>
      <link rel="stylesheet" href="css/bootstrap.css">
    <title>网上书城</title>
      <style>
          .nav li{
              float: right;
              display: inline-block;

              text-align: center;
              font-size: 16px;
          }
          .nav li a{

              text-decoration: none;
          }
      </style>
      <script>
          $(function () {
              $(".a").mouseover(function () {
                  {
                      $(this).css("color","green");
                  }
              });
          });
      </script>
  </head>
  <body>

    <%--<div class="nav" style="margin: 0;padding: auto; width: 100%; height: 30px;background: lemonchiffon">--%>



    <%--</div>--%>
    <div class="container-fluid">
        <div class="col-lg-12 col-xs-12 col-md-12 col-sm-12">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">懒人书城</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">


                            <li><a href="${pageContext.request.contextPath}/client/login.jsp">登录&nbsp;&nbsp;&nbsp;</a></li>
                            <li><a href="${pageContext.request.contextPath}/client/register.jsp">注册&nbsp;&nbsp;&nbsp;</a></li>

                            <li><span >${param.message}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>

                        </ul>
                        <form class="navbar-form navbar-left">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="搜索商品">
                            </div>
                            <button type="submit" class="btn btn-default" value="submit">搜搜</button>
                        </form>
                        <ul class="nav ">

                            <li><a href="${pageContext.request.contextPath}/exitServlet">退出</a></li>
                            <li><a href="${pageContext.request.contextPath}/client/listcart.jsp">购物车&nbsp;&nbsp;&nbsp;</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->


                </div><!-- /.container-fluid -->
            </nav>
        </div>
    </div>
    <iframe style="width: 100%;height: 600px;" src="<c:url value="${pageContext.request.contextPath}/IndexServlet?method=getAll"/>" frameborder="0">

    </iframe>


  </body>

</html>