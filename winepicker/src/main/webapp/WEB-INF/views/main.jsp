<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>


	<div class=main>
		<c:set var="contextPath" value="<%=request.getContextPath()%>"
			scope="session" />
		<ul>
			<li><a href="${contextPath}/info/main">정보글</a></li>
			<li><a href="${contextPath}/admin/adminPage">관리자페이지</a></li>
		</ul>
		<div class="content">
			<h2>여기에 컨텐츠 내용이 들어갑니다.</h2>
			<p>컨텐츠 내용을 자유롭게 추가하세요.</p>
			<li><a href="${contextPath}/info/main">정보글</a></li>
		</div>
	</div>



	<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	
</body>
</html>