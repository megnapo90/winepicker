<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바</title>
<style>
<style>
body {
	font-family: "Oranienbaum", sans-serif;
}
.var {
	width: 212px;
	height: 100%;
	position: absolute; 
	left : 80px;
	top: 335px;
	overflow: hidden;
	background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%,
		rgba(255, 255, 255, 0.2) 100%),
		linear-gradient(180deg, rgba(238, 204, 204, 1) 15%,
		rgba(255, 255, 255, 0) 100%);
	padding: 20px;
}

.side-bar{
	padding: 0;
	list-style-type: none;
	font-weight: 400;
	font-style: italic;
}

.side-bar li {
	margin-bottom: 10px;
	text-align: center;
}

.side-bar li:nth-of-type(1){
	padding-bottom : 15px;
}
.side-bar li:nth-of-type(2){
	padding-bottom : 30px;
}
.side-bar li:nth-of-type(3){
	padding-bottom : 15px;
}
.side-bar li:nth-of-type(4){
	padding-bottom : 30px;
}
.side-barli:nth-of-type(5){
	padding-bottom : 15px;
}
.side-bar li:nth-of-type(6){
	padding-bottom : 50px;
}

.user {
	position: relative;
    font-size: 30px;
    margin-top: 10px;
    margin-bottom: 5px;
    left: 80px;
    top: 20px
}

a {
	text-decoration: none;
	color: #000000;
	font-size: 16px;
	display: block;
	padding: 2px 0;
}

a:hover {
	color: #ff0000;
}

.my-page-main {
	margin-top: 20px;
	font-size: 20px;
	font-weight: bold;
}

.welcome-message {
	position: relative;
    font-size: 20px;
    margin-top: 10px;
    margin-bottom: 5px;
   	left: 80px;
    top: 20px
}

</style>
</head>
<body>

<!-- sidebar content 시작-->
<div class="user">마이페이지</div>
<div class="welcome-message">
	<p id="welcome-message-text">
		${not empty loginUser ? loginUser.userName : '홍길동'} 님, 환영합니다.
	</p>
</div>
<div class="var">	
		<ul class="side-bar">
				<li><a href="${contextPath}/user/myPage">주문 배송 조회</a></li>
				<li><a href="${contextPath}/user/myReview">리뷰 관리</a></li>
				<%-- <li><a href="${contextPath}/user/myRecentProduct">최근 본 상품</a></li> --%>
				<li><a href="${contextPath}/user/myWishList">관심 상품</a></li>
				<li><a href="${contextPath}/user/myInfoChange">내 정보 변경</a></li>
				<li><a href="${contextPath}/user/callCenter">고객 센터</a></li>
				<li><a href="${contextPath}/user/exitUser">회원 탈퇴</a></li>
		</ul>
		
</div>
<!-- sidebar content 종료-->
<!-- 마이페이지 공통 시작 -->
         

</body>
</html>