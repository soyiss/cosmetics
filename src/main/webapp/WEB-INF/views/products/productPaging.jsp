<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-22
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* 중앙 정렬 */
            gap: 10px; /* 카드 간격 조정 */
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 300px;
            margin: 10px;
            text-align: center;
            font-family: arial;
        }

        .price {
            color: grey;
            font-size: 22px;
        }

        .card button {
            border: none;
            outline: 0;
            padding: 12px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

        .card button:hover {
            opacity: 0.7;
        }

        .container {
            text-align: center;
        }

        .container ul {
            list-style-type: none;
            display: flex;
            justify-content: space-between;
            max-width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<%@include file="../conponent/header.jsp" %>
<%@include file="../conponent/nav.jsp" %>
<br>
<div id="section">
    <div class="card-container">
        <c:forEach items="${productList}" var="product">
            <div class="card" style="flex: 1; margin: 10px;">
                <c:if test="${product.fileAttached == 1}">
                    <img src="${pageContext.request.contextPath}/upload/${product.storedFileName}" width="100" height="100">
                </c:if>
                <h1>${product.productName}</h1>
                <p class="price">${String.format("%,d", product.productPrice)}원</p>
                <p>${product.productContents}</p>
                <p><button>Detail Click</button></p>
            </div>
        </c:forEach>
    </div>


<%--        <table>--%>
        <%--            <tr>--%>
        <%--                <th>상품번호</th>--%>
        <%--                <th>상품명</th>--%>
        <%--                <th>상품가격</th>--%>
        <%--                <th>상품수량</th>--%>
        <%--                <th>상품설명</th>--%>


        <%--            </tr>--%>
        <%--            <c:forEach items="${productList}" var="product">--%>
        <%--                <tr>--%>
        <%--                    <td>${product.id}</td>--%>
        <%--                    <td>--%>
        <%--                            ${product.productName}--%>
        <%--                    </td>--%>
        <%--                    <td>${product.productPrice}</td>--%>
        <%--                    <td>${product.productQu}</td>--%>
        <%--                    <td>${product.productContents}</td>--%>
        <%--                </tr>--%>
        <%--                <c:if test="${product.fileAttached == 1}">--%>
        <%--                    <tr>--%>
        <%--                        <th>image</th>--%>
        <%--                        <td>--%>
        <%--                                &lt;%&ndash;    ${pageContext.request.contextPath}는 현재 프로젝트의 경로에 접근한다(그냥 기본적으로 써야되는 식이다)            &ndash;%&gt;--%>
        <%--                                <img src="${pageContext.request.contextPath}/upload/${product.storedFileName}"--%>
        <%--                                     width="100" height="100">--%>
        <%--                        </td>--%>
        <%--                    </tr>--%>
        <%--                </c:if>--%>
        <%--            </c:forEach>--%>

        <%--        </table>--%>
    </div>
    <br>
    <div class="container">
        <ul>


            <%--  [이전] 처리 부분    --%>
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌(클릭이 안됨) --%>
                <c:when test="${paging.page<=1}">
                    <%-- class는 부트스트랩 클래스이다 --%>
                    <li class="page-item disabled ">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/product/paging?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>


            <%--  for(int i=startPage; i<=endPage; i++)      --%>
            <%--  반복변수 i는 var/ 시작값은 begin / 끝값은 end /step는 증감식      --%>
            <%--  반복문에 의해서 123페이지가 보김      --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                    <%-- 현재 사용자가 머물고있는 페이지는 클릭이 안되고 active로 호버효과만 나오게 --%>
                    <%-- eq는 == 라는 뜻  --%>
                    <c:when test="${i eq paging.page}">
                        <li>
                            <a>${i}</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="page-item">
                                <%--  현재 사용자가 머문 페이지가 아니면 그걸 누르면 그 페이지로 이동하게끔 한것 --%>
                                <%-- 예를 들어 [1] [2] [3] 페이지 중에 머물고있는 페이지가 2페이지이면
                                      1,3 번호를 클릭하면 그 1번 페이지.3번페이지로 이동할수 있게 함              --%>

                            <a href="/product/paging?page=${i}"> ${i} </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>


            <%--  [다음] 처리 부분    --%>

            <c:choose>
                <%-- 현재 페이지가 최대 페이지보다 크거나 같으면 즉. 마지막 페이지면        --%>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" style="color: black"
                           href="/product/paging?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

</div>
<%@include file="../conponent/footer.jsp" %>
</body>
</html>
