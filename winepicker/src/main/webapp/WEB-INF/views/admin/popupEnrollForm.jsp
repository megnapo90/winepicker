<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
	img {
		width: 100px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/adminList.jsp"/>

<div class="section">
	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>팝업 등록</h2>
			<br>
			<form action="${contextPath}/admin/popupEnroll" id="enrollForm" method="post" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<th>제목</th>
						<td><input type="text" id="title" class="form-control" name="popupTitle" required></td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td><input type="file" id="upfile" class="form-control" name="upfile"></td>
					</tr>
				</table>
				<div align="center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-danger" onclick="adminPage()">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
	
	<script>
		function adminPage(){
			location.href = "${contextPath}/admin/adminPage";
		}
	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>