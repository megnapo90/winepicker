<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>
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
.review-list-search {
	height: 100%;
	margin-top: 50px;
}

.review-list-search .date-filter {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.date-filter form {
	display: flex;
	align-items: center;
}

.date-filter input[type="date"] {
	padding: 5px;
	margin: 0 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.date-filter input[type="submit"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.empty-review-list {
	text-align: center;
	padding: 20px;
	color: #888;
}

.empty-review-list>p {
	padding-top: 15%;
	text-align: center;
	font-size: 20px;
}

.review-list-box {
	overflow-x: auto;
	margin-top: 20px;
}

.show-review-list {
	width: 100%;
	border-collapse: collapse;
}

.show-review-list tr {
	height: 100px;
}

.show-review-list tr:nth-of-type(1) {
	height: 60px;
}

.show-review-list th, .show-review-list td {
	border: 1px solid #ddd;
	text-align: center;
}

.show-review-list th {
	background-color: #f8f8f8;
	width: 10%;
}

.show-review-list td p {
	margin: 0;
}


.review-notice {
	margin-top: 20px;
	margint-left: 10px;
}

.show-review-list img {
	width: 50px;
	height: auto;
	margin: 0;
}

#available-review {
	font-weight: 300px;
	cursor: pointer;
}

.review-notice {
	margin-top: 20px;
	margint-left: 10px;
}

</style>

<c:if test="${not empty errorMsg}">
	<script>
	    	alert('${errorMsg}');	
	    </script>
	<c:remove var="errorMsg" />
</c:if>
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

			<div class="page-name">리뷰 관리</div>
			<div class="content">
			
				<div class="review-list-search">

					<div class="date-filter">
						<form action="searchMyReview" method="post">
							<input type="date" name="startDate"
								value=${not empty paramMap.startDate ? paramMap.startDate : today}>&nbsp;~&nbsp;
							<input type="date" name="endDate"
								value=${not empty paramMap.endDate ? paramMap.endDate : today }>&nbsp;
							<input type="submit" value="조회">
						</form>
					</div>

					<c:choose>
						<c:when test="${empty reviewList}">

							<div class="empty-review-list">
								<p>리뷰하실 상품이 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>

							<div class="review-list-box">

								<table class="show-review-list">
									<tr>
										<th></th>
										<td><p>주문번호</p></td>
										<td><p>주문일자</p></td>
										<td><p>상품명</p></td>
										<td><p>수량</p></td>
										<td><p>금액</p></td>
										<td><p>배송상태</p></td>
										<td><p>리뷰관리</p></td>
									</tr>

									<c:forEach items="${reviewList }" var="item">
										<tr>
											<td><img
												src="${contextPath}/${path }/${item.wineImage.changeName }"
												alt="상품 이미지"></td>
											<td><p>${item.orderNo}</p></td>
											<td><p>${item.orderDate}</p></td>
											<td><p>${item.wine.wineName}</p></td>
											<td><p>${item.qty}</p></td>
											<td><p>
													<fmt:formatNumber value="${item.wine.price}"
														pattern="#,###" />
												</p></td>
											<td><p>${item.DStatus == 3 ? '배송완료' : item.DStatus == 2 ? '배송중' : '배송전'}</p></td>
											<c:if test="${item.DStatus ne 3}">
												<td><p>작성불가</p></td>
											</c:if>
											<c:if
												test="${item.DStatus eq 3 and item.review.content ne null }">
												<td
													onclick="location.href='${contextPath}/user/review/detail/${item.orderNo}'">
													<p style="color: green;">리뷰확인</p>
												</td>
											</c:if>
											<c:if
												test="${item.DStatus eq 3 and item.review.content eq null }">
												<td id="available-review"
													onclick="location.href='${contextPath}/user/review/enroll/${item.orderNo}'">
													<p style="color: blue;">작성하기</p>
												</td>
											</c:if>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div class="review-notice">
								<div class="notice-detail">
									<div>리뷰는 주문 후 30일까지 작성 가능합니다.</div>
									<div>주문 이후 30일 지난 시점부터 작성 불가하니 참고하여 주시기 바랍니다.</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				<!-- .purchase-history -->
			</div>
			<!-- .content -->
		</div>
		<!-- .main-section -->
	</div>
	<!-- .main-content -->

	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
	
</body>
</html>