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
main{
margin-top: 300px;
}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>

<main>
	<div class=main>
		<c:set var="contextPath" value="<%=request.getContextPath()%>"
			scope="session" />
		<div class="content">
		</div>
	</div>
</main>


	<footer>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
	
</body>
</html>