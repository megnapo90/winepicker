<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<style>
         /* 전체 레이아웃 */
        .container {
            display: flex;
            padding: 0px;
            background-color: #f0f2f5;
        }

        /* 사이드바 필터 스타일 */
        .filter-container {
      
            width: 280px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            
        }

        /* 필터 헤더 스타일 */
        .filter-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .filter-header h2 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        /* 리셋 버튼 */
        #resetFilters {
            background: none;
            border: none;
            color: #dc3545;
            cursor: pointer;
            font-size: 22px;
        }

        #resetFilters img {
            width: 28px;
            height: 28px;
        }

        /* 필터 그룹 */
        .filter-group {
            margin-bottom: 20px;
        }

        .filter-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            font-size: 20px;
            color: #333;
        }

        .toggle-btn {
            font-size: 18px;
            color: #007bff;
            
            background: none;
            border: none;
            cursor: pointer;
            transition: color 0.3s;
        }

        .toggle-btn:hover {
            color: #0056b3;
        }
        
   
        /* 서브 필터의 기본 스타일 */
        .sub-options {
            display: none;
            margin-top: 10px;
        }

        .sub-options label {
            display: block;
            margin-bottom: 5px;
            font-size: 18px;
            color: #333;
        }

        .sub-options input {
            margin-right: 5px;
        }
        
        #redSubFilter input{
       		margin-left:16px;
        	
        }
         #redSubFilter label{
         	font-size: 16px;
         }
        
          #whiteSubFilter input{
       		margin-left:16px;
        	
        }
         #whiteSubFilter label{
         	font-size: 16px;
         }
          #sparklingSubFilter input{
       		margin-left:16px;
        	
        }
         #sparklingSubFilter label{
         	font-size: 16px;
         }
        

        /* 제품 목록 스타일 */
        #productList {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .product {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(33.333% - 10px);
        }

        .product img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .product p {
            margin: 10px;
            font-size: 14px;
            color: #333;
        }
        
        
        #price-slider .noUi-handle {
            background-color: #fff;
            border: 2px solid #007bff;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            top: -9px; 
        }
        
        #price-slider .noUi-connect {
            background: #007bff;
        }
        
        #price-slider .noUi-base {
            background: #e0e0e0;
            height: 6px;
        }
   		.noUi-target {
	   	background: none;
	    border-radius: 4px;
	    border: none;
	    box-shadow: none;
	   	width: 240px;
	
    }
       .slider-container p{
       	font-size : 18px;
       	font-weight : bold;
       }
       
      .slider-values {
    display: flex; /* Flexbox 레이아웃 활성화 */
    justify-content: space-between; /* 자식 요소를 양쪽 끝으로 배치 */
    align-items: center; /* 자식 요소 수직 정렬 */
    font-size: 1em; /* 글자 크기 조정 (필요시) */
    padding: 0 10px; 
    margin-bottom: 10px;
}

#minValue, #maxValue {
    white-space: nowrap; /* 텍스트가 줄 바꿈 없이 한 줄에 표시되도록 함 */
}
        
    </style>
