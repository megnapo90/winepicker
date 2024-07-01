<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<ul>
		<li><a href="${contextPath}/info/main">정보글</a></li>
		<li><a href="${contextPath}/admin/adminPage">관리자페이지</a></li>
	</ul>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>