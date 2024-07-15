<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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

#faq-detail {
	background: #D0D0D0;
	height: 90px;
	padding: 10px;
}

.call-center-menu .faq {
	color: #FFFFFF;
}

.faq-list-box {
	overflow-x: auto;
	margin-top: 20px;
}

.faq-list {
	margin-left: 20px;
	width: 60%; 
	border-collapse: collapse;
}

.faq-list tr {
	height: 90px;
	box-sizing: border-box;
	border-width: 0px 0px 0.5px 0px;
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.5);
}

.faq-list th, .faq-list td {
	margin: auto;
	text-align: left;
}

.faq-list th {
	width: 10%;
	text-align: center;
	color: #3D3D3D;
}

.faq-list td {
	
}

.faq-list td p {
	margin: 0;
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

			<div class="page-name">고객센터</div>
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
					<div class="faq-list-box">
						<table class="faq-list">

							<c:forEach items="${faqList }" var="faq">
								<tr id="${faq.faqNo }" onclick=showFaqDetail(${faq.faqNo});>
									<th>Q${faq.faqNo }</th>
									<td>${faq.faqTitle }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script>
	
	function showFaq(){
		location.href="${contextPath}/user/callCenter"
		
	}
	
	function showNotice(){
		location.href="${contextPath}/user/userNotice"
	}

	function showFaqDetail(fno){
	
		if($("#faq-detail") != null){
			$.ajax({
		
				url : "${contextPath}/user/faqDetail/"+fno,
				data : {
					faqNo : "${faqNo}"
				},
				type : "get",
				success : function showFaqContent(faq){
					console.log(faq);
					
					var content = "";
						content += '<tr id="faq-detail" onclick=removeFaqDetail(this);>';
						content += `<th>A\${faq.faqNo}</th>`; 
						content += `<td>\${faq.faqContent}</td>`;
						content += '</tr>';
					var faqNo = faq.faqNo;
					
					$(".faq-list #"+faqNo+"").after(content);
				}
			})
		}
			
	}
	
	
	function removeFaqDetail(faq){
		$(faq).remove();
	}
	
	
</script>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>

</body>
</html>