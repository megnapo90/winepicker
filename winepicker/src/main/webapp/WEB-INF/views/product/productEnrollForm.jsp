<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와인 등록 </title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: 0 auto;
    background-color: #ffffff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

h1 {
    text-align: center;
    color: #333333;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin: 10px 0 5px;
    color: #555555;
}

input, select, textarea, button {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #dddddd;
    border-radius: 4px;
    font-size: 16px;
}

input:focus, select:focus, textarea:focus {
    border-color: #aaaaaa;
    outline: none;
}

button {
    background-color: #007BFF;
    color: #ffffff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}
#fieldset{
	margin-top: 10px;
}
</style>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<jsp:include page="/WEB-INF/views/admin/adminList.jsp" />

<div class="section">

   <div class="container">
        <h1>와인 등록</h1>
        <form action="${contextPath}/admin/enrollWine" id="enrollWine" method="post" enctype="multipart/form-data">
            
            <label for="wineName">와인 이름:</label>
            <input type="text" id="wineName" name="wineName" required>

			<label for="wineTypeNo">와인타입:</label>
			<select name="wineTypeNo" id="wineTypeNo">
				<option>와인타입 선택(필수)</option>
				<c:forEach var="wineType" items="${wtList}">
					<option value="${wineType.wineTypeNo}" class="wineType">${wineType.wineTypeName} ${wineType.wineTypeNo}</option>
				</c:forEach>
			</select>
			<input type="button" value="선택" onclick="selectWineType()">

			<label for="grapeNo">품종:</label>
            <select id="grapeNo" name="grapeNo" required>
            </select>

            <label for="countryNo">나라:</label>
            <select id="countryNo" name="countryNo" required>
                <c:forEach var="country" items="${cList}">
            		<option value="${country.countryNo}">${country.countryName}</option>
            	</c:forEach>
            </select>
			
			<br>
			
			<fieldset name="characteristic" id="fieldset">
			<legend>특성</legend>
	            <label for="body">바디:</label>
	            <input type="number" id="body" name="body" max="5" min="0" required>
	            <label for="body">당도:</label>
	            <input type="number" id="sweet" name="sweet" max="5" min="0" required>
	            <label for="body">탄닌:</label>
	            <input type="number" id="bitter" name="bitter" max="5" min="0" required>
	            <label for="body">산도:</label>
	            <input type="number" id="sour" name="sour" max="5" min="0" required>
            </fieldset>

            <label for="vintage">빈티지:</label>
            <input type="number" id="vintage" name="vintage" min="2000">

            <label for="price">가격(원):</label>
            <input type="number" id="price" name="price" min="10000" step="1000" required>
				
			 <label for="volume">용량 (ml):</label>
            <select id="volume" name="volume" required>
                <option value="750">750</option>
                <option value="375">375</option>
            </select>


            <label for="quantity">수량:</label>
            <input type="number" id="quantity" name="quantity" min="0" required>

            
            
            <label for="content">내용:</label>
            <textarea id="content" name="content"></textarea>

			<label for="status">판매등록  :</label>
            <select id="status" name="status" required>
                <option value="Y">Y</option>
                <option value="N">N</option>
            </select>


            <label>이미지 파일:</label>
            <input type="file" id="upfile" name="upfile" >

            <button type="submit">등록</button>
        </form>
    </div>
    
</div>
    
    <script>
		function selectWineType() {
			
			var $num = $("select[name=wineTypeNo] option:selected").val();
			
			$.ajax({
	    		url: "${contextPath}/admin/wineTypeList",
	    		data:{
	    			wineTypeNo : $num
	    		},
	    		success : (gList)=>{
                	$("#grapeNo").empty();
	                $.each(gList, function(index, value){
	                	var num = value.grapeNo;
	                    $("#grapeNo").append(`<option value=\${num}>\${value.grapeName}</option>`)
	                })
	    		},
	    		error : (xhr)=>{
	    			$("#grapeNo").empty();
	    			console.log(xhr);
	    		}
	    	});
		};
	    
    </script>
    
	
</body>
</html>

