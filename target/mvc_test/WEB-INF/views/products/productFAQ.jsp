<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오전 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FAQ</title>
    <link rel="stylesheet" href="/resources/css/sidebar.css">
    <style>

        body {
            padding: 0 20px;

            height: 300px; /* 적절한 높이 값으로 설정 */
            overflow-y: auto; /* 세로 스크롤바를 표시 */
        }
        .section{
            width: 60%;
            margin: 0 auto; /* Center-align the section */
            text-align: center;
            /*margin-left: 130px;*/
            margin-left: 500px;
        }
        .sidebar {
            position: fixed; /* 사이드바를 화면에 고정 */

            width: 15%;
            padding: 0 50px;
            margin-top: 35px;
            margin-left: 40px;
            height: 90vh; /* Set height to 100% viewport height */
        }


        h2 {
            text-align: center;
            margin: 70px auto;
        }

        .container {
            border: 2px solid #dedede;
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }

        .darker {
            border-color: #ccc;
            background-color: #ddd;
        }

        .container::after {
            content: "";
            clear: both;
            display: table;
        }

        .container img {
            float: left;
            max-width: 60px;
            width: 100%;
            margin-right: 20px;
            border-radius: 50%;
        }

        .container img.right {
            float: right;
            margin-left: 20px;
            margin-right: 0;
        }

        .time-right {
            float: right;
            color: #aaa;
        }

        .time-left {
            float: left;
            color: #999;
        }


    </style>

</head>
<body>
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
                        <a href="/member/myPage?loginEmail=${sessionScope.loginEmail}" style="font-size: 11px;">MY PAGE
                            /</a>
                    </li>
                    <li><a href="/member/logout" style="font-size: 11px;">LOGOUT </a></li>
                    <br>
                    <li>
                        <a href="#" style="font-size: 11px;">CART </a>
                    </li>

                </c:when>
                <c:otherwise>
                    <li><a href="/member/login" style="font-size: 11px;">LOGIN /</a></li>
                    <li><a href="/member/save" style="font-size: 11px;">JOIN-US </a></li>

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



<div class="section">
    <h2>자주 묻는 질문</h2>

    <div class="container">
        <img src="../../../resources/image/기본%20프로필.png" alt="Avatar" style="width:60%; height: 60px; margin-top: 10px;">
        <p>[구매] 비회원 구매가 가능한가요?</p>
        <span class="time-right">질문1</span>
    </div>

    <div class="container darker">
        <img src="../../../resources/image/속눈썹.png" alt="Avatar" class="right" style="width:100%;">
        <p>비회원으로 주문이 불가능합니다.<br>
            왼쪽 상단의 JOIN-US로 회원가입 해주시면 주문이 가능합니다.
        </p>
        <span class="time-left">답변1</span>
    </div>
    <br>
    <br>
    <br>
    <br>

    <div class="container">
        <img src="../../../resources/image/기본%20프로필.png" alt="Avatar" style="width:60%; height: 60px; margin-top: 10px;">
        <p>[배송] 배송비는 얼마인가요?</p>
        <span class="time-right">질문2</span>
    </div>

    <div class="container darker">
        <img src="../../../resources/image/속눈썹.png" alt="Avatar" class="right" style="width:100%;">
        <p>기본 배송비는 2,500원 이며, 3만원 이상 구매시 무료 배송이 가능합니다.<br>
            단, 해외배송은 불가능합니다.

        </p>
        <span class="time-left">답변2</span>
    </div>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
        <img src="../../../resources/image/기본%20프로필.png" alt="Avatar" style="width:60%; height: 60px; margin-top: 10px;">
        <p>[구매] 오프라인 매장은 어디에 있나요?</p>
        <span class="time-right">질문3</span>
    </div>

    <div class="container darker">
        <img src="../../../resources/image/속눈썹.png" alt="Avatar" class="right" style="width:100%;">
        <br>
        <br>
        <br>
        <br>
        <strong>cosmetics를 오프라인 매장에서 직접 만나보세요!</strong><br>
        <br>
        <br>
        ✔️ 서울 강남역점<br>

        서울특별시 강남구 개성로 558 B1F무지개뷰티<br>

        ( Tel : (253) 512-3443 )<br>

        <br>
        <br>
        <br>
        <br>


        ✔️ 서울 타임스퀘어점<br>

        서울특별시 영등포구 영중로 15 타임스퀘어 588층<br>

        ( Tel : (518) 677-6532 )<br>
        <br>
        <br>
        <br>
        <br>


        ✔️ cosmetics 대구점<br>

        대구광역시 동구 동부로 149 신세계백화점 대구점 888층 <br>

        ( Tel : (541) 947-7963 )<br>
        </p>
        <span class="time-left">답변3</span>
    </div>
    <br>
    <br>
    <br>
    <br>
</div>

</body>
</html>