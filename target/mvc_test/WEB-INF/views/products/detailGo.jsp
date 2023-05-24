<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오전 8:59
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
        .section {
            margin: 0 auto;
            text-align: center;

        }

        img.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            float: left;
            width: 30%;
            margin-left: 150px;

        }

        p {

            float: left;
            width: 70%;
        }

        .btn {
            border: none;
            color: white;
            padding: 14px 28px;
            font-size: 16px;
            cursor: pointer;
        }

        .default {
            background-color: #e7e7e7;
            color: black;
        }

        /* Gray */
        .default:hover {
            background: #ddd;
        }
    </style>
</head>
<body>

<%@include file="../conponent/sidebar.jsp" %>
<div class="section" style="
            margin-top: 200px;">
    <img src="${pageContext.request.contextPath}/upload/${productFile.storedFileName}" alt=""
         height="300" class="sticky">
    <p>
    <h2>${product.productName}</h2>
    <pre>${product.productContents}</pre>
    <br>
    <strong>판매가</strong> <span id="calculatedPrice"></span><br>
    <strong>할인가</strong> <span id="discountedPrice"></span>원 <span style="color: red">전품목 10%할인</span><br>
    <br>
    <form action="/cart/cart" name="form1" method="post" onsubmit="return submitForm('${product.id}')">
        <input type="hidden" name="id" value="${product.id}">
        <select name="productQu">
            <c:forEach begin="1" end="10" var="i">
                <option value="${i}">${i}</option>
            </c:forEach>
        </select>&nbsp;개
        <input type="submit" value="cart in">
    </form>
    </p>
</div>
<script>
    const productPrice = ${product.productPrice}; // 가격을 동적으로 가져옴
    const calculatedPrice = Math.floor(productPrice / 0.9); // 가격을 0.9로 나눈 후 소수점 아래를 제거하여 정수로 변환
    const discountedPrice = productPrice.toLocaleString(); // 할인가에 1000단위 쉼표를 붙임

    // 결과를 출력
    //판매가
    // const calculatedPriceElement = document.getElementById("calculatedPrice");
    // calculatedPriceElement.textContent = new Intl.NumberFormat().format(calculatedPrice) + "원";
    const calculatedPriceElement = document.getElementById("calculatedPrice");
    const formattedPrice = new Intl.NumberFormat().format(calculatedPrice) + "원";
    calculatedPriceElement.innerHTML = formattedPrice.replace(/\d+/, "<span style='text-decoration: line-through'>$&</span>");


    //할인가
    const discountedPriceElement = document.getElementById("discountedPrice");
    discountedPriceElement.textContent = discountedPrice;


    const submitForm = (id) => {
        const productQu = document.getElementsByName("productQu")[0].value;
        if (confirm("장바구니에 추가하시겠습니까?")) {
            if ('${sessionScope.loginEmail}' == null) {
                alert("로그인 해주시길 바랍니다")
                location.href = "/member/login";
            } else {
                location.href = "/cart/cart?productId=" + id + "&productQu=" + productQu;
            }
        } else {
            location.reload();
        }
    }

</script>
</body>
</html>

