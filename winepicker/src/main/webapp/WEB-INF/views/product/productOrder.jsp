<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f4f4f4;
}

.order-page-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

h1, h2 {
    text-align: center;
    margin-bottom: 20px;
}

.product-info {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.product-image {
    width: 100px;
    height: 100px;
    object-fit: cover;
    margin-right: 20px;
}

.product-details {
    flex-grow: 1;
}

.product-name {
    font-size: 20px;
    margin-bottom: 10px;
}

.product-price {
    font-size: 18px;
    color: #555;
    margin-bottom: 10px;
}

.product-details label {
    font-weight: bold;
}

.product-details input {
    width: 60px;
    padding: 5px;
    margin-top: 10px;
}

.order-form {
    display: flex;
    flex-direction: column;
}

.order-form label {
    margin-bottom: 5px;
    font-weight: bold;
}

.order-form input {
    margin-bottom: 15px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.order-form button {
    background-color: #28a745;
    color: #fff;
    border: none;
    cursor: pointer;
    font-size: 16px;
    padding: 10px;
    border-radius: 5px;
}

.order-form button:hover {
    background-color: #218838;
}



</style>




<body>
<div class="order-page-container">

    <h1>주문 페이지</h1>
    
    <form action="order" method="post">
    <c:forEach var="wineExt" items="${wines }">
    	
        <div class="product-info" data-href="detail/${wineExt.wineNo }" data-price="${wineExt.price}" data-wine-no="${wineExt.wineNo }">
            <img class="product-image" src="/winepicker/resources/images/product/${wineExt.wineImage.changeName}"
                 alt="${wineExt.wineName} 이미지">
            <div class="product-details">
                <h2 class="product-name">${wineExt.wineName}</h2>
                <p class="product-price" id="formattedPrice">
                    ${wineExt.price * quantity}
                </p>
                <p>
                    <label for="quantity-${wineExt.wineNo}">수량:</label>
                    <input type="number" id="quantity" name="quantities" min="1" value="${wineExt.BQuantities }"  required
                           data-price="${wineExt.price}" data-wine-no="${wineExt.wineNo}">
                      <input type="hidden" name="wineNos" value="${wineExt.wineNo}">
                </p>
                
                
            </div>
        </div>
    </c:forEach>
       
        
            <h2>배송 정보</h2>
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required>
            
             <label for="phone">전화번호:</label>
        	<input type="text" id="phone" name="phone" class="phone-input" placeholder="예: 010-1234-5678" required>	

            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>

            <label for="address">주소:</label>      
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="address" name="address" placeholder="주소" required><br>
			<input type="text" id="postcode" name="postcode" placeholder="우편번호" required>
			<input type="text" id="detailAddress" name = "detailAddress" placeholder="상세주소입력" required>


            <button type="submit">주문하기</button>
           </form>
    </div>
	
	


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	//카카오 주소등록 
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
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
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                   
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr + extraAddr ;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }
	    //카카오 주소등록 끝  
  
	    //갯수가 변할떄 처리
	    
		
	    
	    
	   
	    
	    
	    
	</script>
	
	
    
	
	

</body>
</html>