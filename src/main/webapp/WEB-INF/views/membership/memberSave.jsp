<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JOIN-US</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .save1{
            text-align: center;
        }

    </style>
</head>
<body>

<%@include file="../conponent/header.jsp" %>
<%@include file="../conponent/nav.jsp" %>
<br>

<div id="section">

    <form action="/member/save" method="post" id="save-form" enctype="multipart/form-data">
        <div class="save1">
            <input type="text" name="memberEmail" placeholder="이메일" id="member-email" onblur="email_check()"><br>
            <p id="check-result"></p>
            <input type="text" name="memberPassword" placeholder="비밀번호" id="member-password"
                   onblur="password_check()"><br>
            <p id="pass-rule"></p>
            <input type="text" name="memberName" id="member-name" placeholder="이름"><br>
            <p></p>
            <input type="text" name="memberMobile" placeholder="전화번호" id="member-mobile" onblur="mobile_check()"><br>
            <p id="mobile-rule"></p>

            <input type="hidden" name="memberAddress" id="memberAddress">

            <input type="text" id="sample6_postcode" placeholder="우편번호">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample6_address" placeholder="주소"><br>
            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
            <input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>

            <input type="file" name="memberFile"> <br>
            <input type="submit" value="가입" onclick="member_address()">
        </div>
    </form>

</div>

<%@include file="../conponent/footer.jsp" %>
</body>
<script>


    const email_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("check-result");
        $.ajax({
            type: "post",
            url: "/member/email-check",
            data: {
                "memberEmail": email
            },
            success: function () {
                result.innerHTML = "사용가능한 이메일입니다.";
                result.style.color = "green";
            },
            error: function (err) {
                // 성공이 아닌경우 응답을 err로 받음.
                //err 내부의 status에는 서버에서 응답한 http status code값이 담겨있음.
                //status code 값으로 화면에 출력하는 부분 제어
                console.log(err);
                if (err.status == "409") { //중복되는 경우
                    result.innerHTML = "이미 사용 중인 이메일입니다."
                    result.style.color = "red";
                } else if (err.status == "404") { // 아무값도 입력하지 않은 경우
                    result.innerHTML = "입력해주세요";
                    result.style.color = "red";
                }
            }
        });
    }

    const password_check = () => {

        const password = document.getElementById("member-password").value;
        const rule = document.getElementById("pass-rule");
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!#])[A-Za-z\d-_!#]{5,10}$/;

        if (password.match(exp)) {
            rule.innerHTML = "사용가능한 비밀번호입니다.";
            rule.style.color = "green";
            return false;
            //   false면 다음조건이 맞았을때로 들어감
        } else {
            rule.innerHTML = "소문자,숫자,특수문자(-_!# 중) 필수입력 입니다\n5~10글자 내로 입력하세요";
            rule.style.color = "red";
            return true;
            //
        }

    }

    const mobile_check = () => {
        const mobile = document.getElementById("member-mobile").value;
        const rule = document.getElementById("mobile-rule");
        const exp = /^\d{3}-\d{4}-\d{4}$/;

        if (!(mobile.match(exp))) {
            rule.innerHTML = "000 - 0000 - 0000(기호필수)으로 입력해주세요";
            rule.style.color = "red";
            return true;
        } else {
            rule.innerHTML = "입력 가능합니다";
            rule.style.color = "green";
            return false;
        }

    }

    const member_address = () => {
        const postcode = document.getElementById("sample6_postcode").value;
        const address = document.getElementById("sample6_address").value;
        const detailAddress = document.getElementById("sample6_detailAddress").value;
        const extraAddress = document.getElementById("sample6_extraAddress").value;
        const memberAddress = postcode + ", " + address + ", " + detailAddress + ", " + extraAddress;
        document.getElementById("memberAddress").value = memberAddress;

    }

    <!-- 이벤트 리스너 적용 -->
    const saveForm = document.getElementById("save-form");

    saveForm.addEventListener("submit", function (e) {
        e.preventDefault(); // 해당 요소의 기본 동작을 수행하지 않을 때
        // 가입하기 버튼을 아무리 눌러도 서브밋을 막음

        const email = document.getElementById("member-email");
        const password = document.getElementById("member-password");
        const name = document.getElementById("member-name");
        const mobile = document.getElementById("member-mobile");

        const postcode = document.getElementById("sample6_postcode").value;
        const address = document.getElementById("sample6_address").value;
        const detailAddress = document.getElementById("sample6_detailAddress").value;
        const extraAddress = document.getElementById("sample6_extraAddress").value;

        const memberAddress = postcode + ", " + address + ", " + detailAddress + ", " + extraAddress;
        document.getElementById("memberAddress").value = memberAddress;

        if (email.value == "") {
            alert("이메일을 입력하세요");
            email.focus();
        } else if (password.value == "") {
            alert("비밀번호를 입력하세요");
            password.focus();
        } else if (name.value == "") {
            alert("이름을 입력하세요");
            name.focus();
        } else if (mobile.value == "") {
            alert("전화번호를 입력하세요");
            mobile.focus();
        } else if (password_check()) {
            alert("비밀번호를 다시입력해주세요 ");
            password.focus();
        } else if (mobile_check()) {
            alert("전화번호를 다시입력해주세요");
            mobile.focus();
            // postcode, address, detailAddress, extraAddress는 입력란의 ID가 아니라 입력된 값 자체를 나타내므로
            // postcode.focus(), address.focus(), detailAddress.focus(), extraAddress.focus()와 같은 코드는 잘못된 부분입니다.
        }else if(postcode.length < 3){
            alert("우편번호를 다시입력해주세요");
            document.getElementById("sample6_postcode").focus();
        }
        else if(address.length < 5){
            alert("주소를 다시입력해주세요");
            document.getElementById("sample6_address").focus();
        }else if(detailAddress.length < 3){
            alert("상세주소를 다시입력해주세요");
            document.getElementById("sample6_detailAddress").focus();
        }
        else if(extraAddress.length < 1){
            alert("참고주소를 다시입력해주세요");
            document.getElementById("sample6_extraAddress").focus();
        } else {
            saveForm.submit();
        }
    });

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>