<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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





<div class="section">

<form action="${contextPath}/admin/enrollGrape" method="post">
	
	<label for="wineTypeNo"> 와인 종류 선택 : </label>
	<select name="wineTypeNo" id="wineTypeNo">
		<c:forEach var="wt" items="${wtList}">
			<option value="${wt.wineTypeNo}">${wt.wineTypeName}</option>
		</c:forEach>
	</select>
	<br>
	<label for="grapeName"> 포도 이름 : </label>
	<input type="text" name="grapeName" id="grapeName" placeholder="추가할 포도 품종 이름을 적으시오" size="50">
	<input type="text" name="countryName">
</form>





</div>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>