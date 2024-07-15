<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/userCommon.css">

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
.wish-list {
	height: 100%;
	margin-top: 50px;
}

.empty-wish-list {
	text-align: center;
	padding: 20px;
	color: #888;
}

.empty-wish-list>p {
	padding-top: 15%;
	text-align: center;
	font-size: 20px;
}

.wish-list-box {
	overflow-x: auto;
	margin-top: 50px;
}

.wish-list {
	width: 100%;
	border-collapse: collapse;
}

.wish-list tr {
	height: 100px;
}

.wish-list tr:nth-of-type(1) {
	height: 60px;
}

.wish-list th, .wish-list td {
	border: 1px solid #ddd;
	text-align: center;
}
.wish-list td:nth-of-type(1) {
	width: 200px;
}

.wish-list td:nth-of-type(2) {
	width: 600px;
}


.wish-list th {
	background-color: #f8f8f8;
	width: 10%;
}

.wish-list td p {
	margin: 0;
}

.wish-list img {
	width: 50px;
	height: auto;
	margin: 0;
}

.addShoppingBag {
	margin-top: 10px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.addShoppingBag input[type="button"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
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
			<div class="page-name">관심 상품</div>

			<div class="content">
				<!-- <div class="page-detail">
			관심 상품
		</div> -->

				<div class="wish-list">

					<c:choose>
						<c:when test="${empty wishList}">
							<div class="empty-wish-list">
								<p>관심 상품이 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="wish-list-box">

								<table class="wish-list">

									<tr>
										<th></th>
										<td><p>상품명</p></td>
										<td><p>상품설명</p></td>
										<td><p>금액</p></td>
										<td><p>장바구니</p></td>
										<td><p>구매하기</p></td>
										<td><p>삭제</p></td>
									</tr>

									<c:forEach items="${wishList }" var="wish">
										<tr class="wish-item-${wish.wineNo }">
											<th><img
												src="${contextPath}/${path }/${wish.wineImage.changeName }" /></th>
											<td>${wish.wineName }</td>
											<td>${wish.content }</td>
											<td><fmt:formatNumber value="${wish.price}"
														pattern="#,###" /></td>
											<td onclick=addShoppingBag(${wish.wineNo})>장바구니</td>
											<c:choose>
												<c:when test="${wish.quantity eq 0}">

													<td><span style="color: red;">sold out</span></td>

												</c:when>
												<c:otherwise>
													<td onclick=purchaseItem(${wish.wineNo})>구매하기</td>
												</c:otherwise>
											</c:choose>
											<td onclick=removeItem(${wish.wineNo})>삭제</td>
										</tr>
									</c:forEach>
								</table>
								<div class="addShoppingBag">
									<input type="button" onclick=addShoppingBagAll(${wishList})
										value="장바구니">
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<script>
	function addShoppingBag(no){
		//장바구니 모달창에 상품 추가
	}

	function addShoppingBagAll(list){
		//관심상품 전체 장바구니 모달창에 추가	
	}
	
	function purchaseItem(no){
		//구매하기 화면으로 넘김
	}
	function removeItem(no){

		$.ajax({
			url : "${contextPath}/user/delete/myWishItem",
			data : {
				no : no
			},
			type : "get",
			success : $(".wish-item-"+no+"").remove()
		})

		
	}

</script>



	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>