<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.titleblock {
	padding: 60px;
}

.products-container {
	display: flex;
	flex-wrap: wrap;
	margin-right: 100px;
	margin-left: 100px;
}

.products-image {witdth
	
}

.title {
	font-size: 2.5em;
	font-weight: bold;
	margin: 0;
	color: #e74c3c;
}

.product-image {
	position: relative; /* 이 속성으로 하위 요소를 절대 위치로 설정할 수 있게 합니다. */
	width: 450px;
	margin-right: 100px; /* 이미지의 너비를 450px로 설정합니다. */
}

.product-image img {
	width: 100%; /* 이미지를 div의 너비에 맞게 조절합니다. */
	height: auto; /* 이미지의 높이를 자동으로 조절하여 비율을 유지합니다. */
	display: block; /* 이미지를 블록 요소로 만들어 아래쪽의 여백을 제거합니다. */
}

.product-info {
	display: flex; /* Flexbox 레이아웃 사용 */
	gap: 20px; /* 요소 사이의 간격 설정 */
	margin-top: 5px; /* 상단 여백 */
	width: 450px;
}

.category {
	display: flex;
	width: 220px;
	flex-direction: column;
	align-items: center;
	text-align: center;
	margin-left: 2.5px;
	margin-right: 2.5px;
}

.image-container {
	position: relative;
	display: inline-block;
}

.image-container img {
	width: 100%; /* 이미지 크기를 컨테이너에 맞추기 위해 필요시 조정 */
	height: auto;
}

.centered-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white; /* 필요에 따라 텍스트 색상 조정 */
	font-size: 20px; /* 필요에 따라 텍스트 크기 조정 */
	text-align: center;
	background-color: rgba(0, 0, 0, 0.5); /* 필요에 따라 배경색 조정 */
	padding: 10px; /* 필요에 따라 패딩 조정 */
}

.character {
	display: flex; /* Flexbox 사용 */
	width: 220px;
	justify-content: space-between; /* 요소 사이의 여백을 동일하게 분배 */
	box-sizing: border-box;
}

.character p {
	width: 25%; /* 4등분 */
	box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
	margin: 0; /* 기본 마진 제거 */
	padding: 10px; /* 패딩 추가 (필요에 따라 조정) */
	text-align: center; /* 텍스트 가운데 정렬 */
	font-size: 14px;
}

.favorite {
	position: absolute; /* 절대 위치를 사용하여 요소를 div의 상단 오른쪽에 배치합니다. */
	top: 10px; /* 상단에서 10px 떨어지게 합니다. */
	right: 10px; /* 오른쪽에서 10px 떨어지게 합니다. */
	background: rgba(255, 255, 255, 0.8); /* 흰색 배경에 투명도를 설정합니다. */
	border-radius: 50%; /* 둥근 모양으로 만듭니다. */
	padding: 10px; /* 아이콘의 주변 여백을 설정합니다. */
	cursor: pointer; /* 마우스 오버 시 손가락 모양으로 변경됩니다. */
}

.favorite svg {
	width: 24px; /* 아이콘의 너비를 24px로 설정합니다. */
	height: 24px; /* 아이콘의 높이를 24px로 설정합니다. */
	fill: #e74c3c; /* 아이콘의 색상을 빨간색으로 설정합니다. */
}

.product-details {
	flex: 1;
	padding
	20px;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<div class="titleblock"></div>



	<div class="products-container">

		<div class="product">
			<div class="product-image">
				<img
					src="${contextPath}/resources/images/product/${wine.wineImage.changeName}"
					alt="${wine.wineName} 이미지">
				<div class="favorite" id="favorite"
					onclick=insertWish(${wine.wineNo})>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path
							d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
                    </svg>
				</div>
			</div>


			<div class="product-info">
				<div class="category">
					<div class="image-container">
						<img
							src="${contextPath}/resources/css/images/product/type/type${wine.grape.wineTypeNo}.svg"
							alt="${wine.wineType.wineTypeName}">
						<p>${wine.wineType.wineTypeName}</p>
					</div>

				</div>
				<div class="character">
					<p>당도 1</p>
					<p>산도 1</p>
					<p>떫음 1</p>
					<p>바디 1</p>

				</div>
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
					<input type="number" value="1" class="quantity-input" min="1"
						max="${wine.quantity}" data-wine-id="${wine.wineNo}">
					<button class="plus">+</button>
				</div>
			</div>
			<div class="actions">
				<button class="cart" onclick="addToCart(${wine.wineNo})">장바구니</button>
				<button class="btn_order" id="order" onclick=movePage()>구매하기</button>
			</div>
		</div>




	</div>
   	
   	<script>

	 function addToCart(wineNo) {
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
	            .then(response => {
	                if (!response.ok) {
	                    throw new Error('Network response was not ok');
	                }
	                return response.text();
	            })
	            .then(data => {
	                alert(data); // 예시: 'Item added to cart'
	                window.location.href = `${contextPath}/product/cart`; // 장바구니 페이지로 이동
	            })
	            .catch(error => {
	            	console.error('Error:', error);
	            	
	            	window.location.href = `${contextPath}/common/errorPage`; // 에러 페이지로 이동
	            });
	        } else {
	            alert('유효한 수량을 입력하세요.');
	        }
	    };

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
		
	};
	
		
   	/* function insertWish(wineNo){
   		$.ajax({
   			url : "${contextPath}/product/insert/myWishItem",
   			data : {
   				wineNo : wineNo
   			},
   			success : function(){
   				alert(${alertMsg});
   			},
   			error : console.log()
   		});
   	}; */
   	 
	
	
	
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
	
	document.addEventListener('DOMContentLoaded', () => {
		
	    var btn = document.getElementById("favorite");

	    btn.addEventListener('click', function(){
	              btn.classList.toggle('active');
	      });
	});

	</script>

   	
   	
   	
   
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>



</body>
</html>