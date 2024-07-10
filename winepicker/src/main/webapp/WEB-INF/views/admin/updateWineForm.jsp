<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
table{
	width: 1200px;
}
table th,td{
	text-align: center;
	border-style: solid; 
	border-collapse: separate;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="section">

	<table>
	
		<tr>
			<th>와인번호</th>
			<th>와인이름</th>
			<th>와인종류</th>
			<th>포도품종</th>
			
			<th>생산국</th>
			<th>생산년도</th>
			<th>가격</th>
			<th>용량</th>
			<th>수량</th>
			
			<th>바디</th>
			<th>당도</th>
			<th>탄닌</th>
			<th>산도</th>
		</tr>

		<tr>
			<td align="right">${wine.wineNo}</td>
			<td>${wine.wineName}</td>
			
			<td>${wine.wineType.wineTypeName}</td>
			<td>${wine.grape.grapeName}</td>
			
			<td>${wine.country.countryName}</td>
			<td>${wine.vintage}</td>
			<td>${wine.price}</td>
			<td>${wine.volume}</td>
			<td>${wine.quantity}</td>
			
			<td>${wine.characteristic.body}</td>
			<td>${wine.characteristic.sweet}</td>
			<td>${wine.characteristic.bitter}</td>
			<td>${wine.characteristic.sour}</td>
		</tr>

		<tr>
			<th rowspan="2">와인 설명</th>
			<td rowspan="2" colspan="12">${wine.content}</td>
		</tr>

			<form action="${contextPath}/admin/updateWine/${wine.wineNo}" method="post">
			<fieldset>
				와인 번호 : <input type="number" name="wineNo" id="wineNo" readonly style="background-color: lightgray;"> <br>
				와인 이름 : <input type="text" name="wineName" id="wineName"> <br>
				와인 종류 : <select name="wineTypeName" id="wineTypeName"> <br>
				포도 품종 : <select name="grapeName" id="grapeName"></select> <br>
				생산 국가 : <select name="countryName" id="countryName"></select> <br>
				생산 년도 : <input type="number" name="vintage" id="vintage"> <br>
				가격 : <input type="number" name="price" id="price"> <br>

				용량(ml) : <input type="number" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>
				와인 이름 : <input type="text" name="" id=""> <br>


				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</fieldset>
			</form>
	
			
			
		
	</table>










</div>







<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>