<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 등록</title>
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
.my-review {
	height: 100%;
	margin-top: 50px;
}

.my-review .review-item-header {
	height: 5%;
	display: flex;
	align-items: flex-start;
}

.review-item-header div {
	font-style: italic;
	font-size: 20px;
	font-weight: 400;
	width: 20%;
	height: 100%;
	margin: auto;
	display: flex;
}

.review-item-header div p {
	margin-top: 7px;
	text-align: left;
}

.review-box {
	overflow-x: auto;
	padding: 20px;
}

.review-insert-container {
	padding: 20px;
	width: 70%;
}

.review-item-header div {
	display: flex;
}

.review-item-body {
	overflow-x: auto;
	width: 100%;
	border-collapse: collapse;
}

.review-item-body tr {
	height: 100px;
}

.review-item-body tr:nth-of-type(1) {
	height: 60px;
}

.review-item-body th, .review-item-body td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.review-item-body th {
	background-color: #f8f8f8;
	width: 20%;
}

.review-item-body td p {
	margin: 0;
}

.review-item-body th p {
	margin: 0;
}

.review-insert-form {
	margin-top: 30px;
}

.review-insert {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #ddd;
}

.review-insert div {
	display: flex;
	padding-top: 30px;
	align-items: baseline;
	justify-content: center;
}

.review-insert div p {
	width: 10%;
	text-align: center;
}

.review-title #title {
	width: 50%;
    height: auto;
    font-size: 15px;
}

.review-content {
	height: 40px;
}

.review-enroll {
	margin-right: 40px;
	margin-top: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.review-enroll input[type="submit"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

/* 별점  */
.rating {
	display: flex;
	align-items: center;
	height: 150px;
}
#point {
	width: 200px;
	margin-right: 10px;
}
.star-output {
	font-size: 1.5em;
	
}

</style>
<c:if test="${not empty errorMsg}">
	<script>
		alert('${errorMsg}');	
	</script>
	<c:remove var="errorMsg" />
</c:if>

<script>
        document.addEventListener('DOMContentLoaded', function() {
            const rangeInput = document.getElementById('point');
            const starOutput = document.getElementById('star-output');

            rangeInput.addEventListener('input', function() {
                starOutput.textContent = rangeInput.value;
            });
        });
</script>

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
				
				<div class="my-review">

						<div class="review-insert-container">
							<div class="review-item-header">
								<div>
									<p>주문번호 :</p>
									<p>${review.orderNo}</p>
								</div>
								<div>
									<p>주문일자 :</p>
									<p>${review.orderDate}</p>
								</div>
							</div>

							<table class="review-item-body">
								<tr>
									<th><p></p></th>
									<td><p>상품명</p></td>
									<td><p>상품정보</p></td>
									<td><p>수량</p></td>
									<td><p>금액</p></td>
								</tr>

								<tr>
									<th><img
										src="${contextPath}/${path }/${review.wineImage.changeName }"
										alt="상품 이미지"></th>
									<td><p>${review.wine.wineName}</p></td>
									<td><p>${review.wine.content}</p></td>
									<td><p>${review.qty}</p></td>
									<td><p><fmt:formatNumber value="${review.wine.price}"
														pattern="#,###" /></p></td>
								</tr>
							</table>

							<div class="review-insert-form">
								<form
									action="${contextPath}/user/review/insert/${review.orderNo}"
									id="enrollForm" method="post">
									<div class="review-insert">
										<div class="review-title">
											<p>한줄평</p>
											<input type="text" id="title" name="reveiwContent" required
												placeholder="한줄평을 등록하세요. (50자 이내)">
										</div>
										<div class="rating">
											<p>만족도</p>
									        <input type="range" min="0.0" max="5.0" step="0.5" id="point" name="reveiwPoint" value="0.0">
									        <div class="star-output" id="star-output">0.0</div>
										</div>
									</div>

									<div class="review-enroll">
										<input type="submit" id="formSubmit" value="등록">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>