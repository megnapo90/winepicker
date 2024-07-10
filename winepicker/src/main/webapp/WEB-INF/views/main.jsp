<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

	<div id="list">
	
	<ul class="ul">
		<li><a href="${contextPath}/admin/adminPage">관리자페이지</a></li>
		<li><a href="${contextPath}/admin/info/main">정보글 메인페이지</a></li>
		
		<!-- 사용자 마이페이지 이동 -->
		<li><a href="${contextPath}/user/myPage">마이페이지</a></li>
	</ul>
	
	</div>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>