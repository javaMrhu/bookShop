<%--
  Created by IntelliJ IDEA.
  User: 胡
  Date: 2019/11/13
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>购物车显示列表</title>
</head>
<body style="text-align: center">
<c:if test="${user==null}">
    对不起，请先登录
</c:if>


<c:if test="${user!=null}">


    <h2>购物车列表</h2>
    <table style="text-align: center;width: 80%;border: 2px;">
        <tr style="border: 2px solid black;">
            <td style="border: 2px solid black;">书名</td>
            <td style="border: 2px solid black;">作者</td>
            <td style="border: 2px solid black;">价格</td>
            <td style="border: 2px solid black;">数量</td>
            <td style="border: 2px solid black;">总计</td>
            <td style="border: 2px solid black;">操作</td>
        </tr>


    <c:forEach var="me" items="${cart.map }">
        <tr style="border: 2px solid black;">
            <td style="border: 2px solid black;">${me.value.book.name }</td>
            <td style="border: 2px solid black;">${me.value.book.author }</td>
            <td style="border: 2px solid black;">${me.value.book.price }</td>
            <td style="border: 2px solid black;">${me.value.quantity }</td>
            <td style="border: 2px solid black;">${me.value.book.price*me.value.quantity }</td>
            <td style="border: 2px solid black;">
                <a href="#">删除</a>
            </td>
        </tr>
    </c:forEach>

    <tr>
        <td colspan="1" style="border: 2px solid black;">总价</td>
        <td colspan="5" style="border: 2px solid black;">${cart.price}</td>
    </tr>
        <tr style="border: 2px solid black;">
            <td>
                <a href="${pageContext.request.contextPath }/OrderServlet">购买</a>
            </td>
        </tr>
    </table>

</c:if>
</body>
</html>
