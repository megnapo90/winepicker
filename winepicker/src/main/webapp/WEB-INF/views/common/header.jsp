<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<style>
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
	justify-content: center;
	align-items: center;
	color: white;
	font-size: 24px;
	position: sticky;
	top: 0;
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

.left-text, .right-text {
	font-family: Judson;
	font-size: 80px;
	font-weight: normal;
	line-height: normal;
	text-align: center;
	letter-spacing: 0.3em;
	font-variation-settings: "opsz" auto;
	color: #FFFFFF;
	margin: 10px;
}

.logo-container {
	display: flex;
	align-items: center;
	justify-content: center;
}

.logo {
	width: 140px;
	height: 180px;
	background:
		url(https://image-resource.creatie.ai/131184926775412/131184970815644/9807466d9fc7c804bee814979ae75873.png);
	object-fit: cover;
	background-repeat: no-repeat;
	background-size: 100% 100%;
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

.nav a {
	text-decoration: none;
	color: #ffffff;
	font-size: 25px;
	font-weight: normal;
	display: block;
	width: 100%;
	height: 100%;
	line-height: 55px;
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
	/
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

#navi a:hover {
	font-family: Inter;
	font-size: 30px;
	font-weight: normal;
	line-height: normal;
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
</style>
</head>

<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("서비스 요청 성공", '${alertMsg}');
		</script>
		<c:remove var="alertMsg" />
	</c:if>

	<div class="header" id="header">
		<a href="" class="header-link">
			<div class="text-container">
				<div class="left-text">WINE</div>
				<div class="logo-container">
					<div class="logo"></div>
				</div>
				<div class="right-text">PICKER</div>
			</div>
		</a>
	</div>
	<div class="nav">
		<ul id="navi">
			<li><a href="${contextPath}/product/listView">전체 와인</a></li>
			<li><a href="${contextPath}/info/main">정보글</a></li>
		</ul>
	</div>
	<div id="header">

		<div id="header_1">
			<div id="header_1_left"></div>
			<div id="header_1_center"></div>
			<div id="header_1_right">
				<c:set var="contextPath" value="<%=request.getContextPath()%>"
					scope="session" />
				<c:choose>
					<c:when test="${empty loginUser}">
						<!-- 로그인전이라면 -->
						<a href="${contextPath}/user/loginPage" class="beforeLogin">마이페이지</a>
					</c:when>
					<c:otherwise>
						<label>${loginUser.userName}님</label> &nbsp;&nbsp; 
							<a href="${contextPath}/user/myPage">마이페이지</a>
						<a href="${contextPath}/user/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="header_2">
			<ul>
				<c:forEach items='${boardTypeList}' var='boardType'>
					<li><a href="${contextPath}/board/list/${boardType.boardCode}">${boardType.boardName}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

</body>

</html>