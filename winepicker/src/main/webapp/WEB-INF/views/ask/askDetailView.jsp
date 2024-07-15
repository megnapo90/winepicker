<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항 상세조회</title>
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

.ask-detail-box {
	overflow-x: hidden;
	padding: 20px;
}

.ask-menu-title {
	width: 98%;
	height: 6%;
	margin: 15px;
	font-size: 20px;
}

.ask-detail-container {
	padding: 20px;
}

.ask-detail-container>form {
	height: 100%;
}

.ask-detail {
	border-collapse: collapse;
}

.ask-detail div {
	display: flex;
}

.ask-title {
	width: 50%;
}

.ask-content {
	width: 50%;
}
.ask-upfile{
	margin-top: 10px;
	width: 50%;
}
.ask-detail div div {
	width: 100%;
	box-sizing: border-box;
	border: 0.5px solid rgba(0, 0, 0, 0.5);
	padding-left: 10px;
	margin-left: 20px;
	margin-bottom: 10px;
}

#content{
	height: 300px;
    overflow: scroll;
}

.ask-detail div p {
	width: 100px;
	text-align: center;
	font-size: 16px;
}

.buttons {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 110	px;
}

.buttons div {
	margin: 5px;
}

.buttons input[type="button"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.response {
	height: 20%;
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

					<div class="ask-detail-box">
						<div class="ask-menu-title"
							onclick="location.href='${contextPath}/ask/askPage'">1:1 문의
							내역</div>
						<div class="ask-detail-container">
							<form>
								<div class="ask-detail">
									<div class="ask-title">
										<p>제목</p>
										<div id="title">${ask.askTitle}</div>
									</div>
									<div class="ask-content">
										<p>내용</p>
										<div id="content">${ask.askContent}</div>
									</div>
									<c:if test="${ask.originName ne null}">
										<div class="ask-upfile">
											<p>첨부파일</p>
											<div id="upfile">${ask.originName}</div>
										</div>
									</c:if>
									<c:if test="${fn:contains(ask.responseStatus, 'Y')}">
										<div class="response">
											<p>답변</p>
											<div class="response-detail">${ask.responseContent }</div>
										</div>
									</c:if>

								</div>
								<div class="buttons">
									<c:if test="${fn:contains(ask.responseStatus, 'N')}">
										<div class="askUpdate">
											<input type="button" id="updateAsk" value="수정"
												onclick="updateAskDetail(${ask.askNo})">
										</div>
									</c:if>
									<div class="askDelete">
										<input type="button" id="deleteAsk" value="삭제"
											onclick="deleteAskDetail(${ask.askNo})">
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		function deleteAskDetail(ano){
			var bool = confirm("삭제하시겠습니까?");
			
			if(bool){
				location.href="${contextPath}/ask/delete/"+ano;
			}
		}
		function updateAskDetail(ano){
			location.href="${contextPath}/ask/update/"+ano;
		}
	
	</script>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>