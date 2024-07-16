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



.title {
	text-align: center;
	margin-top: 60px;
	margin-bottom: 30px;
	font-size: 36px;
	font-weight: bold;
	color: #333;
}

	


hr {
	width: 100%;
	margin: 20px auto;
	border-top: 2px solid #D8D8D8;
}

.container {
	display: flex;
	flex-wrap: wrap;
	margin: 20px;
}



.content-container {
    display: flex; /* 필터와 와인 컨테이너를 가로로 배치 */
    flex: 1;
    gap: 20px; /* 필터와 와인 컨테이너 사이의 간격 설정 */
}


.filter-container {
    width: 250px; /* 필터 컨테이너의 너비 설정 */
}


.wine-container {
    flex: 1; /* 와인 컨테이너가 남은 공간을 채우도록 설정 */
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


/* 전체 컨테이너 */
.wine-container {
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
}

/* 슬라이드 랩 */
.wine-list-wrap {
    display: flex;
    overflow: hidden; /* 슬라이드가 넘치지 않게 숨김 */
    position: relative;
}

/* 각 와인 카드 */
.wine-card-info-wrap {
    flex: 0 0 25%; /* 4개의 카드가 화면에 보이도록 설정 */
    box-sizing: border-box;
    padding: 10px;
    transition: transform 0.5s ease; /* 슬라이드 전환 애니메이션 */
}

/* 와인 이미지 */
.wine-image-wrap {
    position: relative;
}

.wine-image-wrap img {
    width: 100%;
    height: auto;
}


.type-country {
    display: flex;
    align-items: center; 
    justify-content: center; 
}

.type-country .country-image {
    width: 32px;  
    height: 32px; 
    margin : 1px; 
}

/* .type-image 클래스의 이미지 크기 설정 */
.type-country .type-image {
    width: 32px;   
    height: 32px; 
    margin : 1px;  
}

/* 와인 제목 */
.wine-title {
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
    text-align: center;
}

/* 가격 정보 */
.wine-price-info {
    font-size: 14px;
    margin-top: 10px;
    text-align: center;
}

/* 기타 정보 */
.wine-etc-info {
    font-size: 12px;
    margin-top: 10px;
    text-align: center;
}

</style>

</head>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="title">
		<p>전체 와인</p>

	</div>

	<hr>



   <div class="products-container">
   
   <%-- 
    <div class="sort-options">
        <a href="#recent" class="${sortOption == 'recent' ? 'active' : ''}" data-sort="recent" onclick="searchProducts('recent')">최신순</a>
        <a href="#pricehigh" class="${sortOption == 'pricehigh' ? 'active' : ''}" data-sort="pricehigh" onclick="searchProducts('pricehigh')">가격 높은 순</a>
        <a href="#pricelow" class="${sortOption == 'pricelow' ? 'active' : ''}" data-sort="pricelow" onclick="searchProducts('pricelow')">가격 낮은 순</a>
    </div>
     --%>
     
     <div class="sort-options">
    <a href="#recent" class="${sortOption == 'recent' ? 'active' : ''}" data-sort="recent" onclick="sortProducts('recent')">최신순</a>
    <a href="#pricehigh" class="${sortOption == 'pricehigh' ? 'active' : ''}" data-sort="pricehigh" onclick="sortProducts('pricehigh')">가격 높은 순</a>
    <a href="#pricelow" class="${sortOption == 'pricelow' ? 'active' : ''}" data-sort="pricelow" onclick="sortProducts('pricelow')">가격 낮은 순</a>
</div>
 	 <div class="content-container">

	  <jsp:include page="/WEB-INF/views/product/filter.jsp" />



	<div class="wine-container">
		<div class="wine-list-wrap"  id="productList">
			<c:forEach var="wine" items="${list}">
				<div class="wine-card-info-wrap"
					data-href="${contextPath}/product/detail/${wine.wineNo}">
					<div class="wine-image-wrap">
						<img
							src="${contextPath}/resources/images/product/${wine.wineImage.changeName}"
							alt="${wine.wineName}">
						<p class="wine-title">${wine.wineName}</p>
					</div>
					<div class="wine-price-info">
						<p>${wine.formattedPrice}원</p>
					</div>

					<div class="type-country">


						<img
							src="${contextPath }/resources/css/images/product/country/country${wine.countryNo}.png"
							alt="${wine.countryNo} Image" class="country-image" /> <img
							src="${contextPath}/resources/css/images/product/type/type${wine.grape.wineTypeNo}.svg"
							alt="${wine.grape.wineTypeNo} Image" class="type-image" />



					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</div>



</div>



		<c:set var="url" value="?currentPage=" />

	<div id="pagingArea">
    <ul class="pagination" style="list-style: none; padding: 0; margin: 0; display: flex; justify-content: center;">
        <c:if test="${pi.currentPage eq 1}">
            <li class="page-item"><a class='page-link'>Prev</a></li>
        </c:if>
        <c:if test="${pi.currentPage ne 1}">
            <li class="page-item"><a class='page-link' href="${url }${pi.currentPage -1 }${sParam}&sortOption=${sortOption}" onclick="loadPage(${pi.currentPage - 1}); return false;">Previous</a></li>
        </c:if>
        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
            <li class="page-item"><a class="page-link ${i eq pi.currentPage ? 'on' : ''}" href="${url }${i}${sParam}&sortOption=${sortOption}" onclick="loadPage(${i}); return false;">${i}</a></li>
        </c:forEach>
        <c:if test="${pi.currentPage eq pi.maxPage}">
            <li class="page-item"><a class='page-link'>Next</a></li>
        </c:if>
        <c:if test="${pi.currentPage ne pi.maxPage}">
            <li class="page-item"><a class='page-link' href="${contextPath}/product/list?currentPage=${pi.currentPage + 1}&sortOption=${sortOption}" onclick="loadPage(${pi.currentPage + 1}); return false;">Next</a></li>
        </c:if>
    </ul>
</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>

	
	<script>
	
	/* 소팅 */
	/* function sortProducts(sortOption) {
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
		 */
		
		document.querySelectorAll('.wine-card-info-wrap').forEach(product => {
		    product.addEventListener('click', () => {
		        window.location.href = product.getAttribute('data-href');
		    });
		});
	
		 function sortProducts(sortOption) {
			    console.log('sortOption in sortProducts:', sortOption);  // 확인용

			    document.querySelectorAll('.sort-options a').forEach(function(el) {
			        el.classList.remove('active');
			    });

			    document.querySelector(`.sort-options a[data-sort="${sortOption}"]`).classList.add('active');

			    
			    searchProducts(sortOption);

			    
			    
			    
			}
		 
		 
		 
	/* 
	function sortProducts(sortOption) {
	    $.ajax({
	        url: '${contextPath}/product/list',
	        type: 'GET',
	        data: { 
	            sortOption: sortOption,
	            currentPage: 1 
	        },
	        success: function(data) {
	            $('#productList').html($(data).find('#productList').html());
	            $('#pagingArea').html($(data).find('#pagingArea').html());
	        },
	        error: function(xhr, status, error) {
	            console.error('Error occurred:', error);
	        }
	    });
	}

	function loadPage(pageNumber) {
	    const sortOption = $('.sort-options .active').data('sort') || 'recent';
	    $.ajax({
	        url: '/product/list',
	        type: 'GET',
	        data: { 
	            sortOption: sortOption,
	            currentPage: pageNumber 
	        },
	        success: function(data) {
	            $('#productList').html($(data).find('#productList').html());
	            $('#pagingArea').html($(data).find('#pagingArea').html());
	        },
	        error: function(xhr, status, error) {
	            console.error('Error occurred:', error);
	        }
	    });
	}
		 */
		
	</script>

	





	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

