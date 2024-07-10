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
            padding: 20px;
            background-color: #f0f2f5;
        }

        /* 사이드바 필터 스타일 */
        .filter-container {
            width: 300px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-right: 30px;
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
            font-size: 16px;
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
            font-size: 16px;
            color: #333;
        }

        .toggle-btn {
            font-size: 16px;
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
            font-size: 14px;
            color: #333;
        }

        .sub-options input {
            margin-right: 5px;
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
                        </div>
                        <label><input type="checkbox" id="white" name="type-option" value="2" class=""> 화이트</label>
                        <div id="whiteSubFilter" class="sub-options sub-filter">
                            <label><input type="checkbox" name="white-subType-option" value="1" class=""> 소비뇽 블랑</label>
                            <label><input type="checkbox" name="white-subType-option" value="2" class=""> 샤르도네</label>
                            <label><input type="checkbox" name="white-subType-option" value="3" class=""> 리슬링</label>
                        </div>
                        <label><input type="checkbox" id="sparkling" name="type-option" value="3" class=""> 스파클링</label>
                        <div id="sparklingSubFilter" class="sub-options sub-filter">
                            <label><input type="checkbox" name="sparkling-subType-option" value="1" class=""> 샤르도네</label>
                            <label><input type="checkbox" name="sparkling-subType-option" value="2" class=""> 피노 그리지오</label>
                        </div>
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
                    </div>
                </div>
            </div>
        </div>
  
           

    <script>
    $(document).ready(function() {
        // 필터 상태 변경 시 searchProducts 호출
        $('#volumeOptions input[name="volume-option"]').on('change', searchProducts);
        $('#typeOptions input[name="type-option"]').on('change', updateSubFilters);
        $('#typeOptions input[name="red-subType-option"], #typeOptions input[name="white-subType-option"], #typeOptions input[name="sparkling-subType-option"]').on('change', searchProducts);
        $('#countryOptions input[name="country-option"]').on('change', searchProducts);

        // 리셋 버튼 클릭 시 필터 초기화
        $('#resetFilters').on('click', function() {
            $('input[type="checkbox"]').prop('checked', false);
            $('.sub-options').hide();
            searchProducts();
        });
    });

    // 특정 하위 옵션 그룹을 토글하는 함수
    function toggleSubFilter(subFilterId) {
        const subFilter = document.getElementById(subFilterId);
        if (subFilter) {
            // `volumeOptions`, `typeOptions`, `countryOptions`는 `+` 버튼으로 열고 닫기
            if (subFilter.style.display === 'none' || subFilter.style.display === '') {
                subFilter.style.display = 'block';
            } else {
                subFilter.style.display = 'none';
            }
        }
    }

    // 레드, 화이트, 스파클링의 체크 상태에 따라 하위 필터를 업데이트하는 함수
    function updateSubFilters() {
        const isCheckedRed = $('#red').is(':checked');
        const isCheckedWhite = $('#white').is(':checked');
        const isCheckedSparkling = $('#sparkling').is(':checked');

        $('#redSubFilter').toggle(isCheckedRed);
        $('#whiteSubFilter').toggle(isCheckedWhite);
        $('#sparklingSubFilter').toggle(isCheckedSparkling);

        // 체크박스가 해제되면 하위 필터의 체크박스도 해제
        if (!isCheckedRed) {
            $('#redSubFilter input[type="checkbox"]').prop('checked', false);
        }
        if (!isCheckedWhite) {
            $('#whiteSubFilter input[type="checkbox"]').prop('checked', false);
        }
        if (!isCheckedSparkling) {
            $('#sparklingSubFilter input[type="checkbox"]').prop('checked', false);
        }

        // 필터 상태에 따라 검색 호출
        searchProducts();
    }

    // 제품 목록을 검색하고 업데이트하는 함수
    function searchProducts() {
        var selectedVolumes = [];
        $('#volumeOptions input[name="volume-option"]:checked').each(function() {
            selectedVolumes.push(parseInt($(this).val()));
        });

        var selectedTypes = [];
        $('#typeOptions input[name="type-option"]:checked').each(function() {
            selectedTypes.push(parseInt($(this).val()));
        });

        var selectedRedSubTypes = [];
        $('#redSubFilter input[name="red-subType-option"]:checked').each(function() {
            selectedRedSubTypes.push(parseInt($(this).val()));
        });

        var selectedWhiteSubTypes = [];
        $('#whiteSubFilter input[name="white-subType-option"]:checked').each(function() {
            selectedWhiteSubTypes.push(parseInt($(this).val()));
        });

        var selectedSparklingSubTypes = [];
        $('#sparklingSubFilter input[name="sparkling-subType-option"]:checked').each(function() {
            selectedSparklingSubTypes.push(parseInt($(this).val()));
        });

        var selectedCountries = [];
        $('#countryOptions input[name="country-option"]:checked').each(function() {
            selectedCountries.push(parseInt($(this).val()));
        });

        console.log({
            volumes: selectedVolumes,
            types: selectedTypes,
            redSubTypes: selectedRedSubTypes,
            whiteSubTypes: selectedWhiteSubTypes,
            sparklingSubTypes: selectedSparklingSubTypes,
            countries: selectedCountries
        });

        $.ajax({
            url: `${contextPath}/product/searchByVolume`,  // `${contextPath}` 변수를 사용
            type: 'GET',
            traditional: true,
            data: {
                volumes: selectedVolumes,
                types: selectedTypes,
                redSubTypes: selectedRedSubTypes,
                whiteSubTypes: selectedWhiteSubTypes,
                sparklingSubTypes: selectedSparklingSubTypes,
                countries: selectedCountries
            },
            success: function(result) {
                console.log('서버 응답 데이터:', result);

                var wineExts = '';
                for (var wineExt of result) {
                    console.log('처리 중인 데이터:', wineExt);
                    console.log('처리 중인 데이터:', wineExt.wineName);
                    console.log('처리 중인 데이터:', wineExt.wineImage.changeName);
                    
                    wineExts += `<div class="product" data-href="detail/\${wineExt.wineNo}" data-price="\${wineExt.price}"  data-wineNo="\${wineExt.wineNo}">`;
                    wineExts += `  <img src="${contextPath}/resources/images/product/\${wineExt.wineImage.changeName}" alt="\${wineExt.wineName} 이미지">`;
                    wineExts += `  <p>\${wineExt.wineName}</p>`;
                    wineExts += `  <p>\${wineExt.price}원</p>`;
                    wineExts += `  <p>\${wineExt.countryNo}</p>`;
                    wineExts += `  <p>\${wineExt.grapeNo}</p>`;
                    wineExts += `</div>`;
                }

                $('#productList').html(wineExts);
                
                $('.product').on('click', function() {
                    var href = $(this).data('href');
                    window.location.href = href;
                });
                
            },
            error: function(error) {
                console.error('AJAX 요청 에러:', error);
                $('#productList').html('<p>데이터를 불러오는 중 오류가 발생했습니다.</p>');
            }
        });
    }
  
    
    </script>
</body>
</html>
