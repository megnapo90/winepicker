<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<div align="center">
		<p>오류입니다. 다시실행해주세요.<p>
		<br><br>
		
		<h1 style="font-weight: bold;">${errorMsg }</h1>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>