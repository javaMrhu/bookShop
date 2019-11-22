<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>首页体</title>
</head>

<body style="text-align:center;">
<div id="content" style="margin:0 auto;width:60%;">
    <div id="category" style="float:left; width:200px; border:1px solid red; text-align:left; height:450px;">
        分类列表：
        <ul>
            <c:forEach var="category" items="${categories }">
                <li>
                    <a href="${pageContext.request.contextPath }/IndexServlet?method=listBookWithCategory&category_id=${category.id}">${category.name }</a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div id="bookandpage" style="float:left; margin-left:30px;">
        <div id="books">
            <c:forEach var="book" items="${page.list }">
                <div id="book" style="height:150px; margin-top:20px;">
                    <div id="image" style="float:left;">
                        <img src="${pageContext.request.contextPath }/${book.img}" height=150 width=100>

                    </div>
                    <div id="bookinfo" style="float:left; text-align:left;">
                        <ul>
                            <li>${book.name }</li>
                            <li>作者：${book.author }</li>
                            <li>售价：${book.price }</li>
                            <li>
                                <a href="${pageContext.request.contextPath }/BuyServlet?bookid=${book.id}">加入购物车</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div style="clear:both"></div><!-- 做div浮动后，为了不影响后续页面的显示，在这里清楚浮动效果 -->
            </c:forEach>
        </div>
        <div style="clear:both"></div><!-- 做div浮动后，为了不影响后续页面的显示，在这里清楚浮动效果 -->
        <div id="page" style="margin-top:20px; text-align:center;">
            当前第[${page.pageNum }]页 &nbsp;&nbsp;
            <c:forEach var="pagenum" begin="${page.startPage }" end="${page.totalPage }">

                [<a href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${pagenum}&category_id=${param.category_id}">${pagenum }</a>]
            </c:forEach>
            &nbsp;&nbsp;
            总共[${page.totalPage }]页，共[${page.totalCount }]条记录
        </div>
    </div>
</div>
</body>
</html>