<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>" scope="application"/>
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<style>
  



</style>


<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/product/productMain.jsp"/>
	
	
<%-- 	
	
	
	<div id="list">
		
	
	<ul class="ul">
		<li><a href="${contextPath}/admin/adminPage">관리자페이지</a></li>
		<li><a href="${contextPath}/admin/info/main">정보글 메인페이지</a></li>
		
		
		
		
		
		<!-- 사용자 마이페이지 이동 -->
		<li><a href="${contextPath}/user/myPage">마이페이지</a></li>
	</ul>
	
	</div>
	 --%>
	 
	 



	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>