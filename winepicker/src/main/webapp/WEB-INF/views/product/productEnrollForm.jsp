<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>



<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

   <div class="container">
        <h1>와인 등록</h1>
        <form action="${contextPath }/admin/enrollWine" id="enrollWine" method="post" enctype="multipart/form-data">
            
            <label for="wineName">와인 이름:</label>
            <input type="text" id="wineName" name="wineName" required>

			<label for="grapeNo">품종:</label>
            <select id="grapeNo" name="grapeNo" required>
                <option value="1">카베르네 소비뇽</option>
                <option value="2">메를로</option>
                <option value="3">피노 누아</option>
                <option value="4">쉬라</option>
                <option value="5">그 외 (레드 와인)</option>
                <option value="6">샤르도네</option>
                <option value="7">소비뇽 블랑</option>
                <option value="8">리슬링</option>
                <option value="9">그 외 (화이트 와인)</option>
                <option value="10">샤르도네 (스파클링)</option>
                <option value="11">소비뇽 블랑 (스파클링)</option>
                <option value="12">뮈스카</option>
                <option value="13">그 외 (스파클링)</option>
            </select>

            <label for="countryNo">나라:</label>
            <select id="countryNo" name="countryNo" required>
                <option value="1">프랑스</option>
                <option value="2">이탈리아</option>
                <option value="3">미국</option>
                <option value="4">칠레</option>
                <option value="5">호주</option>
                <option value="6">그 외</option>
            </select>

            <label for="vintage">빈티지:</label>
            <input type="number" id="vintage" name="vintage">

            <label for="price">가격(원):</label>
            <input type="number" id="price" name="price" required>
				
			 <label for="volume">용량 (ml):</label>
            <select id="volume" name="volume" required>
                <option value="750">750</option>
                <option value="375">375</option>
            </select>


            <label for="quantity">수량:</label>
            <input type="number" id="quantity" name="quantity" value="0" required>

            <label for="content">내용:</label>
            <textarea id="content" name="content"></textarea>

			<label for="status">판매등록  :</label>
            <select id="status" name="status" required>
                <option value="Y">Y</option>
                <option value="N">N</option>
            </select>
            
              
        <label for="body">바디:</label>
        <input type="number" id="body" name="body" min="1" max="5" required>

        <label for="sweet">단맛:</label>
        <input type="number" id="sweet" name="sweet" min="1" max="5" required>

        <label for="bitter">쓴맛:</label>
        <input type="number" id="bitter" name="bitter" min="1" max="5" required>

        <label for="sour">신맛:</label>
        <input type="number" id="sour" name="sour" min="1" max="5" required>
            
			

            <label>이미지 파일:</label>
            <input type="file" id="upfile" name="upfile" >

            <button type="submit">등록</button>
        </form>
    </div>
    
	
</body>
</html>

