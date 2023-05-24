<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/e3b6bf5ae9.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/sidebar.css">
<div class="sidebar">
    <div class="logo">
        <a href="/" class="active"><img src="../../resources/image/속눈썹.png" alt="cosmetic 임시로고(바꿀예정)_"></a>
    </div>
    <br>

    <div class="cat">
        <ul>
            <c:choose>
                <c:when test="${sessionScope.loginEmail != null}">
                    <li>
                        <a href="/member/myPage?loginEmail=${sessionScope.loginEmail}" style="font-size: 11px;">MY PAGE /</a>
                    </li>
                    <li><a href="/member/logout" style="font-size: 11px;">LOGOUT </a></li>
                    <br>
                    <li>
                        <a href="/cart/cart" style="font-size: 11px;">CART </a>
                    </li>

                </c:when>
                <c:otherwise>
                    <li><a href="/member/login" style="font-size: 11px;">LOGIN /</a></li>
                    <li> <a href="/member/save" style="font-size: 11px;">JOIN-US </a></li>

                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <div class="select-icon">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" name="q" class="select-icon3" style="font-size: small">
        <input type="submit" value="검색" style="font-size: small">
    </div>
    <br> <br>

    <div class="category">
        <a href="/product/paging"><strong>Best 10</strong></a>
        <br>

        <!--   크 박스를 설명하는 레이블 요소입니다. for 속성의 값으로 "check-btn"을 설정하여 체크 박스와 연결합니다.
        이렇게 함으로써 체크 박스를 클릭하는 동작과 레이블을 클릭하는 동작이 서로 연결되어 동일한 동작을 수행하도록 할 수 있습니다.      -->
        <input id="check-btn" type="checkbox"/>
        <label for="check-btn"><strong>SKIN</strong></label>
        <br>
        <ul class="menubars">
            <br>
            <li>
                <a href="#">토너</a>
            </li>
            <li>
                <a href="#">로션</a>
            </li>
            <li>
                <a href="#">크림</a>
            </li>
        </ul>

        <br>
        <input id="check-btn1" type="checkbox"/>
        <label for="check-btn1"><strong>FACE</strong></label>
        <br>
        <ul class="menubars1">
            <br>
            <li>
                <a href="#">파운데이션</a>
            </li>
            <li>
                <a href="#">쿠션</a>
            </li>
            <li>
                <a href="#">파우더</a>
            </li>
            <li>
                <a href="#">컨실러</a>
            </li>
        </ul>

        <br>
        <input id="check-btn2" type="checkbox"/>
        <label for="check-btn2"> <strong>LIP</strong></label>
        <br>
        <ul class="menubars2">
            <br>
            <li>
                <a href="#">립스틱</a>
            </li>
            <li>
                <a href="#">틴트</a>
            </li>
        </ul>

        <br>
        <input id="check-btn3" type="checkbox"/>
        <label for="check-btn3"><strong>EYE</strong></label>
        <br>
        <ul class="menubars3">
            <br>
            <li>
                <a href="#">섀도우</a>
            </li>
            <li>
                <a href="#">아이라이너</a>
            </li>
            <li>
                <a href="#">아이브로우</a>
            </li>
        </ul>

        <br><br>
        <br><br>


        <ul>
            <li style="display:block">
                <a href="/board/paging" style="font-size: 12px;">묻고 답하기</a>
            </li>
            <li style="display:block">
                <a href="/product/productFAQ" style="font-size: 12px;">FAQ</a>
            </li>
            <li style="display:block">
                <a href="#" style="font-size: 12px;">고객후기</a>
            </li>
        </ul>
    </div>

</div>