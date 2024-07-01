<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
		width: 100px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>게시글 작성하기</h2>
			<br>
			<form action="${contextPath}/admin/insertInfo" id="enrollForm" method="post" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<th>부제목</th>
						<td><input type="text" id="title" class="form-control" name="subtitle" required></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${loginUser.userId}</td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td><input type="file" id="upfile" class="form-control" name="upfile"></td>
					</tr>


					<tr>
						<th>내용</th>
						<td>
							<textarea id="content" style="resize: none;" rows="10" class="form-control" name="noticeContent" required="required"></textarea>
						</td>
					</tr>
				</table>
				<div align="center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-danger">취소</button>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>