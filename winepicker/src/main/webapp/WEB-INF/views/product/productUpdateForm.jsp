<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product update</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

   <div class="container">
        <h1>상품 수정</h1>
        <form action="${contextPath }/admin/updateWine/${wineNo}" id="updateWine" method="post" enctype="multipart/form-data">
        
            
            <label for="wineName">와인 이름:</label>
            <input type="text" id="wineName" name="wineName" value="${wine.wineName }" required>

			<label for="grapeNo">품종:</label>
            <select id="grapeNo" name="grapeNo" required>
                <option value="1" ${wine.grapeNo == 1 ? 'selected' : ''}>카베르네 소비뇽</option>
                <option value="2" ${wine.grapeNo == 2 ? 'selected' : ''}>>메를로</option>
                <option value="3" ${wine.grapeNo == 3 ? 'selected' : ''}>>피노 누아</option>
                <option value="4" ${wine.grapeNo == 4 ? 'selected' : ''}>>쉬라</option>
                <option value="5" ${wine.grapeNo == 5 ? 'selected' : ''}>>그 외 (레드 와인)</option>
                <option value="6" ${wine.grapeNo == 6 ? 'selected' : ''}>>샤르도네</option>
                <option value="7" ${wine.grapeNo == 7 ? 'selected' : ''}>>소비뇽 블랑</option>
                <option value="8" ${wine.grapeNo == 8 ? 'selected' : ''}>>리슬링</option>
                <option value="9" ${wine.grapeNo == 9 ? 'selected' : ''}>>그 외 (화이트 와인)</option>
                <option value="10" ${wine.grapeNo == 10 ? 'selected' : ''}>>샤르도네 (스파클링)</option>
                <option value="11" ${wine.grapeNo == 11 ? 'selected' : ''}>>소비뇽 블랑 (스파클링)</option>
                <option value="12" ${wine.grapeNo == 12 ? 'selected' : ''}>>뮈스카</option>
                <option value="13" ${wine.grapeNo == 13 ? 'selected' : ''}>>그 외 (스파클링)</option>
            </select>

            <label for="countryNo">나라:</label>
            <select id="countryNo" name="countryNo" required>
                <option value="1" ${wine.countryNo == 1 ? 'selected' : ''}>프랑스</option>
                <option value="2" ${wine.countryNo == 2 ? 'selected' : ''}>이탈리아</option>
                <option value="3" ${wine.countryNo == 3 ? 'selected' : ''}>미국</option>
                <option value="4" ${wine.countryNo == 4 ? 'selected' : ''}>칠레</option>
                <option value="5" ${wine.countryNo == 5 ? 'selected' : ''}>호주</option>
                <option value="6" ${wine.countryNo == 6 ? 'selected' : ''}>그 외</option>
            </select>

            <label for="vintage">빈티지:</label>
            <input type="number" id="vintage" name="vintage" value="${wine.vintage }" required>

            <label for="price">가격(원):</label>
            <input type="number" id="price" name="price" value="${wine.price }" required>
				
			 <label for="volume">용량 (ml):</label>
            <select id="volume" name="volume" required>
                <option value="750" ${wine.volume == 750 ? 'selected' : ''}>750</option>
                <option value="375" ${wine.volume == 375 ? 'selected' : ''}>375</option>
            </select>


            <label for="quantity">수량:</label>
            <input type="number" id="quantity" name="quantity" value="${wine.quantity }" required>

            <label for="content">내용:</label>
            <textarea id="content" name="content">${wine.content }</textarea>

			<label for="status">판매등록  :</label>
           
              <select id="status" name="status" required>
   				<option value="Y" ${wine.status == Y ? 'selected' : ''} >Y</option>
                <option value="N" ${wine.status == N ? 'selected' : ''} >N</option>
            </select>
            
              
        <label for="body">바디:</label>
        <input type="number" id="body" name="body" min="1" max="5" value="${wine.characteristic.body }" required>

        <label for="sweet">단맛:</label>
        <input type="number" id="sweet" name="sweet" min="1" max="5" value="${wine.characteristic.sweet }" required>

        <label for="bitter">쓴맛:</label>
        <input type="number" id="bitter" name="bitter" min="1" max="5" value="${wine.characteristic.bitter }" required>

        <label for="sour">신맛:</label>
        <input type="number" id="sour" name="sour" min="1" max="5" value="${wine.characteristic.sour }" required>


		<label>이미지 파일:</label><br> 
		<input type="file" id="upfile" name="upfile"><br> 
		<span id="originName">${wine.wineImage.originName}</span><br><br>
		<input type="submit" value="이미지 수정">
		
		<label>현재 이미지:</label><br> 
		
		
		<img id="currentImage1" src="${contextPath }/resources/images/product/${wine.wineImage.changeName}"/>

		<!-- 수정, 취소, 삭제 버튼 -->
    <button type="submit" formaction="${contextPath}/admin/update/${wineNo}" name="action" value="update">수정</button>
    <button type="submit" formaction="${contextPath}/admin/cancelWine/${wineNo}" name="action" value="cancel">취소</button>
    <button type="submit" formaction="${contextPath}/admin/deletewine/${wineNo}" name="action" value="delete">삭제</button>

	</form>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>