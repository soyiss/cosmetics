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
            <form action="/cart/update" name="form1" id="form1" method="post" onsubmit="updateGo('${row.productId}')">
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
                            <td style="width: 80px;text-align: right">
                                <fmt:formatNumber pattern="###,###,###"
                                                  value="${row.productPrice}"/></td>
                            <td>
                                <input type="number" style="width: 40px" name="productQu" value="${row.productQu}"
                                       min="1">
                                <input type="hidden" name="productId" value="${row.productId}">
                            </td>
                            <td style="width: 100px; text-align: right">
                                <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                            </td>
                                <%--  + 기호는 문자열을 연결하는 연산자이지만, JSP 표현 언어에서는 ${}로 변수 값을 가져올 수 있습니다. --%>
                            <td><a href="/cart/delete?id=${row.id}">상품 삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5" style="text-align: right">
                            장바구니 금액 합계: <fmt:formatNumber pattern="###,###,###"
                                                          value="${map.sumMoney}"/><br>
                            배송료: <fmt:formatNumber pattern="###,###,###"
                                                   value="${map.fee}"/><br>
                            전체 주문금액: <fmt:formatNumber pattern="###,###,###"
                                                       value="${map.allSum}"/>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="count" value="${map.count}">
                <button type="submit" id="btnUpdate">수량변경</button>
            </form>
        </c:otherwise>
    </c:choose>
    <button onclick="gogo()">상품목록</button>
</div>
</body>
<script>
    const gogo = () => {
      location.href="/product/paging";
    }
    
    const updateGo = (productId) => {
        const productQu = document.getElementsByName("productQu")[0].value;
        location.href = "/cart/cart?productId=" + productId + "&productQu=" + productQu;
      
    }

</script>
</html>
