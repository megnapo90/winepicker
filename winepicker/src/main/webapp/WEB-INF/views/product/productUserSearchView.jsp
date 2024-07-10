<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath }/resources/css/productcss.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="title">
		<p>검색결과 : "${keyword}"</p>
	</div>
	
	
	<div class="search-container">
	<form action = "${contextPath }/product/search" method="get">
	    <input type="text" class="search-input" name="keyword" value="${paramMap.keyword }" placeholder="검색할 와인의 이름을 작성하세요.">
	    <button type="submit" class="search-button">Search</button>
	
	</form>
	</div>


		<div class="products-container">
			<div class="sort-options">

				<a href="#recent" class="${sortOption == 'recent' ? 'active' : ''}"
					onclick="sortProducts('recent')">최신순</a> <a href="#pricehigh"
					class="${sortOption == 'pricehigh' ? 'active' : ''}"
					onclick="sortProducts('pricehigh')">가격 높은 순</a> <a href="#pricelow"
					class="${sortOption == 'pricelow' ? 'active' : ''}"
					onclick="sortProducts('pricelow')">가격 낮은 순</a>
			</div>
			<div class="products">
				<c:forEach var="wineExt" items="${list}">
						<div class="product" data-href="detail/${wineExt.wineNo}"
							data-price="${wineExt.price}" 
                			data-wineNo="${wineExt.wineNo}">
						<img
							src="${contextPath }/resources/images/product/${wineExt.wineImage.changeName}"
							alt="와인 이미지">
						<p>${wineExt.wineName}<br>${wineExt.formattedPrice}원<br>${wineExt.countryNo}/${wineExt.grapeNo}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	

	
	
	
		<c:set var="url" value="?currentPage=" />
        
	    <div id="pagingArea">
        	<ul class="pagination" style="list-style: none; padding: 0; margin: 0; display: flex; justify-content: center;">
        		<c:if test="${pi.currentPage eq 1}">
        			<li class="page-item">
        				<a class='page-link'>Prev</a>
        			</li>
        		</c:if>
        		<c:if test="${pi.currentPage ne 1}">
        			<li class="page-item">
        				<a class='page-link' href="${url }${pi.currentPage -1 }${sParam}">Previous</a>
        			</li>
        		</c:if>
        		
        		<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
        			<li class="page-item">
        				<a class="page-link ${i eq pi.currentPage ? 'on' : ''}" href="${url }${i}${sParam}">${i }</a>
        			</li>
        		</c:forEach>
        	
        	
        		<c:if test="${pi.currentPage eq pi.maxPage}">
        			<li class="page-item">
        				<a class='page-link'>Next</a>
        			</li>
        		</c:if>
        		<c:if test="${pi.currentPage ne pi.maxPage}">
        			<li class="page-item">
        				<a class='page-link' href="${url }${pi.currentPage +1 }${sParam}">Next</a>
        			</li>
        		</c:if>
        	</ul>
        </div>
	
	
		
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
	document.querySelectorAll('.product').forEach(product => {
	    product.addEventListener('click', () => {
	        window.location.href = product.getAttribute('data-href');
	    });
	});
	
	</script>
	
</body>
</html>