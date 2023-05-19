<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-12
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<%@include file="../conponent/header.jsp" %>
<%@include file="../conponent/nav.jsp" %>
<br><br>
<div id="section">
    <form action="/product/update" method="post" name="updateForm">
        <table>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>상품가격</th>
                <th>상품수량</th>
                <th>상품설명</th>
                <th>파일여부</th>
            </tr>

                <tr>
                    <td>
                        <input type="text" name="id" value="${product.id}" readonly>
                    </td>
                    <td>
                        <input type="text" name="productName" value="${product.productName}" >
                    </td>
                    <td>
                        <input type="text" name="productPrice" value="${product.productPrice}" >
                    </td>
                    <td>
                        <input type="text" name="productQu" value="${product.productQu}" >
                    </td>
                    <td>
                        <input type="text" name="productContents" value="${product.productContents}" >
                    </td>
                    <td>
                        <input type="text" name="fileAttached" value="${product.fileAttached}" readonly>
                    </td>
                    <td>
                        <input type="submit" value="수정">
                    </td>

                </tr>

        </table>
    </form>
</div>

<%@include file="../conponent/footer.jsp" %>
</body>
<script>

</script>
</html>