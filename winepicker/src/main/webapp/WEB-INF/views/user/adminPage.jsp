<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Integer gradeNo = (Integer) session.getAttribute("gradeNo");
    if (gradeNo == null || gradeNo != 0) {
        response.sendRedirect("${contextPath}/errorPage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
table{
	width: 1200px;
	border-collapse: separate;
}
table th{
	text-align: center;
	border-bottom-style: solid; 
	border-right-style: solid; 
}
td{
	border-right-style: solid;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	
<div class="section">

<table>
	<tr>
		<th colspan="11" style="border-right-style: none;">와인 재고 현황</th>
	</tr>
	<tr>
		<th>와인 번호</th>
		<th>와인 이름</th>
		<th>와인 종류</th>
		<th>포도 품종</th>
		<th>생산국</th>
		<th>빈티지</th>
		<th>용량(ml)</th>
		<th>수량(개)</th>
		<th>가격(원)</th>
		<th>판매 가능 상태</th>
		<th style="border-right-style: none;">수정</th>
	</tr>
	
	<c:forEach items="${wList}" var="wine">
		<tr>
			<td align="center">${wine.wineNo}</td>
			<td>${wine.wineName}</td>
			<td>${wine.wineType.wineTypeName}</td>
			<td>${wine.grape.grapeName}</td>
			<td>${wine.country.countryName}</td>
			<td align="center">${wine.vintage}</td>
			<td align="center">${wine.volume}ml</td>
			<td align="right">${wine.quantity}개</td>
			<td align="right">${wine.price}원</td>
			<td align="center">${wine.status}</td>
			<td style="border-right-style: none;"><input type="button" value="수정" onclick="updateWine(${wine.wineNo})"></td>
		</tr>
	</c:forEach>
	
</table>
	
</div>	

<div id="list">

	<ul class="ul">
		<li><a href="${contextPath}/admin/userList">회원 목록 조회</a>
		<li><a href="${contextPath}/admin/searchUser">회원 검색</a>
		<li><a href="${contextPath}/admin/enrollWine">와인등록</a>
		<li><a href="${contextPath}/admin/deletWine">게시글 삭제</a>
		
		
		<li><a href="${contextPath}/admin/grape">포도조회</a>
		
		
		<li><a href="${contextPath}/admin/noticeEnroll">공지 등록</a>
		
		
		
		<li><a href="${contextPath}/admin/info/main">정보글 등록/수정</a>
	
	</ul>
	
</div>

	<script>
		function updateWine(no){
			console.log(no);
			location.href = "${contextPath}/admin/updateWine/"+no;
		}
	</script>

	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>