</head>
<body>
	
        <div class="filter-container">
            <div class="filter-header">
                <h2>Filter
                    <button type="button" id="resetFilters">
                        <img src="${contextPath}/resources/css/images/product/filterReset.png" alt="Filter Reset" />
                    </button>
                </h2>
            </div>
            
            
            
            <div class="filter-section">
               <div class="slider-container">
       
                    		<p> 가격 </p>

            <div id="price-slider"></div>
                    <div class="slider-values">
                        <span id="minValue"></span> ~ <span id="maxValue"></span>
                    </div>
                    <input type="hidden" id="min-price" name="minPrice" value="${minPrice}">
                    <input type="hidden" id="max-price" name="maxPrice" value="${maxPrice}">
   				 </div>
    
   
                <!-- 종류 필터 -->
                <div class="filter-group">
                    <label for="type">종류
                    <button type="button" class="toggle-btn" onclick="toggleSubFilter('typeOptions')">+</button>
                    </label>
                    <div id="typeOptions" class="sub-options">
                        <label><input type="checkbox" id="red" name="type-option" value="1" class=""> 레드</label>
                        <div id="redSubFilter" class="sub-options sub-filter">
                            <label><input type="checkbox" name="red-subType-option" value="1" class=""> 카베르네 소비뇽</label>
                            <label><input type="checkbox" name="red-subType-option" value="2" class=""> 메를로</label>
                            <label><input type="checkbox" name="red-subType-option" value="3" class=""> 피노 누아</label>
                            <label><input type="checkbox" name="red-subType-option" value="4" class=""> 쉬라 </label>
                            <label><input type="checkbox" name="red-subType-option" value="5" class=""> 그 외</label>
                        </div>
                        <label><input type="checkbox" id="white" name="type-option" value="2" class=""> 화이트</label>
                      
                        <div id="whiteSubFilter" class="sub-options sub-filter">
                            <label><input type="checkbox" name="white-subType-option" value="6" class=""> 샤르도네 </label>
                            <label><input type="checkbox" name="white-subType-option" value="7" class=""> 소비뇽 블랑 </label>
                            <label><input type="checkbox" name="white-subType-option" value="8" class=""> 리슬링</label>
                            <label><input type="checkbox" name="white-subType-option" value="9" class=""> 그 외 </label>
                            
                        </div>
                        <label><input type="checkbox" id="sparkling" name="type-option" value="3" class=""> 스파클링</label>
                        <div id="sparklingSubFilter" class="sub-options sub-filter">
                            <label><input type="checkbox" name="sparkling-subType-option" value="1" class="">샤르도네</label>
                            <label><input type="checkbox" name="sparkling-subType-option" value="1" class="">소비뇽 블랑</label>
                            <label><input type="checkbox" name="sparkling-subType-option" value="2" class="">뮈스카 </label>
                            <label><input type="checkbox" name="sparkling-subType-option" value="2" class="">그 외</label>
                            
                        </div>
                    </div>
                </div>
                
                 <!-- 용량 필터 -->
                <div class="filter-group">
                    <label for="volume">용량
                    <button type="button" class="toggle-btn" onclick="toggleSubFilter('volumeOptions')">+</button>
                    </label>
                    <div id="volumeOptions" class="sub-options">
                        <label><input type="checkbox" name="volume-option" value="750" class=""> 750ml</label>
                        <label><input type="checkbox" name="volume-option" value="375" class=""> 375ml</label>
                    </div>
                </div>

                <!-- 나라 필터 -->
                <div class="filter-group">
                    <label for="country">나라
                    <button type="button" class="toggle-btn" onclick="toggleSubFilter('countryOptions')">+</button>
                    </label>
                    <div id="countryOptions" class="sub-options">
                        <label><input type="checkbox" name="country-option" value="1" class=""> 프랑스</label>
                        <label><input type="checkbox" name="country-option" value="2" class=""> 이탈리아</label>
                        <label><input type="checkbox" name="country-option" value="3" class=""> 미국 </label>
                        <label><input type="checkbox" name="country-option" value="4" class=""> 칠레 </label>
                        <label><input type="checkbox" name="country-option" value="5" class=""> 호주</label>
                        <label><input type="checkbox" name="country-option" value="6" class=""> 그 외 </label>
                        
                    </div>
                </div>
            </div>
        </div>
  
           

   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.5.0/nouislider.min.js"></script>
    
   <script>
