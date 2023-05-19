<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>

        table {
            border: solid 1px black;
        }

        table tr, th, td {
            border: solid 1px black;
        }
    </style>
</head>
<body>

<%@include file="../conponent/header.jsp" %>
<%@include file="../conponent/nav.jsp" %>
<div id="section">
    <form action="/member/update" method="post" name="updateForm">
        회원번호(수정 불가능) <br><input type="text" name="id" value="${member.id}" readonly> <br><br>
        이메일(수정 불가능) <br><input type="text" name="memberEmail" value="${member.memberEmail}" readonly
                               placeholder="이메일(수정 불가능)"> <br><br>
        비밀번호(수정 가능) <br><input type="text" name="memberPassword" id="member-password1" value="${member.memberPassword}"
                               placeholder="비밀번호(수정 가능)" onblur="pass_c()"><br>
        <p id="pass-rule1"></p>

        <br><br>
        이름(수정 가능) <br><input type="text" name="memberName" value="${member.memberName}" placeholder="이름(수정 가능)">
        <br><br>
        전화번호(수정 가능) <br><input type="text" name="memberMobile" id="member-mobile1" value="${member.memberMobile}"
                               placeholder="전화번호(수정 가능)" onblur="mobile_c()"><br>
        <p id="mobile-rule1"></p>
        <br><br>
        <%--    <input type="text" name="memberAddress" value="${member.memberAddress}" placeholder="주소(수정 가능)" size="100" maxlength="100" readonly><br>--%>
        <br><br>
        주소(수정 가능)<br>
        <input type="hidden" name="memberAddress" id="memberAddress">
        <input type="text" id="sample6_postcode" placeholder="우편번호">
        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" id="sample6_address" placeholder="주소"><br>
        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
        <input type="text" id="sample6_extraAddress" placeholder="참고항목">

        <input type="button" onclick="update_check()" value="수정">
    </form>
</div>

<%@include file="../conponent/footer.jsp" %>
</body>
<script>
    const pass_c = () => {

        const password = document.getElementById("member-password1").value;
        const rule = document.getElementById("pass-rule1");
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

    const mobile_c = () => {
        const mobile = document.getElementById("member-mobile1").value;
        const rule = document.getElementById("mobile-rule1");
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


    // 비밀번호 확인 메소드
    const update_check = () => {
        <%--  //  수정할 비밀번호--%>
        <%--  const inputPass = document.getElementById("memberPassword").value;--%>
        <%--  // 서버에 저장되있는 비밀번호--%>
        <%--  const DBPass = '${member.memberPassword}';--%>
        const password = document.getElementById("member-password1");
        const mobile = document.getElementById("member-mobile1");

        const postcode = document.getElementById("sample6_postcode").value;
        const address = document.getElementById("sample6_address").value;
        const detailAddress = document.getElementById("sample6_detailAddress").value;
        const extraAddress = document.getElementById("sample6_extraAddress").value;

        const memberAddress = postcode + ", " + address + ", " + detailAddress + ", " + extraAddress;
        document.getElementById("memberAddress").value = memberAddress;

        // if (inputPass == DBPass) {
        //   alert("사용하던 비밀번호 입니다 다시 입력해주세요");
        // }

        if (mobile_c()) {
            alert("비밀번호를 다시 입력해주세요");
        } else if (pass_c()) {
            alert("전화번호를 다시 입력해주세요");
        } else if (postcode.length < 3
        ) {
            alert("우편번호를 다시입력해주세요");
            document.getElementById("sample6_postcode").focus();
        } else if (address.length < 5) {
            alert("주소를 다시입력해주세요");
            document.getElementById("sample6_address").focus();
        } else if (detailAddress.length < 3) {
            alert("상세주소를 다시입력해주세요");
            document.getElementById("sample6_detailAddress").focus();
        } else if (extraAddress.length < 1) {
            alert("참고주소를 다시입력해주세요");
            document.getElementById("sample6_extraAddress").focus();
        } else {
            document.updateForm.submit();
        }
    }


    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
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
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
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