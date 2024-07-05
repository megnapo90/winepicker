<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="section">

	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>공지사항</h2>
			<br>
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${notice.noticeTitle}</td>
					<td><input type="button" value="삭제" onclick='location.href = "${contextPath}/admin/deleteNotice/"+${notice.noticeNo}'></td>
					<td><input type="button" value="수정" onclick='location.href = "${contextPath}/admin/updateNotice/"+${notice.noticeNo}'></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${notice.createDate}</td>
				</tr>
				
				<c:if test="${board.attachment ne null}">
					<tr>
						<th>첨부파일</th>
						<td>
							<button type="button" class="btn btn-outline-success btn-block"
							onclick="location.href='${contextPath}/board/fileDownload/${board.boardNo}'">
							${board.attachment.originName} - 다운로드</button>
						</td>
					</tr>
				</c:if>
				
				<c:if test="${boardCode == 'P'}">
					<c:set var="imgList" value="${board.imgList}" />

					<c:if test="${not empty imgList }">
						<c:forEach var="i" begin="0" end="${fn:length(imgList) - 1}">
							<tr>
								<th>이미지${i+1 }</th>
								<td colspan="3">
									<a href="${contextPath}/resources/images/board/${boardCode}/${imgList[i].changeName}"
									download="${imgList[i].originName}"> 
										<img src="${contextPath}/resources/images/board/${boardCode}/${imgList[i].changeName}">
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</c:if>
				<tr>
					<th>내용</th>
					<td colspan="4">
						<p style="height: 150px;">${notice.noticeContent}</p>
					</td>
				</tr>
			</table>
			<br>

			<br>
			<br>

		</div>
	</div>
	
</div>

<script>
function deleteNotice(elem){
	location.href = "${contextPath}/admin/deleteNotice"+noticeNo;
};
</script>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>


</body>
</html>