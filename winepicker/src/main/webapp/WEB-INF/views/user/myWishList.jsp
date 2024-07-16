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
.close-button {
	cursor: pointer;
	color: red;
}
.button{
	cursor: pointer;
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
											<td class="button" onclick=addToCart(${wish.wineNo})>담기</td>
											<c:choose>
												<c:when test="${wish.quantity eq 0}">
													<td><span style="color: red;">sold out</span></td>
												</c:when>
												<c:otherwise>
													<td class="button" id="quantity-input" data-wine-no="${wish.wineNo}" onclick=movePage(${wish.wineNo})>구매</td>
												</c:otherwise>
											</c:choose>
											<td onclick=removeItem(${wish.wineNo})>
												<span class="close-button">X</span>
											</td>
										</tr>
									</c:forEach>
								</table>
								<!-- <div class="addShoppingBag">
									<input type="button" onclick=purchaseAllItem(); value="전체구매">
								</div> -->
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<script>
	/* function addToCart(wineNo) {
        
        const quantity = 1;
	
        $.ajax({
        	url : "${contextPath}/product/addToCart",
        	data : {
        		wineNo : wineNo,
        		quantity : quantity
        	},
        	method : "POST",
        	success : function(){
        		window.location.href = `${contextPath}/product/cart`; // 장바구니 페이지로 이동
        	},
        	error : function(){
        		alert("장바구니 담기에 실패하였습니다.");
        	}

        })
         */
        function addToCart(wineNo) {
	        const quantity = 1;
	        if (quantity > 0) {
	            fetch(`${contextPath}/product/addToCart`, {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify({ wineNo: wineNo, quantity: quantity })
	            })
	            .then(response => response.text())
	            .then(data => {
	                alert(data); // 예시: 'Item added to cart'
	                window.location.href = `${contextPath}/product/cart`; // 장바구니 페이지로 이동
	            })
	            .catch(error => console.error('Error:', error));
	        } 
	    }

	function movePage(wineNo){
		/* const bQuantityInputs = document.querySelectorAll('.quantity-input');*/
		 
		const wineNos = [];
		const bQuantities = [];
		
		wineNos.push(wineNo)
		bQuantities.push(1);
		
		const cartJSON = JSON.stringify(wineNos.map((wineNo, index) => ({
	        wineNo: wineNo,
	        bQuantity: bQuantities[index]
	    })));
		
		location.href = `${contextPath}/product/order?cart=\${encodeURIComponent(cartJSON)}`;
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
	
	/* function addToCart(wineNo) {
        const quantityInput = document.querySelector(`input[data-wine-id='\${wineNo}']`);
        const quantity = parseInt(quantityInput.value);
	
        if (quantity > 0 && quantity <= quantityInput.max) {
            fetch(`${contextPath}/product/addToCart`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ wineNo: wineNo, quantity: quantity })
            })
            .then(response => response.text())
            .then(data => {
                alert(data); // 예시: 'Item added to cart'
                window.location.href = `${contextPath}/product/cart`; // 장바구니 페이지로 이동
            })
            .catch(error => console.error('Error:', error));
        } else {
            alert('유효한 수량을 입력하세요.');
        }
    } */

</script>



	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>
</html>