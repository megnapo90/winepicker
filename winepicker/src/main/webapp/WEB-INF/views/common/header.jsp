<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>

<!-- ===== 공통적으로 사용할 라이브러리 추가 ===== -->
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩에서 제공하는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- alertify에서 제공하는 라이브러리 -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

<style>
#header {
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

li, ul, a {
	box-sizing: border-box;
}

.custom-svg {
	width: 20px;
	height: 25px;
	fill: #D8D8D8;
}

.header {
	box-sizing: border-box;
	width: 100%;
	height: 180px;
	background: linear-gradient(to right, rgb(29, 29, 59), black,
		rgb(29, 29, 59));
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	color: white;
	font-size: 24px;
	position: relative;
	top: 0;
}

.logo-container {
	width: 80%;
	height: 180px;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

.logo {
	height: 170px;
	padding-top: 30px;
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
}

.header a {
	text-decoration: none;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 100%;
}

.text-container {
	display: flex;
	align-items: center;
	justify-content: center;
}

.nav {
	width: 100%;
	height: 58px;
	opacity: 1;
	background-color: #84515F;
}

#navi {
	height: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	width: 100%;
}

#navi>li {
	width: 100%;
	text-align: center;
	height: 100%;
	position: relative;
}

#navi>li::after {
	content: "";
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
	width: 1px;
	height: 100%;
	background-color: white;
}

#navi>li:last-child::after {
	display: none;
}

#navi>li>ul {
	display: none;
	flex-direction: column;
}

#navi>li>ul a {
	font-size: 10px;
}

.nav a {
    text-decoration: none;
    color: #ffffff;
    font-size: 25px;
    font-weight: normal;
    display: block;
    width: 100%;
    height: 100%;
    line-height: 55px; /* 기본 line-height 값을 조정 */
    position: relative;
    font-family: 'Georgia', serif; /* 변경된 폰트명 적용 */
    transition: font-size 0.3s ease; /* hover 시 transition 효과 추가 */
}

.nav a:hover {
    font-size: 30px; /* hover 시 글자 크기 증가 */
    line-height: 55px; /* 기본 line-height 값으로 유지하여 텍스트가 위로 올라가지 않도록 설정 */
    text-align: center;
    letter-spacing: 0em;
    font-variation-settings: "opsz" auto;
    color: #FFFFFF;
}

#navi>li>ul a:hover {
	font-size: 13px;
}

#navi>li>a:hover+ul, #navi>li>ul:hover {
	display: flex;
}

.user-actions {
	position: absolute;
	top: 10px;
	right: 10px;
	display: flex;
	flex-direction: column; /* Updated to column */
	align-items: flex-end; /* Updated alignment */
	font-size: 15px;
}

.user-info {
	margin-bottom: 5px;
	/* Adjust spacing between user info and action icons */
}

.user-actions label {
	color: white;
}

.action-icons {
	display: flex;
	flex-direction: row;
}

.action-icons a {
	color: white;
	margin: 0 10px;
}

.action-icons img {
	width: 20px;
	height: 20px;
	margin: 0 5px;
}

.user-actions a {
	color: white;
	margin: 0 10px;
}

.user-actions img {
	width: 20px;
	height: 20px;
	margin: 0 5px;
}
</style>

<c:if test="${not empty alertMsg}">
	<script>
		alertify.alert("","${alertMsg}");
	</script>
	<c:remove var="alertMsg"/>
</c:if>


</head>

<body>
	<div class="header" id="header">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<a href="${contextPath}" class="header-link">
			<div class="logo-container">
				<img src="${contextPath}/resources/common/headerlogo.png"class="logo">
			</div>
		</a>
		<div class="nav">
			<ul id="navi">
				<li><a href="${contextPath}/product/list">WINE</a></li>
				<li><a href="${contextPath}/admin/info/main">INFORMATION</a></li>
			</ul>
		</div>
		<div class="user-actions">
			<div class="user-info">
				<label> <c:choose>
						<c:when test="${empty loginUser}">
							<!-- If user is not logged in -->
                            로그인 하세요
                        </c:when>
						<c:otherwise>
							<!-- If user is logged in -->
                            ${loginUser.userName} 님
                        </c:otherwise>
					</c:choose>
				</label>
			</div>

			<!-- User actions section -->
			<div class="action-icons">
				<c:choose>
					<c:when test="${empty loginUser}">
						<!-- 사용자가 로그인하지 않은 경우 -->
						<a href="${contextPath}/user/loginPage" class="beforeLogin"> <img
							src="${contextPath}/resources/common/myPage.png" alt="login"
							class="icon"
							data-hover-src="${contextPath}/resources/common/myPage-hover.png">
						</a>
					</c:when>
					<c:otherwise>
						<!-- 사용자가 로그인한 경우 -->
						<c:choose>
							<c:when test="${loginUser.gradeNo == 0}">
								<a href="${contextPath}/admin/adminPage"> <img
									src="${contextPath}/resources/common/admin.png" alt="adminPage"
									class="icon"
									data-hover-src="${contextPath}/resources/common/admin-hover.png">
								</a>
							</c:when>
							<c:otherwise>
								<a href="${contextPath}/user/myPage"> <img
									src="${contextPath}/resources/common/myPage.png" alt="myPage"
									class="icon"
									data-hover-src="${contextPath}/resources/common/myPage-hover.png">
								</a>
							</c:otherwise>
						</c:choose>
						<a href="${contextPath}/user/logout"> <img
							src="${contextPath}/resources/common/logout.png" alt="logout"
							class="icon"
							data-hover-src="${contextPath}/resources/common/logout-hover.png">
						</a>
						<a href="${contextPath}/product/cart"> <img
							src="${contextPath}/resources/common/cart.png" alt="Cart"
							class="icon"
							data-hover-src="${contextPath}/resources/common/cart-hover.png">
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- jQuery 라이브러리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- 이미지 hover 효과를 위한 자바스크립트 코드 -->
	<script>
		$(document).ready(function() {
			// 이미지에 hover 효과 처리
			$('.icon').hover(function() {
				// data-hover-src 속성 값 (hover 이미지 URL) 가져오기
				var hoverSrc = $(this).data('hover-src');
				// 원래 src 속성 값을 저장
				$(this).data('original-src', $(this).attr('src'));
				// src 속성을 hover 이미지 URL로 변경
				$(this).attr('src', hoverSrc);
				// 이미지 크기 확대
				$(this).css('transform', 'scale(1.1)');
			}, function() {
				// 마우스가 떠날 때 원래 src 속성으로 복원
				$(this).attr('src', $(this).data('original-src'));
				// 이미지 크기 원래대로 복원
				$(this).css('transform', 'scale(1)');
			});
		});
	</script>
</body>

</html>