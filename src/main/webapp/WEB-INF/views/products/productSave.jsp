<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-19
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<%@include file="../conponent/header.jsp"%>
<%@include file="../conponent/nav.jsp"%><br>
<div id="section">

  <form action="/product/save" method="post" enctype="multipart/form-data"><br>
    상품명<br><input type="text" name="productName"><br>
    <p></p>
    상품가격<br><input type="text" name="productPrice"><br>
    <p></p>
    상품수량<br><input type="text" name="productQu"><br>
    <p></p>
    상품설명<br><textarea type="text" name="productContents" maxlength=500></textarea><br>
    <p></p>
    이미지 파일<input type="file" name="productFile"> <br>
    <p></p>
    <input type="submit" value="상품등록">
  </form>
</div>
<%@include file="../conponent/footer.jsp"%>

</body>
</html>
