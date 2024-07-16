<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.new-wine {
	text-align: center; /* 텍스트 중앙 정렬 */
	margin: 50px;
}

.new-wine ul {
	list-style-type: none; /* 목록의 기본 점 제거 */
	padding: 0; /* 기본 패딩 제거 */
	margin: 0; /* 기본 마진 제거 */
}

.new-wine li {
	margin: 0; /* 기본 여백 제거 */
	padding: 0; /* 기본 패딩 제거 */
}

.new-wine-title {
	font-size: 36px;
	font-weight: bold; /* 글씨 굵게 */
	color: #333; /* 텍스트 색상 */
	margin-bottom: 10px; /* 하단 여백 추가 */
}

.new-wine li:not(.new-wine-title) {
	font-size: 12px; /* 폰트 크기 조정 */
	color: #555; /* 텍스트 색상 */
}

/* 페이지 컨테이너 */
.order-page-container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 제품 정보 */
.product-info {
	display: flex;
	margin-bottom: 20px;
	padding: 15px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product-info:hover {
	background-color: #f1f1f1;
}

.product-image {
	width: 120px;
	height: 120px;
	object-fit: cover;
	margin-right: 15px;
}

.product-details {
	flex: 1;
}

.product-name {
	font-size: 1.2em;
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
}

.product-price {
	font-size: 1.1em;
	color: #e74c3c;
	margin-bottom: 10px;
}

.product-info p {
	margin: 5px 0;
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

/* 배송 정보 */
h2 {
	margin-top: 30px;
	margin-bottom: 15px;
	font-size: 1.5em;
	color: #2c3e50;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	color: #333;
}

input[type="text"], input[type="email"] {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

input[type="text"]:focus, input[type="email"]:focus {
	border-color: #3498db;
	outline: none;
}

/* 우편번호 찾기 버튼 */
input[type="button"] {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 15px;
}

input[type="button"]:hover {
	background-color: #2980b9;
}

/* 제출 버튼 */
button[type="submit"] {
	background-color: #2ecc71;
	color: #fff;
	border: none;
	padding: 15px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
	margin-left: auto;
	display: block;
}

button[type="submit"]:hover {
	background-color: #27ae60;
}
</style>




<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />



	<div class="new-wine">
		<ul>
			<li class="new-wine-title">주문하기</li>
			<li>Order</li>
		</ul>

	</div>
	<hr>

	<div class="order-page-container">
		<form action="order" method="post">
			<c:forEach var="wineExt" items="${wines }">
				<div class="product-info" data-href="detail/${wineExt.wineNo }"
					data-price="${wineExt.price}" data-wine-no="${wineExt.wineNo }">
					<img class="product-image"
						src="/winepicker/resources/images/product/${wineExt.wineImage.changeName}"
						alt="${wineExt.wineName} 이미지">
					<div class="product-details">
						<h2 class="product-name">${wineExt.wineName}</h2>
						<p class="product-price" id="formattedPrice-${wineExt.wineNo}">
							${wineExt.price}</p>
						<p>
							<label for="quantity-${wineExt.wineNo}">수량:</label> <input
								type="number" id="quantity-${wineExt.wineNo}" name="quantities"
								min="1" value="${wineExt.BQuantities }" required
								data-price="${wineExt.price}" data-wine-no="${wineExt.wineNo}">
							<input type="hidden" name="wineNos" value="${wineExt.wineNo}">
						</p>
						<button type="button" class="remove-item"
							data-wine-no="${wineExt.wineNo}">삭제</button>
					</div>
				</div>
			</c:forEach>


			<h2>배송 정보</h2>
			<label for="name">이름:</label> <input type="text" id="name"
				name="name" required> <label for="phone">전화번호:</label> <input
				type="text" id="phone" name="phone" class="phone-input"
				placeholder="예: 010-1234-5678" required> <label for="email">이메일:</label>
			<input type="email" id="email" name="email" required> <label
				for="address">주소:</label> <input type="button"
				onclick="execDaumPostcode()" value="우편번호 찾기"> <br> <input
				type="text" id="address" name="address" placeholder="주소" required>
			<br> <input type="text" id="postcode" name="postcode"
				placeholder="우편번호" required> <input type="text"
				id="detailAddress" name="detailAddress" placeholder="상세주소입력"
				required>


			<button type="submit">주문하기</button>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		//카카오 주소등록 
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}

							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr
									+ extraAddr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}
		//카카오 주소등록 끝  

		//갯수가 변할떄 처리
		document.addEventListener(
						'DOMContentLoaded',
						function() {
							document
									.querySelectorAll(
											'input[name="quantities"]')
									.forEach(
											function(quantityInput) {
												quantityInput
														.addEventListener(
																'input',
																function(event) {

																	let quantity = parseInt(
																			event.target.value,
																			10) || 0;
																	let price = parseInt(event.target
																			.getAttribute('data-price'));

																	let totalPrice = price
																			* quantity;
																	let wineNo = event.target
																			.getAttribute('data-wine-no');

																	const formattedPrice = new Intl.NumberFormat(
																			'ko-KR')
																			.format(totalPrice);
																	document
																			.getElementById(`formattedPrice-\${wineNo}`).textContent = formattedPrice;
																});

												quantityInput
														.dispatchEvent(new Event(
																'input'));
											});
						});
	
		
		
		
		
		
		
		
		
		document.addEventListener('DOMContentLoaded', () => {

		    const removeButtons = document.querySelectorAll('.remove-item');
		    
		    removeButtons.forEach(button => {
		        button.addEventListener('click', () => {
		            
		            const wineNo = button.getAttribute('data-wine-no');
		            
		          
		            const productInfo = button.closest('.product-info');
		            productInfo.remove();

		           
		            const wineNosInput = document.querySelector('input[name="wineNos"]');
		            if (wineNosInput) {
		                const wineNos = Array.from(document.querySelectorAll('input[name="wineNos"]'));
		                const newWineNos = wineNos.filter(input => input.value !== wineNo);
		                newWineNos.forEach(input => input.remove());
		            }
		        });
		    });
		});
		
		
		
		
		
		</script>





</body>
</html>