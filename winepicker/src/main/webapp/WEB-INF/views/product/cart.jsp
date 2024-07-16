
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>





.title {
	text-align: center;
	margin-top: 60px;
	margin-bottom: 30px;
	font-size: 36px;
	font-weight: bold;
	color: #333;
}

	
//* 페이지 컨테이너 */
.cart-product {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 제품 정보 */
.cart-item {
    display: flex;
    margin-bottom: 20px;
    padding: 15px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.cart-item:hover {
    background-color: #f1f1f1;
}

.cart-item img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    margin-right: 15px;
}

.cart-item-details {
    flex: 1;
}

.cart-item-details h2 {
    font-size: 1.2em;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.cart-item-details p {
    font-size: 1.1em;
    color: #555;
    margin-bottom: 10px;
}

/* 수량 입력 */
input[type="number"] {
    width: 80px;
    padding: 5px;
    margin-right: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

input[type="number"]:focus {
    border-color: #3498db;
    outline: none;
}

/* 삭제 버튼 */
.btn_remove {
    background-color: #e74c3c;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
}

.btn_remove:hover {
    background-color: #c0392b;
}

/* 구매 버튼 */
.btn_order {
    background-color: #2ecc71;
    color: #fff;
    border: none;
    padding: 15px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    margin-top: 20px;
    display: block;
    width: 100%;
    text-align: center;
}

.btn_order:hover {
    background-color: #27ae60;
}
</style>


<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>


	<div class="title">
	<p> 장바구니</p>
	</div>
	
	
<div>
    <div class="cart-product">
        <c:forEach var="cartItem" items="${wines}">
            <div class="cart-item">
                <img src="${contextPath}/resources/images/product/${cartItem.wine.wineImage.changeName}" alt="${cartItem.wine.wineName} 이미지">
                <div class="cart-item-details">
                    <h2>${cartItem.wine.wineName}</h2>
                    <p>가격: ${cartItem.wine.price} 원</p>
                    <p>수량: ${cartItem.cartQty}</p>
                    <input type="hidden" name="wineNos" value="${cartItem.wine.wineNo}">
                    <input type="number" id="quantity-${cartItem.wine.wineNo}" name="quantities" min="1" value="${cartItem.cartQty}" data-price="${cartItem.wine.price}" data-wine-id="${cartItem.wine.wineNo}">
                	<button type="button" class="btn_remove" data-wine-id="${cartItem.wine.wineNo}">삭제</button>
                </div>
            </div>
        </c:forEach>
        <button class="btn_order" id="order" onclick="movePage()">구매하기</button>
    </div>
</div>

<script>

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.btn_remove').forEach(button => {
        button.addEventListener('click', (event) => {
            const wineId = event.target.dataset.wineId;

            // 확인 다이얼로그
            if (confirm('정말로 이 제품을 장바구니에서 삭제하시겠습니까?')) {
                fetch(`${contextPath}/product/cart/remove`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        wineNo: wineId
                    })
                })
                .then(response => {
                    if (response.ok) {
                        // 삭제가 성공하면 페이지를 새로고침하여 업데이트된 장바구니를 반영
                        location.reload();
                    } else {
                        alert('삭제에 실패했습니다. 다시 시도해 주세요.');
                    }
                });
            }
        });
    });


    document.querySelector('#order').addEventListener('click', movePage);
});









function movePage(){
	const bQuantityInputs = document.querySelectorAll('input[name="quantities"]');
	 
	const wineNos = [];
	const bQuantities = [];
	
	bQuantityInputs.forEach(input=>{
			wineNos.push(input.dataset.wineId)
	        bQuantities.push(input.value);
			
	});
	
	const cartJSON = JSON.stringify(wineNos.map((wineNo, index) => ({
        wineNo: wineNo,
        bQuantity: bQuantities[index]
    })));
	
	location.href = `${contextPath}/product/order?cart=\${encodeURIComponent(cartJSON)}`;
	
}


</script>
         
         
</body>
</html>