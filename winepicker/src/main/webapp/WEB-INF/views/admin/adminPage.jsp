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
		<li><a href="${contextPath}/admin/userList">회원 목록 조회</a>
		<li><a href="${contextPath}/admin/searchUser">회원 검색</a>
		<li><a href="${contextPath}/admin/enrollWine">와인등록</a>
		<li><a href="${contextPath}/admin/deletWine">게시글 삭제</a>
		<li><a href="${contextPath}/admin/insertNotice">공지 등록</a>
		<li><a href="${contextPath}/admin/insertInfo">정보글 등록</a>
		
		
		
	</ul>
	

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>