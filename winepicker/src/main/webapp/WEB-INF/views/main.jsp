<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%= request.getContextPath() %>" scope="application"/>

<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<style>
.search-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px auto;
    padding: 10px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    max-width: 400px;
}

.search-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px 0 0 5px;
    outline: none;
}

.search-button {
    padding: 10px 20px;
    border: none;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    border-radius: 0 5px 5px 0;
}

.search-button:hover {
    background-color: #0056b3;
}

</style>


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
	
	<div class="search-container">
	<form action = "${contextPath }/product/search" method="get">
	    <input type="text" class="search-input" name="keyword" value="${paramMap.keyword }" placeholder="검색할 와인의 이름을 작성하세요.">
	    <button type="submit" class="search-button">Search</button>
	
	</form>
	
</div>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>