
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>장바구니</h1>
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