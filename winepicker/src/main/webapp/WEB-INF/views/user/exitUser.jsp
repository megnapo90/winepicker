<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/userCommon.css">

<style>
/* 공통 스타일 */
body {
	margin: 0;
	padding: 0;
}

header {
	color: white;
	text-align: center;
}

.main-content {
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* 최소 높이를 화면 높이와 같게 설정 */
}

.user-common {
	padding: 20px;
	width: 300px;
	font-weight: bold;
}

.main-section {
	display: flex;
	flex: 1; /* 남은 공간을 모두 차지 */
}

.page-name {
	font-size: 24px;
	font-weight: bold;
}

.content {
	flex: 1;
}
/* 공통 스타일 */
.user-info-confirm {
	height: 100%;
	padding: 20px;
	margin: auto;
	font-size: medium;
}

.user-info-box {
	width: 50%;
	height: 50%;
	margin-top: 50px;
	margin-left: 350px;
	border: 1px solid #ddd;
	text-align: center;
	padding-top: 30px;
}

.title {
	margin-top: 50px;
}

form {
	margin-top: 20px;
}

form div {
	padding-top: 30px;
	height: 20%;
}

form div * {
	padding-left: 10px;
}

#user-id div {
	width: 200px;
	border: 1px solid darkgrey;
	background-color: #ddd;
}
</style>

<script>
	function confirmExit() {

		var bool = confirm("정말 탈퇴하시겠습니까?");

		if (bool) {
			location.href = "${contextPath}/user/delete";
		}
	}
</script>
<c:if test="${not empty confirmExit}">
	<script>
			confirmExit();
		</script>
	<c:remove var="confirmExit" />
</c:if>

<c:if test="${not empty errorMsg}">
	<script>
			alert('${errorMsg}');
		</script>
	<c:remove var="errorMsg" />
</c:if>

</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</header>

	<div class="main-content">

		<div class="user-common">
			<jsp:include page="/WEB-INF/views/common/userCommon.jsp" />
		</div>

		<div class="main-section">
			<div class="page-name">회원 탈퇴</div>
			<div class="content">

				<div class="user-info-confirm">

					<div class="user-info-box">
						<div class="title">
							<p>회원탈퇴를 위해서는 비밀번호 확인이 필요합니다.</p>
						</div>
						<form action="exitUser" method="post">
							<div id="user-id">
								<span>아이디</span> <span>${not empty loginUser ? loginUser.userId : 'test'}</span>
							</div>
							<div id="user-pwd">
								<span>비밀번호</span> <input type="password" name="userPwd">
								<input type="submit" value="확인">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>

</body>
</html>