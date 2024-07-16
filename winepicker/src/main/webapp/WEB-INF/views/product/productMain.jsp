<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  .search {
            display: flex;
            justify-content: center;
            padding: 20px;
            background-color:white; /* 배경색 */
          	margin: 50px auto;
            
        }

        .search-container {
            display: flex;
            align-items: center;
            background-color: #fff; /* 배경색 */
            border-radius: 24px; /* 둥근 모서리 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 */
            overflow: hidden; /* 자식 요소가 컨테이너를 넘어서지 않도록 함 */
            width: 800px;
            
        }
        
        .search form{
         display: flex;
         width: 100%;
        }

        .search-input {
            flex: 1;
            padding: 10px 15px;
            border: none;
            border-radius: 24px; /* 둥근 모서리 */
            outline: none;
            font-size: 16px; /* 글자 크기 */
            width:90%;
            
        }

        .search-input:focus {
            box-shadow: 0 0 0 2px white; /* 포커스 시 테두리 색상 */
        }

        .search-button {
            padding: 10px 20px;
            border: none;
            border-radius: 24px; /* 둥근 모서리 */
            background-color: #282934; 
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            width: 10%
            transition: background-color 0.3s ease;
            
        }

        .search-button:hover {
            background-color: #357ae8; /* 버튼에 마우스를 올렸을 때 배경색 */
        }

        .search-button:focus {
            outline: none; /* 포커스 시 아웃라인 제거 */
        }
        
      /* 개행 */  
        hr {
	width: 80%;
	margin: 20px auto;
	border-top: 2px solid #D8D8D8;
}
        
        
/* 새 와인 디브*/

.new-wine {
    text-align: center; /* 텍스트 중앙 정렬 */
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


/* 전체 컨테이너 */
.new-wine-container {
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

/* 화살표 버튼 */
.arrow-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    padding: 10px;
    cursor: pointer;
    border: none;
    z-index: 1;
}

.arrow-btn.left {
    left: 10px;
}

.arrow-btn.right {
    right: 10px;
}



</style>
</head>
<body>


	<div class="search">
		<div class="search-container">
			<form action="${contextPath}/product/search" method="get">
				<input type="text" class="search-input" name="keyword"
					value="${paramMap.keyword}" placeholder="검색할 와인의 이름, 종류 등으로 검색">
				<button type="submit" class="search-button">검색</button>
			</form>
		</div>
	</div>

	<div class="new-wine">
		<ul>
			<li class="new-wine-title">새 와인</li>
			<li>Be the first to experience</li>
		</ul>

	</div>


	<div class="new-wine-container">

		<div class="wine-list-wrap">
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

	<hr>



	<div class="new-wine">
		<ul>
			<li class="new-wine-title">셀렉션 와인</li>
			<li>Winepicker's Best Wine Selection</li>
		</ul>

	</div>

	

		



	<script>
		document.querySelectorAll('.wine-card-info-wrap').forEach(product => {
		    product.addEventListener('click', () => {
		        window.location.href = product.getAttribute('data-href');
		    });
		});
	 
	 </script>




</body>
</html>