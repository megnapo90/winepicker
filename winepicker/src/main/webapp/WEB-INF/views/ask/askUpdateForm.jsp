<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항 수정</title>
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
	margin: auto;
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

.ask-update-box {
	overflow-x: hidden;
	padding: 20px;
}

.ask-menu-title {
	width: 98%;
	height: 6%;
	margin: 15px;
	font-size: 20px;
}

.ask-update-container {
	padding: 20px;
}

.ask-update {
	border-collapse: collapse;
}

.ask-update div {
	display: flex;
	margin: 0px 0px 10px 0px;
}

#title {
	width: 40%;
}

#content {
	width: 40%;
}

#upfile {
	width: 40%;
}

.ask-update div p {
	width: 100px;
	text-align: center;
	font-size: 16px;
}

.ask-update div div {
	padding-left: 10px;
	box-sizing: border-box;
	border: 0.5px solid rgba(0, 0, 0, 0.5);
	padding-left: 10px;
}

.ask-update-button {
	margin-right: 40px;
	margin-top: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.ask-update-button input[type="submit"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}
</style>
<c:if test="${not empty errorMsg }">
	<script>   
        	alert("",'${errorMsg}');
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

					<div class="ask-update-box">
						<div class="ask-menu-title"
							onclick="location.href='${contextPath}/ask/askPage'">1:1
							문의작성</div>
						<div class="ask-update-container">

							<div class="ask-update-form">
								<form action="${contextPath}/ask/update/${askNo}"
									id="updateForm" method="post" enctype="multipart/form-data">
									<div class="ask-update">
										<div class="ask-title">
											<p>제목</p>
											<input type="text" id="title" class="frame-41"
												name="askTitle" value="${ask.askTitle }" required>
										</div>
										<div class="ask-content">
											<p>내용</p>
											<textarea class="frame-42" id="content" name="askContent"
												rows="10" cols="50" required>${ask.askContent}</textarea>
										</div>
										<div class="ask-upfile">
											<p>첨부파일</p>
											<span class="update-file"> <input type="file"
												id="upfile" class="frame-43" name="upfile"> <span
												id="origin-name">${ask.originName}</span> <span
												class="delete-img" data-name="${ask.changeName}">&times;</span>
											</span>
										</div>
									</div>
									<input type="hidden" id="delete-img-name" value=""
										name="deleteImageName">
									<div class="ask-update-button">
										<input type="submit" id="formSubmit" value="수정">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function(){
			
			var $deleteImage = $(".delete-img");
			var $deleteImageName = $("#delete-img-name");
			
			$deleteImage.each(function(index, ele){
				$(ele).click(function(e){
					
					var imgName = $(this).data("name");  
					var originName = $("#origin-name");
					
					$deleteImageName.val(imgName);
					
					originName.remove();
					$(this).remove();
					
				})
			})
			
		})
	
	
	</script>


	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>