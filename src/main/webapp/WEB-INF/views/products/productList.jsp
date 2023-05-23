<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-19
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>

        #section table{
            margin: 0 auto;
            margin-top: 50px;
        }
        #section table tr,th,td{
            text-align: center;
            border: solid 1px black;
            padding: 10px 20px;
        }
    </style>
</head>
<body>

<%@include file="../conponent/header.jsp"%>
<%@include file="../conponent/nav.jsp"%><br>
<div id="section">
    <table>
        <tr>
            <th>상품번호</th>
            <th>상품명</th>
            <th>상품가격</th>
            <th>상품수량</th>
            <th>상품설명</th>
            <th>파일여부</th>
            <th>상품수정</th>
            <th>상품삭제</th>
        </tr>
        <c:forEach items="${productList}" var="product">
            <tr>
            <%-- 로그인한 사람이 관리자일때 상품 상세조회를 누를수 있어서 그 안에서 수정, 삭제가 가능하게 한다                 --%>
                <c:choose>
                    <c:when test="${sessionScope.loginEmail == 'admin'}">
                        <td>
                            <a href="/product/detail?id=${product.id}"> ${product.id}</a>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td> ${product.id} </td>
                    </c:otherwise>
                </c:choose>

                <td>${product.productName}</td>
                <td>${product.productPrice}</td>
                <td>${product.productQu}</td>
                <td>${product.productContent}</td>
                <td>${product.fileAttached}</td>
                <td><button onclick="product_update('${product.id}')">수정</button></td>
                <td><button onclick="product_delete('${product.id}')">삭제</button></td>

            </tr>
        </c:forEach>
    </table>

</div>
<%@include file="../conponent/footer.jsp"%>

</body>
<script>
    const product_update = (id) => {
        location.href="/product/update?id="+id;
    }

    const product_delete = (id) => {
        if(confirm("정말 삭제하시겠습니까?")){
            location.href="/product/delete?id="+id;
        }else {
            location.reload();
        }

    }
</script>
</html>
