<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/userCommon.css">
</head>
<body>

<!-- sidebar content 시작-->
<div id="sidebar-box">	
	<div id="sidebar-content">
		<ul class="sidebar-list">
			<li><a href="${contextPath}/user/myPage">주문 배송 조회</a></li>
	      	<li><a href="${contextPath}/user/myReview">리뷰 관리</a></li>
	      	<li><a href="${contextPath}/user/myRecentProduct">최근 본 상품</a></li>
			<li><a href="${contextPath}/user/myWishList">관심 상품</a></li>
	     	<li><a href="${contextPath}/user/myInfoChange">내 정보 변경</a></li>
	     	<li><a href="${contextPath}/user/callCenter">고객 센터</a></li>
	    	<li><a href="${contextPath}/user/exitUser">회원 탈퇴</a></li>
  		</ul>
	</div>	
</div>
<!-- sidebar content 종료-->
<!-- 마이페이지 공통 시작 -->
<div class="my-page-main">
	마이페이지
</div>
<div class="welcome-message">
	<p id="welcome-message-text">
		${loginUser.userName } 홍길동 님, 환영합니다.
	</p>
</div>

<hr class="line-1">
<hr class="line-2">
<!-- 마이페이지 공통 종료 -->
	            

</body>
</html>