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
</head>
<body>
<div id="section">
<%-- ${map}안에 담긴 정보들
        1. 장바구니 정보 : 장바구니id,회원id,회원이름,상품id,상품이름,장바구니수량,상품단가,(상품*수량)총금액이 담겨있다
        2. 장바구니 상품유무
        3. 장바구니 전체금액
        4. 배송료
        5. 주문상품 전체금액(3+4) --%>
    <h2>상품 장바구니 목록</h2>
    <c:choose>
        <c:when test="${map.count == 0}">장바구니가 비어있습니다.</c:when>
        <c:otherwise>
            <form action="#" name="form1" id="form1" method="post">
                <table>
                    <tr>
                        <th>상품명</th>
                        <th>단가</th>
                        <th>수량</th>
                        <th>총 금액</th>
                        <th>취소</th>
                    </tr>
                    <c:forEach var="row" items="${map.list}" varStatus="i">
                        <tr>
                            <td>${row.productName}</td>
                            <td>${row.productPrice}</td>
                            <td>${row.productQu}</td>
                            <td>${row.money}</td>
                            <td><a href="#">삭제</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                                장바구니 금액 합계: ${map.sumMoney}<br>
                                배송료: ${map.fee}<br>
                                전체 주문금액: ${map.allSum}
                        </td>
                    </tr>
                </table>
            </form>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
