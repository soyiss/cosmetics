<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>COSMETICS</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <%--    <script src="../js/bootstrap.bundle.min.js"></script>--%>
    <script src="../../resources/js/bootstrap.bundle.min.js"></script>
    <%--    <link rel="stylesheet" href="../css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://kit.fontawesome.com/e3b6bf5ae9.js" crossorigin="anonymous"></script>

    <style>

        /*        \* {*/
        /*            box-sizing: border-box;*/
        /*            margin: 0;*/
        /*        }*/

        /*        body {*/
        /*           */
        /*            background-color: #f8f4e7;*/
        /*        }*/

        /*        .sidebar {*/
        /*            !*background-color: #fcf6f6;*!*/
        /*            background-color: rgba(0, 0, 0, 0.05);*/
        /*            float: left;*/
        /*            width: 15%;*/
        /*            padding: 0 50px;*/
        /*            margin-top: 35px;*/
        /*            margin-left: 40px;*/
        /*            height: 100%;*/

        /*            !**/
        /*            position: fixed;는 사이드바를 페이지 내에서 고정 위치로 설정합니다. 따라서 스크롤이 움직여도 사이드바는 항상 고정된 위치에 있게 됩니다.*/
        /*            *!*/

        /*            !*position: fixed;*!*/
        /*            height: 90vh; !* Set height to 100% viewport height *!*/
        /*            font-size: small;*/
        /*            overflow-y: hidden; !* Disable vertical scroll *!*/
        /*        }*/

        /*        .sidebar a {*/
        /*            display: block;*/
        /*            margin-bottom: 10px;*/
        /*            color: #000;*/
        /*            !**/
        /*            a링크 밑줄 없애기*/
        /*            *!*/
        /*            text-decoration: none;*/
        /*        }*/

        /*        .sidebar a.active {*/
        /*            font-weight: bold;*/
        /*        }*/

        /*        .logo {*/
        /*            text-align: center;*/
        /*        }*/

        /*        .logo img {*/
        /*            margin-top: 50px;*/
        /*            width: 100px;*/
        /*            height: 100px;*/
        /*        }*/

        /*        ul {*/
        /*            text-align: center;*/

        /*            padding-left: 0px;*/

        /*        }*/

        /*        li {*/
        /*            list-style: none;*/
        /*            display: inline-block;*/
        /*        }*/

        /*        ul li a {*/
        /*            font-size: 15px;*/
        /*        }*/

        /*        .select-icon {*/
        /*            display: flex;*/
        /*            justify-content: center;*/
        /*            align-items: center;*/
        /*        }*/

        /*        .select-icon i {*/
        /*            padding-right: 10px;*/
        /*        }*/

        /*        .select-icon .select-icon3 {*/
        /*            margin-right: 2px;*/
        /*        }*/

        /*        .category {*/
        /*            text-align: center;*/
        /*        }*/


        .carousel {
            float: left;
            width: 70%;
            height: 65vh; /* Set height to 100% viewport height */
            margin-top: 30px;

        }

        /* 캐러셀 내부 내용을 감싸는 컨테이너 요소의 스타일을 정의합니다. */
        .carousel-inner {
            height: 100%; /* Make the inner content fill the carousel height */
        }

        .carousel-item {
            height: 100%; /* Make each item fill the carousel height */

        }

        .carousel-item img {
            object-fit: cover;
            width: 100%;
            height: 100%;
            margin: 5px 0px 0px 100px; /* 이미지를 수평 가운데 정렬합니다. */
            display: block; /* 이미지를 블록 요소로 설정하여 수평 가운데 정렬 스타일이 적용됩니다. */

        }

        <%--    #check-btn, #check-btn1, #check-btn2, #check-btn3 {--%>
        <%--        display: none;--%>
        <%--    }--%>

        <%--    #check-btn:checked ~ .menubars, #check-btn1:checked ~ .menubars, #check-btn2:checked ~ .menubars, #check-btn3:checked ~ .menubars {--%>
        <%--        display: block;--%>
        <%--    }--%>

        <%--    .menubars {--%>
        <%--        display: none;--%>
        <%--    }--%>

        <%--    .menubars li {--%>
        <%--        display: block;--%>
        <%--    }--%>

        <%--    .menubars1 {--%>
        <%--        display: none;--%>
        <%--    }--%>

        <%--    .menubars1 li {--%>
        <%--        display: block;--%>
        <%--    }--%>

        <%--    .menubars2 {--%>
        <%--        display: none;--%>
        <%--    }--%>

        <%--    .menubars2 li {--%>
        <%--        display: block;--%>
        <%--    }--%>

        <%--    .menubars3 {--%>
        <%--        display: none;--%>
        <%--    }--%>

        <%--    .menubars3 li {--%>
        <%--        display: block;--%>
        <%--    }--%>


    </style>
