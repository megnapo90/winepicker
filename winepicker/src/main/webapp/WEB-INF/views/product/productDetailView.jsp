<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${contextPath }/resources/css/detail.css">
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	

        <main>
        <div class="product">
            <div class="product-image">
                <img src="${contextPath}/resources/images/product/${wine.wineImage.changeName}" alt="와인 이미지">
                <div class="favorite" id="favorite">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
                    </svg>
                </div>
            </div>
            <div class="product-details">
                <h2>${wine.wineName}</h2>
                <div class="tags">
                    <p>국가 : ${wine.country.countryName}</p>
                    <p>용량 : ${wine.volume} ml</p>
                </div>
                <div class="price">
                    <p>가격: ${price} 원</p>
                    
                    <div class="quantity">
                        <button class="minus">-</button>
                        <input type="number" value="1" class="quantity-input" min="1" max= "${wine.quantity}" data-wine-id="${wine.wineNo}">
                        <button class="plus">+</button>
                    </div>
                </div>
                <div class="actions">
                    <button class="cart">장바구니</button>
                    <button class="btn_order" id="order" onclick="movePage()">구매 하기</button>
                    
                   
                </div>
            </div>
            <div class="product-info">
                <div class="category">
                    <p>카테고리</p>
                    <p>${wine.wineType.wineTypeName}</p>
                </div>
                <div class="character">
                    <p>Character</p>
                    <img src="" alt="">
                </div>
            </div>
        </div>
    </main>
	
	<script>

	function movePage(){
		const bQuantityInputs = document.querySelectorAll('.quantity-input');
		 
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
	
	document.addEventListener('DOMContentLoaded', () => {
	    const quantityInputs = document.querySelectorAll('.quantity-input');

	    quantityInputs.forEach(input => {
	        const minusButton = input.previousElementSibling; // minus 버튼
	        const plusButton = input.nextElementSibling; // plus 버튼

	        minusButton.addEventListener('click', () => {
	            const currentValue = parseInt(input.value);
	            if (currentValue > 1) {
	                input.value = currentValue - 1;
	            }
	        });

	        plusButton.addEventListener('click', () => {
	            input.value = parseInt(input.value) + 1;
	        });
	    });
	});

	
 
	</script>
   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	
	
</body>
</html>