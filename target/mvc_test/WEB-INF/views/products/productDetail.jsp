<%--
  Created by IntelliJ IDEA.
  User: pa684
  Date: 2023-05-21
  Time: 오후 12:51
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
  <style>
    table{
      border: solid 1px black;
      margin-left: auto;
      margin-right: auto;
    }

    table tr,th,td {
      padding: 20px;
      border: solid 1px black;
    }

    .center-align {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 10px;
      /*height: 100vh; !* 버튼을 수직으로 가운데 정렬하기 위한 높이 설정 *!*/
    }
  </style>
</head>
<body>

<%@include file="../conponent/header.jsp" %>
<%@include file="../conponent/nav.jsp" %>
<br><br>
<div id="section">
  <table>
    <tr>
      <th>상품번호</th>
      <td>${product.id}</td>
    </tr>
    <tr>
      <th>상품명</th>
      <td>${product.productName}</td>
    </tr>
    <tr>
      <th>상품가격</th>
      <td>${product.productPrice}</td>
    </tr>
    <tr>
      <th>상품수량</th>
      <td>${product.productQu}</td>
    </tr>
    <tr>
      <th>상품설명</th>
      <td>${product.productContents}</td>
    </tr>
    <tr>
      <th>파일여부</th>
      <td>
        ${product.fileAttached}
      </td>
    </tr>
<%--        첨부된 파일이있으면 목록에 이미지가 뜨게하공 없으면 아에 이미지 칸 자체가 안보이게 하기--%>
    <c:if test="${product.fileAttached == 1}">
      <tr>
        <th>image</th>
        <td>
          <c:forEach items="${productFileList}" var="productFile">
            <%--    ${pageContext.request.contextPath}는 현재 프로젝트의 경로에 접근한다(그냥 기본적으로 써야되는 식이다)            --%>
            <img src="${pageContext.request.contextPath}/upload/${productFile.storedFileName}" alt=""
                 width="100" height="100">
          </c:forEach>
        </td>
      </tr>
    </c:if>
  </table>
  <div class="center-align">
  <button onclick="product_list()" class="com1">목록</button>
  </div>
</div>

<%@include file="../conponent/footer.jsp" %>
</body>
<script>
  const product_list = () => {
    location.href = "/product/list";
  }
</script>
</html>