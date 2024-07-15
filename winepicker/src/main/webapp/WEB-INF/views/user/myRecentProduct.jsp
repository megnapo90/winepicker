<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
<link rel="stylesheet" href="${contextPath}/resources/css/userCommon.css">

<style>
/* 공통 스타일 */
body {
	margin: 0;
	padding: 0;
}

header {
	color: white;
	text-align: center;
}

.main-content {
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* 최소 높이를 화면 높이와 같게 설정 */
}

.user-common {
	
	padding: 20px;
	width: 300px;
	font-weight: bold;
}

.main-section {
	display: flex;
	flex: 1; /* 남은 공간을 모두 차지 */
}

.page-name {
	font-size: 24px;
	font-weight: bold;
}

.content {
	flex: 1;
}
/* 공통 스타일 */ 
.search-history {
	height : 100%;
	margin-top: 20px;
}

.empty-select-list {
	text-align: center;
	padding: 20px;
	color: #888;

}
.empty-select-list>p{
	padding-top : 15%;
	text-align : center;
	font-size : 20px;
}

.search-list-box {
	overflow-x: auto;
	margin-top: 20px;
}

.search-list {
	width: 100%;
	border-collapse: collapse;
}

.search-list tr{
	height: 100px;
}

.search-list tr:nth-of-type(1){
	height: 60px;
}

.search-list th, .search-list td {
	border: 1px solid #ddd;
	text-align: center;
}

.search-list th {
	background-color: #f8f8f8;
	width: 10%;
}

.search-list td p {
	margin: 0;
}

.search-list img {
	width: 50px;
	height: auto;
	margin: 0;
}


</style>

</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</header>
	<div class="main-content">
		<div class="user-common">
			<jsp:include page="/WEB-INF/views/common/userCommon.jsp" />
		</div>
		<div class="main-section">
			<div class="page-name">최근 본 상품</div>
	
	<div class="content">
		<!-- <div class="page-detail">최근 조회 상품</div> -->	
		<div class="search-history">
			<c:choose>
	
				<c:when test="${empty searchList}">
					<div class="empty-select-list">
						<p>최근 조회한 상품이 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="search-list-box">
						<table class="search-list">
							<tr>
								<th></th>
								<td><p>상품명</p></td>
								<td><p>상품설명</p></td>
								<td><p>금액</p></td>
							</tr>
	
							<c:forEach items="${searchList }" var="item">
								<tr>
									<td><img src="${contextPath}/${path }/${item.wineImage.changeName }" alt="상품 이미지"></td>
									<td><p>
											${item.wineName}
										</p></td>
									<td><p>
											${item.content}
										</p></td>
									<td><p>
											${item.price}
										</p></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</div>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>


</body>
</html>