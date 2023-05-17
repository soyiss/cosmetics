## 프로젝트 기획안
<br>
<div style="text-align: right">
작성일: 2023.05.17<br>
작성자: 하소이
</div>

------
+ 프로젝트명: cosmetic shopping mall 


+ 기획의도
  + 화장품 판매하는 회원제 쇼핑몰이다.
  + 쇼핑몰 프로젝트를 하면 지금까지 공부한 내용을 다 사용해 볼 수 있다고 들었고 다른 모르는 기능들도 많이 접할 수 있을 것 같아서 선택했다.
  + 화장품으로 주제를 잡은 이유는 관심 있어 하는 것, 잘 아는 것으로 프로젝트를 만드는 것이좋다 해서 정하게 되었다.
  

+ 벤치마킹
  + 올리브영,아멜리 홈페이지에서 카테고리 종류와 화장품 종류 등을 참고했다.


+ 주요 기능
  + 일반 고객: 회원가입, 로그인, 묻고답하기 조회, 상품 조회
  + 회원 고객: 상품 주문, 결제, 장바구니담기, 장바구니 상품 삭제, 마이페이지(회원 탈퇴, 회원 수정,문의내역,내가쓴리뷰,주문배송/조회)
  + 관리자: 게시판 관리, 카테고리 관리, 회원관리, 상품관리
  
***********

1. 회원가입 기능 
   + 이메일 중복 체크
   + 비밀번호, 비밀번호 확인란, 비밀번호 정규식
   + 전화번호 정규식
   + 주소입력
   + 생년월일입력
   + 성별입력
   + 네이버/카카오로 로그인 api
   + 회원가입에 성공하면 로그인창 띄우기


2. 로그인 기능
   + 비밀번호/아이디 찾기
   + 아이디 저장
   + 로그인에 성공하면 홈페이지화면 띄우기


3. 마이페이지 
   + 주문/배송조회
   + 회원수정(비밀번호입력 후 맞으면 수정 가능)
   + 문의내역(묻고답하기에서 내가쓴 글 상세조회)
   + 내가 쓴 리뷰(내가쓴 리뷰 상세조회)
   + 회원탈퇴(비밀번호 입력 후 맞으면 탈퇴 가능)


4. 장바구니 기능
   + 회원이 장바구니에 담은 제품 리스트들을 계산해서 가격띄우기
   + 장바구니에 담긴 제품 수량 변경 및 삭제
   + 장바구니 리스트중 선택 주문 or 전체주문


5. 결제 기능
   + 카카오페이 결제 api 구현해보기
   + 아임포트 결제 api 구현해보기
6. 묻고답하기(게시판)기능
   + 비회원은 보기만 가능
   + 회원만 글을 쓸수 있음 ,회원은 자기가 쓴글 삭제 or 수정 가능 
   + 게시판에 파일올리기 가능 
   + 관리자는 모든 게시글 삭제 가능 ,수정은 불가능


7. 게시글에 댓글기능
    + 댓글은 관리자와 회원만 쓸수있음
    + 회원과 관리자는 댓글 삭제 가능


7. 관리자(admin)
   + 관리자 마이페이지에는 회원리스트,게시글리스트,제품리스트가 있음
       1. 회원리스트: 회원리스트가 보이고 삭제가능
       2. 게시글리스트: 게시글리스트가 보이고 누르면 상세조회가 뜨고 삭제 가능
       3. 제품리스트
       4. 제품 등록,수정,삭제
8. 공지사항
   + 공지사항은 관리자만 쓸수있고 비회원,회원 둘다 보기만 가능
   + 공지사항글은 댓글 못씀(궁금하신점은 묻고 답하기에 올려주세요~)
   + 공지사항에 파일올리기 가능