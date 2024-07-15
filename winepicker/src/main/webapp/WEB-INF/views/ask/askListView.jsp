<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항</title>
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
.callcenter {
	height: 100%;
	margin-top: 50px;
}

.callcenter .call-center-menu {
	width: 98%;
	height: 6%;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
}

.call-center-menu div {
	font-style: italic;
	font-size: 18px;
	font-weight: 400;
	text-align: center;
	background: #D0D0D0;
	width: 20%;
	height: 100%;
	margin-left: 10px;
}

.call-center-menu div p {
	margin-top: 10px;
}

#blank {
	background: white;
}

.call-center-menu .ask {
	color: #FFFFFF;
}

.ask-list-box {
	overflow-x: hidden;
	padding: 20px;
}

.ask-menu-title {
	width: 98%;
	height: 6%;
	margin: 15px;
	font-size: 20px;
}

.ask-list-container {
	width: 60%;
}

.ask-list {
	width: 100%;
	border-collapse: collapse;
	margin: auto;
}

.ask-list tr {
	height: 60px;
	/* 	font-size : 20px;
	font-weight : 200; */
	text-align: center;
	box-sizing: border-box;
	border-width: 0px 0px 0.5px 0px;
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.5);
}

.ask-list tr:nth-of-type(1) {
	/* height: 60px; */
}

.ask-list th, .ask-list td {
	margin: auto;
	text-align: center;
}

.ask-list th {
/* 	width: 10%; */
	text-align: center;
	color: #3D3D3D;
}

.ask-list td {
	
}

.ask-list td p {
	margin: 0;
}

.empty-ask-list {
	text-align: center;
	padding: 20px;
	color: #888;
	
}

.empty-ask-list>p {
	padding-top: 15%;
	text-align: center;
	font-size: 20px;
	font-weight: 10px;
}

.ask-insert-button {
	margin-right: 605px;
	margin-top: 10px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.ask-insert-button input[type="button"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}
</style>
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
			<div class="page-name" onclick=showFaq()>고객센터</div>
			<div class="content">
				<div class="callcenter">
					<div class="call-center-menu">
						<div class="faq" onclick=showFaq()>
							<p>FAQ</p>
						</div>
						<div class="ask"
							onclick="location.href='${contextPath}/ask/askPage'">
							<p>1:1문의</p>
						</div>
						<div id="blank"></div>
						<div class="user-notice" onclick=showNotice()>
							<p>이용약관 및 개인정보처리 방침</p>
						</div>
					</div>

					<div class="ask-list-box">
						<div class="ask-menu-title"
							onclick="location.href='${contextPath}/ask/askPage'">1:1
							문의내역</div>
						<c:choose>
							<c:when test="${empty askList}">
								<div class="empty-ask-list">
									<p>작성하신 문의글이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<div class="ask-list-container">

									<table class="ask-list">
										<tr>
											<th><p>No.</p></th>
											<td><p>제목</p></td>
											<td><p>작성일자</p></td>
											<td><p>답변상태</p></td>
										</tr>

										<c:forEach var="ask" items="${askList}">
											<tr onclick="movePage(${ask.askNo})">
												<th><p>${ask.askNo}</p></th>
												<td><p>${ask.askTitle}</p></td>
												<td><p>${ask.modifyDate}</p></td>
												<td><c:choose>
														<c:when test="${fn:contains(ask.responseStatus, 'N')}">
															<p>답변대기</p>
														</c:when>
														<c:otherwise>
															<p>답변완료</p>
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="ask-insert-button">
						<input type="button" value="작성하기"
							onclick="location.href='${contextPath}/ask/askInsert'">
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
	<script>
	
	function showFaq(){
		location.href="${contextPath}/user/callCenter"
	}
	
	function showNotice(){
		location.href="${contextPath}/user/userNotice"
	}
	
	function movePage(ano){
		location.href="${contextPath}/ask/detail/"+ano
	}

</script>


</body>
</html>