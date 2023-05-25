<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/sidebar.css">
    <style>
        #section {
            /* section을 브라우저의 가운데로 정렬합니다. */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: white;
            margin-top: 110px;
            border: solid 1px dimgrey;
            width: 700px;
            padding: 25px;

        }

        .table2, table {
            border-top: solid 1px dimgray;
            margin: 0 auto;
        }

        .table2 th, .table2 td {
            border: none;
            padding: 10px;
        }

        .table2 td {
            white-space: nowrap;
            text-align: center;
        }

        .table2 th {
            text-align: center;
        }

        form table, table tr, th, td {
            border: solid 1px dimgray;
        }

        form table tr, th, td {
            border: solid 1px dimgray;
        }

        form table th, td {
            padding: 10px;
        }

        form table button {
            margin: 10px;
        }

    </style>
</head>
<body>

<%@include file="../conponent/sidebar.jsp" %>
<div id="section">
    <%-- ${map}안에 담긴 정보들
            1. 장바구니 정보 : 장바구니id,회원id,회원이름,상품id,상품이름,장바구니수량,상품단가,(상품*수량)총금액이 담겨있다
            2. 장바구니 상품유무
            3. 장바구니 전체금액
            4. 배송료
            5. 주문상품 전체금액(3+4) --%>
    <div class="container">
        <h2 style="margin-left: 52px;>장바구니</h2><br>
        <c:choose>
            <c:when test="${map.count == 0}">장바구니가 비어있습니다.</c:when>
            <c:otherwise>
                <form action="/cart/update" name="form1" id="form1" method="post"
                      onsubmit="updateGo('${row.productId}')">
                    <table>
                        <tr>
                            <th>상품명</th>
                            <th>판매가</th>
                            <th>수량</th>
                            <th>구매가</th>
                            <th>총 결제금액</th>
                            <th>취소</th>
                        </tr>
                        <c:forEach var="row" items="${map.list}" varStatus="i">
                            <tr>
                                <td style="width: 80px;text-align: right">${row.productName}</td>
                                <td style="width: 80px;text-align: right">
                                    <fmt:formatNumber pattern="###,###,###"
                                                      value="${row.productPrice / 0.9}"/>원
                                </td>
                                <td>
                                    <input type="number" style="width: 40px" name="productQu" value="${row.productQu}"
                                           min="1">
                                    <input type="hidden" name="productId" value="${row.productId}">
                                </td>
                                <td style="width: 80px;text-align: right">
                                    <fmt:formatNumber pattern="###,###,###"
                                                      value="${row.productPrice}"/>원
                                </td>
                                <td style="width: 100px; text-align: right">
                                    <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>원
                                </td>
                                    <%--  + 기호는 문자열을 연결하는 연산자이지만, JSP 표현 언어에서는 ${}로 변수 값을 가져올 수 있습니다. --%>
                                <td><a href="/cart/delete?id=${row.id}">상품 삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <input type="hidden" name="count" value="${map.count}">
                    <button type="submit" id="btnUpdate" style="margin-left: 52px; margin-top: 10px">수량변경</button>
                    <br><br>
                    <table class="table2">
                        <tr>
                            <td>결제금액 합계</td>
                            <td></td>
                            <td>배송비</td>
                            <td></td>
                            <td>최종 결제금액</td>
                        </tr>
                        <tr>
                            <th>
                                <fmt:formatNumber pattern="###,###,###"
                                                  value="${map.sumMoney}"/>원
                            </th>
                            <th>+</th>
                            <th>
                                <c:choose>
                                    <c:when test="${0 eq map.fee}">
                                        <span>무료배송</span>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber pattern='###,###,###'
                                                          value='${map.fee}'/>원
                                    </c:otherwise>
                                </c:choose>
                            </th>
                            <th>=</th>
                            <th>
                                <fmt:formatNumber pattern="###,###,###"
                                                  value="${map.allSum}"/>원
                            </th>
                        </tr>
                    </table>

                </form>
            </c:otherwise>
        </c:choose>
        <div style="display: flex; justify-content: center; margin-top: 20px;">
            <button onclick="gogo()">상품목록</button>
        </div>
    </div>
</div>
</body>
<script>
    const gogo = () => {
        location.href = "/product/paging";
    }

    const updateGo = (productId) => {
        const productQu = document.getElementsByName("productQu")[0].value;
        location.href = "/cart/cart?productId=" + productId + "&productQu=" + productQu;

    }

</script>
</html>