// 전역 변수로 priceSlider 선언
   var priceSlider;

   document.addEventListener('DOMContentLoaded', function() {
	    // 초기값 설정
	    var minPrice = Math.floor(${minPrice} / 10000) * 10000;
	    var maxPrice = Math.ceil(${maxPrice} / 10000) * 10000;

	    // 가격 슬라이더 초기화
	    priceSlider = document.getElementById('price-slider');

	    if (priceSlider) {
	        // noUiSlider 생성
	        noUiSlider.create(priceSlider, {
	            start: [minPrice, maxPrice],
	            connect: true,
	            range: {
	                'min': minPrice,
	                'max': maxPrice
	            },
	            step: 1000,
	            format: {
	                to: function (value) {
	                    return value.toLocaleString();
	                },
	                from: function (value) {
	                    return Number(value.replace(/,/g, ''));
	                }
	            }
	        });

	        // 슬라이더의 값이 업데이트 될 때마다 호출
	        priceSlider.noUiSlider.on('update', function (values) {
	            // 값 변경 시에만 `searchProducts` 호출
	            document.getElementById('minValue').textContent = values[0];
	            document.getElementById('maxValue').textContent = values[1];
	            document.getElementById('min-price').value = values[0];
	            document.getElementById('max-price').value = values[1];
	        });

	        // 슬라이더의 값이 완료된 후 호출
	        priceSlider.noUiSlider.on('set', function (values) {
	            searchProducts();
	        });
	    } else {
	        console.error('가격 슬라이더 요소가 없습니다.');
	    }

	    // 필터 상태 변경 시 searchProducts 호출
	    document.querySelectorAll('#volumeOptions input[name="volume-option"]').forEach(function(el) {
	        el.addEventListener('change', searchProducts);
	    });
	    document.querySelectorAll('#typeOptions input[name="type-option"]').forEach(function(el) {
	        el.addEventListener('change', updateSubFilters);
	    });
	    document.querySelectorAll('#typeOptions input[name="red-subType-option"], #typeOptions input[name="white-subType-option"], #typeOptions input[name="sparkling-subType-option"]').forEach(function(el) {
	        el.addEventListener('change', searchProducts);
	    });
	    document.querySelectorAll('#countryOptions input[name="country-option"]').forEach(function(el) {
	        el.addEventListener('change', searchProducts);
	    });

	    // 리셋 버튼 클릭 시 필터 초기화
	    document.getElementById('resetFilters').addEventListener('click', function() {
	        document.querySelectorAll('input[type="checkbox"]').forEach(function(el) {
	            el.checked = false;
	        });
	        document.querySelectorAll('.sub-options').forEach(function(el) {
	            el.style.display = 'none';
	        });
	        if (priceSlider) {
	            priceSlider.noUiSlider.set([minPrice, maxPrice]);
	        }
	        document.getElementById('min-price').value = minPrice;
	        document.getElementById('max-price').value = maxPrice;

	        searchProducts(); // 리셋 후 필터 상태에 따라 검색 호출
	    });
	});

	// 특정 하위 옵션 그룹을 토글하는 함수
	function toggleSubFilter(subFilterId) {
	    const subFilter = document.getElementById(subFilterId);
	    if (subFilter) {
	        if (subFilter.style.display === 'none' || subFilter.style.display === '') {
	            subFilter.style.display = 'block';
	        } else {
	            subFilter.style.display = 'none';
	        }
	    }
	}

	// 레드, 화이트, 스파클링의 체크 상태에 따라 하위 필터를 업데이트하는 함수
	function updateSubFilters() {
	    const isCheckedRed = document.getElementById('red').checked;
	    const isCheckedWhite = document.getElementById('white').checked;
	    const isCheckedSparkling = document.getElementById('sparkling').checked;

	    document.getElementById('redSubFilter').style.display = isCheckedRed ? 'block' : 'none';
	    document.getElementById('whiteSubFilter').style.display = isCheckedWhite ? 'block' : 'none';
	    document.getElementById('sparklingSubFilter').style.display = isCheckedSparkling ? 'block' : 'none';

	    // 체크박스가 해제되면 하위 필터의 체크박스도 해제
	    if (!isCheckedRed) {
	        document.querySelectorAll('#redSubFilter input[type="checkbox"]').forEach(function(el) {
	            el.checked = false;
	        });
	    }
	    if (!isCheckedWhite) {
	        document.querySelectorAll('#whiteSubFilter input[type="checkbox"]').forEach(function(el) {
	            el.checked = false;
	        });
	    }
	    if (!isCheckedSparkling) {
	        document.querySelectorAll('#sparklingSubFilter input[type="checkbox"]').forEach(function(el) {
	            el.checked = false;
	        });
	    }

	    // 필터 상태에 따라 검색 호출
	    searchProducts();
	}

 	// 제품 목록을 검색하고 업데이트하는 함수
	function searchProducts(sortOption) {
 		
 		
	    var selectedVolumes = [];
	    document.querySelectorAll('#volumeOptions input[name="volume-option"]:checked').forEach(function(el) {
	        selectedVolumes.push(parseInt(el.value));
	    });

	    var selectedTypes = [];
	    document.querySelectorAll('#typeOptions input[name="type-option"]:checked').forEach(function(el) {
	        selectedTypes.push(parseInt(el.value));
	    });

	    var selectedRedSubTypes = [];
	    document.querySelectorAll('#redSubFilter input[name="red-subType-option"]:checked').forEach(function(el) {
	        selectedRedSubTypes.push(parseInt(el.value));
	    });

	    var selectedWhiteSubTypes = [];
	    document.querySelectorAll('#whiteSubFilter input[name="white-subType-option"]:checked').forEach(function(el) {
	        selectedWhiteSubTypes.push(parseInt(el.value));
	    });

	    var selectedSparklingSubTypes = [];
	    document.querySelectorAll('#sparklingSubFilter input[name="sparkling-subType-option"]:checked').forEach(function(el) {
	        selectedSparklingSubTypes.push(parseInt(el.value));
	    });

	    var selectedCountries = [];
	    document.querySelectorAll('#countryOptions input[name="country-option"]:checked').forEach(function(el) {
	        selectedCountries.push(parseInt(el.value));
	    });

	    //소팅
	  
	    
	    
	    // 슬라이더의 값 가져오기
	    if (priceSlider && priceSlider.noUiSlider) {
	        var priceRange = priceSlider.noUiSlider.get();
	        var minPrices = parseInt(priceRange[0].replace(/,/g, ''));
	        var maxPrices = parseInt(priceRange[1].replace(/,/g, ''));
	    } else {
	        console.error('noUiSlider가 초기화되지 않았습니다.');
	        return;
	    }
	    
	    

	    $.ajax({
	        url: `${contextPath}/product/searchByAjax`,
	        type: 'GET',
	        traditional: true,
	        data: {
	            volumes: selectedVolumes,
	            types: selectedTypes,
	            redSubTypes: selectedRedSubTypes,
	            whiteSubTypes: selectedWhiteSubTypes,
	            sparklingSubTypes: selectedSparklingSubTypes,
	            countries: selectedCountries,
	            minPrices: minPrices,  
	            maxPrices: maxPrices,  
	            sortOption: sortOption
	        },
	        success: function(result) {
	            console.log('서버 응답 데이터:', result);
				
	            var wineExts = '';
	            for (var wineExt of result) {
	           	var formattedPrice = wineExt.price.toLocaleString();
	            	
	                wineExts += `<div class="wine-card-info-wrap" data-href="${contextPath}/product/detail/\${wineExt.wineNo}">`;
	                wineExts += `  <div class="wine-image-wrap">`;
	                wineExts += `    <img src="${contextPath}/resources/images/product/\${wineExt.wineImage.changeName}" alt="\{wineExt.wineName}">`;
	                wineExts += `    <p class="wine-title">\${wineExt.wineName}</p>`;
	                wineExts += `  </div>`;
	                wineExts += `  <div class="wine-price-info">`;
	                wineExts += `    <p>\${formattedPrice}원</p>`;
	                wineExts += `  </div>`;
	                wineExts += `  <div class="type-country">`;
	                wineExts += `    <img src="${contextPath}/resources/css/images/product/country/country\${wineExt.countryNo}.png" alt="\${wineExt.countryNo} Image" class="country-image" />`;
	                wineExts += `    <img src="${contextPath}/resources/css/images/product/type/type\${wineExt.grape.wineTypeNo}.svg" alt="\${wineExt.grape.wineTypeNo} Image" class="type-image" />`;
	                wineExts += `  </div>`;
	                wineExts += `</div>`;
	            }

	            document.getElementById('productList').innerHTML = wineExts;

	            document.querySelectorAll('.wine-card-info-wrap').forEach(function(product) {
	                product.addEventListener('click', function() {
	                    var href = product.getAttribute('data-href');
	                    window.location.href = href;
	                });
	            });
	        },
	        error: function(error) {
	            console.error('AJAX 요청 에러:', error);
	            document.getElementById('productList').innerHTML = '<p>데이터를 불러오는 중 오류가 발생했습니다.</p>';
	        }
	    });
	}
 	
	document.addEventListener('DOMContentLoaded', function() {
	    sortProducts('recent');
	});

</script>
</body>
</html>
