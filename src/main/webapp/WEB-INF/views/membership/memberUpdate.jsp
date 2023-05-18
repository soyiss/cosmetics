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

    table{
      border: solid 1px black;
    }
    table tr, th, td{
      border: solid 1px black;
    }
  </style>
</head>
<body>

<%@include file="../conponent/header.jsp"%>
<%@include file="../conponent/nav.jsp"%>
<div id="section">
  <form action="/member/update" method="post" name="updateForm">
    회원번호(수정 불가능) <br><input type="text" name="id" value="${member.id}" readonly> <br><br>
    이메일(수정 불가능) <br><input type="text" name="memberEmail" value="${member.memberEmail}" readonly placeholder="이메일(수정 불가능)"> <br><br>
    비밀번호(수정 가능) <br><input type="text" name="memberPassword" id="memberPassword" value="${member.memberPassword}" placeholder="비밀번호(수정 가능)"> <br><br>
    이름(수정 가능) <br><input type="text" name="memberName" value="${member.memberName}" placeholder="이름(수정 가능)"> <br><br>
    전화번호(수정 가능) <br><input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="전화번호(수정 가능)"> <br><br>
<%--    <input type="text" name="memberAddress" value="${member.memberAddress}" placeholder="주소(수정 가능)" size="100" maxlength="100" readonly><br>--%>
    <br><br>
  <table>
    <tr>
      <td>현재 저장된 주소</td>
    </tr>
    <tr>
      <td>${member.memberAddress}</td>
    </tr>
    <tr>
      <td>수정하실 주소를 밑에 다시 입력해주세요</td>
    </tr>
  </table>
<br>
    <input type="hidden" name="memberAddress" id="memberAddress">
    <input type="text" id="sample6_postcode" placeholder="우편번호">
    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="sample6_address" placeholder="주소"><br>
    <input type="text" id="sample6_detailAddress" placeholder="상세주소">
    <input type="text" id="sample6_extraAddress" placeholder="참고항목">

    <input type="button" onclick="update_check()" value="수정">
  </form>
</div>

<%@include file="../conponent/footer.jsp"%>
</body>
<script>
  // 비밀번호 확인 메소드
  const update_check = () => {
      <%--  //  수정할 비밀번호--%>
      <%--  const inputPass = document.getElementById("memberPassword").value;--%>
      <%--  // 서버에 저장되있는 비밀번호--%>
      <%--  const DBPass = '${member.memberPassword}';--%>

      const postcode = document.getElementById("sample6_postcode").value;
      const address = document.getElementById("sample6_address").value;
      const detailAddress = document.getElementById("sample6_detailAddress").value;
      const extraAddress = document.getElementById("sample6_extraAddress").value;

      const memberAddress = postcode + ", " + address + ", " + detailAddress + ", " + extraAddress;
      document.getElementById("memberAddress").value = memberAddress;

      // if (inputPass == DBPass) {
      //   alert("사용하던 비밀번호 입니다 다시 입력해주세요");
      // }

      if (postcode.length < 8
      ) {
          alert("주소를 다시입력해주세요11");
          postcode.focus();
      } else if (address.length < 5) {
          alert("주소를 다시입력해주세요22");
          address.focus();
      } else if (detailAddress.length < 3) {
          alert("주소를 다시입력해주세요33");
          detailAddress.focus();
      } else if (extraAddress.length < 1) {
          alert("주소를 다시입력해주세요44");
          extraAddress.focus();
      } else {
          document.updateForm.submit();
      }
  }



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
