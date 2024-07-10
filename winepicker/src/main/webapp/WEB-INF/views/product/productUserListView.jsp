<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css"
	rel="stylesheet">
<style>
<
style>body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

.header {
	background-color: #333;
	color: white;
	padding: 20px;
	text-align: center;
}

.title {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 40px;
	font-weight: normal;
	color: #3D3D3D;
}

hr {
	width: 80%;
	margin: 20px auto;
	border-top: 2px solid #D8D8D8;
}

.container {
	display: flex;
	flex-wrap: wrap;
	margin: 20px;
}

.products-container {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

.sort-options {
	display: flex;
	justify-content: flex-end;
	padding-bottom: 20px;
}

.sort-options a {
	margin-left: 20px;
	color: #333;
	text-decoration: none;
}

.sort-options a.active {
	color: red !important; /* 선택된 소팅 옵션의 텍스트 색상 */
	font-weight: bold; /* 선택된 소팅 옵션의 텍스트 굵게 */
}

.sort-options a:hover {
	text-decoration: underline; /* 마우스를 올렸을 때 텍스트에 밑줄 */
}

.products {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.product {
	background-color: white;
	padding: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.product img {
	width: 100%;
	height: auto;
	background-color: #ddd;
}

.product p {
	margin: 10px 0;
}

.filter {
	width: 100%;
	max-width: 250px;
	padding: 20px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	box-sizing: border-box;
}

.filter h2 {
	margin-top: 0;
	font-size: 1.5em;
	display: flex;
	align-items: center;
	justify-content: space-between; /* 제목과 버튼 사이의 공간을 조절 */
}

.filter label {
	display: block;
	margin: 10px 0 5px;
	font-size: 1em;
}

.filter input[type="range"] {
	width: 100%;
	margin-bottom: 10px;
}

.filter select {
	width: 100%;
	padding: 5px;
	font-size: 1em;
	margin-bottom: 10px;
}

#resetFilters {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
}

#resetFilters img {
	width: 24px; /* 아이콘의 너비 */
	height: 24px; /* 아이콘의 높이 */
}

/* 버튼을 클릭할 때의 스타일 */
#resetFilters:hover img {
	opacity: 0.7;
}

/* 체크박스 스타일링 */
.custom-checkbox {
	display: none;
}

.custom-checkbox+label {
	display: inline-block;
	position: relative;
	padding-left: 30px;
	cursor: pointer;
	user-select: none;
}

.custom-checkbox+label::before {
	content: '';
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #ccc;
	border-radius: 3px;
	position: absolute;
	left: 0;
	top: 0;
	background:
		url('${contextPath}/resources/css/images/product/checkbox.png')
		no-repeat center center; /* 체크 전 이미지 */
	background-size: contain;
	transition: background-color 0.3s, border-color 0.3s;
}

.custom-checkbox:checked+label::before {
	background: #84515F;
}

.custom-checkbox+label::after {
	content: '';
	position: absolute;
	left: 4px;
	top: 4px;
	width: 12px;
	height: 12px;
	background: url('${contextPath}/resources/css/images/product/checkbox.png' ')
		no-repeat center center;
	background-size: contain;
	opacity: 0;
}

.custom-checkbox:checked+label::after {
	opacity: 1;
}

/* 페이징 처리 */
#pagingArea {
	display: flex;
	justify-content: center;
	width: 100%;
}

#pagingArea.pagination {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
}

.page-item {
	margin: 0 5px; /* 페이지 아이템 사이에 간격 추가 */
}

.page-link {
	display: block;
	padding: 10px 15px;
	text-decoration: none;
	color: #007bff;
}

.page-link.on {
	font-weight: bold;
	color: #fff;
	background-color: #007bff;
	border-radius: 5px;
}

.page-link:hover {
	background-color: #0056b3;
	color: #fff;
	border-radius: 5px;
}
</style>

</head>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="title">
		<p>전체 와인</p>

	</div>

	<hr>

	<jsp:include page="/WEB-INF/views/product/filter.jsp" />

<%-- 	<div class="products-container">
		<div class="sort-options">

			<a href="#recent" class="${sortOption == 'recent' ? 'active' : ''}"
				onclick="sortProducts('recent')">최신순</a> <a href="#pricehigh"
				class="${sortOption == 'pricehigh' ? 'active' : ''}"
				onclick="sortProducts('pricehigh')">가격 높은 순</a> <a href="#pricelow"
				class="${sortOption == 'pricelow' ? 'active' : ''}"
				onclick="sortProducts('pricelow')">가격 낮은 순</a>
		</div>
--%>



   <div class="products-container">
    <div class="sort-options">
        <a href="#recent" class="${sortOption == 'recent' ? 'active' : ''}" data-sort="recent" onclick="sortProducts('recent')">최신순</a>
        <a href="#pricehigh" class="${sortOption == 'pricehigh' ? 'active' : ''}" data-sort="pricehigh" onclick="sortProducts('pricehigh')">가격 높은 순</a>
        <a href="#pricelow" class="${sortOption == 'pricelow' ? 'active' : ''}" data-sort="pricelow" onclick="sortProducts('pricelow')">가격 낮은 순</a>
    </div>

		<div class="products" id="productList">
			<c:forEach var="wine" items="${list}">
				<div class="product" data-href="detail/${wine.wineNo}"
				data-price="${wine.price}" 
                 data-wineNo="${wine.wineNo}">
                
					<img
						src="${contextPath}/resources/images/product/${wine.wineImage.changeName}"
						alt="${wine.wineName} 이미지">
					<p>${wine.wineName}</p>
					<p>${wine.formattedPrice}원</p>
					<p>${wine.countryNo}</p>		
					<P>${wine.grapeNo}</p>
				</div>
			</c:forEach>
		</div>
	</div>






	<c:set var="url" value="?currentPage=" />

	<div id="pagingArea">
		<ul class="pagination"
			style="list-style: none; padding: 0; margin: 0; display: flex; justify-content: center;">
			<c:if test="${pi.currentPage eq 1}">
				<li class="page-item"><a class='page-link'>Prev</a></li>
			</c:if>
			<c:if test="${pi.currentPage ne 1}">
				<li class="page-item"><a class='page-link'
					href="${url }${pi.currentPage -1 }${sParam}">Previous</a></li>
			</c:if>

			<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
				<li class="page-item"><a
					class="page-link ${i eq pi.currentPage ? 'on' : ''}"
					href="${url }${i}${sParam}">${i }</a></li>
			</c:forEach>


			<c:if test="${pi.currentPage eq pi.maxPage}">
				<li class="page-item"><a class='page-link'>Next</a></li>
			</c:if>
			<c:if test="${pi.currentPage ne pi.maxPage}">
				<li class="page-item"><a class='page-link'
					href="${url }${pi.currentPage +1 }${sParam}">Next</a></li>
			</c:if>
		</ul>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>

	<script>
	
	/* 소팅 */
	function sortProducts(sortOption) {
			const form = document.createElement('form');
			form.method = 'GET';
			form.action = 'list'; // 컨트롤러의 매핑 경로

			const input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'sortOption';
			input.value = sortOption;
			form.appendChild(input);

			document.body.appendChild(form);
			form.submit();
		}
		
	
		document.querySelectorAll('.product').forEach(product => {
		    product.addEventListener('click', () => {
		        window.location.href = product.getAttribute('data-href');
		    });
		});

 

		
		
	</script>






	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

