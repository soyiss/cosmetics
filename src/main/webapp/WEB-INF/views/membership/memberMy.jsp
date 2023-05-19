<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/image/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <script src="https://kit.fontawesome.com/e3b6bf5ae9.js" crossorigin="anonymous"></script>
  <style>
    .container{
      margin: 0 auto;
      margin-top: 35px;
      border: solid 1px dimgrey;
      max-width: 600px; /* 원하는 최대 너비로 조절합니다 */
      padding: 20px; /* 원하는 패딩 값을 적용합니다 */
    }
    hr {
      width: 85%; /* 구분선의 너비를 조절합니다 */
      margin: 0 auto; /* 가운데 정렬을 설정합니다 */
    }

    #file img{
      border: solid 1px #3a3939;
    }

  </style>
</head>
<body>

<%@include file="../conponent/header.jsp" %>
<%@include file="../conponent/nav.jsp" %>
<div id="section">
  <div class="container">

    <div id="file">
      <c:if test="${member.memberProfile == 1}">
        <img src="${pageContext.request.contextPath}/upload/${memberFile.storedFileName}" alt="" width="150"
             height="150">
      </c:if>
      <c:if test="${member.memberProfile == 0}">
        <img src="/resources/image/기본%20프로필.png" alt="" width="100" height="100">
      </c:if>
    </div>

    <c:choose>
      <c:when test="${sessionScope.loginEmail != 'admin'}">
        <h2>${member.memberName}님</h2>
        <h5>${sessionScope.loginEmail}</h5>
        <br>
        <hr/>
        <br>
        <h4><i class="fa-solid fa-mobile-screen" style="color: #adadad;"></i> ${member.memberMobile}</h4>
        <br>
        <hr/>
        <br>
        <h4><i class="fa-solid fa-location-dot" style="color: #adadad;"></i> ${member.memberAddress}</h4><br>
        <button onclick="update()">회원정보수정</button>
        <button onclick="member_delete()">회원탈퇴</button>
      </c:when>
      <c:when test="${sessionScope.loginEmail == 'admin'}">
        <h2>${member.memberName}</h2>
        <br>
        <hr/>
        <br>
        <button onclick="product_save()">상품등록</button>
        <button onclick="product_list()">상품 리스트</button>
      </c:when>

    </c:choose>

  </div>
</div>


<%@include file="../conponent/footer.jsp" %>
</body>
<script>
  const update = () => {
    location.href = "/member/updatePass";
  }

  const member_delete = () => {
    location.href = "/member/deletePass";
  }
  
  const product_save = () => {
      location.href = "/product/save";
  }
  
  const product_list = () => {
    location.href = "/product/list";
  }


</script>
</html>