</head>
<body>
<%@include file="../views/conponent/sidebar.jsp" %>
<!--data-bs-interval="2000"sms 2초마다 슬라이드를 변경하게 해준다-->
<div id="myCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="../../resources/image/화장2.png" alt="속눈썹">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                 aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="#777"/>
            </svg>
        </div>
        <div class="carousel-item">
            <img src="../../resources/image/화장1.jpg" alt="속눈썹">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                 aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="#777"/>
            </svg>
        </div>
        <div class="carousel-item">
            <img src="../../resources/image/눈감은%20섀도우.jpg" alt="속눈썹">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                 aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="#777"/>
            </svg>

        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


</body>
<script>
    // 슬라이드 자동 변경을 위한 JavaScript 코드
    const myCarousel = document.getElementById('myCarousel');
    const carousel = new bootstrap.Carousel(myCarousel, {
        interval: 3000, // 슬라이드 변경 간격 (밀리초 단위)
        wrap: true // 마지막 슬라이드에서 첫 번째 슬라이드로 자동으로 이동 여부
    });

    // 첫 번째 슬라이드로 이동하는 함수
    function goToFirstSlide() {
        carousel.to(0); // 첫 번째 슬라이드로 이동
    }

    // 마지막 슬라이드에서 첫 번째 슬라이드로 이동하기 위한 타이머 설정
    let timer;

    function startTimer() {
        timer = setInterval(goToFirstSlide, 3000); // 2초마다 첫 번째 슬라이드로 이동
    }

    function stopTimer() {
        clearInterval(timer);
    }

    // 마지막 슬라이드에서 첫 번째 슬라이드로 이동할 때 타이머 시작
    myCarousel.addEventListener('slide.bs.carousel', function (event) {
        if (event.to === 0 && event.direction === 'next') {
            stopTimer(); // 이전 타이머 중지
            setTimeout(startTimer, 3000); // 2초 후에 타이머 다시 시작
        }
    });

    window.addEventListener('DOMContentLoaded', function () {
        var checkboxes = [
            {id: 'check-btn', menuClass: '.menubars'},
            {id: 'check-btn1', menuClass: '.menubars1'},
            {id: 'check-btn2', menuClass: '.menubars2'},
            {id: 'check-btn3', menuClass: '.menubars3'}
        ];

        checkboxes.forEach(function (checkbox) {
            var element = document.getElementById(checkbox.id);
            var menuBars = document.querySelector(checkbox.menuClass);

            element.addEventListener('change', function () {
                checkboxes.forEach(function (cb) {
                    var cbElement = document.getElementById(cb.id);
                    var cbMenuBars = document.querySelector(cb.menuClass);

                    if (cbElement !== element) {
                        cbElement.checked = false;
                        cbMenuBars.style.display = 'none';
                    }
                });

                if (element.checked) {
                    menuBars.style.display = 'block';
                } else {
                    menuBars.style.display = 'none';
                }
            });
        });
    });

</script>
</html>

<%--<%@include file="./conponent/header.jsp"%>--%>
<%--<%@include file="./conponent/nav.jsp"%>--%>
<%--<div id="section">--%>
<%--    <p><strong>로그인을 하시면 글쓰기가 보입니다 ↑</strong></p>--%>

<%--</div>--%>
<%--<%@include file="./conponent/footer.jsp"%>--%>
